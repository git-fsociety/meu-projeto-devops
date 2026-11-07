#!/bin/bash
set -e
echo "[DEPLOY] Publicando em 'producao'..."
mkdir -p ~/producao
cp ~/meu-projeto-devops/app/index.html ~/producao/
echo "[DEPLOY] OK - publicado em ~/producao/index.html"
