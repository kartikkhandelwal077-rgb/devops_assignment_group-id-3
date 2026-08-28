#!/usr/bin/env bash
# ==============================================================================
# System Health Check & Resource Monitoring Script
# ==============================================================================

set -euo pipefail

LOG_FILE="/tmp/system_health_$(date +%Y%m%d).log"

echo "==========================================" | tee -a "$LOG_FILE"
echo "DevOps Health Check - $(date)" | tee -a "$LOG_FILE"
echo "==========================================" | tee -a "$LOG_FILE"

# 1. CPU Usage Check
echo "[1/4] Checking CPU Usage..." | tee -a "$LOG_FILE"
CPU_LOAD=$(uptime | awk -F'load average:' '{ print $2 }')
echo "  Current Load Average: $CPU_LOAD" | tee -a "$LOG_FILE"

# 2. Memory Usage Check
echo "[2/4] Checking Memory Usage..." | tee -a "$LOG_FILE"
free -h | awk 'NR==2{printf "  Used: %s / Total: %s (%.2f%%)\n", $3, $2, $3/$2*100}' | tee -a "$LOG_FILE"

# 3. Disk Space Usage Check
echo "[3/4] Checking Disk Usage..." | tee -a "$LOG_FILE"
df -h / | awk 'NR==2{printf "  Used: %s / Total: %s (Capacity: %s)\n", $3, $2, $5}' | tee -a "$LOG_FILE"

# 4. Active Network Connections
echo "[4/4] Checking Active Ports & Connections..." | tee -a "$LOG_FILE"
netstat -tulpn 2>/dev/null | grep LISTEN | head -n 5 || echo "  No open listening ports detected."

echo "==========================================" | tee -a "$LOG_FILE"
echo "Health check complete. Log saved to: $LOG_FILE"
