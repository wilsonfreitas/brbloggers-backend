+++
title = "Capturando dados do Twitter com R"
date = "2016-03-12 16:00:44"
categories = ["IBPAD"]
original_url = "http://www.ibpad.com.br/blog/comunicacao-digital/capturando-dados-do-twitter-com-r/"
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
<a href="http://www.ibpad.com.br/blog/comunicacao-digital/capturando-dados-do-twitter-com-r/" class="single-post-date">
12/03/2016 </a>
<div class="post-inner-content">
<p>
<img class="alignleft wp-image-540" src="https://i1.wp.com/ibpad.com.br/wp-content/uploads/2016/03/Imagem1-1-300x211.png?resize=183%2C138" alt="Twitter R">Um
dos primeiros desafios para qualquer analista de dados oriundos de
mídias sociais é a captura dos dados. Existem vários softwares pagos e
gratuitos, mas nem todos são claros sobre como exatamente esta captura
está sendo realizada. O R, que é gratuito, pode te ajudar bastante nesse
processo.
</p>
<p>
 Mostro aqui o primeiro passo nessa direção.
</p>
<blockquote>
<p>
<span>Carlos Cinelli é professor do curso de
<a href="http://www.ibpad.com.br/produto/programacao-em-r/">Programação
em R </a></span>
</p>
</blockquote>
<p>
A primeira coisa que você tem que fazer é criar uma aplicação no
Twitter,
<a href="https://apps.twitter.com/app/new" class="broken_link">a partir
deste link.</a>
</p>
<p>
Após seguir as instruções do site, você irá copiar os códigos em
<strong>Consumer Key (API Key) </strong>e <strong>Consumer Secret (API
Secret)</strong>.
</p>
<p>
Verifique se o seu nível de acesso (Access Level) está como <strong>Read
and write</strong>, para você poder consultar e tuitar por meio da API.
Em seguida, peça para gerar seus <em>tokens</em> de acesso e copie os
códigos em <strong>Access Token</strong> e <strong>Access Token
Secret</strong>.
</p>
<p>
Uma vez com os códigos em mãos, instale o pacote <code>twitteR</code> na
sua máquina.
</p>
<textarea class="crayon-plain print-no">
install.packages("twitteR")
</textarea>

<table class="crayon-table">
<tr class="crayon-row">
<td class="crayon-nums ">
</td>
<td class="crayon-code">
<span class="crayon-v">install</span><span
class="crayon-sy">.</span><span class="crayon-e">packages</span><span
class="crayon-sy">(</span><span class="crayon-s">"twitteR"</span><span
class="crayon-sy">)</span>

</td>
</tr>
</table>

<p>
Pronto! A a partir de agora você pode tanto consultar quanto tuitar,
retuitar – tudo a partir do R. Vamos fazer alguns testes simples.
Primeiramente precisamos passar as chaves de acesso para o
<code>twitteR</code>.
</p>
<textarea class="crayon-plain print-no">
library(twitteR)   \# coloque suas chaves api\_key             &lt;-
"xxxx" api\_secret          &lt;- "xxxx" access\_token        &lt;-
"xxxx" access\_token\_secret &lt;- "xxxx"  
setup\_twitter\_oauth(api\_key, api\_secret, access\_token,
access\_token\_secret)
</textarea>

<table class="crayon-table">
<tr class="crayon-row">
<td class="crayon-nums ">
</td>
<td class="crayon-code">
<span class="crayon-v">access\_token\_secret</span><span
class="crayon-h"> </span><span class="crayon-o">&lt;</span><span
class="crayon-o">-</span><span class="crayon-h"> </span><span
class="crayon-s">"xxxx"</span>

<span class="crayon-e">setup\_twitter\_oauth</span><span
class="crayon-sy">(</span><span class="crayon-v">api\_key</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">api\_secret</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span
class="crayon-v">access\_token</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">access\_token\_secret</span><span
class="crayon-sy">)</span>

</td>
</tr>
</table>

<br>  

Para começar, que tal buscar os <em>trends</em> de Brasília neste
momento?

<div class="line number9 index8 alt2">
<div id="crayon-5943c4aca3046835554933" class="crayon-syntax crayon-theme-classic crayon-font-monaco crayon-os-pc print-yes notranslate">
<div class="crayon-plain-wrap">
<textarea class="crayon-plain print-no">
woeid -&gt; where on earth id
=============================

455819 é o código de Brasília
=============================

trendsBrasilia &lt;- getTrends(woeid = 455819) \# 10 primeiros apenas
trendsBrasilia$name\[1:10\]&lt;/textarea&gt;&lt;/div&gt; &lt;div class="crayon-main"&gt; &lt;table class="crayon-table"&gt; &lt;tr class="crayon-row"&gt; &lt;td class="crayon-nums "&gt; &lt;/td&gt; &lt;td class="crayon-code"&gt;&lt;div class="crayon-pre"&gt;&lt;div class="crayon-line" id="crayon-5943c4aca3046835554933-1"&gt;&lt;span class="crayon-c"&gt;\# woeid -&gt; where on earth id&lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line crayon-striped-line" id="crayon-5943c4aca3046835554933-2"&gt;&lt;span class="crayon-c"&gt;\# 455819 &\#xE9; o c&\#xF3;digo de Bras&\#xED;lia&lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line" id="crayon-5943c4aca3046835554933-3"&gt;&lt;span class="crayon-v"&gt;trendsBrasilia&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;&lt;&lt;/span&gt;&lt;span class="crayon-o"&gt;-&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-e"&gt;getTrends&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;woeid&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-cn"&gt;455819&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line" id="crayon-5943c4aca3046835554933-5"&gt;&lt;span class="crayon-v"&gt;trendsBrasilia&lt;/span&gt;&lt;span class="crayon-sy"&gt;$</span><span
class="crayon-v">name</span><span class="crayon-sy">\[</span><span
class="crayon-cn">1</span><span class="crayon-o">:</span><span
class="crayon-cn">10</span><span class="crayon-sy">\]</span>
</div>
</div>
</td>
</tr>
</table>
</div>
</div>
<br> Resultado:
</div>
<textarea class="crayon-plain print-no">
  \[1\] "\#PurposeTourVancouver"      "\#ARegraFinal"             
------------------------------------------------------------------

  \[3\] "\#GloboGolpista"             "Louise"                   
-----------------------------------------------------------------

  \[5\] "DIRECTIONERS AO ATAQUE"     "\#SemJesusEu"              
-----------------------------------------------------------------

  \[7\] "\#NoFuturoEu"                "HOJE TEM FLAMENGO"        
-----------------------------------------------------------------

\#\#  \[9\] "Doctor Who Back To Netflix" "Atlanta"
</textarea>

<table class="crayon-table">
<tr class="crayon-row">
<td class="crayon-nums ">
</td>
<td class="crayon-code">
<span class="crayon-c">\#\#  \[1\] "\#PurposeTourVancouver"     
"\#ARegraFinal"             </span>

<span class="crayon-c">\#\#  \[3\] "\#GloboGolpista"            
"Louise"                   </span>

<span class="crayon-c">\#\#  \[5\] "DIRECTIONERS AO ATAQUE"    
"\#SemJesusEu"              </span>

<span class="crayon-c">\#\#  \[7\] "\#NoFuturoEu"                "HOJE
TEM FLAMENGO"        </span>

<span class="crayon-c">\#\#  \[9\] "Doctor Who Back To Netflix"
"Atlanta"</span>

</td>
</tr>
</table>

<br> Os demais <code>woied</code> disponíveis podem ser obtidos com a
função <code>availableTrendLocations()</code>.

<p>
Vejamos outro exemplo: quais os últimos 50 tweets contendo a palavra
‘impeachment’?
</p>
<textarea class="crayon-plain print-no">
imp &lt;- searchTwitter('impeachment', n = 50) imp\[c(1, 25, 50)\]
</textarea>

<table class="crayon-table">
<tr class="crayon-row">
<td class="crayon-nums ">
</td>
<td class="crayon-code">
<span class="crayon-v">imp</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span
class="crayon-e">searchTwitter</span><span
class="crayon-sy">(</span><span
class="crayon-s">'impeachment'</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">n</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-cn">50</span><span class="crayon-sy">)</span>

</td>
</tr>
</table>

<br>  

<textarea class="crayon-plain print-no">
  \#\# \[\[1\]\] \#\# \[1\] "GeizeStella: RT @BlogOlhoNaMira:
Específico: impeachment. Pedir fim da corrupção pra deputado corrupto é
mandar lembrança pra quem não conhece [https://t…"](https://t…%22) \#\#
\#\# \[\[2\]\] \#\# \[1\] "paulogmmoura: De acordo com a literatura
sobre impeachment, a consistência e a extensão dos protestos de rua são
os aspectos... <https://t.co/W3H92BUXtu%22> \#\# \#\# \[\[3\]\] \#\#
\[1\] "prof\_xico: RT @radaronline: Se impeachment passar, TSE deve
sustar processo contra Temer <https://t.co/y9tCw6jWJf%22>
</textarea>

<table class="crayon-table">
<tr class="crayon-row">
<td class="crayon-nums ">
</td>
<td class="crayon-code">
<span class="crayon-c">\#\# \[1\] "GeizeStella: RT @BlogOlhoNaMira:
Específico: impeachment. Pedir fim da corrupção pra deputado corrupto é
mandar lembrança pra quem não conhece
[https://t…"](https://t…%22)</span>

<span class="crayon-c">\#\# \[1\] "paulogmmoura: De acordo com a
literatura sobre impeachment, a consistência e a extensão dos protestos
de rua são os aspectos... <https://t.co/W3H92BUXtu%22></span>

<span class="crayon-c">\#\# \[1\] "prof\_xico: RT @radaronline: Se
impeachment passar, TSE deve sustar processo contra Temer
<https://t.co/y9tCw6jWJf%22></span>

</td>
</tr>
</table>

<p>
E, como último exemplo, vamos utilizar a função <code>tweet()</code>
para tuitar diretamente do R.
</p>
<textarea class="crayon-plain print-no">
tweet("Tweet gerado com twitteR
<https://cran.r-project.org/web/packages/twitteR/index.html%22>)
</textarea>

<table class="crayon-table">
<tr class="crayon-row">
<td class="crayon-nums ">
</td>
<td class="crayon-code">
<span class="crayon-e">tweet</span><span class="crayon-sy">(</span><span
class="crayon-s">"Tweet gerado com twitteR
<https://cran.r-project.org/web/packages/twitteR/index.html%22></span><span
class="crayon-sy">)</span>

</td>
</tr>
</table>

<blockquote class="twitter-tweet">
<p>
Tweet gerado com twitteR
<a href="https://t.co/LN62PvMBMB">https://t.co/LN62PvMBMB</a>
</p>
<p>
— Análise Real (@analisereal)
<a href="https://twitter.com/analisereal/status/706263873997946880">March
5, 2016</a>
</p>
</blockquote>

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
quantitativos</a> ,  <a href="http://www.ibpad.com.br/tag/captura-de-dados/">captura
de
dados</a> ,  <a href="http://www.ibpad.com.br/tag/comunicacao-digital/">comunicação
digital</a> ,  <a href="http://www.ibpad.com.br/tag/estatistica/">estatística</a> ,  <a href="http://www.ibpad.com.br/tag/ibpad/">ibpad</a> ,  <a href="http://www.ibpad.com.br/tag/linguagem-r/">Linguagem
R</a> ,  <a href="http://www.ibpad.com.br/tag/monitoramento/">monitoramento</a> ,  <a href="http://www.ibpad.com.br/tag/programacao-em-linguagem-r/">Programação
em linguagem
R</a> ,  <a href="http://www.ibpad.com.br/tag/programacao-em-r/">programação
em
R</a> ,  <a href="http://www.ibpad.com.br/tag/programacao-r-estatistica/">Programação
R
estatística</a> ,  <a href="http://www.ibpad.com.br/tag/r/">r</a> ,  <a href="http://www.ibpad.com.br/tag/software-r/">software
R</a> ,  <a href="http://www.ibpad.com.br/tag/twitter/">twitter</a> ,  <a href="http://www.ibpad.com.br/tag/twitterr/">twitterR</a>

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
<fb:comments-count href="http://www.ibpad.com.br/blog/comunicacao-digital/capturando-dados-do-twitter-com-r/"></fb:comments-count>
comments
</p>
</div>
</div>
</div>
</div>
</section>
</p>
<a href="http://www.ibpad.com.br/blog/comunicacao-digital/capturando-dados-do-twitter-com-r/#" class="scroll-up"><span
class="ti-arrow-up"></span></a>
</div>
</div>

