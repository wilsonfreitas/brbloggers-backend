+++
title = "Criando GIFs no R"
date = "2016-09-19 16:59:38"
categories = ["IBPAD"]
original_url = "http://www.ibpad.com.br/blog/analise-de-dados/criando-gifs-no-r/"
+++

<div>
<div class="main-container">
<header class="kopa-page-header-1">
</header>
<p id="main-content">
<section class="post-content">
<div class="container">
<div class="row">
<div class="main-col col-md-8 col-sm-8 col-xs-8">
<div class="single-entry-item">
<article class="entry-item">
<div class="entry-content">
<a href="http://www.ibpad.com.br/blog/analise-de-dados/criando-gifs-no-r/" class="single-post-date">
19/09/2016 </a>
<div class="post-inner-content">
<p>
<em>\[Texto do prof.
<a href="http://www.ibpad.com.br/team-member/robert-mcdonnell/">Robert
McDonnell</a>, responsável pelo curso de
<a href="http://www.ibpad.com.br/produto/programacao-em-r/">Programação
em R</a> do IBPAD\]</em>
</p>
<p>
<img class="alignleft" src="https://i1.wp.com/ibpad.com.br/wp-content/uploads/2016/09/download-2.gif?resize=203%2C282">R
é famoso por suas capacidades gráficas, mas podemos integrá-lo com
browsers modernos da internet para criar gráficos cada vez mais úteis.
Por exemplo, podemos mostrar a mudança numa variável sobre valores de
duas outras variáveis usando gifs. Neste post, eu vou mostrar como criar
um gráfico gif no R que demostra os preços
de<a href="http://seriesestatisticas.ibge.gov.br/series.aspx?vcodigo=PRECO415">
casas e construção </a>no Brasil de 2000 até 2016 por cada estado. O
formato gif nos permite fazer isso num gráfico só; senão, precisaríamos
de 27 gráficos separados ou um gráfico muito confuso.<br> Primeiro,
vamos importar os dados, que são do IBGE, no R. Nós vamos ler do meu
github, usando uma função que organiza os dados e arrumá-los do jeito
que precisamos. (Para saber mais da função, simplesmente digite o nome
dela no console do R.) Se você não tem algum dos pacotes que eu uso
abaixo, vai precisar o instalar com a função install.packages(” “), com
o nome do pacote entre aspas.
</p>
<textarea class="crayon-plain print-no">
library(tidyverse) library(devtools) library(lubridate) library(stringr)
preco &lt;-
read\_csv("<https://raw.githubusercontent.com/RobertMyles/various/master/data/series_historicas.csv%22>)
source\_gist("82320196db01c1c95e152955e5de9edc", filename =
"clean\_ibge.R", sha1 = "c18480aa7c67ccc9ae6756310e41bcb3351d455f")
preco &lt;- clean\_ibge(preco)
</textarea>

<table class="crayon-table">
<tr class="crayon-row">
<td class="crayon-nums ">
</td>
<td class="crayon-code">
<span class="crayon-v">preco</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span class="crayon-e">read\_csv</span><span
class="crayon-sy">(</span><span
class="crayon-s">"<https://raw.githubusercontent.com/RobertMyles/various/master/data/series_historicas.csv%22></span><span
class="crayon-sy">)</span>

<span class="crayon-e">source\_gist</span><span
class="crayon-sy">(</span><span
class="crayon-s">"82320196db01c1c95e152955e5de9edc"</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">filename</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-s">"clean\_ibge.R"</span><span class="crayon-sy">,</span>

<span class="crayon-h">            </span><span
class="crayon-v">sha1</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-s">"c18480aa7c67ccc9ae6756310e41bcb3351d455f"</span><span
class="crayon-sy">)</span>

<span class="crayon-v">preco</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span class="crayon-e">clean\_ibge</span><span
class="crayon-sy">(</span><span class="crayon-v">preco</span><span
class="crayon-sy">)</span>

</td>
</tr>
</table>

<p>
Agora os dados estão no formato que precisamos. Para criar o gif, vamos
usar mais três pacotes do R. Neste primeiro gif, o intervalo entre
transições é controlado pelo interval.
</p>
<div id="crayon-5943bb4aa1826941623727" class="crayon-syntax crayon-theme-github crayon-font-monaco crayon-os-pc print-yes notranslate">
<div class="crayon-plain-wrap">
<textarea class="crayon-plain print-no">
library(ggplot2) library(scales) library(gganimate) p &lt;-
ggplot(preco, aes(time, sum, color = UF, frame = UF)) +
geom\_line(aes(cumulative = FALSE)) + theme\_minimal() +
theme(legend.position="none") +
scale\_y\_continuous(labels=dollar\_format(prefix="R$&quot;)) gg\_animate(p, title\_frame = T, interval=3)&lt;/textarea&gt;&lt;/div&gt; &lt;div class="crayon-main"&gt; &lt;table class="crayon-table"&gt; &lt;tr class="crayon-row"&gt; &lt;td class="crayon-nums "&gt; &lt;/td&gt; &lt;td class="crayon-code"&gt;&lt;div class="crayon-pre"&gt;&lt;div class="crayon-line" id="crayon-5943bb4aa1826941623727-5"&gt;&lt;span class="crayon-v"&gt;p&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;&lt;&lt;/span&gt;&lt;span class="crayon-o"&gt;-&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-e"&gt;ggplot&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;preco&lt;/span&gt;&lt;span class="crayon-sy"&gt;,&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-e"&gt;aes&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;time&lt;/span&gt;&lt;span class="crayon-sy"&gt;,&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-v"&gt;sum&lt;/span&gt;&lt;span class="crayon-sy"&gt;,&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-v"&gt;color&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-v"&gt;UF&lt;/span&gt;&lt;span class="crayon-sy"&gt;,&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-v"&gt;frame&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-v"&gt;UF&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;+&lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line crayon-striped-line" id="crayon-5943bb4aa1826941623727-6"&gt;&lt;span class="crayon-h"&gt;&\#xA0;&\#xA0;&lt;/span&gt;&lt;span class="crayon-e"&gt;geom\_line&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-e"&gt;aes&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;cumulative&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-t"&gt;FALSE&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;+&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line crayon-striped-line" id="crayon-5943bb4aa1826941623727-8"&gt;&lt;span class="crayon-h"&gt;&\#xA0;&\#xA0;&lt;/span&gt;&lt;span class="crayon-e"&gt;theme&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;legend&lt;/span&gt;&lt;span class="crayon-sy"&gt;.&lt;/span&gt;&lt;span class="crayon-v"&gt;position&lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-s"&gt;&quot;none&quot;&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;+&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line" id="crayon-5943bb4aa1826941623727-9"&gt;&lt;span class="crayon-h"&gt;&\#xA0;&\#xA0;&lt;/span&gt;&lt;span class="crayon-e"&gt;scale\_y\_continuous&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;labels&lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-e"&gt;dollar\_format&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;prefix&lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-s"&gt;&quot;R$"</span><span
class="crayon-sy">)</span><span class="crayon-sy">)</span>
</div>
<span class="crayon-e">gg\_animate</span><span
class="crayon-sy">(</span><span class="crayon-v">p</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">title\_frame</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-t">T</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">interval</span><span
class="crayon-o">=</span><span class="crayon-cn">3</span><span
class="crayon-sy">)</span>

</div>
</td>
</tr>
</table>
</div>
</div>
<p>
<img class="aligncenter" src="https://i2.wp.com/ibpad.com.br/wp-content/uploads/2016/09/download.gif?w=900" alt="download.gif (480&#xD7;480)">
</p>
<p>
E neste segundo, usamos <span id="crayon-5943bb4aa1829629859040"
class="crayon-syntax crayon-syntax-inline crayon-theme-classic crayon-theme-classic-inline crayon-font-monaco"><span
class="crayon-pre crayon-code"><span
class="crayon-v">cumulative</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-t">TRUE</span></span></span>  para colocar as linhas dos
preços uma em cima da outra.
</p>
<div id="crayon-5943bb4aa182c763120726" class="crayon-syntax crayon-theme-github crayon-font-monaco crayon-os-pc print-yes notranslate">
<div class="crayon-plain-wrap">
<textarea class="crayon-plain print-no">
q &lt;- ggplot(preco, aes(time, sum, color = UF, frame = UF)) +
geom\_line(aes(cumulative = TRUE)) + theme\_minimal() +
theme(legend.position="none") +
scale\_y\_continuous(labels=dollar\_format(prefix="R$&quot;)) gg\_animate(q, title\_frame = T, interval=2)&lt;/textarea&gt;&lt;/div&gt; &lt;div class="crayon-main"&gt; &lt;table class="crayon-table"&gt; &lt;tr class="crayon-row"&gt; &lt;td class="crayon-nums "&gt; &lt;/td&gt; &lt;td class="crayon-code"&gt;&lt;div class="crayon-pre"&gt;&lt;div class="crayon-line" id="crayon-5943bb4aa182c763120726-1"&gt;&lt;span class="crayon-v"&gt;q&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;&lt;&lt;/span&gt;&lt;span class="crayon-o"&gt;-&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-e"&gt;ggplot&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;preco&lt;/span&gt;&lt;span class="crayon-sy"&gt;,&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-e"&gt;aes&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;time&lt;/span&gt;&lt;span class="crayon-sy"&gt;,&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-v"&gt;sum&lt;/span&gt;&lt;span class="crayon-sy"&gt;,&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-v"&gt;color&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-v"&gt;UF&lt;/span&gt;&lt;span class="crayon-sy"&gt;,&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-v"&gt;frame&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-v"&gt;UF&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;+&lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line crayon-striped-line" id="crayon-5943bb4aa182c763120726-2"&gt;&lt;span class="crayon-h"&gt;&\#xA0;&\#xA0;&lt;/span&gt;&lt;span class="crayon-e"&gt;geom\_line&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-e"&gt;aes&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;cumulative&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-t"&gt;TRUE&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;+&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line crayon-striped-line" id="crayon-5943bb4aa182c763120726-4"&gt;&lt;span class="crayon-h"&gt;&\#xA0;&\#xA0;&lt;/span&gt;&lt;span class="crayon-e"&gt;theme&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;legend&lt;/span&gt;&lt;span class="crayon-sy"&gt;.&lt;/span&gt;&lt;span class="crayon-v"&gt;position&lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-s"&gt;&quot;none&quot;&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;+&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line" id="crayon-5943bb4aa182c763120726-5"&gt;&lt;span class="crayon-h"&gt;&\#xA0;&\#xA0;&lt;/span&gt;&lt;span class="crayon-e"&gt;scale\_y\_continuous&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;labels&lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-e"&gt;dollar\_format&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;prefix&lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-s"&gt;&quot;R$"</span><span
class="crayon-sy">)</span><span class="crayon-sy">)</span>
</div>
<span class="crayon-e">gg\_animate</span><span
class="crayon-sy">(</span><span class="crayon-v">q</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">title\_frame</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-t">T</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">interval</span><span
class="crayon-o">=</span><span class="crayon-cn">2</span><span
class="crayon-sy">)</span>

</div>
</td>
</tr>
</table>
</div>
</div>
<p>
<img class="aligncenter" src="https://i1.wp.com/ibpad.com.br/wp-content/uploads/2016/09/download-2.gif?w=900">
</p>
<p>
Com o pacote ggplot2 e tudo que pode-se construir cima dele, é muito
fácil customizar os gráficos. Exemplos podem ser vistos
<a href="https://github.com/dgrtwo/gganimate">aqui</a> e as opções de
animação podem ser estendidas com o pacote tweenr.
</p>
<p>
—
</p>
<p>
<a href="http://www.ibpad.com.br/produto/programacao-em-r/">Quer
aprender R? Conheça nosso curso!
</a><a href="http://www.ibpad.com.br/produto/programacao-em-r/">Turmas
abertas em São Paulo e no Rio de Janeiro.</a>
</p>
</div>
</div>
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
quantitativos</a> ,  <a href="http://www.ibpad.com.br/tag/estatistica/">estatística</a> ,  <a href="http://www.ibpad.com.br/tag/gif/">gif</a> ,  <a href="http://www.ibpad.com.br/tag/ibge/">ibge</a> ,  <a href="http://www.ibpad.com.br/tag/ibpad/">ibpad</a> ,  <a href="http://www.ibpad.com.br/tag/linguagem-r/">Linguagem
R</a> ,  <a href="http://www.ibpad.com.br/tag/precos/">preços</a> ,  <a href="http://www.ibpad.com.br/tag/programacao-em-linguagem-r/">Programação
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
Pesquisador e Cientista de Dados, doutorado em Relações Internacionais
pela USP. Especialista em R, Visualização de Dados e estatística
Bayesiana.
</p>

</li>
</ul>

</div>
</div>
</div>
</div>
</section>
</p>
<a href="http://www.ibpad.com.br/blog/analise-de-dados/criando-gifs-no-r/#" class="scroll-up"><span
class="ti-arrow-up"></span></a>
</div>
</div>

