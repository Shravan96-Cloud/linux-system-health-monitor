#!/bin/bash

# ==============================================================================
# Linux System Health and Log Analyzer
# A simple automated health check script for daily server monitoring.
# ==============================================================================

# Define color codes for readable output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}==============================================${NC}"
echo -e "${GREEN}      SYSTEM HEALTH REPORT - $(date '+%Y-%m-%d')      ${NC}"
echo -e "${GREEN}==============================================${NC}"

# 1. System Uptime
echo -e "\n${YELLOW}---> System Uptime & Load:${NC}"
uptime -p
uptime | awk -F'load average:' '{ print "Load Average: " $2 }'

# 2. Disk Usage Check (Flags warning if Root partition is > 80% full)
echo -e "\n${YELLOW}---> Disk Usage (Root Partition):${NC}"
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
df -h / | awk 'NR==2 {print "Total: "$2" | Used: "$3" | Free: "$4" ("$5")"}'

if [ "$DISK_USAGE" -gt 80 ]; then
    echo -e "${RED}[WARNING] Root partition is critically low on space!${NC}"
fi

# 3. Memory Usage Check
echo -e "\n${YELLOW}---> Memory Usage:${NC}"
free -h | awk 'NR==2 {print "Total: "$2" | Used: "$3" | Free: "$4}'

# 4. Top CPU Consuming Process
echo -e "\n${YELLOW}---> Top CPU Consuming Process:${NC}"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 2

# 5. Recent System Logs (Looking for 'error' or 'failed')
echo -e "\n${YELLOW}---> Recent System Log Errors (Last 10 entries):${NC}"
# Note: Using sudo journalctl requires password, so we use tail on a generic log file for practice
# or check standard journalctl if run as root. We will use generic auth logs for this example.
sudo journalctl -p err -n 5 --no-pager 2>/dev/null || echo "No recent errors or requires sudo."

echo -e "\n${GREEN}==============================================${NC}"
echo -e "${GREEN}               REPORT COMPLETE                ${NC}"
echo -e "${GREEN}==============================================${NC}"
