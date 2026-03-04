#!/usr/bin/env pwsh
# Build Regina Emily OpenClaw image with gog support

Write-Host "Building Regina Emily OpenClaw with gog CLI..." -ForegroundColor Cyan

# Step 1: Build base OpenClaw image
Write-Host "`n[1/2] Building base OpenClaw image..." -ForegroundColor Yellow
docker build -t regina-emily-openclaw:base ./state/vendor/openclaw

if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to build base OpenClaw image" -ForegroundColor Red
    exit 1
}

# Step 2: Build Regina extended image with gog
Write-Host "`n[2/2] Building Regina image with gog CLI..." -ForegroundColor Yellow
docker build -f Dockerfile.regina --build-arg BASE_IMAGE=regina-emily-openclaw:base -t regina-emily-openclaw:local .

if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to build Regina image" -ForegroundColor Red
    exit 1
}

Write-Host "`nBuild complete! Image: regina-emily-openclaw:local" -ForegroundColor Green
Write-Host "Run 'docker-compose up -d' to start the services." -ForegroundColor Cyan
