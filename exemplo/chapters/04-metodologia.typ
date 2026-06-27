#import "/src/lib.typ": tabela-abnt, quadro, fonte

= Metodologia

Este capítulo descreve a metodologia empregada neste trabalho, abrangendo as bases de dados utilizadas, as arquiteturas de redes neurais profundas implementadas, os procedimentos de treinamento e as métricas adotadas para avaliação de desempenho.

== Visão Geral

A metodologia adotada seguiu um fluxo estruturado em seis etapas: coleta e preparação dos dados, implementação das arquiteturas de rede neural, treinamento e validação dos modelos, avaliação de desempenho, análise de interpretabilidade e, por fim, validação clínica dos resultados obtidos.

== Bases de Dados

Foram utilizadas três bases de dados públicas de imagens médicas. O *ChestX-ray14* contém 112.120 radiografias torácicas frontais de 30.805 pacientes únicos, com 14 classes de patologias anotadas em formato PNG de resolução 1024 × 1024 pixels. O *RSNA Pneumonia Detection* reúne 30.000 imagens de radiografias torácicas com anotações de pneumonia em bounding boxes no formato DICOM, redimensionadas para 512 × 512 pixels. O *Brain MRI Dataset* é composto por 3.000 imagens de ressonância magnética cerebral para detecção de tumores, em formato JPEG com resolução 256 × 256 pixels, divididas em duas classes: tumor e sem tumor.

== Pré-processamento

Todas as imagens foram redimensionadas para 224 × 224 pixels para compatibilidade com as arquiteturas pré-treinadas no ImageNet. Em seguida, os valores de pixel foram normalizados para o intervalo [0, 1] e padronizados usando a média e o desvio padrão calculados sobre o ImageNet. Para lidar com o desbalanceamento de classes inerente a datasets médicos, foram aplicadas técnicas combinadas de oversampling de classes minoritárias e undersampling de classes majoritárias.

Durante o treinamento, foram aplicadas transformações de aumento de dados — rotação aleatória (±15°), espelhamento horizontal com probabilidade de 50%, e ajustes de brilho e contraste (±20%) — com o objetivo de reduzir overfitting e aumentar a capacidade de generalização dos modelos.

== Arquiteturas Implementadas

Foram implementadas e comparadas três arquiteturas consolidadas na literatura de visão computacional médica. A primeira, *ResNet-50* (Residual Network), introduz conexões residuais que permitem o fluxo direto do gradiente por toda a rede, facilitando o treinamento de modelos com dezenas de camadas. Formalmente, para um bloco residual com entrada $x$, a saída é dada por:

$ y = F(x, {W_i}) + x $

onde $F(x, {W_i})$ representa o mapeamento residual aprendido pelas camadas convolucionais do bloco.

A segunda arquitetura, *DenseNet-121* (Densely Connected Network), estende o conceito de conexões de atalho conectando cada camada a todas as camadas subsequentes dentro do mesmo bloco denso. A saída da $l$-ésima camada é calculada como:

$ x_l = H_l([x_0, x_1, ..., x_(l-1)]) $

onde $[x_0, ..., x_(l-1)]$ denota a concatenação dos mapas de características de todas as camadas anteriores. Essa estratégia promove reutilização de representações e reduz significativamente o número de parâmetros em relação a redes de profundidade equivalente.

A terceira arquitetura avaliada, *EfficientNet-B3*, emprega _compound scaling_ para escalar de forma uniforme e conjunta largura, profundidade e resolução da rede a partir de um único coeficiente de escala $phi$. Essa abordagem produz modelos que alcançam acurácia competitiva com custo computacional substancialmente menor do que arquiteturas obtidas por escalonamento manual @tan2019efficientnet.

Todos os modelos foram inicializados com pesos pré-treinados no ImageNet e submetidos a fine-tuning para as tarefas específicas de classificação médica, com taxa de aprendizado inicial $alpha = 0.001$, otimizador Adam, batch de 32 imagens, 100 épocas e early stopping com paciência de 10 épocas. Os experimentos foram conduzidos em NVIDIA Tesla V100 (32 GB) com Python 3.9 e PyTorch 1.12 em Ubuntu 20.04 LTS.

A @tab:comparacao-gpus apresenta uma comparação entre diferentes GPUs avaliadas em experimentos preliminares de escalabilidade.

#figure(
  {
    tabela-abnt(
      (auto, auto, auto, auto),
      (left, center, center, center),
      ([*GPU*], [*Memória*], [*Tempo/Época*], [*Custo*]),
      [NVIDIA Tesla V100], [32 GB], [8.2 min], [\$ 2.50/h],
      [NVIDIA RTX 3090],  [24 GB], [10.5 min], [\$ 1.20/h],
      [NVIDIA A100],      [40 GB], [6.8 min],  [\$ 4.10/h],
    )
    fonte[Elaborado pelo autor.]
  },
  caption: [Comparação de GPUs utilizadas nos experimentos.],
) <tab:comparacao-gpus>

O @qua:comparacao-frameworks resume as principais características dos frameworks de deep learning avaliados durante o desenvolvimento do trabalho.

#figure(
  {
    quadro(
      (auto, auto, auto, auto),
      (left, center, center, left),
      ([*Framework*], [*Versão*], [*Licença*], [*Uso Principal*]),
      [PyTorch],     [1.12], [BSD],       [Pesquisa e produção],
      [TensorFlow],  [2.10], [Apache 2.0],[Produção em escala],
      [JAX],         [0.3],  [Apache 2.0],[Computação diferenciável],
      [Keras],       [2.10], [MIT],       [Prototipagem rápida],
    )
    fonte[Elaborado pelo autor.]
  },
  caption: [Comparação entre frameworks de deep learning avaliados.],
  kind: "quadro",
  supplement: "Quadro",
) <qua:comparacao-frameworks>

== Métricas de Avaliação

O desempenho dos modelos foi avaliado por meio de um conjunto de métricas complementares, adequadas ao contexto de classificação médica com classes desbalanceadas.

A *acurácia* expressa a proporção global de predições corretas e serve como indicador geral de desempenho, mas pode ser enganosa em datasets desbalanceados:

$ "Acurácia" = (T P + T N) / (T P + T N + F P + F N) $

A *sensibilidade* (ou recall) mede a capacidade do modelo de identificar corretamente os casos positivos — métrica prioritária em diagnósticos médicos, pois falsos negativos têm custo clínico elevado:

$ "Sensibilidade" = T P / (T P + F N) $

A *especificidade* quantifica a taxa de verdadeiros negativos, ou seja, a capacidade de o modelo não gerar alarmes falsos:

$ "Especificidade" = T N / (T N + F P) $

A *precisão* captura a confiabilidade das predições positivas — importante quando falsos positivos implicam em exames ou intervenções desnecessárias:

$ "Precisão" = T P / (T P + F P) $

O *F1-Score* combina precisão e sensibilidade em uma única medida harmônica, equilibrando os dois tipos de erro:

$ F_1 = 2 dot ("Precisão" dot "Sensibilidade") / ("Precisão" + "Sensibilidade") $

Por fim, a *Curva ROC e a AUC* (Area Under the Curve) fornecem uma avaliação independente de threshold, possibilitando comparação direta entre modelos e refletindo o comportamento do classificador em toda a gama de pontos de operação.

== Validação

Para garantir resultados robustos e evitar overfitting ao conjunto de teste, foi utilizada validação cruzada estratificada k-fold com $k = 5$, com particionamento de forma a manter a proporção original de classes em cada fold. Os resultados reportados correspondem à média e ao desvio padrão das cinco rodadas de validação.
