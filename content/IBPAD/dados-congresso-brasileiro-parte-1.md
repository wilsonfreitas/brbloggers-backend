+++
title = "Dados do Congresso Brasileiro – Parte 1"
date = "2017-05-01 15:18:31"
categories = ["IBPAD"]
original_url = "http://www.ibpad.com.br/blog/dados-congresso-brasileiro-parte-1/"
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
<a href="http://www.ibpad.com.br/blog/dados-congresso-brasileiro-parte-1/" class="single-post-date">
01/05/2017 </a>
<div class="post-inner-content">
<p>
O movimento por Dados Abertos está contribuindo imensamente para uma
maior transparência e consequente maior fiscalização. Mas outro ponto
super relevante é como os nossos cientistas políticos estão adorando
todo esse processo. Nunca foi tão fácil obter dados que antes eram
extremamente trabalhosos e difíceis de serem obtidos.
</p>
<p>
A mais recente novidade é o pacote para R
<a href="https://cran.r-project.org/web/packages/congressbr/">congressbr</a>,
desenvolvido por Guilherme Duarte e Robert McDonnell
(<a href="http://www.ibpad.com.br/produto/programacao-em-r-sp">professores
dos cursos de R do IBPAD</a>) e Danilo Freire. O que o pacote faz é
buscar nas APIs da Câmara dos Deputados e Senado Federal os dados e é
uma “mão na roda”. Muitas vezes os dados das APIs são bem confusos e,
principalmente, Senado e Câmara não se conversam muito.
</p>
<p>
Vou mostrar um rápido exemplo do pacote:
</p>
<div id="crayon-59439e00b5de9987220454" class="crayon-syntax crayon-theme-classic crayon-font-monaco crayon-os-pc print-yes notranslate">
<div class="crayon-plain-wrap">
<textarea class="crayon-plain print-no">
Instalando o pacote direto do repositório do GitHub
===================================================

devtools::install\_github("RobertMyles/congressbr") \#Carregando o
pacote library("congressbr") \#Buscando a lista de PLs na Câmara em
2017. Você pode escolher entre "PEC" e outras proposições. PLsCamara
&lt;- cham\_bills(type = "PL", year = 2017) \#Buscando as informações
detalhadas de cada PL datalist = list() \#criando uma lista vazia for(i
in 1:nrow(PLsCamara)){ cat(i, "") dat2 &lt;-
cham\_bill\_info\_id(PLsCamara$bill\_id\[i\]) datalist\[\[i\]\] &lt;- dat2 \# adicionando cada chamada na minha lista } \#transformando minha lista em um dataframe PLDetalhadosCamara &lt;- dplyr::bind\_rows(datalist)&lt;/textarea&gt;&lt;/div&gt; &lt;div class="crayon-main"&gt; &lt;table class="crayon-table"&gt; &lt;tr class="crayon-row"&gt; &lt;td class="crayon-nums "&gt; &lt;div class="crayon-nums-content"&gt;&lt;/div&gt; &lt;/td&gt; &lt;td class="crayon-code"&gt;&lt;div class="crayon-pre"&gt;&lt;div class="crayon-line" id="crayon-59439e00b5de9987220454-1"&gt;&lt;span class="crayon-c"&gt;\#Instalando o pacote direto do reposit&\#xF3;rio do GitHub&lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line crayon-striped-line" id="crayon-59439e00b5de9987220454-2"&gt;&lt;span class="crayon-v"&gt;devtools&lt;/span&gt;&lt;span class="crayon-o"&gt;::&lt;/span&gt;&lt;span class="crayon-e"&gt;install\_github&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-s"&gt;&quot;RobertMyles/congressbr&quot;&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line crayon-striped-line" id="crayon-59439e00b5de9987220454-8"&gt;&lt;span class="crayon-c"&gt;\#Buscando a lista de PLs na C&\#xE2;mara em 2017. Voc&\#xEA; pode escolher entre &quot;PEC&quot; e outras proposi&\#xE7;&\#xF5;es.&lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line crayon-striped-line" id="crayon-59439e00b5de9987220454-10"&gt;&lt;span class="crayon-v"&gt;PLsCamara&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;&lt;&lt;/span&gt;&lt;span class="crayon-o"&gt;-&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-e"&gt;cham\_bills&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;type&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-s"&gt;&quot;PL&quot;&lt;/span&gt;&lt;span class="crayon-sy"&gt;,&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-v"&gt;year&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-cn"&gt;2017&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line" id="crayon-59439e00b5de9987220454-13"&gt;&lt;span class="crayon-c"&gt;\#Buscando as informa&\#xE7;&\#xF5;es detalhadas de cada PL&lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line" id="crayon-59439e00b5de9987220454-15"&gt;&lt;span class="crayon-v"&gt;datalist&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-e"&gt;list&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-c"&gt;\#criando uma lista vazia&lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line" id="crayon-59439e00b5de9987220454-17"&gt;&lt;span class="crayon-st"&gt;for&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-i"&gt;i&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-st"&gt;in&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-cn"&gt;1&lt;/span&gt;&lt;span class="crayon-o"&gt;:&lt;/span&gt;&lt;span class="crayon-e"&gt;nrow&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;PLsCamara&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;span class="crayon-sy"&gt;{&lt;/span&gt;&lt;/div&gt;&lt;div class="crayon-line" id="crayon-59439e00b5de9987220454-19"&gt;&lt;span class="crayon-h"&gt;&\#xA0;&\#xA0;&\#xA0;&\#xA0;&lt;/span&gt;&lt;span class="crayon-v"&gt;dat2&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;&lt;&lt;/span&gt;&lt;span class="crayon-o"&gt;-&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-e"&gt;cham\_bill\_info\_id&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;PLsCamara&lt;/span&gt;&lt;span class="crayon-sy"&gt;$</span><span
class="crayon-v">bill\_id</span><span class="crayon-sy">\[</span><span
class="crayon-v">i</span><span class="crayon-sy">\]</span><span
class="crayon-sy">)</span>
</div>
<span class="crayon-h">  </span><span
class="crayon-v">datalist</span><span class="crayon-sy">\[</span><span
class="crayon-sy">\[</span><span
class="crayon-v">i</span><span class="crayon-sy">\]</span><span class="crayon-sy">\]</span><span
class="crayon-h"> </span><span class="crayon-o">&lt;</span><span
class="crayon-o">-</span><span class="crayon-h"> </span><span
class="crayon-v">dat2</span><span class="crayon-h"> </span><span
class="crayon-c">\# adicionando cada chamada na minha lista</span>

<span class="crayon-c">\#transformando minha lista em um
dataframe</span>

<span class="crayon-v">PLDetalhadosCamara</span><span class="crayon-h">
</span><span class="crayon-o">&lt;</span><span
class="crayon-o">-</span><span class="crayon-h"> </span><span
class="crayon-v">dplyr</span><span class="crayon-o">::</span><span
class="crayon-e">bind\_rows</span><span class="crayon-sy">(</span><span
class="crayon-v">datalist</span><span class="crayon-sy">)</span>

</div>
</td>
</tr>
</table>
</div>
</div>
<p>
Depois de ter rodado esse código, você terá um data.frame com
informações detalhadas de todos os PLs que foram apresentados em 2017.
Uma variável que eu acho super legal é a variável de <span
id="crayon-59439e00b5df3487138666"
class="crayon-syntax crayon-syntax-inline crayon-theme-classic crayon-theme-classic-inline crayon-font-monaco"><span
class="crayon-pre crayon-code"><span
class="crayon-v">bill\_index</span></span></span> . Essa é uma variável
de texto com a indexação em termos da proposição. Quem faz a inserção é
a Mesa da Câmara dos Deputados, o que nos garante uma certa qualidade
nos termos. Vou utilizar essa variável para fazer alguns tratamentos de
texto e entender um pouco o que nossos Deputados Federais andaram
apresentando em 2017.
</p>
<div id="crayon-59439e00b5df7379738484" class="crayon-syntax crayon-theme-classic crayon-font-monaco crayon-os-pc print-yes notranslate">
<div class="crayon-plain-wrap">
<textarea class="crayon-plain print-no">
carregando o pacote TM
======================

library(tm) \#definindo meu corpus myCorpus &lt;-
Corpus(VectorSource(PLDetalhadosCamara$bill\_index)) \#procedimentos de limpeza e tratamento \#deixando tudo min&\#xFA;sculo, removendo espa&\#xE7;os e pontua&\#xE7;&\#xE3;o myCorpus &lt;- tm\_map(myCorpus, content\_transformer(tolower)) myCorpus &lt;- tm\_map(myCorpus, stripWhitespace) myCorpus &lt;- tm\_map(myCorpus,removePunctuation) \#removendo palavras que atrapalhariam a an&\#xE1;lise, atente-se que estou utilizando um dicion&\#xE1;rio padr&\#xE3;o de &quot;stopwords&quot; do pacote e um conjunto de outros termos, ok? voc&\#xEA; pode continuar essa lista ou remover alguns termos da&\#xED; tamb&\#xE9;m. limpeza = c(stopwords(&quot;portuguese&quot;), &quot;federal&quot;, &quot;lei&quot;, &quot;nacional&quot;, &quot;alteracao&quot;, &quot;criacao&quot;) myCorpus = tm\_map(myCorpus, removeWords, limpeza) \#gerando as tabelas de frequencia myCorpus &lt;- tm\_map(myCorpus, PlainTextDocument) tdm &lt;- TermDocumentMatrix(myCorpus, control = list(wordLengths = c(1, Inf))) tdm dtm &lt;- as.DocumentTermMatrix(tdm) (freq.terms &lt;- findFreqTerms(tdm, lowfreq = 2)) term.freq &lt;- rowSums(as.matrix(tdm)) \#optei por deixar um valor m&\#xED;nimo de frequencia de 2 nos termos. voc&\#xEA; pode trabalhar isso conforme desejar. term.freq &lt;- subset(term.freq, term.freq &gt;= 2) term.freqdf &lt;- data.frame(term = names(term.freq), freq = term.freq)&lt;/textarea&gt;&lt;/div&gt; &lt;div class="crayon-main"&gt; &lt;table class="crayon-table"&gt; &lt;tr class="crayon-row"&gt; &lt;td class="crayon-nums "&gt; &lt;div class="crayon-nums-content"&gt;&lt;/div&gt; &lt;/td&gt; &lt;td class="crayon-code"&gt;&lt;div class="crayon-pre"&gt;&lt;div class="crayon-line" id="crayon-59439e00b5df7379738484-5"&gt;&lt;span class="crayon-v"&gt;myCorpus&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;&lt;&lt;/span&gt;&lt;span class="crayon-o"&gt;-&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-e"&gt;Corpus&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-e"&gt;VectorSource&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;PLDetalhadosCamara&lt;/span&gt;&lt;span class="crayon-sy"&gt;$</span><span
class="crayon-v">bill\_index</span><span class="crayon-sy">)</span><span
class="crayon-sy">)</span>
</div>
<span class="crayon-c">\#procedimentos de limpeza e tratamento</span>

<span class="crayon-c">\#deixando tudo minúsculo, removendo espaços e
pontuação</span>

<span class="crayon-v">myCorpus</span><span class="crayon-h">
</span><span class="crayon-o">&lt;</span><span
class="crayon-o">-</span><span class="crayon-h"> </span><span
class="crayon-e">tm\_map</span><span class="crayon-sy">(</span><span
class="crayon-v">myCorpus</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span
class="crayon-e">content\_transformer</span><span
class="crayon-sy">(</span><span class="crayon-v">tolower</span><span
class="crayon-sy">)</span><span class="crayon-sy">)</span>

<span class="crayon-v">myCorpus</span><span class="crayon-h">
</span><span class="crayon-o">&lt;</span><span
class="crayon-o">-</span><span class="crayon-h"> </span><span
class="crayon-e">tm\_map</span><span class="crayon-sy">(</span><span
class="crayon-v">myCorpus</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span
class="crayon-v">stripWhitespace</span><span class="crayon-sy">)</span>

<span class="crayon-v">myCorpus</span><span class="crayon-h">
</span><span class="crayon-o">&lt;</span><span
class="crayon-o">-</span><span class="crayon-h"> </span><span
class="crayon-e">tm\_map</span><span class="crayon-sy">(</span><span
class="crayon-v">myCorpus</span><span class="crayon-sy">,</span><span
class="crayon-v">removePunctuation</span><span
class="crayon-sy">)</span>

<span class="crayon-c">\#removendo palavras que atrapalhariam a análise,
atente-se que estou utilizando um dicionário padrão de "stopwords" do
pacote e um conjunto de outros termos, ok? você pode continuar essa
lista ou remover alguns termos daí também.</span>

<span class="crayon-v">limpeza</span><span class="crayon-h">
</span><span class="crayon-o">=</span><span class="crayon-h">
</span><span class="crayon-e">c</span><span
class="crayon-sy">(</span><span class="crayon-e">stopwords</span><span
class="crayon-sy">(</span><span
class="crayon-s">"portuguese"</span><span
class="crayon-sy">)</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span>

<span class="crayon-h">              </span><span
class="crayon-s">"federal"</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-s">"lei"</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-s">"nacional"</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-s">"alteracao"</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-s">"criacao"</span><span class="crayon-sy">)</span>

<span class="crayon-v">myCorpus</span><span class="crayon-h">
</span><span class="crayon-o">=</span><span class="crayon-h">
</span><span class="crayon-e">tm\_map</span><span
class="crayon-sy">(</span><span class="crayon-v">myCorpus</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">removeWords</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">limpeza</span><span
class="crayon-sy">)</span>

<span class="crayon-c">\#gerando as tabelas de frequencia</span>

<span class="crayon-v">myCorpus</span><span class="crayon-h">
</span><span class="crayon-o">&lt;</span><span
class="crayon-o">-</span><span class="crayon-h"> </span><span
class="crayon-e">tm\_map</span><span class="crayon-sy">(</span><span
class="crayon-v">myCorpus</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span
class="crayon-v">PlainTextDocument</span><span
class="crayon-sy">)</span>

<span class="crayon-v">tdm</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span
class="crayon-e">TermDocumentMatrix</span><span
class="crayon-sy">(</span><span class="crayon-v">myCorpus</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span>

<span class="crayon-h">                          </span><span
class="crayon-v">control</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-e">list</span><span class="crayon-sy">(</span><span
class="crayon-v">wordLengths</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-e">c</span><span class="crayon-sy">(</span><span
class="crayon-cn">1</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-t">Inf</span><span
class="crayon-sy">)</span><span class="crayon-sy">)</span><span
class="crayon-sy">)</span>

<span class="crayon-v">dtm</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span class="crayon-st">as</span><span
class="crayon-sy">.</span><span
class="crayon-e">DocumentTermMatrix</span><span
class="crayon-sy">(</span><span class="crayon-v">tdm</span><span
class="crayon-sy">)</span>

<span class="crayon-sy">(</span><span class="crayon-v">freq</span><span
class="crayon-sy">.</span><span class="crayon-v">terms</span><span
class="crayon-h"> </span><span class="crayon-o">&lt;</span><span
class="crayon-o">-</span><span class="crayon-h"> </span><span
class="crayon-e">findFreqTerms</span><span
class="crayon-sy">(</span><span class="crayon-v">tdm</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">lowfreq</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-cn">2</span><span class="crayon-sy">)</span><span
class="crayon-sy">)</span><span class="crayon-h"> </span>

<span class="crayon-v">term</span><span class="crayon-sy">.</span><span
class="crayon-v">freq</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span class="crayon-e">rowSums</span><span
class="crayon-sy">(</span><span class="crayon-st">as</span><span
class="crayon-sy">.</span><span class="crayon-e">matrix</span><span
class="crayon-sy">(</span><span class="crayon-v">tdm</span><span
class="crayon-sy">)</span><span class="crayon-sy">)</span>

<span class="crayon-c">\#optei por deixar um valor mínimo de frequencia
de 2 nos termos. você pode trabalhar isso conforme desejar.</span>

<span class="crayon-v">term</span><span class="crayon-sy">.</span><span
class="crayon-v">freq</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span class="crayon-e">subset</span><span
class="crayon-sy">(</span><span class="crayon-v">term</span><span
class="crayon-sy">.</span><span class="crayon-v">freq</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">term</span><span class="crayon-sy">.</span><span
class="crayon-v">freq</span><span class="crayon-h"> </span><span
class="crayon-o">&gt;=</span><span class="crayon-h"> </span><span
class="crayon-cn">2</span><span class="crayon-sy">)</span><span
class="crayon-h"> </span>

<span class="crayon-v">term</span><span class="crayon-sy">.</span><span
class="crayon-v">freqdf</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span class="crayon-v">data</span><span
class="crayon-sy">.</span><span class="crayon-e">frame</span><span
class="crayon-sy">(</span><span class="crayon-v">term</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-e">names</span><span
class="crayon-sy">(</span><span class="crayon-v">term</span><span
class="crayon-sy">.</span><span class="crayon-v">freq</span><span
class="crayon-sy">)</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">freq</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-v">term</span><span
class="crayon-sy">.</span><span class="crayon-v">freq</span><span
class="crayon-sy">)</span>

</div>
</td>
</tr>
</table>
</div>
</div>
<p>
Os tratamentos feitos aqui são “padrões” e é muito provável que você vá
utilizá-los em bases diferentes. Vou mostrar nesse post uma simples
nuvem de palavras e nos próximos posts pretendo avançar um pouco na área
de “text mining”.
</p>
<textarea class="crayon-plain print-no">
carregando o pacote
===================

library(wordcloud) \#vou colocar uma semente aqui para quando você gerar
aí a nuvem ficar igual set.seed(1234) \#gerando a nuvem wordcloud(words
=
term.freqdf*t**e**r**m*, *f**r**e**q* = *t**e**r**m*.*f**r**e**q**d**f*freq,
min.freq = 1, max.words=200, random.order=FALSE, rot.per=0,
colors=brewer.pal(8, "Dark2"))
</textarea>

<table class="crayon-table">
<tr class="crayon-row">
<td class="crayon-nums ">
</td>
<td class="crayon-code">
<span class="crayon-p">\#vou colocar uma semente aqui para quando você
gerar aí a nuvem ficar igual</span>

<span class="crayon-e">wordcloud</span><span
class="crayon-sy">(</span><span class="crayon-v">words</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-v">term</span><span
class="crayon-sy">.</span><span class="crayon-v">freqdf</span><span
class="crayon-sy">$&lt;/span&gt;&lt;span class="crayon-v"&gt;term&lt;/span&gt;&lt;span class="crayon-sy"&gt;,&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-v"&gt;freq&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;=&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-v"&gt;term&lt;/span&gt;&lt;span class="crayon-sy"&gt;.&lt;/span&gt;&lt;span class="crayon-v"&gt;freqdf&lt;/span&gt;&lt;span class="crayon-sy"&gt;$</span><span
class="crayon-v">freq</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">min</span><span
class="crayon-sy">.</span><span class="crayon-v">freq</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-cn">1</span><span
class="crayon-sy">,</span>

<span class="crayon-h">          </span><span
class="crayon-v">max</span><span class="crayon-sy">.</span><span
class="crayon-v">words</span><span class="crayon-o">=</span><span
class="crayon-cn">200</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">random</span><span
class="crayon-sy">.</span><span class="crayon-v">order</span><span
class="crayon-o">=</span><span class="crayon-t">FALSE</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">rot</span><span class="crayon-sy">.</span><span
class="crayon-v">per</span><span class="crayon-o">=</span><span
class="crayon-cn">0</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span>

<span class="crayon-h">          </span><span
class="crayon-v">colors</span><span class="crayon-o">=</span><span
class="crayon-v">brewer</span><span class="crayon-sy">.</span><span
class="crayon-e">pal</span><span class="crayon-sy">(</span><span
class="crayon-cn">8</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-s">"Dark2"</span><span
class="crayon-sy">)</span><span class="crayon-sy">)</span>

</td>
</tr>
</table>

<p>
Resultado:
</p>
<p>
<img class="alignnone size-full wp-image-5829" src="https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/05/camaraPL2017.png?w=808%20808w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/05/camaraPL2017.png?resize=260%2C132%20260w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/05/camaraPL2017.png?resize=768%2C391%20768w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/05/camaraPL2017.png?resize=100%2C51%20100w" alt="" srcset="https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/05/camaraPL2017.png?w=808 808w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/05/camaraPL2017.png?resize=260%2C132 260w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/05/camaraPL2017.png?resize=768%2C391 768w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/05/camaraPL2017.png?resize=100%2C51 100w">
</p>
<p>
Resultado simples, mas tenho certeza que você já pensou em vááárias
possibilidades, não é?  Não esquece de comentar aqui.
</p>
<p>
Ficou curioso e não sabe trabalhar com R?
<a href="http://www.ibpad.com.br/nossos-cursos/formacao-em-r/">Que tal
aprender conosco em nossa formação</a>? O curso de Programação em R em
São Paulo começa dia 6 de maio. Em Brasília nós teremos o curso de
<a href="http://www.ibpad.com.br/produto/dados-para-relacoes-governamentais-brasilia/">Dados
para Relações Governamentais. </a>
</p>
</div>
</div>
</article>
<ul>
<li>
<header class="clearfix">
</header>
<p>
Diretor-executivo do IBPAD, Cientista Político com mestrado no Instituto
de Ciência Política da UnB. Prêmio Marcus Figueiredo de Jovens
Pesquisadores em Opinião Pública (Wapor Latinoamérica). Experiências com
pesquisas no setor privado (Caixa, CNI, ANP), setor público (Ministérios
da Defesa, Turismo, Saúde, Esporte e Prefeituras Rio de Janeiro e
Niterói) e em campanhas políticas.
</p>

</li>
</ul>

<p>
<fb:comments-count href="http://www.ibpad.com.br/blog/dados-congresso-brasileiro-parte-1/"></fb:comments-count>
comments
</p>
</div>
</div>
</div>
</div>
</section>
</p>
<a href="http://www.ibpad.com.br/blog/dados-congresso-brasileiro-parte-1/#" class="scroll-up"><span
class="ti-arrow-up"></span></a>
</div>
</div>

