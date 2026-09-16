# DevOps CheatSheet: GitHub Actions & Automated Reporting

## 1. Useful Git Log Parsing Commands
```bash
# Get log with custom separators for script parsing
git log --no-merges --pretty=format:"COMMIT|||%h|||%an|||%ad|||%s" --date=short --numstat

# Get commit stats for specific date window (e.g., last 7 days)
git log --since=2026-09-09 --author="ManishBhattPC" --oneline

# Get total lines added and deleted by author
git log --author="ManishBhattPC" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "Added: %s, Subtracted: %s, Net: %s\n", add, subs, loc }'
```

---

## 2. GitHub Actions Cron Syntax Reference
| Field | Value Range | Description |
| :--- | :--- | :--- |
| **Minute** | `0 - 59` | Minute of the hour |
| **Hour** | `0 - 23` | Hour in UTC |
| **Day of Month** | `1 - 31` | Day of the month |
| **Month** | `1 - 12` | Month of the year |
| **Day of Week** | `0 - 6` | Day of the week (`0` = Sun, `6` = Sat) |

### Common Cron Examples:
- **Every Saturday at 11:59 PM IST (18:29 UTC)**: `29 18 * * 6`
- **Every Monday at 9:00 AM IST (03:30 UTC)**: `30 3 * * 1`
- **Every Day at Midnight UTC**: `0 0 * * *`

---

## 3. ReportLab PDF Generation Quick Reference
```python
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle

# Create Document
doc = SimpleDocTemplate("report.pdf", pagesize=letter, rightMargin=36, leftMargin=36, topMargin=30, bottomMargin=30)
story = []

# Table Styling
table = Table(data, colWidths=[120, 80, 80, 80, 80, 100])
table.setStyle(TableStyle([
    ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor("#1E293B")),
    ('TEXTCOLOR', (0, 0), (-1, 0), colors.whitesmoke),
    ('GRID', (0, 0), (-1, -1), 0.5, colors.HexColor("#CBD5E1")),
]))
story.append(table)
doc.build(story)
```
