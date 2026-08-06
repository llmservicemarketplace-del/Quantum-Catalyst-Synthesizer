# IBM Cloud Catalog release

1. Merge this package into the existing GitHub repository.
2. Run `.\scripts\prepare-ibm-release.ps1`.
3. Commit and push `main`.
4. Tag and push `v0.1.0`.
5. Wait for both GitHub Actions workflows.
6. Make the GitHub container package public.
7. Enable GitHub Pages from `main` and `/docs`.
8. Verify the public `index.yaml`.
9. Import the Helm version in IBM Cloud Catalog.
