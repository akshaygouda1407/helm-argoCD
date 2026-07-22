$ErrorActionPreference = "Stop"

Write-Host "Repository structure already created." -ForegroundColor Green
Write-Host "Next steps:"
Write-Host "1. Replace YOUR_GITHUB_USERNAME in argocd files."
Write-Host "2. Replace your-dockerhub-username in Helm values."
Write-Host "3. Configure DOCKERHUB_USERNAME and DOCKERHUB_TOKEN in GitHub Secrets."
Write-Host "4. Run: helm dependency build helm/service-a"
Write-Host "5. Run: helm lint helm/service-a"
