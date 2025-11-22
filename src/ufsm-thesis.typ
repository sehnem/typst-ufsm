// Tese de Doutorado - UFSM

#import "ufsm-thesis-template.typ": anexo, apendice, glossario, tabela-abnt, thesis-template, apud

// ============================================================================
// CONFIGURAÇÃO DAS INFORMAÇÕES DA TESE
// ============================================================================

#show: thesis-template.with(
  // Informações básicas
  titulo: "Aplicação de Técnicas de Aprendizado Profundo para Classificação de Imagens Médicas",

  autor: "Nome Completo do Autor",

  orientador: "Prof. Dr. Nome do Orientador",

  coorientador: "Prof. Dr. Nome do Coorientador", // ou none se não houver

  tipo-trabalho: "Tese",

  titulo-grau: "Doutor em Ciência da Computação",

  grau: "Doutor",

  area-concentracao: "Inteligência Artificial",

  programa: "Programa de Pós-Graduação em Ciência da Computação",

  instituicao: "Universidade Federal de Santa Maria",

  centro: "Centro de Tecnologia",

  local: "Santa Maria, RS",

  ano: "2025",

  data-defesa: "18 de outubro de 2025",

  impressao-frente-verso: true,

  // Banca examinadora (além do orientador)
  banca: (
    "Prof. Dr. Primeiro Membro da Banca (UFSM)",
    "Prof. Dr. Segundo Membro da Banca (UFRGS)",
    "Prof. Dr. Terceiro Membro da Banca (UFSC)",
    "Prof. Dr. Quarto Membro da Banca (USP)",
  ),

  // Dedicatória (opcional)
  dedicatoria: [
    Dedico este trabalho aos meus pais, pelo apoio incondicional em todos os momentos da minha jornada acadêmica, e à minha família, por sempre acreditar nos meus sonhos.
  ],

  // Agradecimentos (opcional)
  agradecimentos: [
    Agradeço primeiramente a Deus, por me dar forças para superar os desafios encontrados ao longo desta jornada.

    Ao meu orientador, Prof. Dr. Nome do Orientador, pela paciência, dedicação e pelos valiosos ensinamentos que foram fundamentais para a realização deste trabalho.

    Ao meu coorientador, Prof. Dr. Nome do Coorientador, pelas importantes contribuições e pelo suporte técnico durante o desenvolvimento da pesquisa.

    Aos professores do Programa de Pós-Graduação em Ciência da Computação da UFSM, pelos conhecimentos transmitidos e pela excelência acadêmica.

    Aos colegas do grupo de pesquisa, pelas discussões enriquecedoras e pelo companheirismo durante todo o período do doutorado.

    À CAPES e ao CNPq, pelo apoio financeiro que viabilizou a realização desta pesquisa.

    Aos membros da banca examinadora, pelas valiosas contribuições para o aperfeiçoamento deste trabalho.

    A todos os amigos e familiares que, de alguma forma, contribuíram para a conclusão desta etapa importante da minha vida.
  ],

  // Epígrafe (opcional)
  epigrafe: "A mente que se abre a uma nova ideia jamais voltará ao seu tamanho original.",
  epigrafe-autor: "Albert Einstein",

  // Texto de financiamento (opcional)
  texto-financiamento: [
    This study was financed in part by the Coordenação de Aperfeiçoamento de Pessoal de Nível Superior – Brasil (CAPES) – Finance Code 001
  ],

  // Resumo em português (obrigatório)
  resumo: [
    O diagnóstico médico assistido por computador tem se tornado cada vez mais relevante com o avanço das técnicas de inteligência artificial. Este trabalho apresenta uma investigação sobre a aplicação de técnicas de aprendizado profundo (deep learning) para classificação automática de imagens médicas, com foco em radiografias torácicas e imagens de ressonância magnética. O objetivo principal é desenvolver e avaliar modelos computacionais capazes de auxiliar profissionais da saúde na detecção precoce de patologias. A metodologia adotada envolve a utilização de redes neurais convolucionais (CNNs) com diferentes arquiteturas, incluindo ResNet, DenseNet e EfficientNet. Foram realizados experimentos utilizando três bases de dados públicas contendo mais de 100.000 imagens médicas anotadas por especialistas. Os modelos foram treinados utilizando técnicas de data augmentation, transfer learning e fine-tuning. Para avaliação de desempenho, foram empregadas métricas como acurácia, sensibilidade, especificidade, precisão e área sob a curva ROC. Os resultados demonstram que os modelos propostos alcançaram desempenho superior a 95% de acurácia na classificação de patologias comuns, superando métodos tradicionais da literatura. Além disso, foi desenvolvido um sistema de visualização de mapas de atenção (attention maps) utilizando Grad-CAM, permitindo identificar quais regiões da imagem foram mais relevantes para a decisão do modelo, contribuindo para a interpretabilidade dos resultados. As principais contribuições deste trabalho incluem: (i) uma análise comparativa abrangente de arquiteturas de deep learning para classificação de imagens médicas, (ii) o desenvolvimento de um framework open-source para facilitar a reprodutibilidade dos experimentos, (iii) a proposta de técnicas de ensemble que melhoram a robustez dos modelos, e (iv) a validação clínica dos resultados em colaboração com médicos especialistas. Os resultados obtidos demonstram o potencial das técnicas de aprendizado profundo como ferramentas de apoio ao diagnóstico médico, podendo contribuir para a redução de erros diagnósticos e para a democratização do acesso a cuidados de saúde de qualidade.
  ],

  palavras-chave: (
    "Aprendizado Profundo",
    "Redes Neurais Convolucionais",
    "Imagens Médicas",
    "Diagnóstico Assistido por Computador",
    "Inteligência Artificial",
  ),

  // Abstract em inglês (obrigatório)
  abstract: [
    Computer-aided medical diagnosis has become increasingly relevant with the advancement of artificial intelligence techniques. This work presents an investigation on the application of deep learning techniques for automatic classification of medical images, focusing on chest radiographs and magnetic resonance imaging. The main objective is to develop and evaluate computational models capable of assisting healthcare professionals in early detection of pathologies. The adopted methodology involves the use of convolutional neural networks (CNNs) with different architectures, including ResNet, DenseNet, and EfficientNet. Experiments were conducted using three public databases containing more than 100,000 medical images annotated by specialists. The models were trained using data augmentation, transfer learning, and fine-tuning techniques. For performance evaluation, metrics such as accuracy, sensitivity, specificity, precision, and area under the ROC curve were employed. The results demonstrate that the proposed models achieved performance exceeding 95% accuracy in classifying common pathologies, surpassing traditional methods from the literature. Additionally, an attention map visualization system was developed using Grad-CAM, allowing identification of which image regions were most relevant for the model's decision, contributing to the interpretability of results. The main contributions of this work include: (i) a comprehensive comparative analysis of deep learning architectures for medical image classification, (ii) the development of an open-source framework to facilitate experiment reproducibility, (iii) the proposal of ensemble techniques that improve model robustness, and (iv) clinical validation of results in collaboration with specialist physicians. The obtained results demonstrate the potential of deep learning techniques as tools to support medical diagnosis, potentially contributing to the reduction of diagnostic errors and to the democratization of access to quality healthcare.
  ],

  keywords: (
    "Deep Learning",
    "Convolutional Neural Networks",
    "Medical Imaging",
    "Computer-Aided Diagnosis",
    "Artificial Intelligence",
  ),

  // Listas (true = incluir, false = não incluir)
  lista-figuras: true,
  lista-tabelas: true,

  // Lista de abreviaturas (opcional)
  lista-abreviaturas: (
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

  // Lista de símbolos (opcional)
  lista-simbolos: (
    (simbolo: $alpha$, descricao: "Taxa de aprendizado"),
    (simbolo: $beta$, descricao: "Parâmetro de momentum"),
    (simbolo: $sigma$, descricao: "Função de ativação sigmoid"),
    (simbolo: $theta$, descricao: "Parâmetros do modelo"),
    (simbolo: $nabla$, descricao: "Operador gradiente"),
    (simbolo: $lambda$, descricao: "Parâmetro de regularização"),
  ),

  // Bibliografia (arquivo .bib)
  bibliografia-arquivo: "references/references.bib",
)

// ============================================================================
// CORPO DO TRABALHO
// ============================================================================

= Introdução

A inteligência artificial (IA) tem transformado diversos setores da sociedade nas últimas décadas, e a área da saúde não é exceção. Entre as várias aplicações da IA em medicina, o diagnóstico assistido por computador (Computer-Aided Diagnosis - CAD) destaca-se como uma das mais promissoras, especialmente no contexto de análise de imagens médicas @esteva2019guide @topol2019high.

As imagens médicas, como radiografias, tomografias computadorizadas, ressonâncias magnéticas e ultrassonografias, são ferramentas essenciais para o diagnóstico de diversas patologias. No entanto, a interpretação dessas imagens requer profissionais altamente treinados e experientes, além de ser um processo demorado e sujeito a erros humanos @shen2017deep.

Conforme destaca #cite(label("topol2019high"), form: "prose", supplement: "p. 45"), "a inteligência artificial [...] tem o potencial de *transformar radicalmente* [grifo nosso] a prática médica nos próximos anos". Este exemplo demonstra o uso de *supressões* [...], *ênfase* (grifo nosso) e *interpolações* [grifo nosso] em citações diretas curtas.

Neste contexto, as técnicas de aprendizado profundo (deep learning), especialmente as redes neurais convolucionais (Convolutional Neural Networks - CNNs), têm demonstrado resultados impressionantes na tarefa de classificação automática de imagens médicas @litjens2017survey. Estas técnicas são capazes de aprender representações hierárquicas complexas diretamente dos dados, sem a necessidade de engenharia manual de características.

== Motivação

A motivação principal deste trabalho surge da necessidade de desenvolver sistemas computacionais robustos e confiáveis que possam auxiliar médicos no processo de diagnóstico. Alguns fatores específicos que motivaram esta pesquisa incluem:

a) *escassez de especialistas:* em muitas regiões, especialmente em países em desenvolvimento, há carência de médicos especialistas em radiologia e outras áreas de diagnóstico por imagem;

b) *volume crescente de exames:* o número de exames de imagem realizados tem crescido exponencialmente, tornando desafiador para os profissionais analisarem todos os casos com devida atenção e tempo;

c) *detecção precoce:* sistemas automatizados podem auxiliar na detecção precoce de patologias, aumentando as chances de tratamento bem-sucedido;

d) *redução de erros:* a fadiga e outros fatores humanos podem levar a erros de diagnóstico, sendo que sistemas de IA podem servir como "segunda opinião", conforme:
– redução de falsos negativos;
– diminuição de variabilidade inter-observador;
– auxílio em casos de baixa prevalência.

e) *democratização do acesso:* tecnologias de IA podem ser implementadas em regiões remotas, democratizando o acesso a diagnósticos de qualidade.

Este é um exemplo de *alíneas* (a, b, c...) e *subalíneas* (–) formatadas conforme as normas ABNT: texto anterior termina em dois-pontos, alíneas com letra minúscula seguida de parêntese, primeira letra minúscula, terminam em ponto e vírgula (exceto a última que termina em ponto), e subalíneas iniciadas por travessão.

== Objetivos

=== Objetivo Geral

Desenvolver e avaliar modelos de aprendizado profundo para classificação automática de imagens médicas, com foco em radiografias torácicas e imagens de ressonância magnética, visando auxiliar profissionais da saúde no diagnóstico de patologias.

=== Objetivos Específicos

Os objetivos específicos deste trabalho são:

+ Realizar uma revisão sistemática da literatura sobre aplicações de deep learning em classificação de imagens médicas;

+ Coletar, organizar e pré-processar bases de dados públicas de imagens médicas anotadas;

+ Implementar e treinar diferentes arquiteturas de redes neurais convolucionais (ResNet, DenseNet, EfficientNet);

+ Avaliar comparativamente o desempenho dos modelos utilizando métricas apropriadas;

+ Desenvolver técnicas de ensemble para melhorar a robustez das predições;

+ Implementar mecanismos de interpretabilidade (Grad-CAM) para visualizar regiões relevantes nas decisões do modelo;

+ Validar os resultados em colaboração com médicos especialistas;

+ Disponibilizar um framework open-source para facilitar a reprodutibilidade dos experimentos.

== Organização do Trabalho

Este trabalho está organizado da seguinte forma:

O *Capítulo 2* apresenta a fundamentação teórica necessária para compreensão do trabalho, abordando conceitos de aprendizado de máquina, redes neurais artificiais e processamento de imagens médicas.

O *Capítulo 3* discute os trabalhos relacionados, apresentando uma revisão sistemática da literatura sobre aplicações de deep learning em imagens médicas.

O *Capítulo 4* descreve a metodologia empregada, incluindo as bases de dados utilizadas, as arquiteturas de redes neurais implementadas, técnicas de treinamento e métricas de avaliação.

O *Capítulo 5* apresenta os resultados obtidos nos experimentos, incluindo análises comparativas de desempenho e visualizações de mapas de atenção.

O *Capítulo 6* discute os resultados em profundidade, analisando limitações, desafios e implicações práticas dos achados.

O *Capítulo 7* apresenta as conclusões do trabalho e sugestões para trabalhos futuros.

= Fundamentação Teórica

Este capítulo apresenta os conceitos fundamentais necessários para a compreensão deste trabalho, abordando tópicos de aprendizado de máquina, redes neurais profundas, processamento de imagens e aplicações em medicina.

== Aprendizado de Máquina

Aprendizado de máquina (Machine Learning) é um subcampo da inteligência artificial que se concentra no desenvolvimento de algoritmos capazes de aprender padrões a partir de dados, sem serem explicitamente programados para cada tarefa específica.

Como afirmam #cite(label("mitchell1997machine"), form: "prose"), "um programa de computador aprende a partir da experiência E em relação a alguma classe de tarefas T e medida de desempenho P, se seu desempenho em T, medido por P, melhora com a experiência E".

Este é um exemplo de *citação direta curta* (até 3 linhas), delimitada por aspas duplas e incluindo autor, ano e página (quando disponível).

=== Aprendizado Supervisionado

No aprendizado supervisionado, o algoritmo aprende a partir de um conjunto de dados de treinamento que contém pares de entrada-saída $(x_i, y_i)$. O objetivo é aprender uma função $f: X arrow.r Y$ que mapeia entradas para saídas, minimizando um erro de predição.

#quote(block: true)[
  O aprendizado supervisionado tem sido aplicado com sucesso em diversas áreas, incluindo reconhecimento de fala, visão computacional, processamento de linguagem natural e diagnóstico médico. A capacidade desses algoritmos de generalizar a partir de exemplos os torna particularmente úteis quando regras explícitas são difíceis de formular.
]

A função de perda (loss function) mede o quão bem o modelo está performando#footnote[A escolha da função de perda depende da natureza do problema e pode afetar significativamente o desempenho final do modelo. Esta é uma nota de rodapé explicativa, formatada em fonte 10 com espaçamento simples.]. Para problemas de classificação, uma função de perda comum é a entropia cruzada (cross-entropy):

$ L(theta) = -1/N sum_(i=1)^N sum_(c=1)^C y_(i c) log(hat(y)_(i c)) $

onde $N$ é o número de exemplos, $C$ é o número de classes, $y_(i c)$ é o rótulo verdadeiro e $hat(y)_(i c)$ é a predição do modelo.

== Redes Neurais Artificiais

Redes neurais artificiais são modelos computacionais inspirados no funcionamento do cérebro humano. Uma rede neural é composta por camadas de neurônios artificiais conectados.

Segundo estudos recentes, "redes neurais profundas são capazes de aprender representações hierárquicas de dados, onde cada camada aprende características de complexidade crescente" @litjens2017survey.

A arquitetura de redes neurais profundas evoluiu significativamente desde o trabalho pioneiro de #apud(label("rosenblatt1958perceptron"), label("goodfellow2016deep")), que introduziu o conceito de perceptron#footnote[O perceptron de Rosenblatt foi um dos primeiros modelos de rede neural, embora limitado a problemas linearmente separáveis. Este é um exemplo de citação de citação (apud) com nota de rodapé adicional.].

As redes neurais convolucionais representam um avanço importante na área de visão computacional, permitindo o processamento eficiente de dados estruturados em grade @lecun1998gradient. Este é um exemplo de *citação indireta* (paráfrase), onde o conteúdo é baseado na obra mas escrito com palavras próprias.

=== Perceptron e Redes Feedforward

O perceptron é a unidade básica de uma rede neural. A saída de um neurônio é calculada como:

$ a = sigma(sum_(i=1)^n w_i x_i + b) $ <eq:perceptron>

onde $w_i$ são os pesos, $x_i$ são as entradas, $b$ é o bias e $sigma$ é a função de ativação.

A @eq:perceptron representa a operação fundamental de um neurônio artificial. Este é um exemplo de *equação numerada* que pode ser referenciada no texto.

Diversos estudos @lecun1998gradient @krizhevsky2012imagenet @he2016deep demonstraram a eficácia de redes neurais profundas. Este é um exemplo de *múltiplas citações simultâneas* em ordem alfabética, separadas por ponto e vírgula.

=== Funções de Ativação

Várias funções de ativação são utilizadas em redes neurais:

*ReLU (Rectified Linear Unit):*
$ sigma(x) = max(0, x) $

*Sigmoid:*
$ sigma(x) = 1 / (1 + e^(-x)) $

*Tanh:*
$ sigma(x) = (e^x - e^(-x)) / (e^x + e^(-x)) $

== Redes Neurais Convolucionais

Redes neurais convolucionais (CNNs) são especializadas para processar dados com estrutura de grade, como imagens. Elas consistem de três tipos principais de camadas:

=== Camada Convolucional

A operação de convolução aplica filtros (kernels) à entrada para extrair características locais:

$ y[i, j] = sum_(m) sum_(n) x[i+m, j+n] dot w[m, n] $

=== Camada de Pooling

Reduz a dimensionalidade espacial, mantendo as características mais importantes. O max pooling é definido como:

$ y[i, j] = max_(m,n in R) x[i+m, j+n] $

onde $R$ é a região de pooling.

=== Arquiteturas Modernas

Diversas arquiteturas modernas têm sido propostas, cada uma com suas características específicas:

==== ResNet (Residual Networks)

As redes residuais introduzem conexões residuais (skip connections) para facilitar o treinamento de redes muito profundas. A ideia principal é permitir que gradientes fluam diretamente através da rede.

===== Blocos Residuais Básicos

O bloco residual básico consiste em duas camadas convolucionais com uma conexão de atalho que adiciona a entrada diretamente à saída.

==== DenseNet (Densely Connected Networks)

DenseNet conecta cada camada a todas as camadas subsequentes, promovendo reutilização de características e reduzindo o número de parâmetros.

==== EfficientNet

Utiliza compound scaling para balancear profundidade, largura e resolução da rede de forma uniforme#footnote[O compound scaling é mais eficiente do que escalar apenas uma dimensão por vez.].

Segundo #cite(label("tan2019efficientnet"), form: "prose", supplement: "p. 6731, tradução nossa"), "o escalonamento composto é mais eficiente porque balanceia todas as dimensões da rede de maneira uniforme"#footnote[No original: "_compound scaling is more efficient because it balances all dimensions of the network in a uniform way_". Este é um exemplo de citação com *tradução nossa* em nota de rodapé.].

Durante entrevista com especialista em radiologia#footnote[Informação fornecida pelo Dr. João Silva em entrevista realizada em São Paulo, em 15 de março de 2024.], foi mencionado que a integração de sistemas de IA no fluxo de trabalho clínico requer adaptações significativas (informação verbal). Este é um exemplo de *informação verbal* com especificação da fonte em nota de rodapé.

== Processamento de Imagens Médicas

Imagens médicas apresentam características únicas que requerem técnicas especializadas de processamento.

=== Modalidades de Imagem

*Radiografia (Raios-X):* Utiliza radiação ionizante para criar imagens de estruturas internas.

*Tomografia Computadorizada (CT):* Combina múltiplas imagens de raios-X para criar cortes transversais.

*Ressonância Magnética (MRI):* Utiliza campos magnéticos e ondas de rádio para gerar imagens detalhadas.

=== Pré-processamento

Técnicas comuns de pré-processamento incluem:

- Normalização de intensidade
- Remoção de ruído
- Ajuste de contraste
- Segmentação de regiões de interesse
- Registro de imagens

#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (left, center, center, left),
    table.header([*Modalidade*], [*Resolução*], [*Tempo*], [*Aplicação Principal*]),
    [Raio-X], [Alta], [< 1 min], [Fraturas, pneumonia],
    [CT], [Muito Alta], [5-30 min], [Tumores, hemorragias],
    [MRI], [Muito Alta], [30-90 min], [Tecidos moles, cérebro],
    [Ultrassom], [Média], [< 5 min], [Feto, órgãos internos],
  ),
  caption: [Comparação entre diferentes modalidades de imagem médica.],
) <tab:modalidades>

= Trabalhos Relacionados

Este capítulo apresenta uma revisão da literatura sobre aplicações de deep learning em classificação de imagens médicas, destacando os principais trabalhos, metodologias empregadas e resultados obtidos.

== Classificação de Imagens Médicas com Deep Learning

Nos últimos anos, houve um crescimento exponencial de publicações sobre o uso de deep learning em imagens médicas. Esta seção organiza os trabalhos relevantes por tipo de aplicação e modalidade de imagem.

=== Detecção de Pneumonia em Radiografias

#cite(label("rajpurkar2017chexnet"), form: "prose") desenvolveram o CheXNet, uma rede neural baseada em DenseNet-121 capaz de detectar pneumonia em radiografias torácicas com desempenho comparável ou superior a radiologistas humanos. O modelo foi treinado em mais de 100.000 imagens do dataset ChestX-ray14.

=== Classificação de Lesões de Pele

#cite(label("esteva2019guide"), form: "prose") demonstraram que uma CNN treinada em 129.450 imagens clínicas pode classificar lesões de pele com acurácia comparável a dermatologistas certificados. O modelo utilizou transfer learning a partir da arquitetura Inception-v3.

=== Diagnóstico de Retinopatia Diabética

#cite(label("gulshan2016development"), form: "prose") desenvolveram um sistema de deep learning para detecção de retinopatia diabética em imagens de retina, alcançando sensibilidade de 97.5% e especificidade de 93.4%, superando oftalmologistas em alguns casos.

== Técnicas de Aumento de Dados

Data augmentation é crucial para evitar overfitting quando há poucos dados de treinamento disponíveis. As técnicas mais comuns incluem:

- Rotação e translação
- Espelhamento horizontal/vertical
- Ajustes de brilho e contraste
- Zoom e recorte aleatório
- Adição de ruído gaussiano

#figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    align: (left, left, center, center, left),
    table.header([*Estudo*], [*Arquitetura*], [*Dataset*], [*Acurácia*], [*Ano*]),
    [#cite(label("rajpurkar2017chexnet"), form: "author")], [DenseNet-121], [ChestX-ray14], [92.1%], [2017],
    [#cite(label("esteva2019guide"), form: "author")], [Inception-v3], [Skin Lesions], [91.0%], [2017],
    [#cite(label("gulshan2016development"), form: "author")], [Inception-v4], [EyePACS], [97.5%], [2016],
    [#cite(label("wang2017chestx"), form: "author")], [ResNet-50], [ChestX-ray], [88.4%], [2018],
    [#cite(label("litjens2017survey"), form: "author")], [U-Net], [CAMELYON16], [92.5%], [2016],
  ),
  caption: [Principais trabalhos sobre deep learning em imagens médicas.],
) <tab:trabalhos-relacionados>

== Interpretabilidade de Modelos

A interpretabilidade é crucial em aplicações médicas. Técnicas como Grad-CAM (Gradient-weighted Class Activation Mapping) permitem visualizar quais regiões da imagem foram mais importantes para a decisão do modelo.

#figure(
  rect(width: 80%, height: 8cm, fill: rgb("#f0f0f0"))[
    #align(center + horizon)[
      #text(size: 14pt, fill: gray)[
        [Figura: Exemplo de visualização Grad-CAM]
      ]
    ]
  ],
  caption: [Exemplo de mapa de atenção gerado por Grad-CAM em uma radiografia torácica, destacando regiões relevantes para o diagnóstico.],
) <fig:gradcam>

= Metodologia

Este capítulo descreve detalhadamente a metodologia empregada neste trabalho, incluindo as bases de dados utilizadas, as arquiteturas de redes neurais implementadas, técnicas de treinamento e métricas de avaliação.

== Visão Geral

A metodologia adotada segue as seguintes etapas:

+ Coleta e preparação dos dados
+ Implementação das arquiteturas de rede neural
+ Treinamento e validação dos modelos
+ Avaliação de desempenho
+ Análise de interpretabilidade
+ Validação clínica

== Bases de Dados

Foram utilizadas três bases de dados públicas de imagens médicas:

=== ChestX-ray14

Dataset contendo 112.120 radiografias torácicas frontais de 30.805 pacientes únicos, com 14 classes de patologias anotadas.

*Características:*
- Resolução: 1024 × 1024 pixels
- Formato: PNG
- Anotações: Múltiplas classes por imagem

=== RSNA Pneumonia Detection

Dataset com 30.000 imagens de radiografias torácicas com anotações de pneumonia.

*Características:*
- Resolução: variável (redimensionada para 512 × 512)
- Formato: DICOM
- Anotações: Bounding boxes e classificação binária

=== Brain MRI Dataset

Dataset com 3.000 imagens de ressonância magnética cerebral para detecção de tumores.

*Características:*
- Resolução: 256 × 256 pixels
- Formato: JPEG
- Classes: Tumor / Sem tumor

== Pré-processamento

As seguintes etapas de pré-processamento foram aplicadas:

+ *Redimensionamento:* Todas as imagens foram redimensionadas para 224 × 224 pixels para compatibilidade com as arquiteturas pré-treinadas.

+ *Normalização:* Os valores de pixel foram normalizados para o intervalo [0, 1] e padronizados usando média e desvio padrão do ImageNet.

+ *Balanceamento de classes:* Técnicas de oversampling e undersampling foram aplicadas para lidar com desbalanceamento.

== Arquiteturas Implementadas

Foram implementadas e avaliadas três arquiteturas principais:

=== ResNet-50

ResNet (Residual Network) introduz conexões residuais que facilitam o treinamento de redes profundas:

$ y = F(x, {W_i}) + x $

onde $F(x, {W_i})$ representa o mapeamento residual.

=== DenseNet-121

DenseNet conecta cada camada a todas as camadas subsequentes:

$ x_l = H_l([x_0, x_1, ..., x_(l-1)]) $

onde $[x_0, x_1, ..., x_(l-1)]$ representa a concatenação das saídas de camadas anteriores.

=== EfficientNet-B3

EfficientNet utiliza compound scaling para escalar largura, profundidade e resolução uniformemente.

== Treinamento

=== Hiperparâmetros

Os principais hiperparâmetros utilizados foram:

- Taxa de aprendizado inicial: $alpha = 0.001$
- Otimizador: Adam
- Tamanho do batch: 32
- Número de épocas: 100
- Early stopping: paciência de 10 épocas

=== Transfer Learning

Todos os modelos foram inicializados com pesos pré-treinados no ImageNet e fine-tuned para a tarefa específica.

=== Data Augmentation

Durante o treinamento, as seguintes transformações foram aplicadas:

- Rotação aleatória: ± 15°
- Espelhamento horizontal: 50%
- Ajuste de brilho: ± 20%
- Ajuste de contraste: ± 20%

== Métricas de Avaliação

As seguintes métricas foram utilizadas para avaliar o desempenho dos modelos:

=== Acurácia

$ "Acurácia" = (T P + T N) / (T P + T N + F P + F N) $

=== Sensibilidade (Recall)

$ "Sensibilidade" = T P / (T P + F N) $

=== Especificidade

$ "Especificidade" = T N / (T N + F P) $

=== Precisão

$ "Precisão" = T P / (T P + F P) $

=== F1-Score

$ F_1 = 2 dot (("Precisão" dot "Sensibilidade") / ("Precisão" + "Sensibilidade")) $

=== Curva ROC e AUC

A área sob a curva ROC (AUC) fornece uma medida agregada de desempenho em todos os possíveis thresholds de classificação.

== Validação Cruzada

Foi utilizada validação cruzada estratificada k-fold com k = 5 para garantir resultados robustos e evitar overfitting.

== Ambiente Computacional

Todos os experimentos foram executados no seguinte ambiente:

- *Hardware:* NVIDIA Tesla V100 (32GB), Intel Xeon Gold 6248R (48 cores), 256GB RAM
- *Software:* Python 3.9, PyTorch 1.12, CUDA 11.6
- *Sistema Operacional:* Ubuntu 20.04 LTS

A @tab:comparacao-gpus apresenta uma comparação entre diferentes GPUs utilizadas em experimentos preliminares.

#figure(
  tabela-abnt(
    (auto, auto, auto, auto),
    (left, center, center, center),
    ([*GPU*], [*Memória*], [*Tempo/Época*], [*Custo*]),
    [NVIDIA Tesla V100],
    [32 GB],
    [8.2 min],
    [\$ 2.50/h],
    [NVIDIA RTX 3090],
    [24 GB],
    [10.5 min],
    [\$ 1.20/h],
    [NVIDIA A100],
    [40 GB],
    [6.8 min],
    [\$ 4.10/h],
  ),
  caption: [Comparação de GPUs para treinamento de modelos. Tabela formatada conforme normas ABNT/IBGE (bordas laterais abertas).],
) <tab:comparacao-gpus>

= Resultados

Este capítulo apresenta os resultados obtidos nos experimentos realizados, incluindo análises comparativas de desempenho entre as diferentes arquiteturas avaliadas.

== Desempenho dos Modelos

A @tab:resultados-gerais apresenta um resumo dos resultados obtidos pelos três modelos avaliados.

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto),
    align: (left, center, center, center, center, center),
    table.header([*Modelo*], [*Acurácia*], [*Precisão*], [*Sensibilidade*], [*Especificidade*], [*AUC*]),
    [ResNet-50], [93.2 ± 1.8%], [92.1%], [91.5%], [94.8%], [0.967],
    [DenseNet-121], [94.8 ± 1.5%], [93.7%], [93.2%], [95.9%], [0.978],
    [EfficientNet-B3], [*95.6 ± 1.3%*], [*94.9%*], [*94.3%*], [*96.5%*], [*0.984*],
  ),
  caption: [Desempenho comparativo dos modelos no dataset de teste. Os valores em negrito indicam os melhores resultados.],
) <tab:resultados-gerais>

== Análise por Dataset

=== ChestX-ray14

No dataset ChestX-ray14, o EfficientNet-B3 obteve o melhor desempenho geral, alcançando acurácia de 95.6%.

#figure(
  rect(width: 80%, height: 10cm, fill: rgb("#f0f0f0"))[
    #align(center + horizon)[
      #text(size: 14pt, fill: gray)[
        [Gráfico: Comparação de acurácia por modelo]
      ]
    ]
  ],
  caption: [Comparação de acurácia dos três modelos no dataset ChestX-ray14. As barras de erro representam o desvio padrão da validação cruzada 5-fold.],
) <fig:resultados-chestxray>

=== RSNA Pneumonia

Para detecção de pneumonia, todos os modelos apresentaram desempenho excepcional, com sensibilidade acima de 93%.

== Curvas ROC

A @fig:roc-curves apresenta as curvas ROC para os três modelos avaliados.

#figure(
  rect(width: 80%, height: 10cm, fill: rgb("#f0f0f0"))[
    #align(center + horizon)[
      #text(size: 14pt, fill: gray)[
        [Gráfico: Curvas ROC dos modelos]
      ]
    ]
  ],
  caption: [Curvas ROC para ResNet-50 (azul), DenseNet-121 (verde) e EfficientNet-B3 (vermelho). EfficientNet-B3 apresentou a maior AUC (0.984).],
) <fig:roc-curves>

== Matriz de Confusão

A @fig:confusion apresenta a matriz de confusão para o modelo EfficientNet-B3.

#figure(
  rect(width: 60%, height: 10cm, fill: rgb("#f0f0f0"))[
    #align(center + horizon)[
      #text(size: 14pt, fill: gray)[
        [Matriz de Confusão: EfficientNet-B3]
      ]
    ]
  ],
  caption: [Matriz de confusão normalizada para o modelo EfficientNet-B3 no dataset de teste.],
) <fig:confusion>

== Tempo de Treinamento e Inferência

A @tab:tempo apresenta os tempos de treinamento e inferência dos modelos.

#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (left, center, center, center),
    table.header([*Modelo*], [*Parâmetros*], [*Tempo Treino*], [*Tempo Inferência*]),
    [ResNet-50], [25.6M], [8.2h], [12ms],
    [DenseNet-121], [8.0M], [10.5h], [15ms],
    [EfficientNet-B3], [12.2M], [15.8h], [18ms],
  ),
  caption: [Comparação de complexidade computacional dos modelos. Tempo de treinamento para 100 épocas; tempo de inferência por imagem.],
) <tab:tempo>

== Análise de Interpretabilidade

Utilizando Grad-CAM, foram gerados mapas de atenção para visualizar quais regiões das imagens foram mais relevantes para as decisões dos modelos.

#figure(
  rect(width: 100%, height: 12cm, fill: rgb("#f0f0f0"))[
    #align(center + horizon)[
      #text(size: 14pt, fill: gray)[
        [Figura: Exemplos de visualizações Grad-CAM]
      ]
    ]
  ],
  caption: [Exemplos de mapas de atenção Grad-CAM. (a) Imagem original, (b) Mapa de calor, (c) Sobreposição. As regiões em vermelho indicam maior relevância para a decisão do modelo.],
) <fig:gradcam-exemplos>

== Ensemble de Modelos

Um ensemble combinando os três modelos foi criado usando votação ponderada:

$ y_"ensemble" = 0.4 dot y_"EfficientNet" + 0.35 dot y_"DenseNet" + 0.25 dot y_"ResNet" $

O ensemble alcançou acurácia de 96.3%, superando os modelos individuais.

#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (left, center, center, center),
    table.header([*Abordagem*], [*Acurácia*], [*Sensibilidade*], [*AUC*]),
    [EfficientNet-B3], [95.6%], [94.3%], [0.984],
    [Ensemble], [*96.3%*], [*95.1%*], [*0.988*],
    [Ganho], [+0.7%], [+0.8%], [+0.004],
  ),
  caption: [Comparação entre o melhor modelo individual e o ensemble.],
) <tab:ensemble>

= Discussão

Este capítulo apresenta uma análise crítica dos resultados obtidos, discutindo suas implicações, limitações e contribuições para o estado da arte.

== Análise dos Resultados

Os resultados demonstraram que as arquiteturas modernas de deep learning, especialmente o EfficientNet-B3, são altamente eficazes para classificação de imagens médicas. A acurácia de 95.6% obtida supera diversos trabalhos anteriores da literatura.

=== Comparação com Trabalhos Relacionados

Comparando nossos resultados com estudos similares:

- *CheXNet* @rajpurkar2017chexnet: 92.1% de acurácia
- *Nosso EfficientNet-B3*: 95.6% de acurácia

A melhoria pode ser atribuída a:
+ Uso de arquitetura mais moderna (EfficientNet vs. DenseNet-121)
+ Técnicas avançadas de data augmentation
+ Maior quantidade de dados de treinamento
+ Fine-tuning mais cuidadoso dos hiperparâmetros

=== Interpretabilidade

A análise dos mapas Grad-CAM revelou que os modelos aprenderam a focar em regiões anatomicamente relevantes. Em casos de pneumonia, por exemplo, o modelo concentrou atenção nos campos pulmonares, consistente com o conhecimento médico.

== Impacto Clínico

Os resultados sugerem que sistemas baseados em deep learning podem servir como ferramentas valiosas de apoio ao diagnóstico:

*Como segunda opinião:* Auxiliando médicos na detecção de casos difíceis ou sutis.

*Triagem automática:* Priorizando casos urgentes em ambientes com grande volume de exames.

*Educação médica:* Servindo como ferramenta de treinamento para estudantes e residentes.

== Limitações

Algumas limitações deste trabalho devem ser reconhecidas:

=== Limitações Técnicas

+ *Generalização:* Os modelos foram treinados em datasets específicos e podem não generalizar bem para imagens de diferentes instituições ou equipamentos.

+ *Desbalanceamento:* Algumas classes de patologias eram raras nos datasets, potencialmente afetando o desempenho.

+ *Qualidade das anotações:* A qualidade dos rótulos depende da expertise dos anotadores originais.

=== Limitações Práticas

+ *Integração clínica:* Questões regulatórias e de infraestrutura dificultam a implementação em ambientes clínicos reais.

+ *Explicabilidade:* Apesar do Grad-CAM, a explicabilidade completa dos modelos ainda é um desafio.

+ *Viés nos dados:* Os datasets podem conter vieses relacionados a idade, sexo, etnia ou outras características demográficas.

== Considerações Éticas

O uso de IA em medicina levanta importantes questões éticas:

*Privacidade:* Garantir a proteção de dados sensíveis dos pacientes.

*Responsabilidade:* Definir claramente a responsabilidade em caso de erros diagnósticos.

*Equidade:* Assegurar que os sistemas não ampliem disparidades no acesso à saúde.

*Transparência:* Fornecer explicações compreensíveis das decisões do sistema.

== Contribuições

As principais contribuições deste trabalho incluem:

+ *Análise comparativa abrangente* de arquiteturas modernas de deep learning.

+ *Framework open-source* disponibilizado publicamente para facilitar reprodutibilidade.

+ *Técnicas de ensemble* que melhoram significativamente o desempenho.

+ *Análise de interpretabilidade* usando Grad-CAM para aumentar confiança clínica.

+ *Validação com especialistas* confirmando a relevância clínica dos resultados.

= Exemplos de Aplicação das Normas UFSM

Este capítulo tem como objetivo demonstrar a aplicação das normas de citações e referências da UFSM (adaptadas da ABNT) utilizando diversos tipos de documentos.

== Citações no Texto

As citações podem ser diretas (transcrição textual) ou indiretas (paráfrase).

=== Citação Indireta (Paráfrase)

Na citação indireta, o autor escreve a ideia com suas próprias palavras.

*Exemplo com um autor:*
Segundo #cite(label("silva2023tese"), form: "prose"), as arquiteturas de segmentação semântica evoluíram significativamente...
Ou: As arquiteturas evoluíram significativamente @silva2023tese.

*Exemplo com dois autores:*
#cite(label("souza2022classificacao"), form: "prose") destacam a importância do pré-processamento...
Ou: O pré-processamento é fundamental @souza2022classificacao.

*Exemplo com três autores:*
#cite(label("kotsiantis2007supervised"), form: "prose") revisaram técnicas de classificação...
Ou: As técnicas de classificação foram revisadas @kotsiantis2007supervised.

*Exemplo com mais de três autores (et al.):*
#cite(label("esteva2019guide"), form: "prose") apresentam um guia sobre deep learning...
Ou: O guia sobre deep learning destaca aplicações clínicas @esteva2019guide.

=== Citação Direta Curta (até 3 linhas)

Deve ser inserida no texto entre aspas duplas.

Conforme a #cite(label("who2021ethics"), form: "prose"), "a inteligência artificial tem um enorme potencial para fortalecer a prestação de serviços de saúde".

=== Citação Direta Longa (mais de 3 linhas)

Deve ser destacada com recuo de 4 cm, fonte menor e sem aspas.

#quote(block: true)[
  A Lei Geral de Proteção de Dados Pessoais (LGPD) dispõe sobre o tratamento de dados pessoais, inclusive nos meios digitais, por pessoa natural ou por pessoa jurídica de direito público ou privado, com o objetivo de proteger os direitos fundamentais de liberdade e de privacidade e o livre desenvolvimento da personalidade da pessoa natural @brasil2018lgpd.
]

== Exemplos por Tipo de Documento

Abaixo são apresentados exemplos de como diferentes tipos de documentos são citados e referenciados.

=== Livros e Teses

Livros clássicos como o de #cite(label("mitchell1997machine"), form: "prose") e teses recentes como a de #cite(label("silva2023tese"), form: "prose") são fundamentais.

=== Artigos de Periódicos e Jornais

Artigos científicos @shen2017deep e notícias de jornal @folha2023ia trazem perspectivas diferentes.

=== Documentos Legais e Patentes

A legislação brasileira @brasil2018lgpd e patentes de invenção @pereira2021sistema protegem a propriedade intelectual e os dados.

=== Documentos Online e Relatórios Técnicos

Sites institucionais @ufsm2024site e relatórios de organizações internacionais @who2021ethics fornecem dados atualizados.

=== Eventos

Trabalhos apresentados em congressos @souza2022classificacao são importantes fontes de pesquisa em andamento.

= Conclusões e Trabalhos Futuros

Este capítulo apresenta as conclusões do trabalho, resumindo os principais achados, contribuições e direções para pesquisas futuras.

== Conclusões

Este trabalho investigou a aplicação de técnicas de aprendizado profundo para classificação automática de imagens médicas, com foco em radiografias torácicas e imagens de ressonância magnética. Os principais resultados e conclusões são:

+ *Eficácia do Deep Learning:* As arquiteturas modernas de CNNs demonstraram excelente desempenho na classificação de patologias em imagens médicas, com acurácia superior a 95%.

+ *Superioridade do EfficientNet:* Entre as arquiteturas avaliadas, o EfficientNet-B3 apresentou os melhores resultados, equilibrando desempenho e eficiência computacional.

+ *Benefício do Ensemble:* A combinação de múltiplos modelos através de ensemble melhorou ainda mais o desempenho, alcançando 96.3% de acurácia.

+ *Interpretabilidade:* A implementação do Grad-CAM permitiu visualizar as regiões de atenção dos modelos, aumentando a confiança e explicabilidade das predições.

+ *Viabilidade Clínica:* Os resultados sugerem que sistemas de IA podem ser ferramentas valiosas de apoio ao diagnóstico médico, potencialmente reduzindo erros e aumentando a eficiência.

== Resposta aos Objetivos

Revisitando os objetivos propostos:

✓ *Objetivo 1:* Revisão sistemática da literatura realizada e apresentada no Capítulo 3.

✓ *Objetivo 2:* Três datasets públicos foram coletados, organizados e pré-processados.

✓ *Objetivo 3:* Implementação bem-sucedida de ResNet-50, DenseNet-121 e EfficientNet-B3.

✓ *Objetivo 4:* Avaliação comparativa detalhada usando múltiplas métricas.

✓ *Objetivo 5:* Técnicas de ensemble desenvolvidas e avaliadas.

✓ *Objetivo 6:* Implementação do Grad-CAM para interpretabilidade.

✓ *Objetivo 7:* Colaboração com especialistas para validação dos resultados.

✓ *Objetivo 8:* Framework disponibilizado como código aberto.

== Contribuições Científicas

As principais contribuições científicas deste trabalho incluem:

+ *Metodológica:* Proposta de pipeline completo para classificação de imagens médicas.

+ *Técnica:* Estratégias eficazes de data augmentation e transfer learning.

+ *Prática:* Framework open-source facilitando reprodutibilidade.

+ *Clínica:* Validação dos resultados em colaboração com médicos.

== Trabalhos Futuros

Diversas direções promissoras emergem deste trabalho:

=== Curto Prazo

Os seguintes trabalhos podem ser desenvolvidos a curto prazo:

a) *Validação Prospectiva:* Realizar estudos prospectivos em ambiente clínico real para avaliar o desempenho dos modelos em condições reais de uso;

b) *Expansão de Datasets:* Incluir dados de múltiplas instituições para melhorar a capacidade de generalização dos modelos;

c) *Otimização de Modelos:* Explorar técnicas avançadas de compressão e quantização, incluindo:
- Quantização de pesos para INT8;
- Pruning de neurônios redundantes;
- Knowledge distillation para modelos menores;

d) *Interface de Usuário:* Desenvolver uma interface web intuitiva para facilitar o uso por profissionais de saúde.

=== Médio Prazo

+ *Detecção Multi-Label:* Desenvolver modelos capazes de detectar múltiplas patologias simultaneamente.

+ *Segmentação:* Implementar modelos de segmentação para localização precisa de lesões.

+ *Análise Temporal:* Incorporar informações de exames anteriores para análise longitudinal.

=== Longo Prazo

+ *Modelos Multimodais:* Integrar imagens com dados clínicos, laboratoriais e genômicos.

+ *Aprendizado Federado:* Implementar técnicas de federated learning para treinar modelos preservando privacidade.

+ *IA Explicável:* Desenvolver métodos mais sofisticados de explicabilidade além do Grad-CAM.

+ *Sistemas de Apoio à Decisão:* Criar sistemas completos que não apenas classificam, mas sugerem tratamentos.

== Considerações Finais

Este trabalho demonstrou o potencial transformador do aprendizado profundo na medicina diagnóstica. Embora desafios técnicos, éticos e regulatórios permaneçam, os resultados obtidos são encorajadores e sugerem que a inteligência artificial será cada vez mais integrada à prática clínica nos próximos anos.

A democratização dessas tecnologias pode contribuir significativamente para reduzir disparidades no acesso a cuidados de saúde de qualidade, especialmente em regiões carentes de especialistas.

O futuro da medicina diagnóstica provavelmente não será caracterizado pela substituição de médicos por máquinas, mas sim pela colaboração sinérgica entre inteligência humana e artificial, combinando o melhor de ambos os mundos.

// ============================================================================
// GLOSSÁRIO (Elemento pós-textual opcional)
// ============================================================================

#glossario((
  (
    termo: "Acurácia",
    definicao: "Métrica que mede a proporção de predições corretas em relação ao total de predições realizadas.",
  ),
  (
    termo: "Backpropagation",
    definicao: "Algoritmo para calcular o gradiente da função de perda em relação aos pesos da rede neural, usado no treinamento.",
  ),
  (
    termo: "Ensemble",
    definicao: "Técnica que combina múltiplos modelos de aprendizado de máquina para melhorar o desempenho e robustez das predições.",
  ),
  (
    termo: "Overfitting",
    definicao: "Fenômeno que ocorre quando um modelo aprende padrões específicos dos dados de treinamento que não generalizam para novos dados.",
  ),
  (
    termo: "Transfer Learning",
    definicao: "Técnica que utiliza conhecimento adquirido em uma tarefa para melhorar o aprendizado em outra tarefa relacionada.",
  ),
))

// ============================================================================
// APÊNDICES (Elementos pós-textuais opcionais)
// ============================================================================

#apendice("A", "Detalhes de Implementação")[

  Este apêndice apresenta detalhes adicionais sobre a implementação dos modelos desenvolvidos neste trabalho.

  === Código de Treinamento

  ```python
  import torch
  import torch.nn as nn
  from torchvision import models, transforms

  # Carregar modelo pré-treinado
  model = models.efficientnet_b3(pretrained=True)

  # Modificar camada final
  num_classes = 14
  model.classifier[1] = nn.Linear(
      model.classifier[1].in_features,
      num_classes
  )

  # Definir loss e otimizador
  criterion = nn.BCEWithLogitsLoss()
  optimizer = torch.optim.Adam(
      model.parameters(),
      lr=0.001
  )
  ```

  === Hiperparâmetros Detalhados

  A @tab:hiperparametros-detalhados apresenta os hiperparâmetros utilizados no treinamento dos modelos.

  #figure(
    table(
      columns: (auto, auto, auto),
      align: (left, center, left),
      table.header([*Parâmetro*], [*Valor*], [*Descrição*]),
      [Learning rate], [0.001], [Taxa inicial],
      [Batch size], [32], [Tamanho do lote],
      [Épocas], [100], [Máximo de iterações],
      [Weight decay], [1e-4], [Regularização L2],
      [Dropout], [0.3], [Taxa de dropout],
    ),
    caption: [Hiperparâmetros utilizados no treinamento.],
  ) <tab:hiperparametros-detalhados>

]

#apendice("B", "Resultados Adicionais")[

  Este apêndice apresenta resultados complementares aos apresentados no Capítulo 5.

  === Análise por Patologia

  A @tab:analise-patologia apresenta o desempenho detalhado do modelo EfficientNet-B3 para cada tipo de patologia.

  #figure(
    table(
      columns: (auto, auto, auto, auto),
      align: (left, center, center, center),
      table.header([*Patologia*], [*Sensibilidade*], [*Especificidade*], [*F1-Score*]),
      [Pneumonia], [96.2%], [97.1%], [0.965],
      [Atelectasia], [93.5%], [95.8%], [0.947],
      [Cardiomegalia], [94.8%], [96.3%], [0.955],
      [Derrame pleural], [95.1%], [96.9%], [0.960],
      [Infiltração], [92.7%], [94.5%], [0.937],
    ),
    caption: [Desempenho do EfficientNet-B3 por tipo de patologia.],
  ) <tab:analise-patologia>

]

#apendice("C", "Questionário de Validação Clínica")[

  Este apêndice apresenta o questionário utilizado para validação com médicos especialistas.

  === Formulário de Avaliação

  *Avaliação de Sistema de IA para Diagnóstico*

  Os seguintes critérios foram avaliados pelos especialistas:

  1. Você concorda que as regiões destacadas pelo modelo são clinicamente relevantes?
    - \[ \] Concordo totalmente
    - \[ \] Concordo parcialmente
    - \[ \] Discordo

  2. Você utilizaria este sistema como ferramenta de apoio ao diagnóstico?
    - \[ \] Sim, certamente
    - \[ \] Talvez, com reservas
    - \[ \] Não

  3. O sistema demonstra precisão adequada para uso clínico?
    - \[ \] Sim
    - \[ \] Parcialmente
    - \[ \] Não

  4. Comentários adicionais: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

]

// ============================================================================
// ANEXOS (Elementos pós-textuais opcionais)
// ============================================================================

#anexo("A", "Aprovação do Comitê de Ética")[

  Este anexo contém o documento de aprovação do Comitê de Ética em Pesquisa da UFSM.

  #v(2cm)

  #align(center)[
    #text(weight: "bold")[PARECER CONSUBSTANCIADO DO CEP]
  ]

  #v(1cm)

  *Número do Parecer:* 12345678

  *Data da Relatoria:* 15/03/2024

  *Apresentação do Projeto:*

  O projeto "Aplicação de Técnicas de Aprendizado Profundo para Classificação de Imagens Médicas" foi aprovado pelo Comitê de Ética em Pesquisa da Universidade Federal de Santa Maria.

  *Conclusões ou Pendências:*

  O projeto foi aprovado sem pendências.

]

#anexo("B", "Termo de Consentimento Livre e Esclarecido")[

  Este anexo apresenta o modelo do Termo de Consentimento Livre e Esclarecido (TCLE) utilizado na pesquisa.

  #v(1cm)

  #align(center)[
    #text(weight: "bold")[TERMO DE CONSENTIMENTO LIVRE E ESCLARECIDO]
  ]

  #v(1cm)

  Você está sendo convidado(a) a participar da pesquisa "Aplicação de Técnicas de Aprendizado Profundo para Classificação de Imagens Médicas", sob responsabilidade do pesquisador Nome Completo do Autor.

  *Objetivo da Pesquisa:*

  Esta pesquisa tem como objetivo desenvolver e avaliar modelos computacionais para auxiliar no diagnóstico de patologias através de análise de imagens médicas.

  *Procedimentos:*

  Sua participação consistirá em avaliar os resultados gerados pelo sistema computacional e fornecer feedback sobre sua relevância clínica.

  *Riscos e Benefícios:*

  Os riscos desta pesquisa são mínimos, relacionados ao tempo dedicado à avaliação. Os benefícios incluem contribuir para o avanço de tecnologias que podem auxiliar no diagnóstico médico.

  *Confidencialidade:*

  Todas as informações coletadas serão mantidas em sigilo e utilizadas apenas para fins de pesquisa.

]

