#!/bin/bash

echo "===== Memory Usage (free -h) ====="
free -h
echo ""

echo "===== Disk Usage (df -h) ====="
df -h
echo ""

echo "===== CPU Load (uptime) ====="
uptime
echo ""

echo "===== Open Ports (ss -tuln) ====="
ss -tuln
echo ""

echo "===== Top 5 Memory-Consuming Processes ====="
ps aux --sort=-%mem | head -n 6
