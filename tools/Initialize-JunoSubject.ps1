[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$WorkspacePath,

    [Parameter(Mandatory = $true)]
    [string]$SubjectId,

    [Parameter(Mandatory = $true)]
    [string]$SubjectName,

    [string]$TopicId,

    [string]$TopicName
)

$ErrorActionPreference = "Stop"

$repositoryRoot = Split-Path -Parent $PSScriptRoot
$subjectTemplates = Join-Path $repositoryRoot "templates\subject"
$resolvedWorkspace = [System.IO.Path]::GetFullPath($WorkspacePath)

if (-not (Test-Path -LiteralPath $resolvedWorkspace -PathType Container)) {
    throw "WorkspacePath must point to an existing Juno workspace."
}

if ($SubjectId -notmatch '^[a-z0-9][a-z0-9-]*$') {
    throw "SubjectId must contain lowercase letters, numbers, or hyphens."
}

$hasTopicId = -not [string]::IsNullOrWhiteSpace($TopicId)
$hasTopicName = -not [string]::IsNullOrWhiteSpace($TopicName)
if ($hasTopicId -ne $hasTopicName) {
    throw "TopicId and TopicName must be provided together."
}
if ($hasTopicId -and $TopicId -notmatch '^[a-z0-9][a-z0-9-]*$') {
    throw "TopicId must contain lowercase letters, numbers, or hyphens."
}

$subjectsRoot = Join-Path $resolvedWorkspace "subjects"
$subjectPath = Join-Path $subjectsRoot $SubjectId
$createdAt = Get-Date -Format "yyyy-MM-dd"

New-Item -ItemType Directory -Path $subjectsRoot -Force | Out-Null
New-Item -ItemType Directory -Path $subjectPath -Force | Out-Null

$subjectsReadme = Join-Path $subjectsRoot "README.md"
if (-not (Test-Path -LiteralPath $subjectsReadme)) {
    Copy-Item -LiteralPath (Join-Path $subjectTemplates "README.md") -Destination $subjectsReadme
}

$subjectsIndex = Join-Path $subjectsRoot "index.md"
if (-not (Test-Path -LiteralPath $subjectsIndex)) {
    Copy-Item -LiteralPath (Join-Path $subjectTemplates "index.md") -Destination $subjectsIndex
}

foreach ($directory in @("topics", "materials", "evidence", "sessions", "classes")) {
    New-Item -ItemType Directory -Path (Join-Path $subjectPath $directory) -Force | Out-Null
}

$replacements = @{
    "{{subject_id}}" = $SubjectId
    "{{subject_name}}" = $SubjectName
    "{{created_at}}" = $createdAt
    "{{topic_id}}" = $(if ($hasTopicId) { $TopicId } else { "pending-topic" })
    "{{topic_name}}" = $(if ($hasTopicName) { $TopicName } else { "Pending topic" })
}

function Write-TemplateFile {
    param(
        [Parameter(Mandatory = $true)][string]$TemplateName,
        [Parameter(Mandatory = $true)][string]$Destination
    )

    if (Test-Path -LiteralPath $Destination) {
        return
    }

    $content = Get-Content -LiteralPath (Join-Path $subjectTemplates $TemplateName) -Raw -Encoding UTF8
    foreach ($entry in $replacements.GetEnumerator()) {
        $content = $content.Replace($entry.Key, $entry.Value)
    }
    [System.IO.File]::WriteAllText($Destination, $content, [System.Text.UTF8Encoding]::new($false))
}

Write-TemplateFile -TemplateName "subject.yaml" -Destination (Join-Path $subjectPath "subject.yaml")
Write-TemplateFile -TemplateName "SUBJECT.md" -Destination (Join-Path $subjectPath "SUBJECT.md")
Write-TemplateFile -TemplateName "MATERIALS.md" -Destination (Join-Path (Join-Path $subjectPath "materials") "README.md")
Write-TemplateFile -TemplateName "EVIDENCE.md" -Destination (Join-Path (Join-Path $subjectPath "evidence") "README.md")
Write-TemplateFile -TemplateName "CLASSES.md" -Destination (Join-Path (Join-Path $subjectPath "classes") "README.md")
Write-TemplateFile -TemplateName "CLASSES_INDEX.md" -Destination (Join-Path (Join-Path $subjectPath "classes") "index.md")

$topicPath = $null
if ($hasTopicId) {
    $topicPath = Join-Path (Join-Path $subjectPath "topics") $TopicId
    New-Item -ItemType Directory -Path $topicPath -Force | Out-Null
    foreach ($file in @("TOPIC.md", "UNDERSTANDING.md", "RETENTION.md", "QUESTIONS.md")) {
        Write-TemplateFile -TemplateName $file -Destination (Join-Path $topicPath $file)
    }
}

$subjectsIndexContent = Get-Content -LiteralPath $subjectsIndex -Raw -Encoding UTF8
$subjectIndexMarker = "| $SubjectId |"
if (-not $subjectsIndexContent.Contains($subjectIndexMarker)) {
    $subjectIndexRow = "| $SubjectId | $SubjectName | active | [$SubjectId/subject.yaml]($SubjectId/subject.yaml) |"
    $subjectsIndexContent = $subjectsIndexContent.TrimEnd() + "`r`n" + $subjectIndexRow + "`r`n"
    [System.IO.File]::WriteAllText(
        $subjectsIndex,
        $subjectsIndexContent,
        [System.Text.UTF8Encoding]::new($false)
    )
}

[pscustomobject]@{
    Workspace = $resolvedWorkspace
    Subject = $subjectPath
    Topic = $topicPath
    CreatedAt = $createdAt
}
