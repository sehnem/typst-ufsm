// Teste mínimo: TCC de Graduação (Bacharel)
#import "../src/lib.typ": thesis-template

#show: thesis-template.with(
  titulo: "Título do Trabalho de Conclusão de Curso",
  autor: (nome: "Nome do Autor", sexo: "M"),
  orientador: (nome: "Nome do Orientador", titulacao: "Dr.", instituicao: "UFSM", sexo: "M"),
  tipo-trabalho: "TCC",
  grau: "Bacharel",
  titulo-grau: "Bacharel em Ciência da Computação",
  programa: "Ciência da Computação",
  centro: "Centro de Tecnologia",
  data: (dia: 30, mes: 6, ano: 2025),
  banca: (
    (nome: "Membro da Banca", titulacao: "Dr.", instituicao: "UFSM"),
  ),
  resumo: [Resumo do trabalho de conclusão de curso de graduação.],
  palavras-chave: ("Palavra-chave 1", "Palavra-chave 2"),
  abstract: [Abstract of the undergraduate thesis.],
  keywords: ("Keyword 1", "Keyword 2"),
  lista-figuras: false,
  lista-tabelas: false,
)

= Introdução

Texto introdutório do TCC de graduação.

= Conclusão

Texto conclusivo do TCC de graduação.
