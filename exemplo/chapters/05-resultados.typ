#import "/src/lib.typ": tabela-abnt, fonte

= Resultados

Este capítulo apresenta os resultados obtidos nos experimentos realizados, incluindo análises comparativas de desempenho entre as arquiteturas avaliadas, curvas ROC, matrizes de confusão e o impacto do ensemble de modelos.

== Desempenho dos Modelos

A @tab:resultados-gerais resume o desempenho dos três modelos no conjunto de teste. O EfficientNet-B3 obteve os melhores resultados em todas as métricas avaliadas, alcançando acurácia de 95,6% e AUC de 0,984. O DenseNet-121 apresentou desempenho intermediário, enquanto o ResNet-50 ficou em terceiro lugar, ainda com resultados expressivos acima de 93%.

#figure(
  {
    tabela-abnt(
      (auto, auto, auto, auto, auto, auto),
      (left, center, center, center, center, center),
      ([*Modelo*], [*Acurácia*], [*Precisão*], [*Sensibilidade*], [*Especificidade*], [*AUC*]),
      [ResNet-50],       [93,2 ± 1,8%], [92,1%], [91,5%], [94,8%], [0,967],
      [DenseNet-121],    [94,8 ± 1,5%], [93,7%], [93,2%], [95,9%], [0,978],
      [EfficientNet-B3], [*95,6 ± 1,3%*], [*94,9%*], [*94,3%*], [*96,5%*], [*0,984*]
    )
    fonte[Elaborado pelo autor.]
  },
  caption: [Desempenho comparativo dos modelos no conjunto de teste. Valores em negrito indicam os melhores resultados por métrica.],
) <tab:resultados-gerais>

== Análise por Dataset e Curvas ROC

No dataset ChestX-ray14, o EfficientNet-B3 obteve acurácia de 95,6%, superando o CheXNet original @rajpurkar2017chexnet, baseado em DenseNet-121, em 3,5 pontos percentuais. Para detecção de pneumonia (RSNA), todos os modelos apresentaram sensibilidade superior a 93%, resultado clinicamente relevante. A @fig:resultados-chestxray ilustra a comparação de acurácia entre os modelos nesse dataset.

#figure(
  {
    rect(width: 80%, height: 10cm, fill: rgb("#f0f0f0"))[
      #align(center + horizon)[
        #text(size: 14pt, fill: gray)[[Gráfico: Comparação de acurácia por modelo]]
      ]
    ]
    fonte[Elaborado pelo autor.]
  },
  caption: [Comparação de acurácia dos três modelos no dataset ChestX-ray14. As barras de erro representam o desvio padrão da validação cruzada 5-fold.],
  kind: "grafico",
  supplement: "Gráfico",
) <fig:resultados-chestxray>

As curvas ROC, exibidas na @fig:roc-curves, confirmam a superioridade do EfficientNet-B3 (AUC = 0,984) sobre os demais modelos em toda a gama de pontos de operação, indicando que o ganho de desempenho não decorre de um threshold específico, mas de uma capacidade discriminativa genuinamente maior.

#figure(
  {
    rect(width: 80%, height: 10cm, fill: rgb("#f0f0f0"))[
      #align(center + horizon)[
        #text(size: 14pt, fill: gray)[[Gráfico: Curvas ROC dos modelos]]
      ]
    ]
    fonte[Elaborado pelo autor.]
  },
  caption: [Curvas ROC para ResNet-50 (azul), DenseNet-121 (verde) e EfficientNet-B3 (vermelho). EfficientNet-B3 apresentou a maior AUC (0,984).],
  kind: "grafico",
  supplement: "Gráfico",
) <fig:roc-curves>

== Análise de Erros e Interpretabilidade

A @fig:confusion apresenta a matriz de confusão normalizada do EfficientNet-B3. Os erros mais frequentes ocorreram entre classes com apresentação radiológica similar, como consolidação e opacidade em vidro fosco, o que é consistente com a dificuldade reportada mesmo por radiologistas experientes.

#figure(
  {
    rect(width: 60%, height: 10cm, fill: rgb("#f0f0f0"))[
      #align(center + horizon)[
        #text(size: 14pt, fill: gray)[[Matriz de Confusão: EfficientNet-B3]]
      ]
    ]
    fonte[Elaborado pelo autor.]
  },
  caption: [Matriz de confusão normalizada para o EfficientNet-B3 no conjunto de teste.],
) <fig:confusion>

Para compreender as decisões dos modelos, foram gerados mapas de atenção Grad-CAM (@fig:gradcam-exemplos). Em casos de pneumonia, o modelo concentrou atenção nos campos pulmonares; em tumores cerebrais, destacou regiões periféricas de alta intensidade. Essa correspondência com o conhecimento anatômico clínico aumenta a confiança dos especialistas na adoção do sistema.

#figure(
  {
    rect(width: 100%, height: 12cm, fill: rgb("#f0f0f0"))[
      #align(center + horizon)[
        #text(size: 14pt, fill: gray)[[Figura: Exemplos de visualizações Grad-CAM]]
      ]
    ]
    fonte[Elaborado pelo autor.]
  },
  caption: [Mapas de atenção Grad-CAM: (a) imagem original, (b) mapa de calor, (c) sobreposição. Regiões em vermelho indicam maior relevância para a decisão do modelo.],
) <fig:gradcam-exemplos>

== Complexidade Computacional e Ensemble

A @tab:tempo compara os tempos de treinamento e inferência dos modelos. O EfficientNet-B3, apesar de exigir mais tempo de treinamento (15,8 h para 100 épocas), apresenta tempo de inferência por imagem de apenas 18 ms — adequado a aplicações clínicas em tempo real.

#figure(
  {
    tabela-abnt(
      (auto, auto, auto, auto),
      (left, center, center, center),
      ([*Modelo*], [*Parâmetros*], [*Tempo Treino*], [*Tempo Inferência*]),
      [ResNet-50],       [25,6 M], [8,2 h],  [12 ms],
      [DenseNet-121],    [8,0 M],  [10,5 h], [15 ms],
      [EfficientNet-B3], [12,2 M], [15,8 h], [18 ms],
    )
    fonte[Elaborado pelo autor.]
  },
  caption: [Complexidade computacional dos modelos. Tempo de treinamento para 100 épocas; tempo de inferência por imagem em GPU.],
) <tab:tempo>

Um ensemble combinando os três modelos por votação ponderada ($0{,}40 dot y_"EfficientNet" + 0{,}35 dot y_"DenseNet" + 0{,}25 dot y_"ResNet"$) alcançou acurácia de 96,3% e AUC de 0,988, superando o melhor modelo individual em 0,7 pontos percentuais de acurácia (@tab:ensemble). O ganho marginal em relação ao EfficientNet-B3 isolado sugere que os modelos capturam padrões complementares, tornando o ensemble vantajoso mesmo a custo de maior complexidade de inferência.

#figure(
  {
    tabela-abnt(
      (auto, auto, auto, auto),
      (left, center, center, center),
      ([*Abordagem*], [*Acurácia*], [*Sensibilidade*], [*AUC*]),
      [EfficientNet-B3], [95,6%],    [94,3%],    [0,984],
      [Ensemble],        [*96,3%*],  [*95,1%*],  [*0,988*],
      [Ganho],           [+0,7%],    [+0,8%],    [+0,004],
    )
    fonte[Elaborado pelo autor.]
  },
  caption: [Comparação entre o melhor modelo individual e o ensemble por votação ponderada.],
) <tab:ensemble>
