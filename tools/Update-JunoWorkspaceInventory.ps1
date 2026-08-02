[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$WorkspacePath
)

$ErrorActionPreference = "Stop"

$repositoryRoot = Split-Path -Parent $PSScriptRoot
$templatePath = Join-Path $repositoryRoot "templates\projects\index.md"
$resolvedWorkspace = [System.IO.Path]::GetFullPath($WorkspacePath)
$projectsRoot = Join-Path $resolvedWorkspace "projects"
$indexPath = Join-Path $projectsRoot "index.md"

if (-not (Test-Path -LiteralPath $projectsRoot -PathType Container)) {
    throw "Projects directory not found: $projectsRoot"
}

function Escape-TableCell {
    param([AllowNull()][string]$Value)
    if ([string]::IsNullOrWhiteSpace($Value)) {
        return "-"
    }
    return (($Value.Trim() -replace '\|', '\|') -replace '\r?\n', ' ')
}

function Get-YamlScalar {
    param(
        [string]$Content,
        [string]$Key
    )
    $match = [regex]::Match(
        $Content,
        "(?m)^\s*$([regex]::Escape($Key))\s*:\s*[`"']?([^`"'#\r\n]+)"
    )
    if ($match.Success) {
        return $match.Groups[1].Value.Trim()
    }
    return $null
}

$template = Get-Content -LiteralPath $templatePath -Raw -Encoding UTF8
$rows = @()

foreach ($project in Get-ChildItem -LiteralPath $projectsRoot -Directory |
    Sort-Object Name) {
    $metadataPath = Join-Path $project.FullName "project.yaml"
    $projectId = $project.Name
    $projectName = $project.Name
    $status = "unknown"
    $canonicalFiles = @()

    if (Test-Path -LiteralPath $metadataPath -PathType Leaf) {
        $metadata = Get-Content -LiteralPath $metadataPath -Raw -Encoding UTF8
        $parsedId = Get-YamlScalar -Content $metadata -Key "id"
        $parsedName = Get-YamlScalar -Content $metadata -Key "name"
        $parsedStatus = Get-YamlScalar -Content $metadata -Key "status"
        if ($parsedId) { $projectId = $parsedId }
        if ($parsedName) { $projectName = $parsedName }
        if ($parsedStatus) { $status = $parsedStatus }
        $canonicalFiles += Get-Item -LiteralPath $metadataPath
    }

    foreach ($name in @("STATUS.md", "TODO.md")) {
        $path = Join-Path $project.FullName $name
        if (Test-Path -LiteralPath $path -PathType Leaf) {
            $canonicalFiles += Get-Item -LiteralPath $path
        }
    }

    $lastUpdated = "-"
    if ($canonicalFiles.Count -gt 0) {
        $lastUpdated = (
            $canonicalFiles |
            Sort-Object LastWriteTime -Descending |
            Select-Object -First 1
        ).LastWriteTime.ToString("yyyy-MM-dd HH:mm")
    }

    $rows += (
        "| {0} | {1} | {2} | {3} | {4} | projects/{5}/project.yaml |" -f
        (Escape-TableCell $project.Name),
        (Escape-TableCell $projectId),
        (Escape-TableCell $projectName),
        (Escape-TableCell $status),
        (Escape-TableCell $lastUpdated),
        $project.Name
    )
}

$rowContent = $rows -join "`r`n"
$content = $template.Replace("<!-- PROJECT_ROWS -->", $rowContent).TrimEnd() + "`r`n"

[System.IO.File]::WriteAllText(
    $indexPath,
    $content,
    [System.Text.UTF8Encoding]::new($false)
)

[pscustomobject]@{
    Workspace = $resolvedWorkspace
    Index = $indexPath
    Projects = $rows.Count
}
