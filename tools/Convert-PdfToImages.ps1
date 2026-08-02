[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$PdfPath,

    [string]$OutputDirectory,

    [ValidateRange(72, 600)]
    [int]$Dpi = 180,

    [string]$PdftoppmPath,

    [ValidateRange(1, 100000)]
    [int]$FirstPage,

    [ValidateRange(1, 100000)]
    [int]$LastPage,

    [switch]$Force
)

$ErrorActionPreference = 'Stop'

$pdf = Get-Item -LiteralPath $PdfPath
if ($pdf.Extension -ne '.pdf') {
    throw "El archivo de entrada debe ser un PDF: $($pdf.FullName)"
}

$converter = if ($PdftoppmPath) {
    Get-Item -LiteralPath $PdftoppmPath
} else {
    Get-Command 'pdftoppm' -ErrorAction SilentlyContinue
}
if (-not $converter) {
    throw 'No se encontro pdftoppm. Instalalo o proporciona -PdftoppmPath.'
}

if ($LastPage -and -not $FirstPage) {
    throw 'LastPage requires FirstPage.'
}
if ($FirstPage -and -not $LastPage) {
    $LastPage = $FirstPage
}
if ($FirstPage -and $LastPage -lt $FirstPage) {
    throw 'LastPage cannot be lower than FirstPage.'
}

if (-not $OutputDirectory) {
    $OutputDirectory = Join-Path $pdf.DirectoryName 'rendered'
}

$output = New-Item -ItemType Directory -Path $OutputDirectory -Force
$prefix = Join-Path $output.FullName $pdf.BaseName
$existing = @(Get-ChildItem -LiteralPath $output.FullName -Filter "$($pdf.BaseName)-*.png" -File -ErrorAction SilentlyContinue)

if ($existing.Count -gt 0 -and -not $Force) {
    throw "Ya existen paginas renderizadas en $($output.FullName). Usa -Force para reemplazarlas."
}

if ($Force) {
    $existing | Remove-Item -Force
}

$converterPath = if ($converter.Source) { $converter.Source } else { $converter.FullName }
$arguments = @('-png', '-r', $Dpi)
if ($FirstPage) {
    $arguments += @('-f', $FirstPage, '-l', $LastPage)
}
$arguments += @('--', $pdf.FullName, $prefix)
& $converterPath @arguments
if ($LASTEXITCODE -ne 0) {
    throw "pdftoppm termino con codigo $LASTEXITCODE."
}

$pages = @(Get-ChildItem -LiteralPath $output.FullName -Filter "$($pdf.BaseName)-*.png" -File | Sort-Object Name)
if ($pages.Count -eq 0) {
    throw 'La conversion termino sin generar imagenes.'
}

[pscustomobject]@{
    Pdf = $pdf.FullName
    OutputDirectory = $output.FullName
    Pages = $pages.Count
    RequestedRange = $(if ($FirstPage) { "$FirstPage-$LastPage" } else { 'all' })
    Files = @($pages.FullName)
}
