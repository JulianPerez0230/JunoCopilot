[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$WorkspacePath,

    [string]$ProjectId = "junocopilot",

    [string]$ProjectName = "JunoCopilot"
)

$ErrorActionPreference = "Stop"

$repositoryRoot = Split-Path -Parent $PSScriptRoot
$workspaceTemplates = Join-Path $repositoryRoot "templates\workspace"
$projectTemplates = Join-Path $repositoryRoot "templates\project"
$resolvedWorkspace = [System.IO.Path]::GetFullPath($WorkspacePath)

if ([string]::IsNullOrWhiteSpace($ProjectId) -or $ProjectId -notmatch '^[a-z0-9][a-z0-9-]*$') {
    throw "ProjectId must contain lowercase letters, numbers, or hyphens."
}

if ($resolvedWorkspace -eq [System.IO.Path]::GetPathRoot($resolvedWorkspace)) {
    throw "The workspace cannot be a drive root."
}

$directories = @(
    "inbox",
    "projects",
    "state",
    "cache",
    "logs",
    "archive",
    "backups"
)

$projectDirectories = @(
    "sessions",
    "inbox",
    "attachments",
    "archive"
)

New-Item -ItemType Directory -Path $resolvedWorkspace -Force | Out-Null

foreach ($directory in $directories) {
    New-Item -ItemType Directory -Path (Join-Path $resolvedWorkspace $directory) -Force | Out-Null
}

$workspaceFiles = @("AGENTS.md", "SOUL.md", "IDENTITY.md", "USER.md", "TOOLS.md")
foreach ($file in $workspaceFiles) {
    $source = Join-Path $workspaceTemplates $file
    $destination = Join-Path $resolvedWorkspace $file
    if (-not (Test-Path -LiteralPath $destination)) {
        Copy-Item -LiteralPath $source -Destination $destination
    }
}

$projectPath = Join-Path (Join-Path $resolvedWorkspace "projects") $ProjectId
New-Item -ItemType Directory -Path $projectPath -Force | Out-Null

foreach ($directory in $projectDirectories) {
    New-Item -ItemType Directory -Path (Join-Path $projectPath $directory) -Force | Out-Null
}

$createdAt = Get-Date -Format "yyyy-MM-dd"
$projectFiles = @("PROJECT.md", "STATUS.md", "TODO.md", "DECISIONS.md", "project.yaml")

foreach ($file in $projectFiles) {
    $source = Join-Path $projectTemplates $file
    $destination = Join-Path $projectPath $file
    if (-not (Test-Path -LiteralPath $destination)) {
        $content = Get-Content -LiteralPath $source -Raw -Encoding UTF8
        $content = $content.Replace("{{project_id}}", $ProjectId)
        $content = $content.Replace("{{project_name}}", $ProjectName)
        $content = $content.Replace("{{created_at}}", $createdAt)
        [System.IO.File]::WriteAllText($destination, $content, [System.Text.UTF8Encoding]::new($false))
    }
}

$userFile = Join-Path $resolvedWorkspace "USER.md"
$userContent = Get-Content -LiteralPath $userFile -Raw -Encoding UTF8
if ($userContent.Contains("{{preferred_language}}")) {
    $userContent = $userContent.Replace("{{preferred_language}}", "Spanish")
    [System.IO.File]::WriteAllText($userFile, $userContent, [System.Text.UTF8Encoding]::new($false))
}

[pscustomobject]@{
    Workspace = $resolvedWorkspace
    Project = $projectPath
    CreatedAt = $createdAt
}

