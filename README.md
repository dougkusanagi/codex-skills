# Codex Skills

Catálogo pessoal de skills úteis para reinstalar o ambiente do Codex em uma máquina nova.

Este repositório não copia nem modifica as skills. Ele mantém referências aos repositórios originais e uma revisão conhecida (`skills.lock`), para facilitar a instalação e tornar atualizações explícitas.

## Instalação

Na máquina nova, depois de clonar este repositório:

```bash
./install.sh
```

Ou diretamente:

```bash
curl -fsSL https://raw.githubusercontent.com/dougkusanagi/codex-skills/main/install.sh | bash
```

O instalador usa o `skills` CLI e instala as entradas do manifesto como skills globais do Codex. A autenticação do GitHub continua necessária para repositórios privados.

## Catálogo

| Skill | Origem | Revisão | Uso |
|---|---|---|---|
| `archify` | `tt-a1i/archify` | `06dd052602dd9a369e4d034e24faef0917b5a60c` | Diagramas de arquitetura, workflow, sequência, dados e lifecycle |

## Atualizar uma skill

1. Verifique a nova revisão no repositório original.
2. Atualize a linha correspondente em `skills.lock`.
3. Execute `./install.sh --only <skill>`.
4. Registre a mudança no histórico do commit.

As skills permanecem sob a licença e os termos de seus respectivos repositórios.
