param([Parameter(Mandatory=$true)][string]$TargetRepository)
$ErrorActionPreference = "Stop"
$Source = Split-Path -Parent $PSScriptRoot
$items = @("app","helm",".github","scripts","Dockerfile",".dockerignore",".gitignore",
"requirements-container.txt","README.md","LICENSE.txt","IBM-CATALOG-STEPS.md")
foreach ($item in $items) {
    Copy-Item (Join-Path $Source $item) (Join-Path $TargetRepository $item) -Recurse -Force
}
Write-Host "IBM Catalog package copied into $TargetRepository"
