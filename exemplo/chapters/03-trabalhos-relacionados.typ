#import "/src/lib.typ": fonte

= Trabalhos Relacionados

Este capítulo apresenta uma revisão da literatura sobre aplicações de deep learning em classificação de imagens médicas, destacando os principais trabalhos, metodologias empregadas e resultados obtidos.

== Classificação de Imagens Médicas com Deep Learning

Nos últimos anos, houve um crescimento exponencial de publicações sobre o uso de deep learning em imagens médicas. #cite(label("shen2017deep"), form: "prose") oferecem uma revisão abrangente do estado da arte, documentando avanços em detecção, segmentação e classificação em diversas modalidades.

Na detecção de pneumonia em radiografias torácicas, #cite(label("rajpurkar2017chexnet"), form: "prose") desenvolveram o CheXNet, uma rede baseada em DenseNet-121 treinada em mais de 100.000 imagens do dataset ChestX-ray14, alcançando desempenho comparável ou superior ao de radiologistas humanos. Em classificação de lesões de pele, #cite(label("esteva2019guide"), form: "prose") demonstraram que uma CNN treinada em 129.450 imagens clínicas, com transfer learning a partir da Inception-v3, atinge acurácia equivalente à de dermatologistas certificados. Para retinopatia diabética, #cite(label("gulshan2016development"), form: "prose") obtiveram sensibilidade de 97,5% e especificidade de 93,4% em imagens de retina, superando oftalmologistas em alguns critérios de avaliação.

A @tab:trabalhos-relacionados sintetiza os principais estudos, arquiteturas e resultados para facilitar a comparação com o presente trabalho.

#figure(
  {
    table(
      columns: (auto, auto, auto, auto, auto),
      align: (left, left, center, center, left),
      table.header([*Estudo*], [*Arquitetura*], [*Dataset*], [*Acurácia*], [*Ano*]),
      [#cite(label("rajpurkar2017chexnet"), form: "author")], [DenseNet-121],  [ChestX-ray14], [92,1%], [2017],
      [#cite(label("esteva2019guide"), form: "author")],      [Inception-v3],  [Skin Lesions], [91,0%], [2017],
      [#cite(label("gulshan2016development"), form: "author")],[Inception-v4], [EyePACS],      [97,5%], [2016],
      [#cite(label("wang2017chestx"), form: "author")],       [ResNet-50],     [ChestX-ray],   [88,4%], [2018],
      [#cite(label("litjens2017survey"), form: "author")],    [U-Net],         [CAMELYON16],   [92,5%], [2016],
    )
    fonte[Elaborado pelo autor com base nos estudos citados.]
  },
  caption: [Principais trabalhos sobre deep learning em imagens médicas, organizados por arquitetura e dataset.],
) <tab:trabalhos-relacionados>

== Técnicas de Aumento de Dados

_Data augmentation_ é crucial para evitar overfitting quando os dados de treinamento são escassos ou desbalanceados — condição frequente em datasets médicos, que dependem de anotações especializadas. As técnicas mais amplamente adotadas incluem rotação, translação, espelhamento, ajustes de brilho e contraste, zoom e adição de ruído gaussiano. Em imagens médicas, transformações elásticas e simulação de artefatos de aquisição específicos da modalidade também são empregadas para aumentar a robustez dos modelos a variações clínicas reais.

== Interpretabilidade de Modelos

A interpretabilidade é uma exigência crítica em aplicações médicas: decisões não explicáveis dificultam a adoção clínica e criam obstáculos regulatórios. Técnicas de atenção visual, como o Grad-CAM (_Gradient-weighted Class Activation Mapping_), permitem identificar as regiões da imagem que mais influenciaram a predição do modelo. A @fig:gradcam ilustra um exemplo típico de mapa de atenção sobre uma radiografia torácica.

#figure(
  {
    rect(width: 80%, height: 8cm, fill: rgb("#f0f0f0"))[
      #align(center + horizon)[
        #text(size: 14pt, fill: gray)[[Figura: Exemplo de visualização Grad-CAM]]
      ]
    ]
    fonte[Elaborado pelo autor.]
  },
  caption: [Mapa de atenção Grad-CAM gerado sobre radiografia torácica, destacando as regiões de maior relevância para a classificação.],
) <fig:gradcam>
