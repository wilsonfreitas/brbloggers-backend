+++
title = "Medidas de Risco em Análise de Redes Financeiras"
date = "2016-10-07 19:20:49"
categories = ["IBPAD"]
original_url = "http://www.ibpad.com.br/blog/analise-de-dados/medidas-de-risco-em-analise-de-redes-financeiras/"
+++

<header class="kopa-page-header-1">
</header>
<p id="main-content">
<section class="post-content">
<article class="entry-item">
<a href="http://www.ibpad.com.br/blog/analise-de-dados/medidas-de-risco-em-analise-de-redes-financeiras/" class="single-post-date">
07/10/2016 </a>
<p>
<img class="alignleft wp-image-1538" src="https://i2.wp.com/ibpad.com.br/wp-content/uploads/2016/10/Cinelli-1024x805.png?resize=185%2C143" alt="cinelli">No
dia 15 de junho O IBPAD realizou o sua primeira edição dos Seminários
IBPAD com o tema
“<a href="http://ibpad.com.br/index.php/2016/07/14/seminario-do-ibpad-discute-ciencia-de-dados-como-metodologia-para-estudos-da-sociedade-e-politica/">Ciência
de Dados e Sociedade</a>”, em parceria com o Núcleo de Estudos e
Pesquisa em Políticas Públicas, Governo e Gestão (NP3-UnB). Realizado na
Universidade de Brasília, o Seminário reuniu pesquisadores de várias
áreas para discutir como a análise de dados se propõe a compreender
diferentes elementos sociais e institucionais.
</p>
<p>
Professor do nosso curso de Programação em R, Carlos Cinelli apresentou
o seu pacote para R “Network Risk Measures”.
</p>
<p>
Confira:
</p>
<p>
<span
class="embed-youtube"><iframe class="youtube-player" width="900" height="537" src="http://www.youtube.com/embed/2ZfKt3hcaL0?version=3&amp;rel=1&amp;fs=1&amp;autohide=2&amp;showsearch=0&amp;showinfo=1&amp;iv_load_policy=1&amp;wmode=transparent"></iframe></span>
</p>
<p>
Por razões técnicas, refizemos a gravação da mesma apresentação feita no
seminário.
</p>
<p>
Você pode ver os slides da apresentação
<a href="http://ibpad.com.br/apresentacaoCinelli.html" class="broken_link">aqui</a>.
</p>
<p>
Quer praticar? Faça o download da base de dados utilizada no exemplo
<a href="http://ibpad.com.br/wp-content/uploads/2016/10/rede.zip">aqui</a>.
</p>
<p>
Segue o código utilizado na apresentação:
</p>
<textarea class="crayon-plain print-no">
Limpar nossa área de trabalho ------------------------------------------- rm(list = ls()) \# Carregar os pacotes que vamos usar -------------------------------------- library(igraph)
======================================================================================================================================================================================

library(NetworkRiskMeasures) \# Nossa Rede
-------------------------------------------------------------- rede
&lt;- readRDS("rede.rds") rede\_p &lt;-
graph\_from\_adjacency\_matrix(rede$rede, weighted = T) plot(rede\_p) rede\_a &lt;- graph\_from\_adjacency\_matrix(t(rede$rede),
weighted = T) buffer &lt;- rede$buffer peso &lt;- rede$peso \# Métricas
clássicas de rede ----------------------------------------------
degree(rede\_p, mode = "out") strength(rede\_p, mode = "out")
betweenness(rede\_p) closeness(rede\_p, weights =
1/E(rede\_p)*w**e**i**g**h**t*)*p**a**g**e*<sub>*r*</sub>*a**n**k*(*r**e**d**e*<sub>*a*</sub>)vector
\# Simulação de contágio em cascata
---------------------------------------- cascata &lt;-
contagion(exposures = rede\_a, buffer = buffer, weights = peso, method =
"threshold") summary(cascata) \# DebtRank
----------------------------------------------------------------
debtrank &lt;- contagion(exposures = rede\_a, buffer = buffer, weights =
peso, method = "debtrank") summary(debtrank) \# Reconstrução de redes
--------------------------------------------------- L &lt;- c(a = 4, b =
5, c = 5, d = 0, e = 0, f = 2, g = 4) A &lt;- c(a = 7, b = 5, c = 3, d =
1, e = 3, f = 0, g = 1) \# maxima entropia ME &lt;-
matrix\_estimation(A, L, method = "me") ME &lt;- round(ME, 2) ME \#
minima densidade set.seed(192) MD &lt;- matrix\_estimation(A, L, method
= "md") MD
</textarea>

<table class="crayon-table">
<tr class="crayon-row">
<td class="crayon-nums ">

</td>
<td class="crayon-code">
<span class="crayon-c">\# Limpar nossa área de trabalho
-------------------------------------------</span>

<span class="crayon-c">\# Carregar os pacotes que vamos usar
--------------------------------------</span>

<span class="crayon-r">library</span><span
class="crayon-sy">(</span><span
class="crayon-v">NetworkRiskMeasures</span><span
class="crayon-sy">)</span>

<span class="crayon-c">\# Nossa Rede
--------------------------------------------------------------</span>

<span class="crayon-v">rede</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span class="crayon-e">readRDS</span><span
class="crayon-sy">(</span><span class="crayon-s">"rede.rds"</span><span
class="crayon-sy">)</span>

<span class="crayon-v">rede\_p</span><span class="crayon-h">
</span><span class="crayon-o">&lt;</span><span
class="crayon-o">-</span><span class="crayon-h"> </span><span
class="crayon-e">graph\_from\_adjacency\_matrix</span><span
class="crayon-sy">(</span><span class="crayon-v">rede</span><span
class="crayon-sy">$&lt;/span&gt;&lt;span class="crayon-v"&gt;rede&lt;/span&gt;&lt;span class="crayon-sy"&gt;,&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-v"&gt;weighted&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-t "&gt;T&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line" id="crayon-5943b5d0a2d9b984601212-19"&gt;&lt;span class="crayon-v"&gt;rede\_a&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;&lt;&lt;/span&gt;&lt;span class="crayon-o"&gt;-&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-e"&gt;graph\_from\_adjacency\_matrix&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-t "&gt;t&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;rede&lt;/span&gt;&lt;span class="crayon-sy"&gt;$</span><span
class="crayon-v">rede</span><span class="crayon-sy">)</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">weighted</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-t">T</span><span class="crayon-sy">)</span>

<span class="crayon-c">\# Métricas clássicas de rede
----------------------------------------------</span>

<span class="crayon-e">degree</span><span
class="crayon-sy">(</span><span class="crayon-v">rede\_p</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">mode</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-s">"out"</span><span class="crayon-sy">)</span>

<span class="crayon-e">strength</span><span
class="crayon-sy">(</span><span class="crayon-v">rede\_p</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">mode</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-s">"out"</span><span class="crayon-sy">)</span>

<span class="crayon-e">closeness</span><span
class="crayon-sy">(</span><span class="crayon-v">rede\_p</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">weights</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h">  </span><span
class="crayon-cn">1</span><span class="crayon-o">/</span><span
class="crayon-e">E</span><span class="crayon-sy">(</span><span
class="crayon-v">rede\_p</span><span class="crayon-sy">)</span><span
class="crayon-sy">$</span><span class="crayon-v">weight</span><span
class="crayon-sy">)</span>

<span class="crayon-c">\# Simulação de contágio em cascata
----------------------------------------</span>

<span class="crayon-v">cascata</span><span class="crayon-h">
</span><span class="crayon-o">&lt;</span><span
class="crayon-o">-</span><span class="crayon-h"> </span><span
class="crayon-e">contagion</span><span class="crayon-sy">(</span><span
class="crayon-v">exposures</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-v">rede\_a</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">buffer</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-v">buffer</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">weights</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-v">peso</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">method</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-s">"threshold"</span><span
class="crayon-sy">)</span>

<span class="crayon-c">\# DebtRank
----------------------------------------------------------------</span>

<span class="crayon-v">debtrank</span><span class="crayon-h">
</span><span class="crayon-o">&lt;</span><span
class="crayon-o">-</span><span class="crayon-h"> </span><span
class="crayon-e">contagion</span><span class="crayon-sy">(</span><span
class="crayon-v">exposures</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-v">rede\_a</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">buffer</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-v">buffer</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">weights</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-v">peso</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">method</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-s">"debtrank"</span><span
class="crayon-sy">)</span>

<span class="crayon-c">\# Reconstrução de redes
---------------------------------------------------</span>

<span class="crayon-v">L</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span class="crayon-e">c</span><span
class="crayon-sy">(</span><span class="crayon-v">a</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-cn">4</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">b</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-cn">5</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">c</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-cn">5</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">d</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-cn">0</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">e</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-cn">0</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-t">f</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-cn">2</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">g</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-cn">4</span><span
class="crayon-sy">)</span>

<span class="crayon-v">A</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span class="crayon-e">c</span><span
class="crayon-sy">(</span><span class="crayon-v">a</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-cn">7</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">b</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-cn">5</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">c</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-cn">3</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">d</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-cn">1</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">e</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-cn">3</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-t">f</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-cn">0</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">g</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-cn">1</span><span
class="crayon-sy">)</span>

<span class="crayon-v">ME</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span
class="crayon-e">matrix\_estimation</span><span
class="crayon-sy">(</span><span class="crayon-v">A</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">L</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">method</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-s">"me"</span><span
class="crayon-sy">)</span>

<span class="crayon-v">MD</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span
class="crayon-e">matrix\_estimation</span><span
class="crayon-sy">(</span><span class="crayon-v">A</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">L</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">method</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-s">"md"</span><span
class="crayon-sy">)</span>

</td>
</tr>
</table>

<p>
Veja também o vídeo completo de palestra do prof. Rommel Carvalho sobre
<a href="http://ibpad.com.br/index.php/2016/08/16/ciencia-de-dados-no-combate-corrupcao/">Ciência
de Dados no Combate à Corrupção</a>.
</p>
<blockquote>
<p>
Quer aprender R?
<a href="http://www.ibpad.com.br/produto/programacao-em-r/">Conheça
nosso curso de Programação em R. Inscrições abertas em São Paulo e
Brasília</a>
</p>
</blockquote>

</article>
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
quantitativos</a> ,  <a href="http://www.ibpad.com.br/tag/analise-de-redes/">análise
de
redes</a> ,  <a href="http://www.ibpad.com.br/tag/carlos-cinelli/">carlos
cinelli</a> ,  <a href="http://www.ibpad.com.br/tag/estatistica/">estatística</a> ,  <a href="http://www.ibpad.com.br/tag/ibpad/">ibpad</a> ,  <a href="http://www.ibpad.com.br/tag/linguagem-r/">Linguagem
R</a> ,  <a href="http://www.ibpad.com.br/tag/network-risk-measures/">network
risk
measures</a> ,  <a href="http://www.ibpad.com.br/tag/programacao-em-linguagem-r/">Programação
em linguagem
R</a> ,  <a href="http://www.ibpad.com.br/tag/programacao-em-r/">programação
em
R</a> ,  <a href="http://www.ibpad.com.br/tag/programacao-r-estatistica/">Programação
R
estatística</a> ,  <a href="http://www.ibpad.com.br/tag/r/">r</a> ,  <a href="http://www.ibpad.com.br/tag/sistema-financeiro/">sistema
financeiro</a> ,  <a href="http://www.ibpad.com.br/tag/software-r/">software
R</a>

<ul>
<li>
<header class="clearfix">
</header>
<p>
<b>Economista</b>, com mestrado em economia pela Universidade de
Brasília. É analista da área de Risco Sistêmico do Banco Central,
criador do blog Análise Real e especialista em Análise de Dados, com
foco em programação em R e modelos preditivos.
</p>

</li>
</ul>

<p>
<fb:comments-count href="http://www.ibpad.com.br/blog/analise-de-dados/medidas-de-risco-em-analise-de-redes-financeiras/"></fb:comments-count>
comments
</p>

</section>
</p>
<a href="http://www.ibpad.com.br/blog/analise-de-dados/medidas-de-risco-em-analise-de-redes-financeiras/#" class="scroll-up"><span
class="ti-arrow-up"></span></a>

