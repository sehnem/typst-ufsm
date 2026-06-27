// Teste mínimo: Dissertação de Mestrado
#import "../src/lib.typ": thesis-template

#show: thesis-template.with(
  titulo: "Título da Dissertação de Mestrado",
  autor: (nome: "Nome da Autora", sexo: "F"),
  orientador: (nome: "Nome da Orientadora", titulacao: "Dra.", instituicao: "UFSM", sexo: "F"),
  tipo-trabalho: "Dissertação",
  grau: "Mestre",
  titulo-grau: "Mestre em Ciência da Computação",
  programa: "Programa de Pós-Graduação em Ciência da Computação",
  centro: "Centro de Tecnologia",
  data: (dia: 30, mes: 6, ano: 2025),
  banca: (
    (nome: "Membro da Banca", titulacao: "Dr.", instituicao: "UFSM"),
  ),
  resumo: [Resumo da dissertação de mestrado.],
  palavras-chave: ("Palavra-chave 1", "Palavra-chave 2"),
  abstract: [Abstract of the master's dissertation.],
  keywords: ("Keyword 1", "Keyword 2"),
  lista-figuras: false,
  lista-tabelas: false,
)

= Introdução

Texto introdutório da dissertação.

= Conclusão

Texto conclusivo da dissertação.
