# Exemplo de uso do template typst-ufsm

Este diretório contém um exemplo completo de Tese de Doutorado usando o template. Copie e adapte os arquivos conforme o seu trabalho.

## Como compilar

```bash
typst compile exemplo/ufsm-thesis.typ --root .
```

O `--root .` é obrigatório e deve ser executado a partir da raiz do repositório.

## Estrutura dos arquivos

```
exemplo/
├── ufsm-thesis.typ          # Arquivo principal — configurações e parâmetros do template
│
├── resumo.typ               # Resumo em português
├── abstract.typ             # Abstract em inglês
├── agradecimentos.typ       # Agradecimentos
├── pos-textuais.typ         # Glossário, apêndices e anexos
│
├── chapters/                # Capítulos do corpo do trabalho
│   ├── 01-introducao.typ
│   ├── 02-fundamentacao-teorica.typ
│   ├── 03-trabalhos-relacionados.typ
│   ├── 04-metodologia.typ
│   ├── 05-resultados.typ
│   ├── 06-discussao.typ
│   ├── 07-exemplos-normas.typ
│   └── 08-conclusoes.typ
│
├── references/
│   └── references.bib       # Referências bibliográficas (formato BibTeX)
└── images/                  # Imagens e figuras do trabalho
```

## Arquivo principal (`ufsm-thesis.typ`)

Contém apenas parâmetros de configuração do template — informações do trabalho, banca, listas, epígrafe, palavras-chave, etc. O conteúdo textual extenso é referenciado via `include`:

```typst
resumo:          include "resumo.typ",
abstract:        include "abstract.typ",
agradecimentos:  include "agradecimentos.typ",
pos-textuais:    include "pos-textuais.typ",
```

## Capítulos

Cada capítulo fica em um arquivo separado dentro de `chapters/`. A divisão facilita a navegação, o controle de versão (commits por capítulo) e a colaboração. O arquivo principal inclui todos eles em sequência:

```typst
#include "chapters/01-introducao.typ"
#include "chapters/02-fundamentacao-teorica.typ"
// ...
```

Para adicionar um capítulo, crie `chapters/09-novo-capitulo.typ` e adicione o `#include` correspondente no arquivo principal.

Capítulos que usam funções do template (`apud`, `tabela-abnt`, `quadro`) precisam importá-las no início do arquivo:

```typst
#import "/src/lib.typ": tabela-abnt, quadro
```

## Pós-textuais (`pos-textuais.typ`)

Contém o glossário, os apêndices e os anexos, nessa ordem (conforme MDT/UFSM). Esse arquivo importa as funções necessárias de `lib.typ` diretamente:

```typst
#import "/src/lib.typ": glossario, apendice, anexo
```

## Referências bibliográficas

Adicione as referências em `references/references.bib` no formato BibTeX. O template usa o estilo ABNT adaptado para UFSM (`associacao-brasileira-de-normas-tecnicas-ufsm.csl`, em `src/`).

No texto, cite com `@chave` (citação indireta) ou `#cite(label("chave"), form: "prose")` (citação com autor no texto).
