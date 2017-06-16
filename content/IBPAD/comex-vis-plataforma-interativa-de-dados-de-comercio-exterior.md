+++
title = "Comex Vis: plataforma interativa de dados de comércio exterior"
date = "2016-08-31 00:44:30"
categories = ["IBPAD"]
original_url = "http://www.ibpad.com.br/blog/analise-de-dados/comex-vis-plataforma-interativa-de-dados-de-comercio-exterior/"
+++

<header class="kopa-page-header-1">
</header>
<p id="main-content">
<section class="post-content">
<article class="entry-item">
<a href="http://www.ibpad.com.br/blog/analise-de-dados/comex-vis-plataforma-interativa-de-dados-de-comercio-exterior/" class="single-post-date">
30/08/2016 </a>
<figure id="attachment_1244" class="wp-caption alignleft">
<img class="wp-image-1244 size-medium" src="https://i2.wp.com/blogantigo.ibpad.com.br/wp-content/uploads/2016/08/Serie-hist&#xF3;rica-Importa&#xE7;&#xF5;es-e-Exporta&#xE7;&#xF5;es-brasileiras-300x225.png?resize=300%2C225" alt="Serie hist&#xF3;rica Importa&#xE7;&#xF5;es e Exporta&#xE7;&#xF5;es brasileiras">
<figcaption class="wp-caption-text">
Série histórica da balança comercial brasileira
</figcaption>
</figure>
<p>
Qual é o saldo da balança comercial brasileira em relação a China? Quais
produtos nós mais exportamos aos EUA? Quais produtos o brasil mais
importou? Responder a essas perguntas nunca foi tão fácil. No dia 28 de
julho foi lançado
o<a href="http://www.mdic.gov.br/comercio-exterior/estatisticas-de-comercio-exterior/comex-vis">
Comex Vis</a>, uma ferramenta de visualização de dados interativa criada
pela Secretaria de Comércio Exterior do Ministério do Desenvolvimento,
Indústria e Comércio. A ferramenta possui a série histórica de dados de
comércio exterior desde 1997 do Brasil. O projeto foi completamente
desenvolvido com plataformas livres e gratuitas, como o R e o D3Plus. O
pacote HTMLWidgets foi utilizado para integrar o R e o D3Plus.
</p>
<p>
A ferramenta apresenta os dados de uma forma muito maleável, lhe dando
acesso às estatísticas de comércio por blocos, continentes, países
específicos, ou no Brasil em geral.
</p>

</article>

</section>
</p>
<p>
Ambos os gráficos a seguir foram tirados da ferramenta, o primeiro
apresenta as exportações do Brasil para a China, e a seguinte as
importações provenientes da China. As cores são usadas como categorias,
o amarelo representando produtos básicos, como grãos e minérios, o cinza
claro representa produtos semimanufaturados, por exemplo, borracha
sintética e celulose, e o cinza escuro representa produtos
manufaturados, que vão de plataformas de perfuração a inseticidas.
</p>
<p>
<img class="size-medium wp-image-1249 aligncenter" src="https://i0.wp.com/ibpad.com.br/wp-content/uploads/2016/08/ComexVis-300x122.png?resize=300%2C122" alt="ComexVis">
</p>
<p>
Como nós somos bem curiosos, mandamos um e-mail com algumas perguntas
para o time do Comex Vis  que gentilmente nos responderam. Confira a
rápida entrevista:
</p>
<p>
<strong>IBPAD: Quando começou a iniciativa? Quanto tempo de
projeto?</strong>
</p>
<p>
<strong>Time Comex Vis:</strong> Ao longo do primeiro semestre de 2016 o
Departamento de Estatística de Apoio à Exportação da Secretaria de
Comércio Exterior (DEAEX/SECEX) vem aprimorando algumas publicações e
criando novos produtos com os dados de comércio exterior brasileiro.
Nesse contexto, há aproximadamente 4 meses começamos alguns experimentos
com visualizações interativas testando algumas alternativas. Desde de a
escolha do D3Plus (software utilizado no ComexVis) até o dia do
lançamento, levamos aproximadamente 3 meses.
</p>
<p>
<strong>IBPAD: Quem são os responsáveis e quantas pessoas trabalharam no
projeto? </strong>
</p>
<p>
<strong>Time Comex Vis: </strong>O projeto foi iniciativa do
DEAEX/SECEX. Inicialmente, dois servidores começaram os experimentos e
evoluíram até o formato de produto. Atualmente estamos organizando
workshops interno para reforçar a equipe e nivelar o conhecimento, assim
teremos mais fôlego para evoluir o projeto de forma rápida e
sustentável.<br> A equipe envolvida tem formação, em sua maioria, na
área de economia, sendo que um dos envolvidos possui formação em ciência
da computação.
</p>
<p>
<strong>IBPAD: Por que escolheram R e D3 Plus?</strong>
</p>
<p>
<strong>Time Comex Vis: </strong>No contexto de aprimoramento dos nossos
produtos, buscávamos uma ferramenta para apoiar nossas análises
estatística e o R foi uma escolha natural, considerando o perfil e
conhecimento prévio do nossa equipe. Também começamos a usar o R como
ferramenta para estruturar rotinas, criar relatórios e gráficos. Este
processo nos levou a necessidade de reformulação de algumas publicações
e produtos do nosso portal. Por conta da “integrabilidade” com o R, nos
deparamos com o D3Plus, fizemos alguns experimentos e gostamos muito dos
resultados. Além do mais, trata-se de um pacote gratuito, simples de
usar e gera visualizações muito atrativas.
</p>
<p>
A integração do R com o D3Plus foi feita usando o pacote htmlwidgets e o
produto final gerado com RMarkdown.
</p>
<p>
<strong>IBPAD: Quais são os passos futuros para o projeto?</strong>
</p>
<p>
<strong>Time Comex Vis: </strong>Pretendemos evoluir o Comex Vis para
cobrir o máximo possível das variáveis divulgadas. As próximas
visualizações que estamos desenvolvendo são visões focadas em Unidade da
Federação e em produtos. As evoluções serão orientadas pelo feedback dos
usuários das estatísticas de comércio exterior.
</p>
<span><i class="fa fa-tag"></i>Tags:
</span><a href="http://www.ibpad.com.br/tag/analise-de-dados/">análise
de
dados</a> ,  <a href="http://www.ibpad.com.br/tag/analise-de-dados-categoricos/">Análise
de dados
categóricos</a> ,  <a href="http://www.ibpad.com.br/tag/analise-de-dados-em-r/">Análise
de dados em
R</a> ,  <a href="http://www.ibpad.com.br/tag/analise-de-dados-estatisticos/">Análise
de dados
estatísticos</a> ,  <a href="http://www.ibpad.com.br/tag/analise-de-dados-qualitativos/">Análise
de dados
qualitativos</a> ,  <a href="http://www.ibpad.com.br/tag/analise-de-dados-quantitativos/">Análise
de dados
quantitativos</a> ,  <a href="http://www.ibpad.com.br/tag/comercio-exterior/">comércio
exterior</a> ,  <a href="http://www.ibpad.com.br/tag/d3-plus/">d3
plus</a> ,  <a href="http://www.ibpad.com.br/tag/dados-abertos/">dados
abertos</a> ,  <a href="http://www.ibpad.com.br/tag/estatistica/">estatística</a> ,  <a href="http://www.ibpad.com.br/tag/ibpad/">ibpad</a> ,  <a href="http://www.ibpad.com.br/tag/linguagem-r/">Linguagem
R</a> ,  <a href="http://www.ibpad.com.br/tag/programacao-em-linguagem-r/">Programação
em linguagem
R</a> ,  <a href="http://www.ibpad.com.br/tag/programacao-em-r/">programação
em
R</a> ,  <a href="http://www.ibpad.com.br/tag/programacao-r-estatistica/">Programação
R
estatística</a> ,  <a href="http://www.ibpad.com.br/tag/r/">r</a> ,  <a href="http://www.ibpad.com.br/tag/software-r/">software
R</a>

<ul>
<li>
<header class="clearfix">
</header>
<p>
O Instituto Brasileiro de Pesquisa e Análise de Dados é um centro de
formação de analistas e pesquisadores nas áreas de Comunicação Digital,
Pesquisa e Opinião Pública, Política e Relações Governamentais. Nosso
time é formado por professores, pesquisadores e profissionais do mercado
fascinados por pesquisa e análise de dados.
</p>

</li>
</ul>

<a href="http://www.ibpad.com.br/blog/analise-de-dados/comex-vis-plataforma-interativa-de-dados-de-comercio-exterior/#" class="scroll-up"><span
class="ti-arrow-up"></span></a>

