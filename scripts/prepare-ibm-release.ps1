param([string]$Version = "0.1.0")

$ErrorActionPreference = "Stop"
Set-Location (Split-Path -Parent $PSScriptRoot)

Write-Host "Validating Helm chart..."
helm lint .\helm\quantum-catalyst-synthesizer
helm template qcs-test .\helm\quantum-catalyst-synthesizer | Out-Null

Write-Host "Building container..."
docker build --no-cache `
  -t "quantum-catalyst-synthesizer:$Version" .

$ExistingContainer = docker ps -a `
  --filter "name=^qcs-catalog-test$" `
  --format "{{.Names}}"

if ($ExistingContainer -eq "qcs-catalog-test") {
    docker rm -f qcs-catalog-test | Out-Null
}

Write-Host "Starting smoke-test container..."
docker run --rm -d `
  --name qcs-catalog-test `
  -p 8080:8080 `
  "quantum-catalyst-synthesizer:$Version" | Out-Null

Start-Sleep -Seconds 5

try {
    $Health = Invoke-RestMethod `
      "http://localhost:8080/health"

    if ($Health.status -ne "healthy") {
        throw "Health endpoint did not report healthy."
    }

    Write-Host ""
    Write-Host "IBM Catalog checks passed."
    Write-Host "Container health: $($Health.status)"
}
finally {
    $RunningContainer = docker ps -a `
      --filter "name=^qcs-catalog-test$" `
      --format "{{.Names}}"

    if ($RunningContainer -eq "qcs-catalog-test") {
        docker rm -f qcs-catalog-test | Out-Null
    }
}
