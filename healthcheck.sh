#!/bin/bash
# healthcheck.sh - verifica a saude basica da maquina

set -e 
echo "=== Health Check - $(hostname) - $(date '+%d/%m/%Y %H:%M') ==="


set -e

SITE=${1:-ubuntu.com}
# 1) Internet: o ping respondeu?
if ping -4 -c 1 -W 3 "$SITE" > /dev/null 2>&1; then
	echo "[OK] Internet ($SITE)"
else
	echo "[FALHA] Internet ($SITE)"
fi

# 2) Disco: acima de 80% de uso, alerta
USO_DISCO=$(df / --output=pcent | tail -1 | tr -d ' %')
if [ "$USO_DISCO" -lt 80 ]; then
   echo "[OK] Disco: ${USO_DISCO}% usado"
else
   echo "[FALHA] Disco: ${USO_DISCO}% usado (acima de 80%)"
fi

# 3) Memoria: coluna 7 do free -m = "available"
MEM_LIVRE=$(free -m | awk '/Mem/ {print $7}')
if [ "$MEM_LIVRE" -gt 500 ]; then
    echo "[OK] Memoria disponivel: ${MEM_LIVRE} MB"
else
    echo "[FALHA] Memoria disponivel: ${MEM_LIVRE} MB (abaixo de 500 MB)"
fi

# 4) Processos: quantos estao rodando
echo "[OK] Processos rodando: $(ps aux | wc -l)"

echo "Fim do health check"
