#!/bin/bash
set -e
echo "===== PIPELINE INICIADA - $(date '+%H:%M:%S') ====="
./build.sh
./test.sh
./deploy.sh
./healthcheck.sh

echo "===== PIPELINE VERDE - aplicacao em producao! ====="
