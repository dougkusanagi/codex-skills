# Plano de evolução do catálogo de skills

Objetivo: manter um catálogo pessoal reproduzível, fácil de reinstalar e seguro para atualizar, sem copiar ou fazer fork das skills originais.

## Estado atual

- [x] Repositório pessoal separado das skills upstream.
- [x] Manifesto com origem e commit fixado.
- [x] Instalador global para Codex.
- [x] Instalação seletiva com `--only`.
- [x] Archify cadastrado como primeira skill.

## P0 — tornar a instalação confiável

- [ ] Tornar o manifesto mais explícito, preferencialmente JSON ou YAML, com `name`, `source`, `skill`, `ref`, `agent`, `scope` e `license`.
- [ ] Validar entradas antes de instalar: nome duplicado, origem inválida, ref ausente e skill incompatível.
- [ ] Tornar `install.sh` idempotente e seguro para reexecução, sem falhar apenas porque a skill já existe.
- [ ] Adicionar `--dry-run` e mensagens claras para instalação total ou seletiva.

Aceite: uma máquina nova instala o catálogo inteiro; uma segunda execução não corrompe nem duplica skills; uma entrada inválida falha antes de alterar o ambiente.

## P1 — atualização controlada

- [ ] Criar `check-updates.sh`, somente leitura, que compare cada `ref` fixada com a referência upstream.
- [ ] Criar `update.sh [nome]`, exigindo revisão explícita antes de alterar o manifesto.
- [ ] Manter atualização por commit/tag fixado como padrão; não atualizar silenciosamente para `latest`.
- [ ] Mostrar diff ou resumo da mudança antes do commit.

Aceite: verificar atualizações não modifica arquivos; atualizar uma skill altera somente sua entrada; atualizar uma skill não atualiza as demais.

## P1 — qualidade e segurança

- [ ] Verificar licença e atribuição de cada skill cadastrada.
- [ ] Documentar quando uma skill é pública, privada ou contém dependências externas.
- [ ] Adicionar CI para validar manifesto, scripts, links e shellcheck quando disponível.
- [ ] Evitar segredos no manifesto, scripts e histórico do catálogo.

Aceite: o CI rejeita manifesto inválido, script sem permissão de execução ou referência quebrada.

## P2 — preservação opcional

- [ ] Definir política para snapshots locais de skills críticas, somente quando a licença permitir.
- [ ] Armazenar snapshots como release asset ou arquivo versionado separado, sem substituir a referência upstream.
- [ ] Registrar a versão do snapshot e o motivo da preservação.

Essa fase só é necessária para evitar perda caso um repositório upstream seja removido. Para a maioria das skills, commit fixado e origem pública são suficientes.

## Fluxo para adicionar uma skill

1. Confirmar origem, nome da skill, licença e compatibilidade com Codex.
2. Obter um commit ou tag estável.
3. Adicionar uma entrada ao manifesto.
4. Executar validação e `./install.sh --only <nome>`.
5. Registrar a mudança no commit.

## Definition of Done

Uma melhoria só está concluída quando possui teste reproduzível, documentação atualizada, comportamento idempotente e um commit que explique a mudança. Atualizações automáticas sem revisão humana não fazem parte do plano.
