# DevSecOps: Security Integration in CI/CD Pipelines

## 1. Overview
DevSecOps embeds security practices early into the software development lifecycle (Shift-Left Security), ensuring automated security scans at every stage of integration and delivery.

---

## 2. Core Pillars of DevSecOps
- **Static Application Security Testing (SAST)**: Scans source code for vulnerabilities before compilation (e.g., SonarQube, Semgrep).
- **Software Composition Analysis (SCA)**: Scans third-party open-source dependencies for known CVEs (e.g., OWASP Dependency-Check, Trivy).
- **Dynamic Application Security Testing (DAST)**: Analyzes running applications for runtime vulnerabilities (e.g., OWASP ZAP).
- **Secret Scanning**: Detects hardcoded API keys, tokens, and credentials in Git history (e.g., Trufflehog, GitGuardian).

---

## 3. GitHub Actions Secret Scanning Workflow
```yaml
name: Security & Secret Scan

on: [push, pull_request]

jobs:
  secret-scan:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - name: Secret Scan with TruffleHog
        uses: trufflesecurity/trufflehog-actions-verify@main
```
