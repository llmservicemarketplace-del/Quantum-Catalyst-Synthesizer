# Quantum Catalyst Synthesizer

**By The New Faith Church and Co-op, Inc.**

This repository includes a minimal working FastAPI service, Linux container,
Helm chart, and GitHub publishing workflows for IBM Cloud Catalog onboarding.

## Local verification

```powershell
.\scripts\prepare-ibm-release.ps1
```

## IBM Catalog settings

- Delivery method: Helm chart
- Repository type: Public repository
- Source URL: https://llmservicemarketplace-del.github.io/Quantum-Catalyst-Synthesizer
- Software version: 0.1.0

The production molecular and IBM Quantum engines can be connected behind the
existing API without changing the deployment contract.

Do not commit IBM Quantum tokens. The chart can reference an existing
Kubernetes secret through `ibmQuantum.tokenSecretName`.
