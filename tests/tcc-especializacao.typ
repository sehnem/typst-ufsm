// Teste mínimo: TCC de Especialização
#import "../src/lib.typ": thesis-template

#show: thesis-template.with(
  titulo: "Título do Trabalho de Conclusão de Especialização",
  autor: (nome: "Nome da Autora", sexo: "F"),
  orientador: (nome: "Nome do Orientador", titulacao: "Dr.", instituicao: "UFSM", sexo: "M"),
  tipo-trabalho: "TCC",
  grau: "Especialista",
  titulo-grau: "Especialista em Gestão de Tecnologia da Informação",
  programa: "Gestão de Tecnologia da Informação",
  centro: "Centro de Tecnologia",
  data: (dia: 30, mes: 6, ano: 2025),
  banca: (
    (nome: "Membro da Banca", titulacao: "Me.", instituicao: "UFSM"),
  ),
  resumo: [Resumo do trabalho de conclusão de curso de especialização.],
  palavras-chave: ("Palavra-chave 1", "Palavra-chave 2"),
  abstract: [Abstract of the specialization course completion work.],
  keywords: ("Keyword 1", "Keyword 2"),
  lista-figuras: false,
  lista-tabelas: false,
)

= Introdução

Texto introdutório do TCC de especialização.

= Conclusão

Texto conclusivo do TCC de especialização.
