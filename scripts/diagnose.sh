#!/usr/bin/env bash

set -u

REPORT_DIR="$HOME/ec2-troubleshooting-lab/incident-reports"
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
REPORT="$REPORT_DIR/diagnostic_$TIMESTAMP.txt"

mkdir -p "$REPORT_DIR"

{
    echo "======================================"
    echo " Linux Cloud Support Diagnostic Report"
    echo "======================================"
    echo "Date: $(date)"
    echo "Hostname: $(hostname)"
    echo

    echo "----- UPTIME AND LOAD -----"
    uptime
    echo

    echo "----- CPU AND PROCESSES -----"
    top -bn1 | head -n 12
    echo

    echo "----- MEMORY -----"
    free -h
    echo

    echo "----- DISK SPACE -----"
    df -h
    echo

    echo "----- NETWORK INTERFACES -----"
    ip -brief address
    echo

    echo "----- LISTENING PORTS -----"
    ss -lnt
    echo

    echo "----- APPLICATION HEALTH -----"
    if curl -fsS --max-time 3 http://127.0.0.1:8000/api/health; then
        echo
        echo "RESULT: Application health check PASSED"
    else
        echo
        echo "RESULT: Application health check FAILED"
    fi
    echo

    echo "----- API READINESS -----"
    if curl -fsS --max-time 3 http://127.0.0.1:8000/api/ready; then
        echo
        echo "RESULT: Application readiness check PASSED"
    else
        echo
        echo "RESULT: Application readiness check FAILED"
    fi
    echo
} > "$REPORT" 2>&1

echo "Diagnostic report created:"
echo "$REPORT"
