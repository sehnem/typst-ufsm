# CLAUDE.md — typst-ufsm

## Project overview

Typst template for the **Manual de Dissertações e Teses da UFSM (MDT/UFSM 2021)**, targeting Trabalhos de Conclusão de Curso (TCC/monografia), Dissertações (mestrado), and Teses (doutorado) at Universidade Federal de Santa Maria.

The normative source is `Manual de Dissertações e Teses_MDT_2021.pdf`. When in doubt about formatting, this PDF is the authority.

**When reviewing any pre-textual element, read the corresponding model page from the MDT PDF using the Read tool with the `pages` parameter:**

| Element | MDT section | PDF page |
|---|---|---|
| Capa | 3.1 / Anexo A | 114 |
| Folha de rosto | 3.2.1 / Anexo B | 115 |
| Ficha catalográfica | 3.2.2 / Anexo C | 116 |
| Folha de aprovação | 3.2.4 / Anexo D | 117 |
| Dedicatória | 3.2.5 / Anexo E | 118 |
| Agradecimentos | 3.2.6 / Anexo F | 119 |
| Epígrafe | 3.2.7 / Anexo G | 120 |
| Resumo (pt) | 3.2.8 / Anexo H | 121 |
| Resumo (en) | 3.2.9 / Anexo I | 122 |
| Lista de ilustrações | 3.2.10 / Anexo J | 123 |
| Lista de tabelas | 3.2.10 / Anexo K | 124 |
| Lista de siglas | 3.2.10 / Anexo L | 125 |
| Lista de abreviaturas | 3.2.10 / Anexo M | 126 |
| Lista de símbolos | 3.2.10 / Anexo N | 127 |
| Sumário | 3.2.11 / Anexo O | 128 |
| Referências | ch. 6 / Anexo P | 129 |
| Miniaturas (visão geral) | Anexos Q–T | 130–133 |

Example: to verify the folha de aprovação layout, call `Read("Manual de Dissertações e Teses_MDT_2021.pdf", pages: "117")`.

## File structure

```
typst.toml                                           # Package manifest for Typst Universe
src/
  lib.typ                                            # Template engine (the library — package entry point)
  ufsm-thesis.typ                                    # User-facing document (example/demo)
  associacao-brasileira-de-normas-tecnicas-ufsm.csl  # CSL citation style (ABNT adapted for UFSM)
  references/references.bib                          # Example bibliography
  images/                                            # Example figures
tests/
  tese.typ                                           # Minimal test: Tese de Doutorado
  dissertacao.typ                                    # Minimal test: Dissertação de Mestrado
  tcc-graduacao.typ                                  # Minimal test: TCC de Graduação
  tcc-especializacao.typ                             # Minimal test: TCC de Especialização
  checklist.md                                       # MDT conformance checklist
```

## How to compile

```bash
typst compile src/ufsm-thesis.typ --root .
# or watch mode:
typst watch src/ufsm-thesis.typ --root .
```

Requires Typst ≥ 0.13. No external fonts beyond Times New Roman (system font, available on all major platforms).

## Template API (lib.typ)

### `thesis-template(...)` — main show rule

Key parameters and their MDT requirements:

| Parameter | Type | MDT requirement |
|---|---|---|
| `titulo` | string | Uppercase on capa/rosto/aprovação |
| `subtitulo` | string\|none | Optional; colon appended to title, subtitle on next line, not bold |
| `autor` | string | Mixed case (initial caps), NO abbreviations |
| `orientador` | string | Full name, no abbreviations |
| `coorientador` | string\|none | Full name or `none` |
| `tipo-trabalho` | "Tese"\|"Dissertação"\|"TCC" | Controls gender agreement and nota de apresentação wording |
| `grau` | "Doutor"\|"Mestre"\|"Bacharel"\|"Especialista"\|"Licenciado" | Controls nota de apresentação wording |
| `titulo-grau` | string | e.g. "Doutor em Ciência da Computação" — used in nota and ficha |
| `programa` | string | Full program/course name — used in nota de apresentação |
| `centro` | string | Full center/department name |
| `errata` | content\|none | Optional errata page (placed after ficha catalográfica) |
| `resumo-extra` | content\|none | Optional third-language resumo (Spanish/French/Italian/German) |
| `palavras-chave-extra` | array | Keywords for resumo-extra |
| `titulo-resumo-extra` | string | Label for the extra resumo (default: "RESUMEN") |
| `titulo-palavras-chave-extra` | string | Keywords label for the extra resumo (default: "Palabras clave:") |
| `lista-quadros` | bool | Include Lista de Quadros (targets `figure.where(kind: "quadro")`) |
| `listas-extras` | array | Extra illustration lists: `(titulo: "LISTA DE X", kind: "x")` tuples |
| `impressao-frente-verso` | bool | Mirrors margins; alternates page number alignment |
| `texto-financiamento` | content\|none | CAPES funding note (mandatory for CAPES fellows) |

### `nota-apresentacao` text — computed from `grau`

| `grau` | Wording |
|---|---|
| "Doutor" or "Mestre" | "X apresentad(a/o) ao #programa, da #instituicao (UFSM, RS), como requisito parcial para a obtenção do título de #titulo-grau." |
| "Especialista" | "Trabalho de Conclusão apresentado ao Curso de Especialização em #programa, da #instituicao (UFSM, RS), como requisito parcial para a obtenção do título de #titulo-grau." |
| "Bacharel" or "Licenciado" | "Trabalho de Conclusão apresentado ao Curso de #programa, da #instituicao (UFSM, RS), como requisito parcial para a obtenção do grau de #titulo-grau." |

For TCC de graduação/especialização, set `programa` to just the course/area name (e.g. `"Ciência da Computação"`), not the full "Programa de Pós-Graduação em ..." string.

### Exported helper functions

- `apendice(letra, titulo, conteudo)` — numbered appendix
- `anexo(letra, titulo, conteudo)` — numbered annex
- `glossario(itens)` — auto-alphabetically sorted glossary
- `tabela-abnt(colunas, alinhamento, cabecalho, ..linhas)` — ABNT/IBGE table (open lateral borders)
- `quadro(colunas, alinhamento, cabecalho, ..linhas)` — ABNT quadro (all borders closed); use with `figure(kind: "quadro", supplement: "Quadro")`
- `apud(original, consultada)` — apud citation (cite A apud B)

## Known limitations

- **Article-format chapter support** (MDT 4.6): chapters submitted as journal articles must keep the journal's own formatting inside the thesis. Not implemented.

## CSL file notes

`associacao-brasileira-de-normas-tecnicas-ufsm.csl` is a custom CSL 1.0 style based on ABNT NBR 10520:2023 and NBR 6023:2018.

- Works correctly with Typst's native CSL engine (no changes needed for Typst usage).
- The `<id>` and `<link rel="self">` are set to the official Zotero URL (`http://www.zotero.org/styles/associacao-brasileira-de-normas-tecnicas-ufsm`). The style **has not been submitted to the Zotero Style Repository yet** — to register it, open a PR against `github.com/citation-style-language/styles` with the file at the repo root.
- The `et-al-min="4"` (4+ authors → et al.) matches ABNT NBR 6023:2018.

## MDT structure reference

Pre-textual elements order (mandatory elements in **bold**):

1. Capa (**obrigatório**) — not paginated, not counted
2. Lombada (obrigatório for printed hardcover)
3. **Folha de rosto** — page count starts here (page 1), not displayed
4. **Ficha catalográfica** (verso da folha de rosto)
5. Errata (opcional) — `errata` parameter
6. **Folha de aprovação**
7. Dedicatória (opcional)
8. Agradecimentos (opcional, mandatory for CAPES)
9. Epígrafe (opcional)
10. **Resumo em língua vernácula** (português)
11. **Resumo em língua estrangeira** (inglês obrigatório)
12. Resumo em terceiro idioma (opcional) — `resumo-extra` parameter
13. Listas (opcional): figuras → quadros → extras → tabelas → abreviaturas/siglas → símbolos
14. **Sumário** — last pre-textual element

Text body pages are numbered (font 10pt, top right; alternating for duplex).

## Formatting rules quick-reference

| Element | Font | Weight | Case | Alignment |
|---|---|---|---|---|
| Capa header | 14pt | regular | UPPER | center |
| Capa author | 14pt | regular | Mixed | center |
| Capa title | 14pt | **bold** | UPPER | center |
| Capa subtitle | 14pt | regular | UPPER | center |
| Rosto author | 12pt | regular | Mixed | center |
| Rosto title | 12pt | **bold** | UPPER | center |
| Rosto subtitle | 12pt | regular | UPPER | center |
| Heading lvl 1 | 12pt | **bold** | UPPER | left |
| Heading lvl 2 | 12pt | regular | UPPER | left |
| Heading lvl 3 | 12pt | **bold** | Mixed | left |
| Heading lvl 4 | 12pt | italic | Mixed | left |
| Heading lvl 5 | 12pt | regular | Mixed | left |
| Body text | 12pt | regular | Mixed | justify |
| Long quote | 10pt | regular | Mixed | 4cm left indent |
| Caption | 10pt | regular | Mixed | center |
| Footnote | 10pt | regular | Mixed | justify |
| Keywords label | 12pt | **bold** | Mixed | left |

Margins: left 3cm, right 2cm, top 3cm, bottom 2cm (mirrored inside/outside for duplex).
Line spacing: 1.5 (body); 1.0 (long quotes, footnotes, captions, ficha).
First-line indent: 1.25cm (body paragraphs).
Nota de apresentação indent: 7cm from left content edge (using `pad(left: 7cm)`).

## Distribution

The package is structured for **Typst Universe** but not yet submitted. `typst.toml` is at the repo root with `entrypoint = "src/lib.typ"`.
