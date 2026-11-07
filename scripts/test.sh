#!/bin/bash
set -e

ARQUIVO=~/meu-projeto-devops/app/index.html

echo "[TEST] Verificando a aplicacao..."

if [ ! -f "$ARQUIVO" ]; then
  echo "[TEST] FALHOU - index.html nao existe!"
exit 1;
fi

if grep -q "Bootcamp DevOps" "$ARQUIVO"; then
    echo "[TEST] OK - conteudo esperado encontrado."
else
    echo "[TEST] FALHOU - conteudo esperado nao encontrado!"
    exit 1
fi
