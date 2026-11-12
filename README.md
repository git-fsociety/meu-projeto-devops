# meu-projeto-devops

Projeto do Bootcamp DevOps Matera 2026: uma pagina HTML simples gerada por script,
testada, publicada e servida em container (nginx + redis), com pipeline local e CI no GitHub Actions.

## Estrutura

- `scripts/` - scripts bash:
  - `relatorio.sh` - relatorio do sistema (data, uptime, disco).
  - `healthcheck.sh` - verifica internet e uso do disco raiz.
  - `build.sh` - gera `app/index.html`.
  - `test.sh` - verifica se `app/index.html` tem o conteudo esperado.
  - `deploy.sh` - copia `app/index.html` para `~/producao`.
  - `pipeline.sh` - roda build, test e deploy em sequencia (para no primeiro erro).
- `app/` - gerada pelo build (nao versionada).
- `Dockerfile` - imagem nginx:alpine servindo `app/index.html`.
- `compose.yaml` - servicos `site` (porta 8080) e `visitas` (redis).
- `.github/workflows/ci.yml` - CI: build e teste em push na main e em pull requests.

## Como rodar

```bash
./scripts/build.sh
docker compose up -d
curl http://localhost:8080
```

Pipeline local completa: `cd scripts && ./pipeline.sh`
