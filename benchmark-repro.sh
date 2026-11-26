#!/usr/bin/env bash
# StackPilot Reproducible VPS Telemetry Check (Ubuntu 24.04 / Linux 6.8+)
# Dataset & lab report: https://stack.lyq705.com/benchmarks/
set -euo pipefail
echo "=== Kernel & CPU ==="
uname -sr
lscpu | grep -E "Model name|CPU\(s\):"
echo "=== Memory & Swap ==="
free -m
echo "=== Sequential fdatasync Disk Write (64 MB) ==="
dd if=/dev/zero of=/tmp/sp_bench.tmp bs=1M count=64 conv=fdatasync 2>&1 | tail -n 1
rm -f /tmp/sp_bench.tmp
echo "=== Top Processes by RSS ==="
ps -eo rss,comm --sort=-rss | head -n 12
