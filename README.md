# Template Typst para o Manual de Dissertações e Teses (MDT) da UFSM

[![Typst Build](https://github.com/sehnem/typst-ufsm/actions/workflows/ci.yml/badge.svg)](https://github.com/sehnem/typst-ufsm/actions/workflows/ci.yml)
[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![GitHub stars](https://img.shields.io/github/stars/sehnem/typst-ufsm.svg)](https://github.com/sehnem/typst-ufsm/stargazers)

Um template [Typst](https://typst.app/) para o [Manual de Dissertações e Teses (MDT)](https://repositorio.ufsm.br/handle/1/24203) da Universidade Federal de Santa Maria (UFSM).

O objetivo deste projeto é fornecer uma alternativa moderna e eficiente ao tradicional fluxo de trabalho com LaTeX para a produção de dissertações e teses, seguindo as normas da UFSM.

## O que é Typst?

Typst é um moderno sistema de composição tipográfica baseado em marcação, projetado para ser uma alternativa mais simples e poderosa ao LaTeX. Ele oferece uma sintaxe intuitiva, compilação extremamente rápida e um ambiente de desenvolvimento integrado que facilita a escrita de documentos acadêmicos e científicos.

## Como Compilar

Para compilar o documento, você precisa ter o Typst instalado. Siga as instruções no [site oficial do Typst](https://github.com/typst/typst#installation).

Após a instalação, você pode compilar o projeto a partir do diretório raiz com o seguinte comando:

```bash
typst compile src/ufsm-thesis.typ
```

O arquivo PDF resultante será gerado no mesmo diretório.

## Visualizar Exemplo

Para ver um exemplo do documento gerado com este template, você pode baixar o PDF compilado automaticamente pelo GitHub Actions:

1. Acesse a [página de Actions](https://github.com/sehnem/typst-ufsm/actions) do repositório
2. Clique no workflow mais recente que foi executado com sucesso (ícone verde ✓)
3. Na seção "Artifacts", baixe o arquivo `thesis-pdf`

Alternativamente, você pode visualizar o PDF diretamente na aba "Actions" após cada commit na branch principal.

## Uso com VS Code

É altamente recomendado o uso do Visual Studio Code com a extensão [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=T-K-H.tinymist) para uma experiência de desenvolvimento otimizada. Esta extensão oferece:

-   Visualização ao vivo do documento.
-   Autocompletar de código.
-   Destaque de sintaxe.
-   Navegação fácil pelo documento.

## Estado Atual e Contribuições

Este é um trabalho em andamento e ainda não está completo. As seguintes áreas precisam de atenção:

-   **Referências Bibliográficas**: Atualmente a bibliografia está utilizando o estilo APA. É necessário implementar o estilo ABNT e as especificidades do MDT para citações e referências bibliográficas.
-   **Paginação Frente e Verso**: A configuração de margens espelhadas para impressão frente e verso ainda não foi totalmente implementada.
-   **Validação Geral**: Todo o template precisa ser revisado e comparado cuidadosamente com as normas do MDT da UFSM para garantir conformidade.

Contribuições são muito bem-vindas! Se você tiver interesse em ajudar, sinta-se à vontade para abrir uma *issue* ou enviar um *pull request*.

## Licença

Este template está licenciado sob a [Creative Commons Attribution-ShareAlike 4.0 International License (CC BY-SA 4.0)](https://creativecommons.org/licenses/by-sa/4.0/).

**Importante**: A licença se aplica **apenas ao código do template** (os arquivos `.typ` e a estrutura do projeto). As teses, dissertações e outros trabalhos acadêmicos criados utilizando este template **não** estão sujeitos a esta licença. Você é livre para licenciar seu trabalho acadêmico da forma que desejar, sem qualquer restrição imposta por este template.

Em outras palavras: se você modificar o template e redistribuir o template modificado, deve fazê-lo sob a mesma licença CC BY-SA 4.0. Mas sua tese ou dissertação escrita com este template é completamente sua, e você pode licenciá-la como quiser (ou não licenciá-la publicamente).

## Link para o MDT

-   [Manual de Dissertações e Teses - MDT (2021)](https://repositorio.ufsm.br/handle/1/24203)
