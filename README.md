# Template Typst para o Manual de Dissertações e Teses (MDT) da UFSM

[![Typst Build](https://github.com/sehnem/typst-ufsm/actions/workflows/ci.yml/badge.svg)](https://github.com/sehnem/typst-ufsm/actions/workflows/ci.yml)
[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![GitHub stars](https://img.shields.io/github/stars/sehnem/typst-ufsm.svg)](https://github.com/sehnem/typst-ufsm/stargazers)

Um template [Typst](https://typst.app/) para o [Manual de Dissertações e Teses (MDT)](https://repositorio.ufsm.br/handle/1/24203) da Universidade Federal de Santa Maria (UFSM).

O objetivo deste projeto é fornecer uma alternativa moderna e eficiente ao tradicional fluxo de trabalho com LaTeX para a produção de trabalhos acadêmicos (TCC, Dissertação, Tese), seguindo as normas da UFSM.

## O que é Typst?

Typst é um moderno sistema de composição tipográfica baseado em marcação, projetado para ser uma alternativa mais simples e poderosa ao LaTeX. Ele oferece uma sintaxe intuitiva, compilação extremamente rápida e um ambiente de desenvolvimento integrado que facilita a escrita de documentos acadêmicos e científicos.

## Visualizar Exemplo

Para ver um exemplo do documento gerado com este template, você pode baixar o PDF compilado mais recente:

**[📄 Download do PDF de Exemplo](https://github.com/sehnem/typst-ufsm/releases/download/latest/ufsm-thesis.pdf)**

## Tipos de Trabalho Suportados

O template suporta as combinações `tipo-trabalho` / `grau` / `titulo-grau` listadas abaixo:

| Tipo | `tipo-trabalho` | `grau` | `titulo-grau` (exemplo) |
|---|---|---|---|
| Doutorado | `"Tese"` | `"Doutor"` | `"Doutor em Ciência da Computação"` |
| Mestrado | `"Dissertação"` | `"Mestre"` | `"Mestre em Ciência da Computação"` |
| Especialização | `"TCC"` | `"Especialista"` | `"Especialista em Gestão de TI"` |
| Graduação (Bacharel) | `"TCC"` | `"Bacharel"` | `"Bacharel em Ciência da Computação"` |
| Licenciatura | `"TCC"` | `"Licenciado"` | `"Licenciado em Física"` |

Para TCC de graduação/especialização, o parâmetro `programa` deve conter apenas o nome do curso (ex: `"Ciência da Computação"`), e não o nome completo do programa de pós-graduação.

## Como Usar

### 1. Copiar o arquivo de exemplo

Copie `src/ufsm-thesis.typ` para o seu projeto e adapte os parâmetros conforme seu trabalho.

### 2. Importar o template

**Via GitHub (pacote local):**

Clone o repositório e instale-o como pacote local (Typst ≥ 0.13):

```bash
# macOS
git clone https://github.com/sehnem/typst-ufsm \
  ~/Library/Application\ Support/typst/packages/local/ufsm-thesis/0.1.0

# Linux
git clone https://github.com/sehnem/typst-ufsm \
  ~/.local/share/typst/packages/local/ufsm-thesis/0.1.0

# Windows
git clone https://github.com/sehnem/typst-ufsm \
  %APPDATA%\typst\packages\local\ufsm-thesis\0.1.0
```

Em seguida, importe no seu documento:

```typst
#import "@local/ufsm-thesis:0.1.0": thesis-template, apendice, anexo, glossario, tabela-abnt, quadro, apud
```

**Desenvolvimento local** (clone do repositório, usando `--root`):
```typst
#import "/src/lib.typ": thesis-template, apendice, anexo, glossario, tabela-abnt, quadro, apud
```

### 3. Compilar

```bash
typst compile src/ufsm-thesis.typ --root .
```

Ou em modo watch (recompila ao salvar):
```bash
typst watch src/ufsm-thesis.typ --root .
```

Requer Typst ≥ 0.13.

## Estrutura de Arquivos

```
typst.toml               # Manifesto do pacote Typst Universe
src/
  lib.typ                # Template (arquivo de biblioteca)
  ufsm-thesis.typ        # Exemplo de uso — copie e adapte este arquivo
  associacao-brasileira-de-normas-tecnicas-ufsm.csl          # Estilo CSL para referências ABNT/UFSM
  references/
    references.bib       # Referências do exemplo
  images/                # Imagens do exemplo
tests/
  tese.typ               # Teste mínimo: Tese de Doutorado
  dissertacao.typ        # Teste mínimo: Dissertação de Mestrado
  tcc-graduacao.typ      # Teste mínimo: TCC de Graduação
  tcc-especializacao.typ # Teste mínimo: TCC de Especialização
  checklist.md           # Mapeamento de conformidade MDT
```

## Ficha Catalográfica

A ficha catalográfica gerada pelo template é um modelo simplificado para verificação. Para o trabalho final, utilize o sistema de geração automática da UFSM disponível na Biblioteca:
[https://www.ufsm.br/orgaos-suplementares/biblioteca/ficha-catalografica/](https://www.ufsm.br/orgaos-suplementares/biblioteca/ficha-catalografica/)

## Referências Bibliográficas e Zotero

O arquivo `src/associacao-brasileira-de-normas-tecnicas-ufsm.csl` implementa o estilo de citações ABNT adaptado para a UFSM (NBR 10520:2023 e NBR 6023:2018). Ele funciona diretamente com o motor CSL nativo do Typst.

O arquivo CSL ainda **não está registrado no repositório oficial do Zotero**. Enquanto isso, você pode instalá-lo manualmente no Zotero:
_Preferências → Citar → Estilos → "+" → selecione o arquivo `associacao-brasileira-de-normas-tecnicas-ufsm.csl`_

## Uso com VS Code

Recomenda-se o uso do Visual Studio Code com a extensão [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=T-K-H.tinymist), que oferece:

- Visualização ao vivo do documento
- Autocompletar de código
- Destaque de sintaxe
- Navegação fácil pelo documento

## Licença

Este template está licenciado sob a [Creative Commons Attribution-ShareAlike 4.0 International License (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/).

A licença se aplica **apenas ao código do template** (os arquivos `.typ`, `.csl` e a estrutura do projeto). As teses, dissertações e outros trabalhos acadêmicos criados com este template **não** estão sujeitos a esta licença — você é livre para licenciar seu trabalho da forma que desejar.

Se você redistribuir o template modificado, deve fazê-lo sob a mesma licença CC BY-SA 4.0.

## Links

- [Manual de Dissertações e Teses - MDT UFSM (2021)](https://repositorio.ufsm.br/handle/1/24203)
- [Documentação do Typst](https://typst.app/docs/)
- [Tinymist — extensão VS Code](https://marketplace.visualstudio.com/items?itemName=T-K-H.tinymist)
