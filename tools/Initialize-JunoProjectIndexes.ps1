[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$WorkspacePath,

    [switch]$Rebuild
)

$ErrorActionPreference = "Stop"

$repositoryRoot = Split-Path -Parent $PSScriptRoot
$projectTemplates = Join-Path $repositoryRoot "templates\project"
$resolvedWorkspace = [System.IO.Path]::GetFullPath($WorkspacePath)
$projectsRoot = Join-Path $resolvedWorkspace "projects"

if (-not (Test-Path -LiteralPath $projectsRoot -PathType Container)) {
    throw "Projects directory not found: $projectsRoot"
}

$sessionTemplate = Join-Path $projectTemplates "sessions\index.md"
$inboxTemplate = Join-Path $projectTemplates "inbox\index.md"
$results = @()

function Escape-TableCell {
    param([AllowNull()][string]$Value)
    if ([string]::IsNullOrWhiteSpace($Value)) {
        return "-"
    }
    return (($Value.Trim() -replace '\|', '\|') -replace '\r?\n', ' ')
}

function Get-FirstMatch {
    param(
        [string]$Content,
        [string]$Pattern
    )
    $match = [regex]::Match(
        $Content,
        $Pattern,
        [System.Text.RegularExpressions.RegexOptions]::Multiline
    )
    if ($match.Success) {
        return $match.Groups[1].Value.Trim()
    }
    return $null
}

function Normalize-SessionStatus {
    param([AllowNull()][string]$Status)
    if ([string]::IsNullOrWhiteSpace($Status)) {
        return "provisional"
    }
    switch -Regex ($Status.Trim().ToLowerInvariant()) {
        '^abiert' { return "open" }
        '^open$' { return "open" }
        '^incomplet' { return "incomplete" }
        '^provisional$' { return "provisional" }
        '^(complet|cerrad|finished)' { return "completed" }
        default { return $Status.Trim().ToLowerInvariant() }
    }
}

foreach ($project in Get-ChildItem -LiteralPath $projectsRoot -Directory) {
    $sessionsPath = Join-Path $project.FullName "sessions"
    $inboxPath = Join-Path $project.FullName "inbox"
    New-Item -ItemType Directory -Path $sessionsPath -Force | Out-Null
    New-Item -ItemType Directory -Path $inboxPath -Force | Out-Null

    $sessionIndex = Join-Path $sessionsPath "index.md"
    $inboxIndex = Join-Path $inboxPath "index.md"

    $sessionCreated = $false
    $inboxCreated = $false

    if ($Rebuild -or -not (Test-Path -LiteralPath $sessionIndex)) {
        $sessionIndexContent = Get-Content -LiteralPath $sessionTemplate -Raw -Encoding UTF8
        $sessionRows = @()
        foreach ($record in Get-ChildItem -LiteralPath $sessionsPath -File -Filter "*.md" |
            Where-Object { $_.Name -ne "index.md" }) {
            $content = Get-Content -LiteralPath $record.FullName -Raw -Encoding UTF8
            $timestamp = Get-FirstMatch -Content $content -Pattern '^#.*?(\d{4}-\d{2}-\d{2}(?:\s+\d{2}:\d{2})?)'
            if (-not $timestamp) {
                $timestamp = $record.LastWriteTime.ToString("yyyy-MM-dd HH:mm")
            }
            $status = Get-FirstMatch -Content $content -Pattern '^\s*-\s*(?:Estado|Status):\s*(.+)$'
            $status = Normalize-SessionStatus $status
            $objective = Get-FirstMatch -Content $content -Pattern '^\s*-\s*(?:Objetivo|Objective):\s*(.+)$'
            $nextStep = Get-FirstMatch -Content $content -Pattern '(?m)^##\s*(?:Pr.ximo paso|Next step)\s*\r?\n+\s*-\s*([^\r\n]+)$'
            $sessionRows += (
                '| {0} | {1} | {2} | {3} | sessions/{4} |' -f
                (Escape-TableCell $timestamp),
                (Escape-TableCell $status),
                (Escape-TableCell $objective),
                (Escape-TableCell $nextStep),
                $record.Name
            )
        }
        if ($sessionRows.Count -gt 0) {
            $sessionIndexContent = $sessionIndexContent.TrimEnd() + "`r`n" + ($sessionRows -join "`r`n") + "`r`n"
        }
        [System.IO.File]::WriteAllText(
            $sessionIndex,
            $sessionIndexContent,
            [System.Text.UTF8Encoding]::new($false)
        )
        $sessionCreated = $true
    }

    if ($Rebuild -or -not (Test-Path -LiteralPath $inboxIndex)) {
        $inboxIndexContent = Get-Content -LiteralPath $inboxTemplate -Raw -Encoding UTF8
        $inboxRows = @()
        foreach ($record in Get-ChildItem -LiteralPath $inboxPath -File -Filter "*.md" |
            Where-Object { $_.Name -ne "index.md" -and $_.Name -ne "README.md" }) {
            $content = Get-Content -LiteralPath $record.FullName -Raw -Encoding UTF8
            $matches = [regex]::Matches(
                $content,
                '(?ms)^##\s+(CAP-[^\r\n]+)\s*\r?\n(.*?)(?=^##\s+CAP-|\z)'
            )
            foreach ($capture in $matches) {
                $captureId = $capture.Groups[1].Value.Trim()
                $body = $capture.Groups[2].Value
                $captured = Get-FirstMatch -Content $body -Pattern '^\s*-\s*Captured:\s*(.+)$'
                $status = Get-FirstMatch -Content $body -Pattern '^\s*-\s*Status:\s*(.+)$'
                $summary = Get-FirstMatch -Content $body -Pattern '(?m)^###\s*Interpretation\s*\r?\n+\s*-\s*([^\r\n]+)$'
                if (-not $summary) {
                    $summary = Get-FirstMatch -Content $body -Pattern '(?m)^###\s*Original\s*\r?\n+\s*>\s*([^\r\n]+)$'
                }
                $inboxRows += (
                    '| {0} | {1} | {2} | {3} | inbox/{4} |' -f
                    (Escape-TableCell $captured),
                    (Escape-TableCell $captureId),
                    (Escape-TableCell $status),
                    (Escape-TableCell $summary),
                    $record.Name
                )
            }
        }
        if ($inboxRows.Count -gt 0) {
            $inboxIndexContent = $inboxIndexContent.TrimEnd() + "`r`n" + ($inboxRows -join "`r`n") + "`r`n"
        }
        [System.IO.File]::WriteAllText(
            $inboxIndex,
            $inboxIndexContent,
            [System.Text.UTF8Encoding]::new($false)
        )
        $inboxCreated = $true
    }

    $results += [pscustomobject]@{
        Project = $project.Name
        SessionIndexCreated = $sessionCreated
        InboxIndexCreated = $inboxCreated
    }
}

$workspaceAgents = Join-Path $resolvedWorkspace "AGENTS.md"
if (Test-Path -LiteralPath $workspaceAgents) {
    $agentsContent = Get-Content -LiteralPath $workspaceAgents -Raw -Encoding UTF8
    $resumptionRule = @'
- Read `projects/<project_id>/sessions/index.md` and inspect every referenced
  `open`, `incomplete`, or `provisional` record before claiming that no
  unfinished session exists.
- If `sessions/index.md` is missing or unreadable, report that the session
  inventory is unavailable. Never interpret a missing index as proof that no
  unfinished session exists.
'@
    if (-not $agentsContent.Contains("sessions/index.md")) {
        $anchor = "### Project resumption"
        $agentsContent = $agentsContent.Replace($anchor, "$anchor`r`n`r`n$resumptionRule")
    }

    $inboxRule = @'
- Add or update every project-specific capture in
  `projects/<project_id>/inbox/index.md`. Include its timestamp, capture ID,
  review state, short summary, and source file.
- When asked about provisional or unrouted project content, read
  `inbox/index.md` and inspect entries in `pending` or `confirmed` state. If the
  index is missing, report that the inventory is unavailable rather than
  claiming the inbox is empty.
'@
    if (-not $agentsContent.Contains("inbox/index.md")) {
        $anchor = "### Universal inbox"
        $agentsContent = $agentsContent.Replace($anchor, "$anchor`r`n`r`n$inboxRule")
    }

    $closureRule = @'
- When an approved closure is stored under
  `projects/<project_id>/sessions/`, add or update its row in
  `sessions/index.md` in the same operation. Record its timestamp, status,
  objective, next step, and relative path.
'@
    if (-not $agentsContent.Contains("When an approved closure is stored under")) {
        $anchor = "### Block closure"
        $agentsContent = $agentsContent.Replace($anchor, "$anchor`r`n`r`n$closureRule")
    }
    [System.IO.File]::WriteAllText(
        $workspaceAgents,
        $agentsContent,
        [System.Text.UTF8Encoding]::new($false)
    )
}

$results
