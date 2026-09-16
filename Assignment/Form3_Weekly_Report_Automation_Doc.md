# Assignment Documentation: Form-3 Weekly Progress Report Automation

**Course**: DevOps Lab Assignment  
**Institution**: Swami Keshvanand Institute of Technology, Management & Gramothan, Jaipur  
**Department**: Department of Computer Science & Engineering  
**Student Name**: Manish Bhatt (24ESKCS600)  

---

## Executive Summary
This assignment implements an automated progress tracking system for team members contributing to the DevOps repository. The solution automatically generates weekly PDF evaluation reports (Form-3) using Python and GitHub Actions.

---

## Architectural Components

### 1. Data Aggregator & Parsing Engine (`generate_report.py`)
- **Git Metadata Extraction**: Uses `git rev-parse` and `git log --numstat` to parse commit SHA, author, timestamp, commit message, and lines added/deleted.
- **Metric Aggregation**: Computes individual student contributions including commit percentages, net lines of code (LOC), and active contribution days.
- **Visualization**: Generates dual-axis Matplotlib visual trends (Commit Timeline & Net LOC Bar Chart).
- **PDF Generation**: Formats the output using ReportLab with custom ParagraphStyles, structured Tables, and vector graphics.

### 2. CI/CD Automation Pipeline (`.github/workflows/auto_weekly_report.yml`)
- **Trigger Mechanisms**:
  - **Cron Schedule**: Automatically runs every Saturday at 11:59 PM IST (`18:29 UTC`).
  - **Manual Trigger**: Supports `workflow_dispatch` for on-demand generation from GitHub Actions.
- **Artifact Management**: Archives generated Form-3 PDFs into the `/weekly_reports` directory and commits them using `github-actions[bot]`.

---

## Verification & Testing
1. **Local Test Run**:
   ```bash
   python generate_report.py weekly
   python generate_report.py final
   ```
2. **GitHub Actions Verification**: Successfully triggered manual workflow runs and verified PDF outputs in `/weekly_reports`.

---

## Key Achievements
- Integrated fully automated weekly PDF reporting for team project tracking.
- Ensured zero manual overhead for archiving weekly progress reports.
- Formatted output according to university and department guidelines.
