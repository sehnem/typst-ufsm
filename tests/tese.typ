// Teste mínimo: Tese de Doutorado
#import "../src/lib.typ": thesis-template

#show: thesis-template.with(
  titulo: "Título da Tese de Doutorado",
  autor: (nome: "Nome do Autor", sexo: "M"),
  orientador: (nome: "Nome do Orientador", titulacao: "Dr.", instituicao: "UFSM", sexo: "M"),
  tipo-trabalho: "Tese",
  grau: "Doutor",
  titulo-grau: "Doutor em Ciência da Computação",
  programa: "Programa de Pós-Graduação em Ciência da Computação",
  centro: "Centro de Tecnologia",
  data: (dia: 30, mes: 6, ano: 2025),
  banca: (
    (nome: "Membro da Banca", titulacao: "Dr.", instituicao: "UFRGS"),
  ),
  resumo: [Resumo da tese de doutorado.],
  palavras-chave: ("Palavra-chave 1", "Palavra-chave 2"),
  abstract: [Abstract of the doctoral thesis.],
  keywords: ("Keyword 1", "Keyword 2"),
  lista-figuras: false,
  lista-tabelas: false,
)

= Introdução

Texto introdutório da tese.

= Conclusão

Texto conclusivo da tese.
