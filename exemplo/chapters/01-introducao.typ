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
