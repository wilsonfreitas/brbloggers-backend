+++
title = "R para Biologia"
date = "2016-11-03 17:12:47"
categories = ["IBPAD"]
original_url = "http://www.ibpad.com.br/blog/analise-de-dados/r-para-biologia/"
+++

<header class="kopa-page-header-1">
</header>
<p id="main-content">
<section class="post-content">
<article class="entry-item">
<a href="http://www.ibpad.com.br/blog/analise-de-dados/r-para-biologia/" class="single-post-date">
03/11/2016 </a>
<p>
<em>\[Texto do prof.
<a href="http://www.ibpad.com.br/nosso-time/robert-mcdonnell/">Robert
McDonnell</a>, professor do curso de Programação em R\]</em>
</p>
<p>
Uma das maiores vantagens de usar o R é o grande número de pacotes
especializados disponíveis. Um ótimo lugar para ver estes pacotes,
agrupados por área, é a página do
CRAN <a href="https://cran.r-project.org/web/views/">Task Views</a>.
Aqui você pode encontrar pacotes R que lidam com tudo, desde
Quimiometria até Ambientometria e pacotes que lidam com Tecnologias Web
e Pesquisa de Reprodução. Neste post, apresentarei pacotes R na área de
Biologia, que na verdade pertencem a várias subáreas no CRAN Task View,
visto que existem páginas sobre genética, ensaios clínicos, análise de
sobrevivência, filogenética e farmacocinética, por exemplo. Já que a
biologia é um campo enorme que requer conhecimentos especializados, vou
me concentrar apenas em maneiras simples de visualizar dados desse tipo
(visto que não sou biólogo). Também é possível encontrar recursos
on-line para lidar com Biologia em R, por
exemplo: <a href="http://varianceexplained.org/r/tidy-genomics-biobroom/">aqui</a>,
<a href="https://cran.r-project.org/doc/contrib/Seefeld_StatsRBio.pdf">aqui</a> e <a href="https://www.amazon.com/Getting-Started-R-Introduction-Biologists/dp/0199601623">aqui</a>.
</p>
<p>
Uma maneira visualmente impressionante para apresentar seus dados
biológicos é usando o phylopics da
página <a href="http://phylopic.org/">phylopic.org</a>, que
disponibiliza imagens de silhuetas. Vamos imaginar que queremos
representar graficamente o surto do Zika Vírus. No código a seguir, eu
carrego as bibliotecas necessárias (que você precisará instalar com
install.packages() caso não as tenha), baixamos a imagem de
phylopic.org, simulamos o surto de vírus e o plotamos usando ggplot2. O
pacote OutbreakTools irá automaticamente gerar um lote semelhante para
você, mas aqui eu decidi adicionar o phylopic, então eu mesmo construí o
gráfico.
</p>
<textarea class="crayon-plain print-no">
library(dplyr) library(tidyr) library(rphylopic) library(OutbreakTools)
\# baixar imagem mosquito &lt;-
image\_data("f538aa99-5c08-4f96-97d9-2e094ef5d84f", size =
"512")\[\[1\]\] \# simular surto set.seed(1) virus &lt;- simuEpi(N =
100, D = 20, beta = 0.01, makePhylo = TRUE, plot = FALSE) \# plotar
gráfico v &lt;- virus*d**y**n**a**m**i**c**s*x, "contacts",
main="Transmission tree")
</textarea>

<table class="crayon-table">
<tr class="crayon-row">
<td class="crayon-nums ">
</td>
<td class="crayon-code">
<span class="crayon-e">plot</span><span class="crayon-sy">(</span><span
class="crayon-v">virus</span><span class="crayon-sy">$</span><span
class="crayon-v">x</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-s">"contacts"</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">main</span><span class="crayon-o">=</span><span
class="crayon-s">"Transmission tree"</span><span
class="crayon-sy">)</span>

</td>
</tr>
</table>

<p>
<code class="r"><span
class="paren"> </span></code><a href="https://i2.wp.com/ibpad.com.br/wp-content/uploads/2016/11/im2-1.png"><img class="alignnone size-full wp-image-1685" src="https://i2.wp.com/ibpad.com.br/wp-content/uploads/2016/11/im2-1.png?resize=900%2C643" alt="im2"></a>
</p>
<blockquote>
<p>
<em>Conheça mais do curso de
<a href="http://www.ibpad.com.br/produto/programacao-em-r/">Programação
em R</a> oferecido pelo IBPAD – Inscrições abertas em São Paulo e no Rio
de Janeiro!</em>
</p>
</blockquote>
<p>
Podemos também usar esse método de visualização para representar
estatísticas descritivas, como o número de espécies observadas em uma
determinada área ao longo de um período de trinta dias. Primeiro vamos
simular alguns dados, e então podemos criar gráficos como fizemos acima.
</p>
<textarea class="crayon-plain print-no">
simular dados species &lt;- data\_frame(animals = rep(c("tarantula", "tiger", "bear"), each = 30), days = c(1:30, 1:30, 1:30), count = c(rnorm(30, mean = 15, sd = 2), rnorm(30, 9, 2), rnorm(30, 30, 2))) %&gt;% mutate(count = ceiling(count)) \# baixar imagens
==================================================================================================================================================================================================================================================================

tarantula &lt;- get\_image("d780fdc0-311f-4bc5-b4fc-1a45f4206d27", size
= "512")\[\[1\]\] lizard &lt;-
get\_image("9cae2028-126b-416f-9094-250782c5bc22", size =
"512")\[\[1\]\] moth &lt;-
get\_image("8229756b-82c3-4a9f-a1c6-e88f958e623e", size =
"512")\[\[1\]\] \# plotar gráfico library(gridExtra) \# put plots side
by side plot\_1 &lt;- ggplot(species\[1:30,\], aes(x = days, y = count))
+ add\_phylopic(tarantula, alpha = 0.5) + theme\_minimal() +
geom\_point() plot\_2 &lt;- ggplot(species\[31:60,\], aes(x = days, y =
count)) + add\_phylopic(lizard, color = "palegreen4", alpha = 0.5) +
theme\_minimal() + geom\_point(colour = "palegreen4") plot\_3 &lt;-
ggplot(species\[61:90,\], aes(x = days, y = count)) +
add\_phylopic(moth, color = "firebrick", alpha = 0.5) + theme\_minimal()
+ geom\_point(colour = "firebrick") grid.arrange(plot\_1, plot\_2,
plot\_3, ncol=3)
</textarea>

<table class="crayon-table">
<tr class="crayon-row">
<td class="crayon-nums ">

</td>
<td class="crayon-code">
<span class="crayon-v">species</span><span class="crayon-h">
</span><span class="crayon-o">&lt;</span><span
class="crayon-o">-</span><span class="crayon-h"> </span><span
class="crayon-e">data\_frame</span><span class="crayon-sy">(</span><span
class="crayon-v">animals</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-e">rep</span><span class="crayon-sy">(</span><span
class="crayon-e">c</span><span class="crayon-sy">(</span><span
class="crayon-s">"tarantula"</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-s">"tiger"</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-s">"bear"</span><span class="crayon-sy">)</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span>

<span class="crayon-h">                      </span><span
class="crayon-v">days</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-e">c</span><span class="crayon-sy">(</span><span
class="crayon-cn">1</span><span class="crayon-o">:</span><span
class="crayon-cn">30</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-cn">1</span><span
class="crayon-o">:</span><span class="crayon-cn">30</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-cn">1</span><span class="crayon-o">:</span><span
class="crayon-cn">30</span><span class="crayon-sy">)</span><span
class="crayon-sy">,</span>

<span class="crayon-h">                      </span><span
class="crayon-v">count</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-e">c</span><span class="crayon-sy">(</span><span
class="crayon-e">rnorm</span><span class="crayon-sy">(</span><span
class="crayon-cn">30</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">mean</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-cn">15</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">sd</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-cn">2</span><span class="crayon-sy">)</span><span
class="crayon-sy">,</span>

<span class="crayon-h">  </span><span
class="crayon-e">mutate</span><span class="crayon-sy">(</span><span
class="crayon-v">count</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-e">ceiling</span><span class="crayon-sy">(</span><span
class="crayon-v">count</span><span class="crayon-sy">)</span><span
class="crayon-sy">)</span>

<span class="crayon-v">tarantula</span><span class="crayon-h">
</span><span class="crayon-o">&lt;</span><span
class="crayon-o">-</span><span class="crayon-h"> </span><span
class="crayon-e">get\_image</span><span class="crayon-sy">(</span><span
class="crayon-s">"d780fdc0-311f-4bc5-b4fc-1a45f4206d27"</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span>

<span class="crayon-v">lizard</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span class="crayon-e">get\_image</span><span
class="crayon-sy">(</span><span
class="crayon-s">"9cae2028-126b-416f-9094-250782c5bc22"</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span>

<span class="crayon-v">moth</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span class="crayon-e">get\_image</span><span
class="crayon-sy">(</span><span
class="crayon-s">"8229756b-82c3-4a9f-a1c6-e88f958e623e"</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span>

<span class="crayon-r">library</span><span
class="crayon-sy">(</span><span class="crayon-v">gridExtra</span><span
class="crayon-sy">)</span><span class="crayon-h"> </span><span
class="crayon-c">\# put plots side by side</span>

<span class="crayon-v">plot\_1</span><span class="crayon-h">
</span><span class="crayon-o">&lt;</span><span
class="crayon-o">-</span><span class="crayon-h"> </span><span
class="crayon-e">ggplot</span><span class="crayon-sy">(</span><span
class="crayon-v">species</span><span class="crayon-sy">\[</span><span
class="crayon-cn">1</span><span class="crayon-o">:</span><span
class="crayon-cn">30</span><span
class="crayon-sy">,</span><span class="crayon-sy">\]</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-e">aes</span><span class="crayon-sy">(</span><span
class="crayon-v">x</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-v">days</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">y</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-v">count</span><span
class="crayon-sy">)</span><span class="crayon-sy">)</span><span
class="crayon-h"> </span><span class="crayon-o">+</span><span
class="crayon-h">  </span>

<span class="crayon-h">  </span><span
class="crayon-e">add\_phylopic</span><span
class="crayon-sy">(</span><span class="crayon-v">tarantula</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">alpha</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-cn">0.5</span><span class="crayon-sy">)</span><span
class="crayon-h"> </span><span class="crayon-o">+</span><span
class="crayon-h"> </span>

<span class="crayon-v">plot\_2</span><span class="crayon-h">
</span><span class="crayon-o">&lt;</span><span
class="crayon-o">-</span><span class="crayon-h"> </span><span
class="crayon-e">ggplot</span><span class="crayon-sy">(</span><span
class="crayon-v">species</span><span class="crayon-sy">\[</span><span
class="crayon-cn">31</span><span class="crayon-o">:</span><span
class="crayon-cn">60</span><span
class="crayon-sy">,</span><span class="crayon-sy">\]</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-e">aes</span><span class="crayon-sy">(</span><span
class="crayon-v">x</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-v">days</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">y</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-v">count</span><span
class="crayon-sy">)</span><span class="crayon-sy">)</span><span
class="crayon-h"> </span><span class="crayon-o">+</span><span
class="crayon-h">  </span>

<span class="crayon-h">  </span><span
class="crayon-e">add\_phylopic</span><span
class="crayon-sy">(</span><span class="crayon-v">lizard</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">color</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-s">"palegreen4"</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">alpha</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-cn">0.5</span><span class="crayon-sy">)</span><span
class="crayon-h"> </span><span class="crayon-o">+</span><span
class="crayon-h"> </span>

<span class="crayon-h">  </span><span
class="crayon-e">geom\_point</span><span class="crayon-sy">(</span><span
class="crayon-v">colour</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-s">"palegreen4"</span><span class="crayon-sy">)</span>

<span class="crayon-v">plot\_3</span><span class="crayon-h">
</span><span class="crayon-o">&lt;</span><span
class="crayon-o">-</span><span class="crayon-h"> </span><span
class="crayon-e">ggplot</span><span class="crayon-sy">(</span><span
class="crayon-v">species</span><span class="crayon-sy">\[</span><span
class="crayon-cn">61</span><span class="crayon-o">:</span><span
class="crayon-cn">90</span><span
class="crayon-sy">,</span><span class="crayon-sy">\]</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-e">aes</span><span class="crayon-sy">(</span><span
class="crayon-v">x</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-v">days</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">y</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-v">count</span><span
class="crayon-sy">)</span><span class="crayon-sy">)</span><span
class="crayon-h"> </span><span class="crayon-o">+</span><span
class="crayon-h">  </span>

<span class="crayon-h">  </span><span
class="crayon-e">add\_phylopic</span><span
class="crayon-sy">(</span><span class="crayon-v">moth</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">color</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-s">"firebrick"</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">alpha</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-cn">0.5</span><span
class="crayon-sy">)</span><span class="crayon-h"> </span><span
class="crayon-o">+</span><span class="crayon-h"> </span>

<span class="crayon-h">  </span><span
class="crayon-e">geom\_point</span><span class="crayon-sy">(</span><span
class="crayon-v">colour</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-s">"firebrick"</span><span class="crayon-sy">)</span>

<span class="crayon-v">grid</span><span class="crayon-sy">.</span><span
class="crayon-e">arrange</span><span class="crayon-sy">(</span><span
class="crayon-v">plot\_1</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">plot\_2</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">plot\_3</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-v">ncol</span><span
class="crayon-o">=</span><span class="crayon-cn">3</span><span
class="crayon-sy">)</span>

</td>
</tr>
</table>

<p>
<a href="https://i0.wp.com/ibpad.com.br/wp-content/uploads/2016/11/im3-1.png"><img class="alignnone size-full wp-image-1686" src="https://i0.wp.com/ibpad.com.br/wp-content/uploads/2016/11/im3-1.png?resize=900%2C643" alt="im3"></a>
</p>
<p>
E pronto! Com algumas linhas de código R, você pode criar visualizações
impressionantes para a pesquisa nas Ciências Biológicas.
</p>

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
quantitativos</a> ,  <a href="http://www.ibpad.com.br/tag/bioestatistica/">bioestatística</a> ,  <a href="http://www.ibpad.com.br/tag/biologia/">biologia</a> ,  <a href="http://www.ibpad.com.br/tag/dplyr/">dplyr</a> ,  <a href="http://www.ibpad.com.br/tag/estatistica/">estatística</a> ,  <a href="http://www.ibpad.com.br/tag/ibpad/">ibpad</a> ,  <a href="http://www.ibpad.com.br/tag/linguagem-r/">Linguagem
R</a> ,  <a href="http://www.ibpad.com.br/tag/outbreaktools/">OutbreakTools</a> ,  <a href="http://www.ibpad.com.br/tag/programacao-em-linguagem-r/">Programação
em linguagem
R</a> ,  <a href="http://www.ibpad.com.br/tag/programacao-em-r/">programação
em
R</a> ,  <a href="http://www.ibpad.com.br/tag/programacao-r-estatistica/">Programação
R
estatística</a> ,  <a href="http://www.ibpad.com.br/tag/r/">r</a> ,  <a href="http://www.ibpad.com.br/tag/rplylopic/">rplylopic</a> ,  <a href="http://www.ibpad.com.br/tag/software-r/">software
R</a> ,  <a href="http://www.ibpad.com.br/tag/tidyr/">tidyr</a>

<p>
<fb:comments-count href="http://www.ibpad.com.br/blog/analise-de-dados/r-para-biologia/"></fb:comments-count>
comments
</p>

</section>
</p>
<a href="http://www.ibpad.com.br/blog/analise-de-dados/r-para-biologia/#" class="scroll-up"><span
class="ti-arrow-up"></span></a>

