# Linux System Health and Log Analyzer

A simple, automated Bash script for daily server monitoring, built as the Week 1 portfolio project for my Cloud & DevOps learning roadmap.

## 📝 Overview
This script combines core Linux administration commands to provide a quick, readable snapshot of system health. It is designed to act as a lightweight check for servers before implementing heavier monitoring solutions (like Prometheus/Grafana).

### What it checks:
*   **System Uptime & Load:** Displays how long the machine has been running and current CPU load averages.
*   **Disk Usage:** Calculates usage of the Root partition and flags a warning if it exceeds 80% capacity.
*   **Memory Usage:** Shows Total, Used, and Free RAM in a human-readable format.
*   **Top Processes:** Identifies the single process currently consuming the most CPU resources.
*   **Log Analysis:** Scans recent system logs (`journalctl`) for critical errors or failures.

---

## 🚀 Setup & Execution

### Prerequisites
*   A Linux environment (Ubuntu, Debian, CentOS, WSL, etc.)
*   Basic terminal access.

### Instructions
1.  Clone this repository to your local machine:
    ```bash
    git clone [https://github.com/Shravan96-Cloud/linux-system-health-monitor.git](https://github.com/Shravan96-Cloud/linux-system-health-monitor.git)
    ```
2.  Navigate into the directory:
    ```bash
    cd linux-system-health-monitor
    ```
3.  Ensure the script is executable:
    ```bash
    chmod +x health_check.sh
    ```
4.  Run the script:
    ```bash
    ./health_check.sh
    ```

---

## 🛠️ Technologies Used
*   **Linux Commands:** `uptime`, `df`, `free`, `ps`, `awk`, `sed`, `journalctl`
*   **Scripting:** Bash (`/bin/bash`)
*   **Version Control:** Git & GitHub

## 💡 Lessons Learned
Building this script reinforced how to pipe `|` the output of raw Linux commands into text processing tools like `awk` and `sed` to extract only the specific data points needed for a clean report.
