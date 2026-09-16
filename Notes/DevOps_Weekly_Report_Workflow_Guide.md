# Workflow to Generate Weekly Report from GitHub

## Overview
This document outlines the end-to-end workflow for launching a GitHub Codespace, setting up the automated Form-3 weekly progress reporting script using Python (`reportlab` & `matplotlib`), configuring the GitHub Actions workflow, and pushing changes to the repository.

---

## 1. Launching and Entering GitHub Codespace
1. Open the repository on GitHub in your browser.
2. Click the green **`<> Code`** button near the top right.
3. Switch from the **Local** tab to the **Codespaces** tab.
4. Click **"Create codespace on main"** (or select an existing Codespace to resume).
5. The full VS Code web environment with a built-in terminal will load directly in your browser.

---

## 2. Python Reporting Script (`generate_report.py`)
The `generate_report.py` script parses Git commit history, calculates contribution metrics (commits, lines added/deleted, active days), generates visual charts using Matplotlib, and compiles a professional PDF using ReportLab.

### Features:
- **Institution Header**: Swami Keshvanand Institute of Technology, Management & Gramothan, Jaipur (Computer Science & Engineering).
- **Evaluation Window Options**: `weekly` (7 days), `monthly` (30 days), and `final` (entire repository history).
- **Contribution Breakdown Table**: Commits percentage, Lines Added, Lines Deleted, Net LOC, and Active Days per student.
- **Visual Trend Charts**: Commit Timeline Plot and Net LOC Written Bar Chart.
- **Detailed Log Section**: Per-student commit history with dates, commit hashes, and sanitized commit messages.

---

## 3. Automated GitHub Actions Workflow (`.github/workflows/auto_weekly_report.yml`)
The workflow automatically executes every **Saturday at 11:59 PM IST** (`18:29 UTC`, cron: `29 18 * * 6`) or on manual trigger from the GitHub Actions tab.

```yaml
name: Weekly Progress Report Auto-Commit

on:
  schedule:
    - cron: '29 18 * * 6'
  workflow_dispatch:

permissions:
  contents: write

jobs:
  generate-and-commit:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository with Full Git History
        uses: actions/checkout@v4
        with:
          fetch-depth: 0
          token: ${{ secrets.GITHUB_TOKEN }}

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.x'

      - name: Install PDF & Graph Dependencies
        run: |
          pip install reportlab matplotlib

      - name: Generate Weekly PDF Report
        run: |
          python generate_report.py weekly

      - name: Move PDF to Weekly Reports Directory & Commit
        run: |
          mkdir -p weekly_reports
          mv *_Weekly_Progress_Report_Form-3_*.pdf weekly_reports/

          git config --global user.name "github-actions[bot]"
          git config --global user.email "github-actions[bot]@users.noreply.github.com"

          git add weekly_reports/

          if git diff --staged --quiet; then
            echo "No new changes or reports to commit."
          else
            git commit -m "docs: archive Form-3 weekly progress report [skip ci]"
            git push
          fi
```

---

## 4. Manual Execution Commands
```bash
# Install dependencies
pip install reportlab matplotlib

# Generate reports
python generate_report.py weekly
python generate_report.py monthly
python generate_report.py final
```

---

## 5. Git Commit & Push Process
```bash
git add .
git commit -m "docs: add Form-3 weekly progress report workflow"
git pull --rebase origin main
git push origin main
```
