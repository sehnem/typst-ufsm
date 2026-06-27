#import "/src/lib.typ": apud, fonte

= Fundamentação Teórica

Este capítulo apresenta os conceitos fundamentais necessários para a compreensão deste trabalho, abordando aprendizado de máquina, redes neurais profundas, processamento de imagens médicas e as arquiteturas relevantes para a tarefa de classificação estudada.

== Aprendizado de Máquina

Aprendizado de máquina (_Machine Learning_) é um subcampo da inteligência artificial que se concentra no desenvolvimento de algoritmos capazes de aprender padrões a partir de dados, sem serem explicitamente programados para cada tarefa específica. Como afirmam #cite(label("mitchell1997machine"), form: "prose"), "um programa de computador aprende a partir da experiência E em relação a alguma classe de tarefas T e medida de desempenho P, se seu desempenho em T, medido por P, melhora com a experiência E".

No paradigma de *aprendizado supervisionado*, o algoritmo recebe um conjunto de treinamento formado por pares entrada-saída $(x_i, y_i)$ e aprende uma função $f: X arrow.r Y$ que generaliza para exemplos não vistos, minimizando um erro de predição. A *função de perda* (loss function) quantifica essa discrepância. Em problemas de classificação multiclasse, uma função amplamente adotada é a entropia cruzada:

$ L(theta) = -1/N sum_(i=1)^N sum_(c=1)^C y_(i c) log(hat(y)_(i c)) $

onde $N$ é o número de exemplos, $C$ é o número de classes, $y_(i c)$ é o rótulo verdadeiro e $hat(y)_(i c)$ é a predição do modelo com parâmetros $theta$.

#quote(block: true)[
  O aprendizado supervisionado tem sido aplicado com sucesso em diversas áreas, incluindo reconhecimento de fala, visão computacional, processamento de linguagem natural e diagnóstico médico. A capacidade desses algoritmos de generalizar a partir de exemplos os torna particularmente úteis quando regras explícitas são difíceis de formular.
]

== Redes Neurais Artificiais

Redes neurais artificiais são modelos computacionais inspirados no funcionamento do cérebro humano, compostos por camadas de neurônios artificiais conectados. A unidade fundamental é o neurônio, cuja saída é calculada aplicando-se uma função de ativação $sigma$ a uma combinação linear ponderada das entradas:

$ a = sigma(sum_(i=1)^n w_i x_i + b) $ <eq:perceptron>

onde $w_i$ são os pesos sinápticos, $x_i$ as entradas, $b$ o bias e $sigma$ a função de ativação não-linear. A @eq:perceptron, conhecida como modelo do perceptron, foi introduzida por #apud(label("rosenblatt1958perceptron"), label("goodfellow2016deep")) e representa a operação fundamental de qualquer rede neural.

Funções de ativação não-lineares são essenciais para que redes multicamadas possam aprender representações complexas. As mais utilizadas atualmente são a *ReLU* ($sigma(x) = max(0, x)$), que mitiga o problema do gradiente evanescente em redes profundas; a *sigmoid* ($sigma(x) = 1/(1+e^(-x))$), empregada em saídas de classificação binária; e a *tanh*, que produz saídas centradas em zero e é preferida em algumas arquiteturas recorrentes. Segundo estudos recentes, "redes neurais profundas são capazes de aprender representações hierárquicas de dados, onde cada camada aprende características de complexidade crescente" @litjens2017survey. Diversos trabalhos @lecun1998gradient @krizhevsky2012imagenet @he2016deep consolidaram esse resultado em tarefas de visão computacional.

== Redes Neurais Convolucionais

Redes neurais convolucionais (CNNs) são especializadas para processar dados com estrutura de grade, como imagens, explorando invariâncias espaciais por meio de compartilhamento de parâmetros. Elas combinam três tipos de operações: convolução, pooling e conexões totalmente conectadas.

A *operação de convolução* aplica um conjunto de filtros (kernels) à entrada, gerando mapas de características que capturam padrões locais — bordas, texturas e formas — independentemente de sua posição na imagem:

$ y[i, j] = sum_m sum_n x[i+m, j+n] dot w[m, n] $

O compartilhamento dos pesos $w$ reduz drasticamente o número de parâmetros em relação a camadas totalmente conectadas e confere invariância à translação. Já a *operação de pooling*, tipicamente aplicada após a convolução, reduz a dimensionalidade espacial mantendo as características mais discriminativas. O max pooling seleciona o valor máximo em uma janela de tamanho $R$:

$ y[i, j] = max_(m,n in R) x[i+m, j+n] $

combinando assim redução de custo computacional com robustez a pequenas distorções na entrada. As CNNs demonstraram desempenho superior em tarefas de visão computacional desde os trabalhos pioneiros de @lecun1998gradient @krizhevsky2012imagenet, passando a dominar benchmarks de classificação e detecção de objetos.

=== Arquiteturas Modernas

Diversas arquiteturas de CNN foram desenvolvidas ao longo da última década, cada uma propondo estratégias distintas para treinar redes mais profundas e expressivas.

As *redes residuais (ResNet)* @he2016deep introduziram conexões de atalho que permitem ao sinal contornar blocos de camadas, facilitando o fluxo do gradiente durante o treinamento. O bloco residual básico é composto por duas camadas convolucionais com uma conexão direta somando a entrada à saída transformada. Essa estrutura possibilitou o treinamento confiável de redes com centenas de camadas, algo inviável com arquiteturas anteriores.

As *redes densamente conectadas (DenseNet)* estendem esse princípio conectando cada camada a todas as camadas subsequentes do bloco, promovendo reutilização agressiva de representações e reduzindo o número de parâmetros. O *EfficientNet* @tan2019efficientnet propõe uma abordagem diferente, baseada em _compound scaling_: em vez de escalar profundidade, largura ou resolução isoladamente, escala todas as dimensões de forma conjunta e proporcional, gerando modelos com melhor custo-benefício. Segundo #cite(label("tan2019efficientnet"), form: "prose", supplement: "p. 6731, tradução nossa"), "o escalonamento composto é mais eficiente porque balanceia todas as dimensões da rede de maneira uniforme"#footnote[No original: "_compound scaling is more efficient because it balances all dimensions of the network in a uniform way_".].

== Processamento de Imagens Médicas

Imagens médicas apresentam características únicas — variações de equipamento, protocolo e população — que demandam técnicas especializadas de pré-processamento e aumentam o risco de overfitting a artefatos de aquisição. As três modalidades relevantes para este trabalho são: radiografia por raios-X, com alta resolução e tempo de aquisição inferior a um minuto; tomografia computadorizada (CT), que combina múltiplas projeções em cortes transversais de muito alta resolução; e ressonância magnética (MRI), sem radiação ionizante, especialmente indicada para tecidos moles e estruturas cerebrais.

#figure(
  {
    table(
      columns: (auto, auto, auto, auto),
      align: (left, center, center, left),
      table.header([*Modalidade*], [*Resolução*], [*Tempo*], [*Aplicação Principal*]),
      [Raio-X],    [Alta],      [< 1 min],  [Fraturas, pneumonia],
      [CT],        [Muito Alta],[5–30 min], [Tumores, hemorragias],
      [MRI],       [Muito Alta],[30–90 min],[Tecidos moles, cérebro],
      [Ultrassom], [Média],     [< 5 min],  [Feto, órgãos internos],
    )
    fonte[Elaborado pelo autor com base em #cite(label("litjens2017survey")).]
  },
  caption: [Comparação entre modalidades de imagem médica relevantes para diagnóstico assistido por computador.],
) <tab:modalidades>

Durante entrevista com especialista em radiologia#footnote[Informação fornecida pelo Dr. João Silva em entrevista realizada em São Paulo, em 15 de março de 2024.], foi destacado que a integração de sistemas de IA no fluxo de trabalho clínico exige adaptações significativas de infraestrutura e capacitação de equipes (informação verbal).
