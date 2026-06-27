// Tese de Doutorado — UFSM (exemplo de uso do template)

#import "/src/lib.typ": thesis-template

#show: thesis-template.with(
  titulo: "Aplicação de Técnicas de Aprendizado Profundo para Classificação de Imagens Médicas",

  subtitulo: "Um Estudo Comparativo com Redes Neurais Convolucionais",

  autor: (nome: "Nome Completo do Autor", sexo: "M"),

  orientador: (nome: "Nome do Orientador", titulacao: "Dr.", instituicao: "UFSM", sexo: "M"),

  // coorientador: opcional; remover ou comentar se não houver
  coorientador: (nome: "Nome do Coorientador", titulacao: "Dr.", instituicao: "UFSM", sexo: "M"),

  // Combinações válidas de tipo-trabalho / grau / titulo-grau:
  //   Doutorado:      tipo-trabalho: "Tese"        / grau: "Doutor"      / titulo-grau: "Doutor em ..."
  //   Mestrado:       tipo-trabalho: "Dissertação" / grau: "Mestre"       / titulo-grau: "Mestre em ..."
  //   Especialização: tipo-trabalho: "TCC"         / grau: "Especialista" / titulo-grau: "Especialista em ..."
  //   Graduação:      tipo-trabalho: "TCC"         / grau: "Bacharel"     / titulo-grau: "Bacharel em ..."
  //   Licenciatura:   tipo-trabalho: "TCC"         / grau: "Licenciado"   / titulo-grau: "Licenciado em ..."
  tipo-trabalho: "Tese",
  grau: "Doutor",
  titulo-grau: "Doutor em Ciência da Computação",

  // area-concentracao: relevante para doutorado/mestrado; omitir (remover ou none) para graduação
  area-concentracao: "Inteligência Artificial",

  // programa: para pós-graduação, nome completo do programa
  //           para TCC/especialização, apenas o nome do curso (ex: "Ciência da Computação")
  programa: "Programa de Pós-Graduação em Ciência da Computação",

  // instituicao e local têm defaults UFSM — altere se necessário
  centro: "Centro de Tecnologia",

  // data: (dia, mes, ano) — mesmo ano aparece na capa, rosto, ficha e aprovação
  // dia pode ser none se não quiser exibir o dia na folha de aprovação: (dia: none, mes: "outubro", ano: 2025)
  data: (dia: 18, mes: 10, ano: 2025),

  // Fonte: "Times New Roman" (padrão MDT) ou "Arial"
  // Sem instalação extra: "Libertinus Serif", "New Computer Modern"
  fonte: "Times New Roman",

  impressao-frente-verso: true,

  banca: (
    (nome: "Primeiro Membro da Banca", titulacao: "Dr.", instituicao: "UFSM"),
    (nome: "Segundo Membro da Banca", titulacao: "Dr.", instituicao: "UFRGS"),
    (nome: "Quarto Membro da Banca", titulacao: "Dr.", instituicao: "USP"),
  ),

  dedicatoria: [
    Dedico este trabalho aos meus pais, pelo apoio incondicional em todos os momentos da minha jornada acadêmica, e à minha família, por sempre acreditar nos meus sonhos.
  ],

  agradecimentos: include "agradecimentos.typ",

  epigrafe: "A mente que se abre a uma nova ideia jamais voltará ao seu tamanho original.",
  epigrafe-autor: "Albert Einstein",

  // Obrigatório para bolsistas CAPES (Portaria nº 206/2018)
  texto-financiamento: [
    _O presente trabalho foi realizado com apoio da Coordenação de Aperfeiçoamento de Pessoal de Nível Superior – Brasil (CAPES) – Código de Financiamento 001_
  ],

  errata: table(
    columns: (2cm, 2cm, 6cm, 6cm),
    align: (center, center, left, left),
    table.header([*Página*], [*Linha*], [*Onde se lê*], [*Leia-se*]),
    [42], [7], [redes convolucionais recursivas], [redes neurais convolucionais],
  ),

  // Resumo em português (obrigatório)
  resumo: include "resumo.typ",

  palavras-chave: (
    "Aprendizado Profundo",
    "Redes Neurais Convolucionais",
    "Imagens Médicas",
    "Diagnóstico Assistido por Computador",
    "Inteligência Artificial",
  ),

  abstract: include "abstract.typ",

  keywords: (
    "Deep Learning",
    "Convolutional Neural Networks",
    "Medical Imaging",
    "Computer-Aided Diagnosis",
    "Artificial Intelligence",
  ),

  resumo-extra: [
    El diagnóstico médico asistido por computadora se ha vuelto cada vez más relevante con el avance de las técnicas de inteligencia artificial. Este trabajo presenta una investigación sobre la aplicación de técnicas de aprendizaje profundo para la clasificación automática de imágenes médicas, con foco en radiografías torácicas e imágenes de resonancia magnética. Los resultados demuestran que los modelos propuestos alcanzaron un rendimiento superior al 95% de precisión en la clasificación de patologías comunes, superando los métodos tradicionales de la literatura. Las principales contribuciones incluyen un análisis comparativo de arquitecturas de aprendizaje profundo, el desarrollo de un framework de código abierto y la validación clínica de los resultados en colaboración con médicos especialistas.
  ],

  palavras-chave-extra: (
    "Aprendizaje Profundo",
    "Redes Neuronales Convolucionales",
    "Imágenes Médicas",
    "Diagnóstico Asistido por Computadora",
    "Inteligencia Artificial",
  ),

  titulo-resumo-extra: "RESUMEN",
  titulo-palavras-chave-extra: "Palabras clave:",

  lista-figuras: true,
  lista-quadros: true,
  listas-extras: (
    (titulo: "LISTA DE GRÁFICOS", kind: "grafico"),
  ),
  lista-tabelas: true,

  lista-siglas: (
    (sigla: "IA", descricao: "Inteligência Artificial"),
    (sigla: "CNN", descricao: "Convolutional Neural Network (Rede Neural Convolucional)"),
    (sigla: "ResNet", descricao: "Residual Network"),
    (sigla: "DenseNet", descricao: "Densely Connected Convolutional Network"),
    (sigla: "ROC", descricao: "Receiver Operating Characteristic"),
    (sigla: "AUC", descricao: "Area Under the Curve (Área sob a Curva)"),
    (sigla: "GPU", descricao: "Graphics Processing Unit"),
    (sigla: "DICOM", descricao: "Digital Imaging and Communications in Medicine"),
    (sigla: "ReLU", descricao: "Rectified Linear Unit"),
    (sigla: "SGD", descricao: "Stochastic Gradient Descent"),
    (sigla: "UFSM", descricao: "Universidade Federal de Santa Maria"),
  ),

  lista-abreviaturas: (
    (sigla: "cf.", descricao: "confira, confronte"),
    (sigla: "ed.", descricao: "edição"),
    (sigla: "et al.", descricao: "et alii — e outros"),
    (sigla: "ibid.", descricao: "ibidem — na mesma obra"),
    (sigla: "op. cit.", descricao: "opus citatum — na obra citada"),
    (sigla: "p.", descricao: "página"),
    (sigla: "vs.", descricao: "versus — em oposição a"),
  ),

  lista-simbolos: (
    (simbolo: $alpha$, descricao: "Taxa de aprendizado"),
    (simbolo: $beta$, descricao: "Parâmetro de momentum"),
    (simbolo: $sigma$, descricao: "Função de ativação sigmoid"),
    (simbolo: $theta$, descricao: "Parâmetros do modelo"),
    (simbolo: $nabla$, descricao: "Operador gradiente"),
    (simbolo: $lambda$, descricao: "Parâmetro de regularização"),
  ),

  bibliografia-arquivo: "/exemplo/references/references.bib",

  // Pós-textuais: glossário → apêndices → anexos (devem ficar aqui, nunca no corpo)
  pos-textuais: include "pos-textuais.typ",
)

// ============================================================================
// CORPO DO TRABALHO
// ============================================================================

#include "chapters/01-introducao.typ"
#include "chapters/02-fundamentacao-teorica.typ"
#include "chapters/03-trabalhos-relacionados.typ"
#include "chapters/04-metodologia.typ"
#include "chapters/05-resultados.typ"
#include "chapters/06-discussao.typ"
#include "chapters/07-exemplos-normas.typ"
#include "chapters/08-conclusoes.typ"
