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
$inboxTemplates = Join-Path $repositoryRoot "templates\inbox"
$subjectTemplates = Join-Path $repositoryRoot "templates\subject"
$planningTemplates = Join-Path $repositoryRoot "templates\planning"
$projectsTemplates = Join-Path $repositoryRoot "templates\projects"
$logsTemplates = Join-Path $repositoryRoot "templates\logs"
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
    "subjects",
    "planning",
    "state",
    "cache",
    "logs",
    "logs\model-usage",
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

$inboxReadmeSource = Join-Path $inboxTemplates "README.md"
$inboxReadmeDestination = Join-Path (Join-Path $resolvedWorkspace "inbox") "README.md"
if (-not (Test-Path -LiteralPath $inboxReadmeDestination)) {
    Copy-Item -LiteralPath $inboxReadmeSource -Destination $inboxReadmeDestination
}

$inboxIndexSource = Join-Path $inboxTemplates "index.md"
$inboxIndexDestination = Join-Path (Join-Path $resolvedWorkspace "inbox") "index.md"
if (-not (Test-Path -LiteralPath $inboxIndexDestination)) {
    Copy-Item -LiteralPath $inboxIndexSource -Destination $inboxIndexDestination
}

$subjectsReadmeSource = Join-Path $subjectTemplates "README.md"
$subjectsReadmeDestination = Join-Path (Join-Path $resolvedWorkspace "subjects") "README.md"
if (-not (Test-Path -LiteralPath $subjectsReadmeDestination)) {
    Copy-Item -LiteralPath $subjectsReadmeSource -Destination $subjectsReadmeDestination
}

$subjectsIndexSource = Join-Path $subjectTemplates "index.md"
$subjectsIndexDestination = Join-Path (Join-Path $resolvedWorkspace "subjects") "index.md"
if (-not (Test-Path -LiteralPath $subjectsIndexDestination)) {
    Copy-Item -LiteralPath $subjectsIndexSource -Destination $subjectsIndexDestination
}

$planningReadmeSource = Join-Path $planningTemplates "README.md"
$planningReadmeDestination = Join-Path (Join-Path $resolvedWorkspace "planning") "README.md"
if (-not (Test-Path -LiteralPath $planningReadmeDestination)) {
    Copy-Item -LiteralPath $planningReadmeSource -Destination $planningReadmeDestination
}

$logsReadmeSource = Join-Path $logsTemplates "README.md"
$logsReadmeDestination = Join-Path (Join-Path $resolvedWorkspace "logs") "README.md"
if (-not (Test-Path -LiteralPath $logsReadmeDestination)) {
    Copy-Item -LiteralPath $logsReadmeSource -Destination $logsReadmeDestination
}

$modelUsageReadmeSource = Join-Path (Join-Path $logsTemplates "model-usage") "README.md"
$modelUsageReadmeDestination = Join-Path (Join-Path (Join-Path $resolvedWorkspace "logs") "model-usage") "README.md"
if (-not (Test-Path -LiteralPath $modelUsageReadmeDestination)) {
    Copy-Item -LiteralPath $modelUsageReadmeSource -Destination $modelUsageReadmeDestination
}

$projectsIndexSource = Join-Path $projectsTemplates "index.md"
$projectsIndexDestination = Join-Path (Join-Path $resolvedWorkspace "projects") "index.md"
if (-not (Test-Path -LiteralPath $projectsIndexDestination)) {
    Copy-Item -LiteralPath $projectsIndexSource -Destination $projectsIndexDestination
}

$projectPath = Join-Path (Join-Path $resolvedWorkspace "projects") $ProjectId
New-Item -ItemType Directory -Path $projectPath -Force | Out-Null

foreach ($directory in $projectDirectories) {
    New-Item -ItemType Directory -Path (Join-Path $projectPath $directory) -Force | Out-Null
}

$createdAt = Get-Date -Format "yyyy-MM-dd"
$projectFiles = @("AGENTS.md", "PROJECT.md", "STATUS.md", "TODO.md", "DECISIONS.md", "project.yaml")

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

$projectIndexTemplates = @{
    "sessions\index.md" = "sessions\index.md"
    "inbox\index.md" = "inbox\index.md"
}

foreach ($relativeDestination in $projectIndexTemplates.Keys) {
    $relativeSource = $projectIndexTemplates[$relativeDestination]
    $source = Join-Path $projectTemplates $relativeSource
    $destination = Join-Path $projectPath $relativeDestination
    if (-not (Test-Path -LiteralPath $destination)) {
        Copy-Item -LiteralPath $source -Destination $destination
    }
}

$userFile = Join-Path $resolvedWorkspace "USER.md"
$userContent = Get-Content -LiteralPath $userFile -Raw -Encoding UTF8
if ($userContent.Contains("{{preferred_language}}")) {
    $userContent = $userContent.Replace("{{preferred_language}}", "Spanish")
    [System.IO.File]::WriteAllText($userFile, $userContent, [System.Text.UTF8Encoding]::new($false))
}

$inventoryTool = Join-Path $PSScriptRoot "Update-JunoWorkspaceInventory.ps1"
& $inventoryTool -WorkspacePath $resolvedWorkspace | Out-Null

[pscustomobject]@{
    Workspace = $resolvedWorkspace
    Project = $projectPath
    CreatedAt = $createdAt
}
