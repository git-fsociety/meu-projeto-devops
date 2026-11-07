#!/bin/bash
echo "=== Relatorio do sistema === "
date
uptime
df -h / | grep -v Filesystem
