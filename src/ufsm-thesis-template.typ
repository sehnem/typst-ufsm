// Template de Tese - Universidade Federal de Santa Maria (UFSM)
// Baseado nas normas ABNT para trabalhos acadêmicos
// Versão 0.13 - 16/11/2025

// ============================================================================
// FUNÇÕES AUXILIARES EXPORTÁVEIS
// ============================================================================

// Função para criar glossário
// IMPORTANTE: Os itens devem estar em ORDEM ALFABÉTICA
#let glossario(itens) = {
  pagebreak()
  v(2cm, weak: true)
  
  // Título
  block(
    width: 100%,
    spacing: 0em,
    above: 0em,
    below: 1.5em,
  )[
    #set align(center)
    #text(size: 12pt, weight: "bold")[
      GLOSSÁRIO
    ]
  ]
  
  // Glossário: ordem alfabética, espaçamento 1.5
  // Os itens devem ser fornecidos já ordenados alfabeticamente
  set par(first-line-indent: 0cm, spacing: 1.5em, leading: 0.65em, justify: false)
  
  for item in itens [
    *#item.termo:* #item.definicao
    
  ]
}

// Função para criar apêndice
#let apendice(letra, titulo-apendice, conteudo) = {
  pagebreak()
  v(2cm, weak: true)
  
  // Título - TODO em negrito
  block(
    width: 100%,
    spacing: 0em,
    above: 0em,
    below: 1.5em,
  )[
    #set align(center)
    #text(size: 12pt, weight: "bold")[
      APÊNDICE #letra – #upper(titulo-apendice)
    ]
  ]
  
  conteudo
}

// Função para criar anexo
#let anexo(letra, titulo-anexo, conteudo) = {
  pagebreak()
  v(2cm, weak: true)
  
  // Título - TODO em negrito
  block(
    width: 100%,
    spacing: 0em,
    above: 0em,
    below: 1.5em,
  )[
    #set align(center)
    #text(size: 12pt, weight: "bold")[
      ANEXO #letra – #upper(titulo-anexo)
    ]
  ]
  
  conteudo
}

// Função para criar tabelas conforme normas ABNT/IBGE
// Tabelas NÃO têm bordas laterais, apenas superior e inferior
#let tabela-abnt(
  colunas,
  alinhamento,
  cabecalho,
  ..linhas
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
      } else if y == linhas.pos().len() + 1 {
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

// ============================================================================
// CONFIGURAÇÕES GLOBAIS
// ============================================================================

#let thesis-template(
  // Informações da tese
  titulo: "",
  autor: "",
  orientador: "",
  coorientador: none,
  tipo-trabalho: "Tese",  // Tese, Dissertação, TCC
  grau: "Doutor",  // Doutor, Mestre, Bacharel
  area-concentracao: "",
  programa: "",
  instituicao: "Universidade Federal de Santa Maria",
  centro: "",
  local: "Santa Maria, RS",
  ano: "",
  data-defesa: "",
  
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
  
  // Texto de financiamento (opcional)
  texto-financiamento: none,
  
  // Listas
  lista-figuras: true,
  lista-tabelas: true,
  lista-abreviaturas: none,
  lista-simbolos: none,
  
  // Bibliografia
  bibliografia-arquivo: none,
  bibliografia-estilo: "apa",
  
  // Configuração de impressão (para trabalhos com mais de 100 páginas)
  // Norma: trabalhos com mais de 100 páginas devem usar impressão frente e verso
  // com margens espelhadas e numeração alternada
  impressao-frente-verso: false,  // true = margens espelhadas e numeração alternada
  
  // Conteúdo
  corpo,
) = {
  
  // ============================================================================
  // CONFIGURAÇÕES GERAIS DO DOCUMENTO
  // ============================================================================
  
  set document(
    title: titulo,
    author: autor,
    date: auto,
  )
  
  // Configuração de página (ABNT: A4, margens específicas)
  // Para trabalhos com mais de 100 páginas: margens espelhadas
  set page(
    paper: "a4",
    margin: if impressao-frente-verso {
      (
        inside: 3cm,   // Margem interna (espelhada)
        outside: 2cm,  // Margem externa (espelhada)
        top: 3cm,
        bottom: 2cm,
      )
    } else {
      (
        left: 3cm,     // Margem esquerda fixa
        right: 2cm,    // Margem direita fixa
        top: 3cm,
        bottom: 2cm,
      )
    },
  )
  
  // Configuração de texto
  set text(
    font: "Times New Roman",  // ABNT recomenda Times ou Arial
    size: 12pt,
    lang: "pt",
    hyphenate: true,
  )
  
  // Configuração de parágrafos (ABNT: justificado, recuo 1.25cm)
  set par(
    justify: true,
    leading: 0.65em,
    first-line-indent: 1.25cm,
  )
  
  // Espaçamento entre linhas (ABNT: 1.5)
  set par(spacing: 1.5em)
  
  // ============================================================================
  // FUNÇÕES AUXILIARES
  // ============================================================================
  
  // Função para texto centralizado sem recuo
  let centralizado(conteudo) = {
    set align(center)
    set par(first-line-indent: 0cm, justify: false)
    conteudo
  }
  
  // Função para texto sem recuo
  let sem-recuo(conteudo) = {
    set par(first-line-indent: 0cm)
    conteudo
  }
  
  // Função para título em maiúsculas e negrito
  let titulo-maiusculo(texto) = {
    text(weight: "bold", upper(texto))
  }
  
  // ============================================================================
  // CAPA (elemento obrigatório - não conta na paginação)
  // ============================================================================
  // Normas UFSM: Fonte 14, espaçamento simples, mínimo 8 espaços entre seções
  
  page(
    margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm),
    numbering: none,
  )[
    #set align(center)
    #set par(first-line-indent: 0cm, justify: false, leading: 0.5em, spacing: 0em)
    
    // Cabeçalho - espaçamento simples
    #text(size: 14pt)[
      #upper(instituicao)\
      #upper(centro)\
      #upper(programa)
    ]
    
    // Mínimo 8 espaços simples (8 * 1.0em * 14pt ≈ 4cm)
    #v(4cm)
    
    // Nome do autor - letras minúsculas com iniciais maiúsculas
    #text(size: 14pt)[
      #autor
    ]
    
    // Mínimo 8 espaços simples
    #v(4cm)
    
    // Título - negrito e maiúsculas
    #text(size: 14pt, weight: "bold")[
      #upper(titulo)
    ]
    
    #v(1fr)
    
    // Local e ano
    #text(size: 14pt)[
      #local\
      #ano
    ]
    
    #v(1cm)
  ]
  
  // Resetar contador para que a Folha de Rosto seja a página 1 (capa não é contada)
  counter(page).update(0)
  
  // ============================================================================
  // FOLHA DE ROSTO (elemento obrigatório - contagem de páginas inicia aqui)
  // ============================================================================
  // Normas UFSM: Fonte 12, 7 espaços simples entre seções, recuo de 7cm
  
  page(
    margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm),
    numbering: none,
  )[
    #set align(center)
    #set par(first-line-indent: 0cm, justify: false, leading: 0.5em, spacing: 0em)
    
    // Nome completo do autor - centralizado, na parte superior
    #text(size: 12pt)[
      #autor
    ]
    
    // 7 espaços simples (7 * 1.0em * 12pt ≈ 2.5cm)
    #v(2.5cm)
    
    // Título - negrito e maiúsculas
    #text(size: 12pt, weight: "bold")[
      #upper(titulo)
    ]
    
    // 7 espaços simples
    #v(2.5cm)
    
    // Natureza do trabalho (recuo de 7cm da margem esquerda)
    #box(width: 100%)[
      #align(left)[
        #h(7cm)
        #block(width: 9cm)[
          #set align(left)
          #set par(justify: true, first-line-indent: 0cm, leading: 0.5em, spacing: 0em)
          #text(size: 12pt)[
            #tipo-trabalho apresentad#if tipo-trabalho == "Tese" [a] else [o] ao #programa da #instituicao (UFSM, RS), como requisito parcial para obtenção do título de #grau em #area-concentracao.
          ]
        ]
      ]
    ]
    
    // Orientação - 10 espaços simples abaixo da nota
    #v(3.5cm)
    
    #box(width: 100%)[
      #align(center)[
        #set par(first-line-indent: 0cm, leading: 0.5em, spacing: 0em)
        #text(size: 12pt)[
          Orientador#if orientador.contains("Prof") [] else [(a)]: #orientador
          
          #if coorientador != none [
            \
            Coorientador#if coorientador.contains("Prof") [] else [(a)]: #coorientador
          ]
        ]
      ]
    ]
    
    #v(1fr)
    
    // Local e ano
    #text(size: 12pt)[
      #local\
      #ano
    ]
    
    #v(1cm)
  ]
  
  // ============================================================================
  // FICHA CATALOGRÁFICA (verso da folha de rosto)
  // ============================================================================
  // Normas UFSM: Deve seguir o padrão do sistema de geração automática da UFSM
  
  page(
    margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm),
    numbering: none,
  )[
    #set par(first-line-indent: 0cm, justify: false, leading: 0.65em)
    #set text(size: 12pt)
    
    // Texto de financiamento (se aplicável)
    #if texto-financiamento != none [
      #v(2cm)
      #align(left)[
        #text(size: 12pt)[
          #texto-financiamento
        ]
      ]
    ]
    
    #v(1fr)
    
    // Caixa da ficha catalográfica
    #set align(center)
    #block(
      width: 12.5cm,
      stroke: 1pt + black,
      inset: 1cm,
    )[
      #set align(left)
      #set text(size: 10pt)
      #set par(first-line-indent: 0cm, spacing: 0.5em, justify: false, leading: 0.5em)
      
      // Formato: Último Sobrenome, Nome
      #let nomes = autor.split(" ")
      #let ultimo-sobrenome = nomes.last()
      #let primeiro-nome = nomes.first()
      
      #ultimo-sobrenome, #primeiro-nome\
      #h(1.25cm)#titulo / #primeiro-nome #ultimo-sobrenome.– #ano.\
      #h(1.25cm)#context [#counter(page).final().first()] p.; 30 cm
      
      #v(0.3cm)
      
      #h(1.25cm)Orientador: #orientador
      #if coorientador != none [
        \
        #h(1.25cm)Coorientador: #coorientador
      ]
      
      #v(0.3cm)
      
      #h(1.25cm)#tipo-trabalho (#if grau == "Doutor" [doutorado] else if grau == "Mestre" [mestrado] else [graduação]) – #instituicao, #centro, #programa, RS, #ano
      
      #v(0.3cm)
      
      // Palavras-chave numeradas
      #h(1.25cm)
      #{
        for (idx, palavra) in palavras-chave.enumerate() {
          str(idx + 1)
          [. ]
          palavra
          [ ]
        }
      }
      
      // Extração dos sobrenomes dos orientadores
      #let sobrenome-orientador = orientador.split(" ").last()
      I. #sobrenome-orientador, orient. 
      #if coorientador != none [
        #let sobrenome-coorientador = coorientador.split(" ").last()
        II. #sobrenome-coorientador, coorient. III. Título.
      ] else [
        II. Título.
      ]
      
      #v(0.5cm)
      
    ]
    
    #v(1cm)
    
    // Declaração de autenticidade
    #set align(left)
    #set text(size: 11pt)
    #set par(justify: true, first-line-indent: 0cm, spacing: 0.8em, leading: 0.65em)
    
    Declaro, #upper(autor), para os devidos fins e sob as penas da lei, que a pesquisa constante neste trabalho de conclusão de curso (#tipo-trabalho) foi por mim elaborada e que as informações necessárias obtidas de consulta em literatura e outras fontes estão devidamente referenciadas. Declaro, ainda, que este trabalho ou parte dele não foi apresentado anteriormente para obtenção de qualquer outro grau acadêmico, estando ciente de que a inveracidade da presente declaração poderá resultar na anulação da titulação pela Universidade, entre outras consequências legais.
    
    #v(1cm)
  ]
  
  // ============================================================================
  // FOLHA DE APROVAÇÃO
  // ============================================================================
  // Normas UFSM: Nome em negrito e maiúsculas, 7 espaços entre seções, 4 espaços antes da data
  
  page(
    margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm),
    numbering: none,
  )[
    #set align(center)
    #set par(first-line-indent: 0cm, justify: false, leading: 0.5em, spacing: 0em)
    
    // Nome completo do autor - negrito e maiúsculas
    #text(size: 12pt, weight: "bold")[
      #upper(autor)
    ]
    
    // 7 espaços simples
    #v(2.5cm)
    
    // Título - negrito e maiúsculas
    #text(size: 12pt, weight: "bold")[
      #upper(titulo)
    ]
    
    // 7 espaços simples
    #v(2.5cm)
    
    // Natureza do trabalho (recuo de 7cm)
    #box(width: 100%)[
      #align(left)[
        #h(7cm)
        #block(width: 9cm)[
          #set align(left)
          #set par(justify: true, first-line-indent: 0cm, leading: 0.5em, spacing: 0em)
          #text(size: 12pt)[
            #tipo-trabalho apresentad#if tipo-trabalho == "Tese" [a] else [o] ao #programa da #instituicao (UFSM, RS), como requisito parcial para obtenção do título de #grau em #area-concentracao.
          ]
        ]
      ]
    ]
    
    // 4 espaços simples
    #v(1.4cm)
    
    // Data da aprovação - negrito
    #text(size: 12pt, weight: "bold")[
      Aprovad#if tipo-trabalho == "Tese" [a] else [o] em #data-defesa
    ]
    
    #v(2cm)
    
    // Banca examinadora
    #line(length: 60%, stroke: 0.5pt)
    #v(0.3cm)
    #text(size: 12pt)[
      #orientador (Presidente/Orientador)
    ]
    
    #v(1.5cm)
    
    #for membro in banca [
      #line(length: 60%, stroke: 0.5pt)
      #v(0.3cm)
      #text(size: 12pt)[
        #membro
      ]
      #v(1.5cm)
    ]
    
    #v(1fr)
    
    // Local e ano
    #text(size: 12pt)[
      #local\
      #ano
    ]
    
    #v(1cm)
  ]
  
  // ============================================================================
  // DEDICATÓRIA (elemento opcional)
  // ============================================================================
  // Normas UFSM: Sem título, formatação livre, centralizada na página, espaçamento 1.5
  
  if dedicatoria != none {
    page(
      margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm),
      numbering: none,
    )[
      #v(1fr)
      
      // Texto - centralizado na página, espaçamento 1.5
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
  // Normas UFSM: Título centralizado, uma linha em branco, texto justificado com espaçamento 1.5
  
  if agradecimentos != none {
    page(
      margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm),
      numbering: none,
    )[
      #v(2cm, weak: true)
      
      // Título
      #block(
        width: 100%,
        spacing: 0em,
        above: 0em,
        below: 1.5em,
      )[
        #set align(center)
        #text(size: 12pt, weight: "bold")[
          AGRADECIMENTOS
        ]
      ]
      
      // Texto - justificado, espaçamento 1.5
      #set par(first-line-indent: 1.25cm, justify: true, leading: 0.65em, spacing: 1.5em)
      #text(size: 12pt)[
        #agradecimentos
      ]
    ]
  }
  
  // ============================================================================
  // EPÍGRAFE (elemento opcional)
  // ============================================================================
  // Normas UFSM: Sem título, formatação livre, geralmente à direita na parte inferior, espaçamento 1.5, fonte entre parênteses
  
  if epigrafe != none {
    page(
      margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm),
      numbering: none,
    )[
      #v(1fr)
      
      // Citação - alinhada à direita, parte inferior da página, espaçamento 1.5
      #align(right)[
        #block(width: 60%)[
          #set align(left)
          #set par(first-line-indent: 0cm, justify: true, leading: 0.65em, spacing: 1.5em)
          #text(size: 12pt, style: "italic")[
            "#epigrafe"
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
  // RESUMO (elemento obrigatório)
  // ============================================================================
  // Normas UFSM: Título centralizado, 2 linhas em branco, espaçamento simples no texto
  
  page(
    margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm),
    numbering: none,
  )[
    #set par(first-line-indent: 0cm, justify: false)
    
    #v(2cm, weak: true)
    
    // Título "RESUMO"
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
    
    // Título e autoria - centralizados, espaçamento simples
    #block(
      width: 100%,
      spacing: 0em,
      above: 0em,
      below: 1cm,
    )[
      #set align(center)
      #set par(leading: 0.5em, spacing: 0em)
      #text(size: 12pt, weight: "bold")[
        #upper(titulo)
      ]
      
      #v(0.5cm)
      
      #text(size: 12pt)[
        AUTOR: #autor\
        ORIENTADOR: #orientador
      ]
    ]
    
    // Texto do resumo - parágrafo único, espaçamento simples, justificado
    #set par(first-line-indent: 0cm, justify: true, leading: 0.5em, spacing: 0em)
    #text(size: 12pt)[
      #resumo
    ]
    
    // 2 linhas em branco (espaçamento simples)
    #v(1cm)
    
    // Palavras-chave
    #set par(first-line-indent: 0cm, justify: false)
    #text(size: 12pt)[
      *Palavras-chave:* #palavras-chave.join(". ").
    ]
  ]
  
  // ============================================================================
  // ABSTRACT (elemento obrigatório)
  // ============================================================================
  // Normas UFSM: Mesma estrutura e formatação do Resumo, apenas traduzido
  
  page(
    margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm),
    numbering: none,
  )[
    #set par(first-line-indent: 0cm, justify: false)
    
    #v(2cm, weak: true)
    
    // Título "ABSTRACT"
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
    
    // Título e autoria - centralizados, espaçamento simples
    #block(
      width: 100%,
      spacing: 0em,
      above: 0em,
      below: 1cm,
    )[
      #set align(center)
      #set par(leading: 0.5em, spacing: 0em)
      #text(size: 12pt, weight: "bold")[
        #upper(titulo)
      ]
      
      #v(0.5cm)
      
      #text(size: 12pt)[
        AUTHOR: #autor\
        ADVISOR: #orientador
      ]
    ]
    
    // Texto do abstract - parágrafo único, espaçamento simples, justificado
    #set par(first-line-indent: 0cm, justify: true, leading: 0.5em, spacing: 0em)
    #text(size: 12pt)[
      #abstract
    ]
    
    // 2 linhas em branco (espaçamento simples)
    #v(1cm)
    
    // Keywords
    #set par(first-line-indent: 0cm, justify: false)
    #text(size: 12pt)[
      *Keywords:* #keywords.join(". ").
    ]
  ]
  
  // ============================================================================
  // LISTA DE FIGURAS (elemento opcional)
  // ============================================================================
  // Normas UFSM: Título centralizado, uma linha em branco (1.5), espaçamento 1.5
  
  if lista-figuras {
    page(
      margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm),
      numbering: none,
    )[
      #v(2cm, weak: true)
      
      // Título
      #block(
        width: 100%,
        spacing: 0em,
        above: 0em,
        below: 1.5em,
      )[
        #set align(center)
        #text(size: 12pt, weight: "bold")[
          LISTA DE FIGURAS
        ]
      ]
      
      // Lista - espaçamento 1.5
      #set par(first-line-indent: 0cm, leading: 0.65em, spacing: 1.5em)
      #outline(
        title: none,
        target: figure.where(kind: image),
      )
    ]
  }
  
  // ============================================================================
  // LISTA DE TABELAS (elemento opcional)
  // ============================================================================
  // Normas UFSM: Título centralizado, uma linha em branco (1.5), espaçamento 1.5
  
  if lista-tabelas {
    page(
      margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm),
      numbering: none,
    )[
      #v(2cm, weak: true)
      
      // Título
      #block(
        width: 100%,
        spacing: 0em,
        above: 0em,
        below: 1.5em,
      )[
        #set align(center)
        #text(size: 12pt, weight: "bold")[
          LISTA DE TABELAS
        ]
      ]
      
      // Lista - espaçamento 1.5
      #set par(first-line-indent: 0cm, leading: 0.65em, spacing: 1.5em)
      #outline(
        title: none,
        target: figure.where(kind: table),
      )
    ]
  }
  
  // ============================================================================
  // LISTA DE ABREVIATURAS E SIGLAS (elemento opcional)
  // ============================================================================
  // Normas UFSM: Título centralizado, uma linha em branco, espaçamento 1.5 entre itens
  // IMPORTANTE: Os itens devem estar em ORDEM ALFABÉTICA
  
  if lista-abreviaturas != none {
    page(
      margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm),
      numbering: none,
    )[
      #v(2cm, weak: true)
      
      // Título
      #block(
        width: 100%,
        spacing: 0em,
        above: 0em,
        below: 1.5em,
      )[
        #set align(center)
        #text(size: 12pt, weight: "bold")[
          LISTA DE ABREVIATURAS E SIGLAS
        ]
      ]
      
      // Lista - alinhamento à esquerda, espaçamento 1.5 entre itens
      // Os itens devem ser fornecidos já ordenados alfabeticamente
      #set par(first-line-indent: 0cm, spacing: 1.5em, leading: 0.65em)
      #for item in lista-abreviaturas [
        #item.sigla – #item.descricao\
      ]
    ]
  }
  
  // ============================================================================
  // LISTA DE SÍMBOLOS (elemento opcional)
  // ============================================================================
  // Normas UFSM: Título centralizado, uma linha em branco, espaçamento SIMPLES entre itens
  // IMPORTANTE: Os itens devem estar na ORDEM DE APRESENTAÇÃO NO TEXTO, NÃO alfabética
  
  if lista-simbolos != none {
    page(
      margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm),
      numbering: none,
    )[
      #v(2cm, weak: true)
      
      // Título
      #block(
        width: 100%,
        spacing: 0em,
        above: 0em,
        below: 1.5em,
      )[
        #set align(center)
        #text(size: 12pt, weight: "bold")[
          LISTA DE SÍMBOLOS
        ]
      ]
      
      // Lista - alinhamento à esquerda, espaçamento SIMPLES entre itens
      // Os itens devem ser fornecidos na ordem em que aparecem no texto
      #set par(first-line-indent: 0cm, spacing: 1em, leading: 0.5em)
      #for item in lista-simbolos [
        #item.simbolo – #item.descricao\
      ]
    ]
  }
  
  // ============================================================================
  // SUMÁRIO (elemento obrigatório)
  // ============================================================================
  // Normas UFSM: Último elemento pré-textual, não inclui elementos pré-textuais
  
  page(
    margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 2cm),
    numbering: none,
  )[
    #v(2cm, weak: true)
    
    // Título
    #block(
      width: 100%,
      spacing: 0em,
      above: 0em,
      below: 1.5em,
    )[
      #set align(center)
      #text(size: 12pt, weight: "bold")[
        SUMÁRIO
      ]
    ]
    
    // Sumário - espaçamento 1.5
    // Deve incluir até 5 níveis (seção quinária)
    #set par(first-line-indent: 0cm, leading: 0.65em, spacing: 1.5em)
    #outline(
      title: none,
      indent: auto,
      depth: 5,
    )
  ]
  
  // ============================================================================
  // CORPO DO TRABALHO
  // ============================================================================
  // Normas UFSM: Numeração aparece a partir da Introdução (fonte 10, canto superior direito)
  
  // Configurar numeração de páginas (inicia no corpo do texto)
  // IMPORTANTE: A numeração CONTINUA a contagem desde a folha de rosto
  // NÃO resetar o contador - a Introdução mostra o número real de páginas contadas
  // Para trabalhos com mais de 100 páginas: numeração alternada (direita no anverso, esquerda no verso)
  set page(
    numbering: "1",
    number-align: if impressao-frente-verso {
      // Impressão frente e verso: alterna entre direita (ímpares) e esquerda (pares)
      top
    } else {
      // Impressão apenas frente: sempre à direita
      top + right
    },
    header: if impressao-frente-verso {
      // Numeração alternada para frente e verso
      context {
        let page-num = counter(page).display()
        let is-odd = calc.odd(counter(page).get().first())
        if is-odd {
          // Anverso (páginas ímpares): numeração à direita
          align(right)[#text(size: 10pt)[#page-num]]
        } else {
          // Verso (páginas pares): numeração à esquerda
          align(left)[#text(size: 10pt)[#page-num]]
        }
      }
    } else {
      // Numeração fixa à direita para impressão simples
      context align(right)[
        #text(size: 10pt)[
          #counter(page).display()
        ]
      ]
    },
  )
  
  
  // Configurar numeração de seções (ABNT: até 5 níveis)
  set heading(numbering: "1.1.1.1.1")
  
  // Configurar numeração de equações
  set math.equation(numbering: "(1)")
  
  // Formatação de títulos (ABNT)
  // Seção Primária: MAIÚSCULAS, negrito, nova página
  // Norma: "Parte superior da página" - 2cm do topo, 1.5em abaixo
  show heading.where(level: 1): it => {
    pagebreak(weak: false)
    v(2cm, weak: true)
    block(
      width: 100%,
      spacing: 0em,
      above: 0em,
      below: 1.5em,
    )[
      #set par(first-line-indent: 0cm)
      #set align(left)
      #set text(size: 12pt, weight: "bold")
      #upper(it)
    ]
  }
  
  // Seção Secundária: MAIÚSCULAS, sem negrito
  show heading.where(level: 2): it => {
    block(
      width: 100%,
      spacing: 0em,
      above: 1.5em,
      below: 1.5em,
    )[
      #set par(first-line-indent: 0cm)
      #set align(left)
      #set text(size: 12pt, weight: "regular")
      #upper(it)
    ]
  }
  
  // Seção Terciária: Maiúsculas e minúsculas, sem negrito
  show heading.where(level: 3): it => {
    block(
      width: 100%,
      spacing: 0em,
      above: 1.5em,
      below: 1.5em,
    )[
      #set par(first-line-indent: 0cm)
      #set align(left)
      #set text(size: 12pt, weight: "regular")
      #it
    ]
  }
  
  // Seção Quaternária: Maiúsculas e minúsculas, itálico
  show heading.where(level: 4): it => {
    block(
      width: 100%,
      spacing: 0em,
      above: 1.5em,
      below: 1.5em,
    )[
      #set par(first-line-indent: 0cm)
      #set align(left)
      #set text(size: 12pt, style: "italic")
      #it
    ]
  }
  
  // Seção Quinária: Maiúsculas e minúsculas, sem destaque
  show heading.where(level: 5): it => {
    block(
      width: 100%,
      spacing: 0em,
      above: 1.5em,
      below: 1.5em,
    )[
      #set par(first-line-indent: 0cm)
      #set align(left)
      #set text(size: 12pt)
      #it
    ]
  }
  
  // Configuração de figuras e tabelas (ABNT: fonte 10 para legendas, espaçamento simples)
  set figure(gap: 0.5em)
  
  show figure: it => {
    set align(center)
    set par(first-line-indent: 0cm, leading: 0.5em, spacing: 0em)
    
    // Dois espaços de 1.5 antes da ilustração
    v(3em)
    
    it.body
    v(0.5em)
    
    // Legenda com fonte 10, espaçamento simples
    set text(size: 10pt)
    it.caption
    
    // Dois espaços de 1.5 depois da ilustração
    v(3em)
  }
  
  // Configuração de citações diretas longas (ABNT: mais de 3 linhas)
  // Usar #quote(block: true)[texto] para citações longas
  show quote.where(block: true): it => {
    set text(size: 10pt)
    set par(
      first-line-indent: 0cm,
      leading: 0.5em,
      spacing: 0em,
      justify: true,
    )
    
    // Dois espaços de 1.5 antes
    v(3em)
    
    // Recuo de 4cm da margem esquerda
    block(inset: (left: 4cm, right: 0cm))[
      #it.body
    ]
    
    // Dois espaços de 1.5 depois
    v(3em)
  }
  
  // Configuração de notas de rodapé (ABNT: fonte 10, espaçamento simples)
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
  
  // Configuração de listas enumeradas (ABNT: espaçamento 1.5)
  set enum(
    indent: 1.25cm,
    spacing: 1.5em,
  )
  
  // Configuração de listas com marcadores (ABNT: espaçamento 1.5)
  set list(
    indent: 1.25cm,
    spacing: 1.5em,
  )
  
  // Corpo do texto
  corpo
  
  // ============================================================================
  // REFERÊNCIAS BIBLIOGRÁFICAS (elemento obrigatório)
  // ============================================================================
  // Normas UFSM: Elemento pós-textual, sem numeração de seção
  
  if bibliografia-arquivo != none {
    pagebreak()
    
    v(2cm, weak: true)
    
    // Título
    block(
      width: 100%,
      spacing: 0em,
      above: 0em,
      below: 1.5em,
    )[
      #set align(center)
      #text(size: 12pt, weight: "bold")[
        REFERÊNCIAS
      ]
    ]
    
    // Bibliografia - espaçamento simples dentro da referência, 1 linha em branco entre referências
    set par(first-line-indent: 0cm, hanging-indent: 0.5cm, leading: 0.5em, spacing: 1.5em)
    bibliography(bibliografia-arquivo, style: bibliografia-estilo, title: none)
  }
}

