// Template para Dissertações e Teses da UFSM (MDT/UFSM 2021)
// Referência normativa: Manual de Dissertações e Teses da UFSM, edição 2021.

// ============================================================================
// FUNÇÕES AUXILIARES EXPORTÁVEIS
// ============================================================================

// Rastreia se estamos em seção pós-textual (referências, glossário, apêndices, anexos)
// para excluir subseções do sumário (MDT Anexo O).
#let _in-pos-textual = state("ufsm-in-pos-textual", false)

// Glossário: itens ordenados automaticamente por termo (MDT Apêndice/Anexo)
#let glossario(itens) = {
  _in-pos-textual.update(true)
  let itens-ordenados = itens.sorted(key: i => i.termo)
  heading(level: 1, numbering: none, "GLOSSÁRIO")
  set par(first-line-indent: 0cm, spacing: 1.5em, leading: 0.65em, justify: false)
  for item in itens-ordenados [
    *#item.termo:* #item.definicao

  ]
}

// Apêndice numerado — MDT ordem pós-textual: glossário → apêndices → anexos
#let apendice(letra, titulo-apendice, conteudo) = {
  _in-pos-textual.update(true)
  heading(level: 1, numbering: none)[APÊNDICE #letra – #titulo-apendice]
  conteudo
}

// Anexo numerado — MDT ordem pós-textual: glossário → apêndices → anexos
#let anexo(letra, titulo-anexo, conteudo) = {
  _in-pos-textual.update(true)
  heading(level: 1, numbering: none)[ANEXO #letra – #titulo-anexo]
  conteudo
}

// Tabela ABNT/IBGE (MDT 4.5): sem bordas laterais, linha topo, linha abaixo do cabeçalho, linha no fundo
#let tabela-abnt(
  colunas,
  alinhamento,
  cabecalho,
  ..linhas,
) = {
  table(
    columns: colunas,
    align: alinhamento,
    stroke: (x, y) => {
      if y == 0 {
        // Linha superior do cabeçalho
        (top: 1pt + black)
      } else if y == 1 {
        // Linha abaixo do cabeçalho
        (top: 0.5pt + black)
      } else if y == linhas.pos().len() {
        // Linha inferior da tabela
        (bottom: 1pt + black)
      } else {
        // Sem bordas laterais
        none
      }
    },
    table.header(..cabecalho),
    ..linhas.pos()
  )
}

// Quadro ABNT (MDT 4.5): todas as bordas fechadas — use com figure(kind: "quadro", supplement: "Quadro")
#let quadro(
  colunas,
  alinhamento,
  cabecalho,
  ..linhas,
) = {
  table(
    columns: colunas,
    align: alinhamento,
    stroke: 0.5pt + black,
    table.header(..cabecalho),
    ..linhas.pos()
  )
}

// Fonte de ilustrações e tabelas (MDT 4.4/4.5 — obrigatório, mesmo que produção própria).
// Use dentro do corpo da figure, após o conteúdo principal:
//   #figure({ image("fig.png"); fonte[Elaborado pelo autor.] }, caption: [...])
#let fonte(texto) = {
  v(0.5em, weak: true)
  align(left)[
    #set text(size: 10pt)
    #set par(first-line-indent: 0cm)
    Fonte: #texto
  ]
}

// Citação apud: autor original apud autor consultado
#let apud(original, consultada) = {
  cite(original, form: "prose")
  [ apud ]
  cite(consultada, form: "prose")
}

// ============================================================================
// TEMPLATE PRINCIPAL
// ============================================================================

#let thesis-template(
  titulo: "",
  subtitulo: none,
  autor: (nome: "", sexo: "M"), // sexo: "M" ou "F"
  orientador: (nome: "", titulacao: "", instituicao: "", sexo: "M"),
  coorientador: none, // (nome: "", titulacao: "", instituicao: "", sexo: "M") ou none
  // tipo-trabalho / grau / titulo-grau — combinações válidas:
  //   Doutorado:      "Tese"        / "Doutor"      / "Doutor em ..."
  //   Mestrado:       "Dissertação" / "Mestre"       / "Mestre em ..."
  //   Especialização: "TCC"         / "Especialista" / "Especialista em ..."
  //   Graduação:      "TCC"         / "Bacharel"     / "Bacharel em ..."
  //   Licenciatura:   "TCC"         / "Licenciado"   / "Licenciado em ..."
  tipo-trabalho: none,
  grau: none,
  titulo-grau: none,
  // area-concentracao: relevante para doutorado/mestrado; omitir (none) para graduação/especialização
  area-concentracao: none,
  // programa: para pós-graduação, nome completo do programa ("Programa de Pós-Graduação em ...")
  //           para TCC/especialização, nome do curso ("Ciência da Computação")
  programa: "",
  instituicao: "Universidade Federal de Santa Maria",
  centro: "",
  local: "Santa Maria, RS",
  // data: (dia: int|none, mes: int (1–12), ano: int) — mesmo ano na capa, rosto, ficha e aprovação
  data: (dia: none, mes: 1, ano: 0),
  // Banca examinadora
  banca: (),
  // Elementos pré-textuais
  dedicatoria: none,
  agradecimentos: none,
  epigrafe: none,
  epigrafe-autor: none,
  resumo: "",
  palavras-chave: (),
  abstract: "",
  keywords: (),
  // Resumo em terceiro idioma (opcional — espanhol, francês, italiano ou alemão)
  resumo-extra: none,
  palavras-chave-extra: (),
  titulo-resumo-extra: "RESUMEN",
  titulo-palavras-chave-extra: "Palabras clave:",
  errata: none,
  texto-financiamento: none,
  lista-figuras: true,
  lista-quadros: false,
  listas-extras: (), // array de (titulo: "LISTA DE X", kind: "x")
  lista-tabelas: true,
  lista-siglas: none,      // MDT Anexo L: siglas/acrônimos — (sigla: "", descricao: "")
  lista-abreviaturas: none, // MDT Anexo M: abreviaturas  — (sigla: "", descricao: "")
  lista-simbolos: none,
  bibliografia-arquivo: none,
  bibliografia-estilo: "associacao-brasileira-de-normas-tecnicas-ufsm.csl",
  // Fonte: MDT aceita Times New Roman ou Arial.
  // Sem instalação extra (embutidas no Typst): "Libertinus Serif", "New Computer Modern"
  // Com instalação (Google Fonts): "PT Sans"
  // De sistema (Windows/macOS): "Times New Roman", "Arial"
  fonte: "Times New Roman",
  impressao-frente-verso: false,
  // Elementos pós-textuais (glossário, apêndices, anexos) — MDT: após as referências
  pos-textuais: none,
  corpo,
) = {
  // ============================================================================
  // CONFIGURAÇÕES GERAIS DO DOCUMENTO
  // ============================================================================

  assert(tipo-trabalho != none, message: "Defina tipo-trabalho: \"Tese\", \"Dissertação\" ou \"TCC\"")
  assert(grau != none, message: "Defina grau: \"Doutor\", \"Mestre\", \"Bacharel\", \"Especialista\" ou \"Licenciado\"")
  assert(titulo-grau != none, message: "Defina titulo-grau, ex: \"Doutor em Ciência da Computação\"")

  // Data formatada para folha de aprovação (ex: "18 de outubro de 2025")
  let nomes-meses = ("janeiro", "fevereiro", "março", "abril", "maio", "junho",
                     "julho", "agosto", "setembro", "outubro", "novembro", "dezembro")
  let nome-mes = nomes-meses.at(data.mes - 1)
  let data-str = if data.dia != none {
    [#data.dia de #nome-mes de #data.ano]
  } else {
    [#nome-mes de #data.ano]
  }

  let page-break-odd = if impressao-frente-verso { pagebreak(to: "odd") }
  let page-break-even = if impressao-frente-verso { pagebreak(to: "even") }

  let margens-padrao = if impressao-frente-verso {
    (inside: 3cm, outside: 2cm, top: 3cm, bottom: 2cm)
  } else {
    (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm)
  }

  set document(
    title: titulo,
    author: autor.nome,
    date: auto,
  )

  set page(
    paper: "a4",
    margin: margens-padrao,
  )

  set text(
    font: fonte,
    size: 12pt,
    lang: "pt",
    hyphenate: true,
  )

  set par(
    justify: true,
    leading: 0.65em,
    first-line-indent: 1.25cm,
  )

  set par(spacing: 0.65em)

  // "Tese" e "Dissertação" são femininos; TCC e demais são masculinos
  let feminino = tipo-trabalho == "Tese" or tipo-trabalho == "Dissertação"

  // Título em negrito MAIÚSCULO; subtítulo na linha seguinte sem negrito (MDT Anexo A/B)
  // Hifenização desativada em títulos
  let render-titulo(size) = {
    set text(hyphenate: false)
    text(size: size, weight: "bold")[#upper(titulo)#if subtitulo != none [:]]
    if subtitulo != none {
      linebreak()
      text(size: size)[#upper(subtitulo)]
    }
  }

  // Nota de apresentação varia conforme grau (MDT seção 3.2.1 / CLAUDE.md)
  let nota-apresentacao = if grau == "Doutor" or grau == "Mestre" {
    [#tipo-trabalho apresentad#if feminino [a] else [o] ao #programa, da #instituicao (UFSM, RS), como requisito parcial para a obtenção do título de *#titulo-grau*.]
  } else if grau == "Especialista" {
    [Trabalho de Conclusão apresentado ao Curso de Especialização em #programa, da #instituicao (UFSM, RS), como requisito parcial para a obtenção do título de *#titulo-grau*.]
  } else {
    [Trabalho de Conclusão apresentado ao Curso de #programa, da #instituicao (UFSM, RS), como requisito parcial para a obtenção do grau de *#titulo-grau*.]
  }

  // ============================================================================
  // CAPA (MDT 3.1 / Anexo A)
  // ============================================================================

  page(
    margin: margens-padrao,
    numbering: none,
  )[
    #set align(center)
    #set par(first-line-indent: 0cm, justify: false, leading: 0.5em, spacing: 0em)

    #text(size: 14pt)[
      #upper(instituicao)\
      #upper(centro)\
      #upper(programa)
    ]

    #v(4cm)

    #text(size: 14pt)[
      #autor.nome
    ]

    #v(4cm)

    #render-titulo(14pt)

    #v(1fr)

    #text(size: 14pt)[
      #local\
      #data.ano
    ]

    #v(1cm)
  ]

  // Capa não conta na paginação; folha de rosto é a página 1
  counter(page).update(0)

  // ============================================================================
  // FOLHA DE ROSTO (MDT 3.2.1 / Anexo B)
  // ============================================================================

  page-break-odd

  page(
    margin: margens-padrao,
    numbering: none,
  )[
    #set align(center)
    #set par(first-line-indent: 0cm, justify: false, leading: 0.5em, spacing: 0em)

    #text(size: 12pt)[
      #autor.nome
    ]

    #v(2.5cm)

    #render-titulo(12pt)

    #v(2.5cm)

    #pad(left: 7cm)[
      #set align(left)
      #set par(justify: true, first-line-indent: 0cm, leading: 0.5em, spacing: 0em)
      #text(size: 12pt)[
        #nota-apresentacao
      ]
    ]

    #v(3.5cm)

    #box(width: 100%)[
      #align(center)[
        #set par(first-line-indent: 0cm, leading: 0.5em, spacing: 0em)
        #text(size: 12pt)[
          #if orientador.sexo == "F" [Orientadora] else [Orientador]: #orientador.titulacao #orientador.nome

          #if coorientador != none [
            \
            #if coorientador.sexo == "F" [Coorientadora] else [Coorientador]: #coorientador.titulacao #coorientador.nome
          ]
        ]
      ]
    ]

    #v(1fr)

    #text(size: 12pt)[
      #local\
      #data.ano
    ]

    #v(1cm)
  ]

  // ============================================================================
  // FICHA CATALOGRÁFICA (verso da folha de rosto)
  // ============================================================================
  // MDT: Deve seguir o padrão do sistema de geração automática da UFSM

  // Garantir que fique no verso (par) se frente e verso
  page-break-even

  page(
    margin: margens-padrao,
    numbering: none,
  )[
    #set par(first-line-indent: 0cm, justify: false, leading: 0.65em)
    #set text(size: 12pt)

    #if texto-financiamento != none [
      #v(2cm)
      #align(left)[
        #text(size: 12pt)[
          #texto-financiamento
        ]
      ]
    ]

    #v(1fr)

    #set align(center)
    #block(
      width: 12.5cm,
      stroke: 1pt + black,
      inset: 1cm,
    )[
      #set align(left)
      #set text(size: 10pt)
      #set par(first-line-indent: 0cm, spacing: 0.5em, justify: false, leading: 0.5em)

      #let nomes = autor.nome.split(" ")
      #let ultimo-sobrenome = nomes.last()
      #let outros-nomes = nomes.slice(0, -1).join(" ")

      #ultimo-sobrenome, #outros-nomes\
      #h(1.25cm)#titulo / #outros-nomes #ultimo-sobrenome.– #data.ano.\
      #h(1.25cm)#context [#counter(page).final().first()] f.; 30 cm

      #v(0.3cm)

      #h(1.25cm)#if orientador.sexo == "F" [Orientadora] else [Orientador]: #orientador.nome
      #if coorientador != none [
        \
        #h(1.25cm)#if coorientador.sexo == "F" [Coorientadora] else [Coorientador]: #coorientador.nome
      ]

      #v(0.3cm)

      #h(1.25cm)#tipo-trabalho (#if grau == "Doutor" [doutorado] else if grau == "Mestre" [mestrado] else [graduação]) – #instituicao, #centro, #programa#if area-concentracao != none [. Área de concentração: #area-concentracao]. RS, #data.ano

      #v(0.3cm)

      #h(1.25cm)
      #{
        for (idx, palavra) in palavras-chave.enumerate() {
          str(idx + 1)
          [. ]
          palavra
          [ ]
        }
      }

      #let sobrenome-orientador = orientador.nome.split(" ").last()
      I. #sobrenome-orientador, orient.
      #if coorientador != none [
        #let sobrenome-coorientador = coorientador.nome.split(" ").last()
        II. #sobrenome-coorientador, coorient. III. Título.
      ] else [
        II. Título.
      ]

      #v(0.5cm)

    ]

    #v(1cm)

    #set align(left)
    #set text(size: 11pt)
    #set par(justify: true, first-line-indent: 0cm, spacing: 0.8em, leading: 0.65em)

    Declaro, #upper(autor.nome), para os devidos fins e sob as penas da lei, que a pesquisa constante neste trabalho de conclusão de curso (#tipo-trabalho) foi por mim elaborada e que as informações necessárias obtidas de consulta em literatura e outras fontes estão devidamente referenciadas. Declaro, ainda, que este trabalho ou parte dele não foi apresentado anteriormente para obtenção de qualquer outro grau acadêmico, estando ciente de que a inveracidade da presente declaração poderá resultar na anulação da titulação pela Universidade, entre outras consequências legais.

    #v(1cm)
  ]

  // ============================================================================
  // ERRATA (MDT 3.2.3 — opcional)
  // ============================================================================

  if errata != none {
    page-break-odd
    page(
      margin: margens-padrao,
      numbering: none,
    )[
      #v(2cm, weak: true)

      #block(
        width: 100%,
        spacing: 0em,
        above: 0em,
        below: 1.5em,
      )[
        #set align(center)
        #text(size: 12pt, weight: "bold")[
          ERRATA
        ]
      ]

      #set par(first-line-indent: 0cm, justify: false, leading: 0.65em, spacing: 1.5em)
      #errata
    ]
  }

  // ============================================================================
  // FOLHA DE APROVAÇÃO (MDT 3.2.4 / Anexo D)
  // ============================================================================

  page-break-odd

  page(
    margin: margens-padrao,
    numbering: none,
  )[
    #set align(center)
    #set par(first-line-indent: 0cm, justify: false, leading: 0.5em, spacing: 0em)

    #text(size: 12pt, weight: "bold")[
      #autor.nome
    ]

    #v(2.5cm)

    #render-titulo(12pt)

    #v(2.5cm)

    #pad(left: 7cm)[
      #set align(left)
      #set par(justify: true, first-line-indent: 0cm, leading: 0.5em, spacing: 0em)
      #text(size: 12pt)[
        #nota-apresentacao
      ]
    ]

    #v(1.4cm)

    // MDT 3.2.4 f): centralizado, peso regular
    #text(size: 12pt)[
      Aprovad#if feminino [a] else [o] em #data-str:
    ]

    #v(2cm)

    #line(length: 60%, stroke: 0.5pt)
    #v(0.3cm)
    #text(size: 12pt, weight: "bold")[
      #orientador.nome, #orientador.titulacao (#orientador.instituicao) \
      (Presidente/#if orientador.sexo == "F" [Orientadora] else [Orientador])
    ]

    #v(1.5cm)

    #if coorientador != none [
      #line(length: 60%, stroke: 0.5pt)
      #v(0.3cm)
      #text(size: 12pt, weight: "bold")[
        #coorientador.nome, #coorientador.titulacao (#coorientador.instituicao) \
        (#if coorientador.sexo == "F" [Coorientadora] else [Coorientador])
      ]
      #v(1.5cm)
    ]

    #for membro in banca [
      #line(length: 60%, stroke: 0.5pt)
      #v(0.3cm)
      #text(size: 12pt, weight: "bold")[
        #membro.nome, #membro.titulacao (#membro.instituicao)
      ]
      #v(1.5cm)
    ]

    #v(1fr)

    #text(size: 12pt)[
      #local\
      #data.ano
    ]

    #v(1cm)
  ]

  // ============================================================================
  // DEDICATÓRIA (MDT 3.2.5 — opcional)
  // ============================================================================

  if dedicatoria != none {
    page-break-odd
    page(
      margin: margens-padrao,
      numbering: none,
    )[
      #v(1fr)

      #align(center)[
        #block(width: 70%)[
          #set align(center)
          #set par(first-line-indent: 0cm, justify: false, leading: 0.65em, spacing: 1.5em)
          #text(size: 12pt)[
            #dedicatoria
          ]
        ]
      ]

      #v(1fr)
    ]
  }

  // ============================================================================
  // AGRADECIMENTOS (elemento opcional, mas obrigatório para bolsistas CAPES)
  // ============================================================================
  if agradecimentos != none {
    page-break-odd
    page(
      margin: margens-padrao,
      numbering: none,
    )[
      #v(2cm, weak: true)

      #block(
        width: 100%,
        spacing: 0em,
        above: 0em,
        below: 3em,
      )[
        #set align(center)
        #text(size: 12pt, weight: "bold")[
          AGRADECIMENTOS
        ]
      ]

      #set par(first-line-indent: 1.25cm, justify: true, leading: 0.65em, spacing: 1.5em)
      #text(size: 12pt)[
        #agradecimentos
      ]
    ]
  }

  // ============================================================================
  // EPÍGRAFE (MDT 3.2.7 — opcional)
  // ============================================================================

  if epigrafe != none {
    page-break-odd
    page(
      margin: margens-padrao,
      numbering: none,
    )[
      #v(1fr)

      #align(right)[
        #block(width: 60%)[
          #set align(left)
          #set par(first-line-indent: 0cm, justify: true, leading: 0.65em, spacing: 1.5em)
          #text(size: 12pt)[
            #epigrafe
          ]
          #v(0.5cm)
          #align(right)[
            #text(size: 12pt)[
              #if epigrafe-autor != none [
                (#epigrafe-autor)
              ]
            ]
          ]
        ]
      ]

      #v(2cm)
    ]
  }

  // ============================================================================
  // RESUMO (MDT 3.2.8 / Anexo H)
  // ============================================================================

  page-break-odd

  page(
    margin: margens-padrao,
    numbering: none,
  )[
    #set par(first-line-indent: 0cm, justify: false)

    #v(2cm, weak: true)

    #block(
      width: 100%,
      spacing: 0em,
      above: 0em,
      below: 1cm,
    )[
      #set align(center)
      #text(size: 12pt, weight: "bold")[
        RESUMO
      ]
    ]

    #block(
      width: 100%,
      spacing: 0em,
      above: 0em,
      below: 1cm,
    )[
      #set align(center)
      #set par(leading: 0.5em, spacing: 0em)
      #render-titulo(12pt)

      #v(0.5cm)

      #text(size: 12pt)[
        #if autor.sexo == "F" [AUTORA] else [AUTOR]: #autor.nome\
        #if orientador.sexo == "F" [ORIENTADORA] else [ORIENTADOR]: #orientador.nome
      ]
    ]

    #set par(first-line-indent: 0cm, justify: true, leading: 0.5em, spacing: 0em)
    #text(size: 12pt)[
      #resumo
    ]

    #v(1cm)

    #set par(first-line-indent: 0cm, justify: false)
    #text(size: 12pt)[
      *Palavras-chave:* #palavras-chave.join(". ").
    ]
  ]

  // ============================================================================
  // ABSTRACT (MDT 3.2.9 / Anexo I)
  // ============================================================================

  page-break-odd

  page(
    margin: margens-padrao,
    numbering: none,
  )[
    #set par(first-line-indent: 0cm, justify: false)

    #v(2cm, weak: true)

    #block(
      width: 100%,
      spacing: 0em,
      above: 0em,
      below: 1cm,
    )[
      #set align(center)
      #text(size: 12pt, weight: "bold")[
        ABSTRACT
      ]
    ]

    #block(
      width: 100%,
      spacing: 0em,
      above: 0em,
      below: 1cm,
    )[
      #set align(center)
      #set par(leading: 0.5em, spacing: 0em)
      #render-titulo(12pt)

      #v(0.5cm)

      #text(size: 12pt)[
        AUTHOR: #autor.nome\
        ADVISOR: #orientador.nome
      ]
    ]

    #set par(first-line-indent: 0cm, justify: true, leading: 0.5em, spacing: 0em)
    #text(size: 12pt)[
      #abstract
    ]

    #v(1cm)

    #set par(first-line-indent: 0cm, justify: false)
    #text(size: 12pt)[
      *Keywords:* #keywords.join(". ").
    ]
  ]

  // ============================================================================
  // RESUMO EM TERCEIRO IDIOMA (elemento opcional)
  // ============================================================================
  // MDT seção 3.2.9: espanhol, francês, italiano ou alemão; mesma estrutura do Resumo

  if resumo-extra != none {
    page-break-odd
    page(
      margin: margens-padrao,
      numbering: none,
    )[
      #set par(first-line-indent: 0cm, justify: false)

      #v(2cm, weak: true)

      #block(
        width: 100%,
        spacing: 0em,
        above: 0em,
        below: 1cm,
      )[
        #set align(center)
        #text(size: 12pt, weight: "bold")[
          #titulo-resumo-extra
        ]
      ]

      #block(
        width: 100%,
        spacing: 0em,
        above: 0em,
        below: 1cm,
      )[
        #set align(center)
        #set par(leading: 0.5em, spacing: 0em)
        #render-titulo(12pt)

        #v(0.5cm)

        #text(size: 12pt)[
          #if autor.sexo == "F" [AUTORA] else [AUTOR]: #autor.nome\
          #if orientador.sexo == "F" [ORIENTADORA] else [ORIENTADOR]: #orientador.nome
        ]
      ]

      #set par(first-line-indent: 0cm, justify: true, leading: 0.5em, spacing: 0em)
      #text(size: 12pt)[
        #resumo-extra
      ]

      #v(1cm)

      #if palavras-chave-extra.len() > 0 [
        #set par(first-line-indent: 0cm, justify: false)
        #text(size: 12pt)[
          *#titulo-palavras-chave-extra* #palavras-chave-extra.join(". ").
        ]
      ]
    ]
  }

  // ============================================================================
  // LISTAS (MDT 3.2.10 / Anexos J–N — opcionais)
  // ============================================================================

  if lista-figuras {
    page-break-odd
    page(margin: margens-padrao, numbering: none)[
      #v(2cm, weak: true)
      #block(width: 100%, spacing: 0em, above: 0em, below: 3em)[
        #set align(center)
        #text(size: 12pt, weight: "bold")[LISTA DE FIGURAS]
      ]
      #set par(first-line-indent: 0cm, leading: 0.65em, spacing: 1.5em)
      #outline(title: none, target: figure.where(kind: image))
    ]
  }

  if lista-quadros {
    page-break-odd
    page(margin: margens-padrao, numbering: none)[
      #v(2cm, weak: true)
      #block(width: 100%, spacing: 0em, above: 0em, below: 3em)[
        #set align(center)
        #text(size: 12pt, weight: "bold")[LISTA DE QUADROS]
      ]
      #set par(first-line-indent: 0cm, leading: 0.65em, spacing: 1.5em)
      #outline(title: none, target: figure.where(kind: "quadro"))
    ]
  }

  for lista in listas-extras {
    page-break-odd
    page(margin: margens-padrao, numbering: none)[
      #v(2cm, weak: true)
      #block(width: 100%, spacing: 0em, above: 0em, below: 3em)[
        #set align(center)
        #text(size: 12pt, weight: "bold")[#lista.titulo]
      ]
      #set par(first-line-indent: 0cm, leading: 0.65em, spacing: 1.5em)
      #outline(title: none, target: figure.where(kind: lista.kind))
    ]
  }

  if lista-tabelas {
    page-break-odd
    page(margin: margens-padrao, numbering: none)[
      #v(2cm, weak: true)
      #block(width: 100%, spacing: 0em, above: 0em, below: 3em)[
        #set align(center)
        #text(size: 12pt, weight: "bold")[LISTA DE TABELAS]
      ]
      #set par(first-line-indent: 0cm, leading: 0.65em, spacing: 1.5em)
      #outline(title: none, target: figure.where(kind: table))
    ]
  }

  // Siglas: ordenadas automaticamente (MDT Anexo L)
  if lista-siglas != none {
    page-break-odd
    page(margin: margens-padrao, numbering: none)[
      #v(2cm, weak: true)
      #block(width: 100%, spacing: 0em, above: 0em, below: 3em)[
        #set align(center)
        #text(size: 12pt, weight: "bold")[LISTA DE SIGLAS]
      ]
      // Coluna da sigla ajustada ao item mais extenso (auto); espaçamento entre linhas 1,5
      #set par(first-line-indent: 0cm, leading: 0.65em, spacing: 0em)
      #let sorted-siglas = lista-siglas.sorted(key: item => item.sigla)
      #grid(
        columns: (auto, 1fr),
        column-gutter: 1em,
        row-gutter: 0.65em,
        ..sorted-siglas.map(item => (item.sigla, item.descricao)).flatten()
      )
    ]
  }

  // Abreviaturas: ordenadas automaticamente (MDT Anexo M)
  if lista-abreviaturas != none {
    page-break-odd
    page(margin: margens-padrao, numbering: none)[
      #v(2cm, weak: true)
      #block(width: 100%, spacing: 0em, above: 0em, below: 3em)[
        #set align(center)
        #text(size: 12pt, weight: "bold")[LISTA DE ABREVIATURAS]
      ]
      // MDT Anexo L/M: coluna da sigla/abreviatura ajustada ao item mais extenso (auto)
      #set par(first-line-indent: 0cm, leading: 0.65em, spacing: 0em)
      #let sorted-abreviaturas = lista-abreviaturas.sorted(key: item => item.sigla)
      #grid(
        columns: (auto, 1fr),
        column-gutter: 1em,
        row-gutter: 0.65em,
        ..sorted-abreviaturas.map(item => (item.sigla, item.descricao)).flatten()
      )
    ]
  }

  // Símbolos: mantidos na ordem de apresentação no texto (MDT Anexo N)
  if lista-simbolos != none {
    page-break-odd
    page(margin: margens-padrao, numbering: none)[
      #v(2cm, weak: true)
      #block(width: 100%, spacing: 0em, above: 0em, below: 3em)[
        #set align(center)
        #text(size: 12pt, weight: "bold")[LISTA DE SÍMBOLOS]
      ]
      // MDT Anexo N: coluna do símbolo ajustada ao item mais extenso (auto)
      #set par(first-line-indent: 0cm, leading: 0.65em, spacing: 0em)
      #grid(
        columns: (auto, 1fr),
        column-gutter: 1em,
        row-gutter: 0.65em,
        ..lista-simbolos.map(item => (item.simbolo, item.descricao)).flatten()
      )
    ]
  }

  // ============================================================================
  // SUMÁRIO (MDT 3.2.11 / Anexo O — último elemento pré-textual)
  // ============================================================================

  page-break-odd

  page(margin: margens-padrao, numbering: none)[
    #v(2cm, weak: true)
    #block(width: 100%, spacing: 0em, above: 0em, below: 1.5em)[
      #set align(center)
      #text(size: 12pt, weight: "bold")[SUMÁRIO]
    ]
    // MDT Anexo O: L1 e L3 negrito; L2/L4/L5 regular; L1/L2 maiúsculas
    // Coluna do número calculada dinamicamente pela largura do número mais extenso
    // Todos os títulos (numerados e não numerados) alinhados na mesma coluna
    // Subseções de apêndices/anexos excluídas (MDT Anexo O nota de atenção)
    #context {
      let all-headings = query(heading.where(outlined: true))

      // Filtra entradas válidas: profundidade ≤ 5 e não subseções pós-textuais
      let entries = all-headings.filter(h => {
        let lv = h.level
        let is-post = _in-pos-textual.at(h.location())
        lv <= 5 and not (is-post and lv > 1)
      })

      // Calcula largura da coluna pelo número mais extenso no documento
      let max-w = 0pt
      for h in entries {
        if h.numbering != none {
          let lv = h.level
          let nums = counter(heading).at(h.location())
          let pattern = range(lv - 1).map(_ => "1.").join("") + "1"
          let num-str = numbering(pattern, ..nums.slice(0, lv))
          let w = measure(text(size: 12pt, num-str)).width
          if w > max-w { max-w = w }
        }
      }
      let num-col = max-w + 0.5em  // número mais largo + espaço entre número e título

      // Renderiza cada entrada com coluna dinâmica
      for h in entries {
        let level = h.level
        let is-bold = level == 1 or level == 3
        let is-upper = level <= 2

        let num = if h.numbering != none {
          let nums = counter(heading).at(h.location())
          let pattern = range(level - 1).map(_ => "1.").join("") + "1"
          let formatted = numbering(pattern, ..nums.slice(0, level))
          if is-upper { upper(formatted) } else { formatted }
        } else {
          none
        }

        let titulo = if is-upper { upper(h.body) } else { h.body }
        let page-num = counter(page).at(h.location()).first()

        block(above: 0em, below: 0.65em)[
          #set text(size: 12pt, weight: "regular", style: "normal")
          #set par(first-line-indent: 0cm, leading: 0.65em)
          // Número e pontos/página sempre regular; apenas o texto do título recebe negrito
          #link(h.location())[
            #box(width: num-col)[#if num != none { num }]#text(
              weight: if is-bold { "bold" } else { "regular" }
            )[#titulo]
          ]
          #box(width: 1fr, repeat[.])
          #link(h.location())[#str(page-num)]
        ]
      }
    }
  ]

  // ============================================================================
  // CORPO DO TRABALHO
  // ============================================================================

  // Numeração inicia no corpo; contagem continua desde a folha de rosto (que é p. 1)
  if impressao-frente-verso {
    pagebreak(to: "odd")
  }

  // numbering: none evita auto-posicionamento pelo Typst; o header explícito abaixo cuida do display
  set page(
    numbering: none,
    header: if impressao-frente-verso {
      context {
        let page-num = counter(page).display("1")
        let is-odd = calc.odd(counter(page).get().first())
        if is-odd {
          align(right)[#text(size: 10pt)[#page-num]]
        } else {
          align(left)[#text(size: 10pt)[#page-num]]
        }
      }
    } else {
      context align(right)[#text(size: 10pt)[#counter(page).display("1")]]
    },
  )


  // Configurar numeração de seções (ABNT: até 5 níveis)
  set heading(numbering: "1.1.1.1.1")

  // Configurar numeração de equações
  set math.equation(numbering: "(1)")

  show heading: set text(hyphenate: false)

  // Heading nível 1: MAIÚSCULAS, negrito, nova página; sem numeração → centralizado (apêndice/anexo)
  show heading.where(level: 1): it => {
    if impressao-frente-verso {
      pagebreak(to: "odd", weak: true)
    } else {
      pagebreak(weak: true)
    }
    v(2cm, weak: true)
    block(width: 100%, spacing: 0em, above: 0em, below: 1.5em)[
      #set par(first-line-indent: 0cm)
      #set align(if it.numbering == none { center } else { left })
      #set text(size: 12pt, weight: "bold")
      #upper(it)
    ]
  }

  show heading.where(level: 2): it => {
    block(width: 100%, spacing: 0em, above: 1.5em, below: 1.5em)[
      #set par(first-line-indent: 0cm)
      #set align(left)
      #set text(size: 12pt, weight: "regular")
      #upper(it)
    ]
  }

  show heading.where(level: 3): it => {
    block(width: 100%, spacing: 0em, above: 1.5em, below: 1.5em)[
      #set par(first-line-indent: 0cm)
      #set align(left)
      #set text(size: 12pt, weight: "bold")
      #it
    ]
  }

  show heading.where(level: 4): it => {
    block(width: 100%, spacing: 0em, above: 1.5em, below: 1.5em)[
      #set par(first-line-indent: 0cm)
      #set align(left)
      #set text(size: 12pt, style: "italic")
      #it
    ]
  }

  show heading.where(level: 5): it => {
    block(width: 100%, spacing: 0em, above: 1.5em, below: 1.5em)[
      #set par(first-line-indent: 0cm)
      #set align(left)
      #set text(size: 12pt)
      #it
    ]
  }

  set figure(gap: 0.5em)
  // Suplemento em maiúsculas para que as listas de ilustrações mostrem "FIGURA 1 –" (MDT Anexo J/K)
  set figure(supplement: it => {
    if it.func() == image { [FIGURA] }
    else if it.func() == table { [TABELA] }
    else { [ILUSTRAÇÃO] }
  })

  // Separador " – " (travessão) conforme MDT Anexo J/K: "FIGURA 1 – Título"
  show figure.caption: it => context [
    #it.supplement #it.counter.display(it.numbering) – #it.body
  ]

  show figure: it => {
    set align(center)
    set par(first-line-indent: 0cm, leading: 0.5em, spacing: 0em)
    block(width: 100%, above: 3em, below: 3em, breakable: false)[
      #set text(size: 10pt)
      #it.caption
      #v(0.5em)
      #it.body
    ]
  }

  // Citação direta longa (>3 linhas): use #quote(block: true)[…]
  show quote.where(block: true): it => {
    set par(
      first-line-indent: 0cm,
      leading: 0.5em,
      spacing: 0em,
      justify: true,
    )

    block(
      width: 100%,
      above: 1.5em,
      below: 1.5em,
      inset: (left: 4cm, right: 0cm),
    )[
      #set text(size: 10pt)
      #it.body
    ]
  }

  set footnote.entry(
    separator: line(length: 5cm, stroke: 0.5pt),
    clearance: 0.5em,
    gap: 0.5em,
  )

  show footnote.entry: it => {
    set text(size: 10pt)
    set par(
      first-line-indent: 0cm,
      leading: 0.5em,
      spacing: 0em,
      justify: true,
    )
    it
  }

  set enum(indent: 1.25cm, spacing: 0.65em)
  set list(indent: 1.25cm, spacing: 0.65em)

  corpo

  // ============================================================================
  // REFERÊNCIAS (MDT cap. 6 / Anexo P — sem numeração de seção)
  // ============================================================================

  if bibliografia-arquivo != none {
    _in-pos-textual.update(true)
    heading(level: 1, numbering: none, "REFERÊNCIAS")
    set par(first-line-indent: 0cm, leading: 0.5em, spacing: 1.5em, justify: false)
    bibliography(bibliografia-arquivo, style: bibliografia-estilo, title: none)
  }

  // Pós-textuais: glossário → apêndices → anexos (MDT ordem obrigatória)
  if pos-textuais != none {
    pos-textuais
  }
}
