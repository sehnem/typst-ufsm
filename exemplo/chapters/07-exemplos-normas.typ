= Exemplos de Aplicação das Normas UFSM

Este capítulo tem como objetivo demonstrar a aplicação das normas de citações e referências da UFSM (adaptadas da ABNT), bem como a hierarquia tipográfica das seções e subseções prevista no MDT/UFSM 2021.

== Hierarquia de Seções e Subseções

O MDT/UFSM 2021 (seção 4.1) prevê até cinco níveis de divisão do texto, identificados por numeração progressiva em algarismos arábicos. Cada nível recebe um destaque tipográfico distinto, conforme descrito a seguir, de forma a evidenciar a hierarquia entre as partes do trabalho.

A *seção primária* (nível 1) é o capítulo em si — título em maiúsculas e negrito, iniciando sempre em nova página. As *seções secundárias* (nível 2) subdividem o capítulo — maiúsculas sem negrito. As *seções terciárias* (nível 3) empregam letras maiúsculas e minúsculas em negrito. As *seções quaternárias* (nível 4) usam itálico com iniciais maiúsculas. As *seções quinárias* (nível 5), último nível permitido, são apresentadas em letras maiúsculas e minúsculas sem qualquer destaque adicional.

=== Seção Terciária (Nível 3) — Negrito, Misto

Esta é uma seção terciária. O título é formatado em negrito com letras maiúsculas e minúsculas, sem caixa alta. É o nível adequado para subdivisões de uma seção secundária quando há necessidade de maior granularidade no texto. O conteúdo deve ser suficientemente extenso para justificar a subdivisão; subseções com apenas uma ou duas frases devem ser incorporadas ao parágrafo da seção superior.

==== Seção Quaternária (Nível 4) — Itálico, Misto

_Esta é uma seção quaternária._ O título aparece em itálico com letras maiúsculas e minúsculas. Este nível é reservado para especializações dentro de uma seção terciária e deve ser usado com parcimônia. Na prática, seções quaternárias aparecem principalmente em trabalhos com estrutura muito ramificada, como revisões sistemáticas ou documentação técnica detalhada.

===== Seção Quinária (Nível 5) — Regular, Misto

Esta é uma seção quinária, o nível mais profundo permitido pelo MDT/UFSM. O título é apresentado em letras maiúsculas e minúsculas sem negrito nem itálico. A ABNT 6024 (vigente) recomenda que a numeração progressiva não ultrapasse o quinto nível; estruturas mais profundas devem ser reformuladas por meio de alíneas ou reorganização do conteúdo. A presença frequente de seções quinárias em um trabalho pode indicar fragmentação excessiva do texto e deve ser revisada com o orientador.

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
