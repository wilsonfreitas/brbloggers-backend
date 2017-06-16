+++
title = "Pacotes brasileiros do R, parte 2: electionsBR"
date = "2017-02-14 18:39:48"
categories = ["IBPAD"]
original_url = "http://www.ibpad.com.br/blog/analise-de-dados/pacotes-brasileiros-do-r-parte-2-electionsbr/"
+++

<header class="kopa-page-header-1">
</header>
<p id="main-content">
<section class="post-content">
<article class="entry-item">
<a href="http://www.ibpad.com.br/blog/analise-de-dados/pacotes-brasileiros-do-r-parte-2-electionsbr/" class="single-post-date">
14/02/2017 </a>
<p>
<img class="alignleft" src="https://i0.wp.com/i.imgur.com/8oS3gxW.png?resize=144%2C108"><br>
O próximo pacote R da nossa série é o
<a href="https://github.com/silvadenisson/electionsBR">electionsBR</a>
de Denisson Silva, Fernando Meireles, e Beatriz Costa. Assim como
o <em>SciencesPo</em>, também lida com dados de política – neste caso,
eleições brasileiras. O pacote faz o download, organiza e agrega os
dados do Tribunal Superior Eleitoral para os anos 1996-2016. Neste post,
vamos dar uma olhada nas suas principais funções. Primeiro, pode
instalar e carregar o pacote assim:
</p>
<textarea class="crayon-plain print-no">
install.packages("electionsBR") library(electionsBR)
</textarea>

<table class="crayon-table">
<tr class="crayon-row">
<td class="crayon-nums ">
</td>
<td class="crayon-code">
<span class="crayon-v">install</span><span
class="crayon-sy">.</span><span class="crayon-e">packages</span><span
class="crayon-sy">(</span><span
class="crayon-s">"electionsBR"</span><span class="crayon-sy">)</span>

</td>
</tr>
</table>

<p>
Para ver a lista complete das funções, digite: <code>help(package =
"electionsBR")</code>. Por exemplo, o pacote tem a função
<code>candidate\_fed()</code>, que baixa os dados dos candidatos nas
eleições federais no Brasil.
</p>
<blockquote>
<p>
<a href="http://www.ibpad.com.br/blog/formacao-em-r/"><br>
</a><a href="http://www.ibpad.com.br/blog/formacao-em-r/"><img class="aligncenter wp-image-4138 size-medium" src="https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=260%2C241%20260w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=768%2C711%20768w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=1024%2C948%201024w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=100%2C93%20100w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?w=1225%201225w" srcset="https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=260%2C241 260w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=768%2C711 768w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=1024%2C948 1024w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=100%2C93 100w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?w=1225 1225w"></a>
</p>
<p>
<a href="http://www.ibpad.com.br/blog/formacao-em-r/">Conheça a Formação
em R do IBPAD</a>
</p>
<p>
Esses dados têm detalhes das profissões dos candidatos, partidos, data
de nascimento, etc. Vamos ver a descrição das profissões dos candidatos
para Governador nos estados de São Paulo, Rio de Janeiro, Minas Gerias e
Bahia nas eleições federais de 2006:
</p>
<textarea class="crayon-plain print-no">
library(tidyverse) cand &lt;- candidate\_fed(year = 2006) gov &lt;- cand
%&gt;% filter(DESCRICAO\_CARGO == "GOVERNADOR", SIGLA\_UF %in% c("BA",
"MG", "SP", "RJ")) ggplot(gov, aes(x = DESCRICAO\_OCUPACAO)) +
geom\_bar() + coord\_flip() + theme\_classic() + labs(y = "", x = "")
</textarea>

<table class="crayon-table">
<tr class="crayon-row">
<td class="crayon-nums ">

</td>
<td class="crayon-code">
<span class="crayon-v">cand</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span
class="crayon-e">candidate\_fed</span><span
class="crayon-sy">(</span><span class="crayon-v">year</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-cn">2006</span><span
class="crayon-sy">)</span>

<span class="crayon-h">  </span><span
class="crayon-e">filter</span><span class="crayon-sy">(</span><span
class="crayon-v">DESCRICAO\_CARGO</span><span class="crayon-h">
</span><span class="crayon-o">==</span><span class="crayon-h">
</span><span class="crayon-s">"GOVERNADOR"</span><span
class="crayon-sy">,</span>

<span class="crayon-h">         </span><span
class="crayon-v">SIGLA\_UF</span><span class="crayon-h"> </span><span
class="crayon-o">%</span><span class="crayon-st">in</span><span
class="crayon-o">%</span><span class="crayon-h"> </span><span
class="crayon-e">c</span><span class="crayon-sy">(</span><span
class="crayon-s">"BA"</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-s">"MG"</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-s">"SP"</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-s">"RJ"</span><span
class="crayon-sy">)</span><span class="crayon-sy">)</span>

<span class="crayon-e">ggplot</span><span
class="crayon-sy">(</span><span class="crayon-v">gov</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-e">aes</span><span class="crayon-sy">(</span><span
class="crayon-v">x</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-v">DESCRICAO\_OCUPACAO</span><span
class="crayon-sy">)</span><span class="crayon-sy">)</span><span
class="crayon-h"> </span><span class="crayon-o">+</span>

</td>
</tr>
</table>

<p>
<img src="https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/electionsBR_2.png?w=900" alt=""><br>
O pacote também pode ser usado para analisar dados de eleições locais.
Por exemplo, podemos ver a quantidade de candidatos que cada partido no
Sul tinha para o cargo de prefeito nas eleições de 2016 – que mostra a
forte presença tradicional do PT e PP no Rio Grande do Sul, por exemplo.
</p>
<textarea class="crayon-plain print-no">
par &lt;- party\_mun\_zone\_local(year = 2016) sul &lt;- par %&gt;%
filter(SIGLA\_UF %in% c("RS", "PR", "SC"), DESCRICAO\_CARGO ==
"Prefeito") ggplot(sul, aes(x =SIGLA\_PARTIDO)) + geom\_bar() +
coord\_flip() + facet\_wrap(nrow = 1, ~ SIGLA\_UF) + labs(x = "", y =
"")
</textarea>

<table class="crayon-table">
<tr class="crayon-row">
<td class="crayon-nums ">
</td>
<td class="crayon-code">
<span class="crayon-v">par</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span
class="crayon-e">party\_mun\_zone\_local</span><span
class="crayon-sy">(</span><span class="crayon-v">year</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-cn">2016</span><span
class="crayon-sy">)</span>

<span class="crayon-h">  </span><span
class="crayon-e">filter</span><span class="crayon-sy">(</span><span
class="crayon-v">SIGLA\_UF</span><span class="crayon-h"> </span><span
class="crayon-o">%</span><span class="crayon-st">in</span><span
class="crayon-o">%</span><span class="crayon-h"> </span><span
class="crayon-e">c</span><span class="crayon-sy">(</span><span
class="crayon-s">"RS"</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-s">"PR"</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-s">"SC"</span><span class="crayon-sy">)</span><span
class="crayon-sy">,</span>

<span class="crayon-h">         </span><span
class="crayon-v">DESCRICAO\_CARGO</span><span class="crayon-h">
</span><span class="crayon-o">==</span><span class="crayon-h">
</span><span class="crayon-s">"Prefeito"</span><span
class="crayon-sy">)</span>

<span class="crayon-e">ggplot</span><span
class="crayon-sy">(</span><span class="crayon-v">sul</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-e">aes</span><span class="crayon-sy">(</span><span
class="crayon-v">x</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span
class="crayon-v">SIGLA\_PARTIDO</span><span
class="crayon-sy">)</span><span class="crayon-sy">)</span><span
class="crayon-h"> </span><span class="crayon-o">+</span>

<span class="crayon-h">  </span><span
class="crayon-e">facet\_wrap</span><span class="crayon-sy">(</span><span
class="crayon-v">nrow</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-cn">1</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-o">~</span><span
class="crayon-h"> </span><span class="crayon-v">SIGLA\_UF</span><span
class="crayon-sy">)</span><span class="crayon-h"> </span><span
class="crayon-o">+</span>

</td>
</tr>
</table>

<p>
<img src="https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/parties_electionsBR.png?w=900" alt=""><br>
E o pacote possui mais funções para ver os resultados das eleições,
sejam locais ou federais. Também podemos analisar, por exemplo, os
eleitores. A função <code>voter\_affiliation()</code> faz o download e
arruma dados das afiliações dos eleitores aos partidos. A função tem
dois argumentos, <code>party</code> e <code>uf</code>, que indica
que podemos investigar só um estado e partido por vez. Neste exemplo,
vou ver quantos comunistas temos no Acre, e em qual município.
</p>
<textarea class="crayon-plain print-no">
v\_ac &lt;- voter\_affiliation(party = "PC do B", uf = "AC") %&gt;%
filter(SITUACAO\_DO\_REGISTRO == "REGULAR") %&gt;%
group\_by(NOME\_DO\_MUNICIPIO) %&gt;% summarise(N = n()) %&gt;%
arrange(desc(N)) %&gt;% top\_n(n = 10) \# install.packages("knitr")
knitr::kable(v\_ac, "markdown")
</textarea>

<table class="crayon-table">
<tr class="crayon-row">
<td class="crayon-nums ">
</td>
<td class="crayon-code">
<span class="crayon-v">v\_ac</span><span class="crayon-h"> </span><span
class="crayon-o">&lt;</span><span class="crayon-o">-</span><span
class="crayon-h"> </span><span
class="crayon-e">voter\_affiliation</span><span
class="crayon-sy">(</span><span class="crayon-v">party</span><span
class="crayon-h"> </span><span class="crayon-o">=</span><span
class="crayon-h"> </span><span class="crayon-s">"PC do B"</span><span
class="crayon-sy">,</span><span class="crayon-h"> </span><span
class="crayon-v">uf</span><span class="crayon-h"> </span><span
class="crayon-o">=</span><span class="crayon-h"> </span><span
class="crayon-s">"AC"</span><span class="crayon-sy">)</span><span
class="crayon-h"> </span><span class="crayon-o">%</span><span
class="crayon-o">&gt;</span><span class="crayon-o">%</span><span
class="crayon-h"> </span>

<span class="crayon-h">      </span><span
class="crayon-e">filter</span><span class="crayon-sy">(</span><span
class="crayon-v">SITUACAO\_DO\_REGISTRO</span><span class="crayon-h">
</span><span class="crayon-o">==</span><span class="crayon-h">
</span><span class="crayon-s">"REGULAR"</span><span
class="crayon-sy">)</span><span class="crayon-h"> </span><span
class="crayon-o">%</span><span class="crayon-o">&gt;</span><span
class="crayon-o">%</span><span class="crayon-h"> </span>

<span class="crayon-h">      </span><span
class="crayon-e">group\_by</span><span class="crayon-sy">(</span><span
class="crayon-v">NOME\_DO\_MUNICIPIO</span><span
class="crayon-sy">)</span><span class="crayon-h"> </span><span
class="crayon-o">%</span><span class="crayon-o">&gt;</span><span
class="crayon-o">%</span><span class="crayon-h"> </span>

<span class="crayon-p">\# install.packages("knitr")</span>

<span class="crayon-v">knitr</span><span class="crayon-o">::</span><span
class="crayon-e">kable</span><span class="crayon-sy">(</span><span
class="crayon-v">v\_ac</span><span class="crayon-sy">,</span><span
class="crayon-h"> </span><span class="crayon-s">"markdown"</span><span
class="crayon-sy">)</span>

</td>
</tr>
</table>

<table>
<thead>
</thead>
<tbody>
<tr class="odd">
<td>
TARAUACÁ
</td>
<td>
2119
</td>
</tr>
<tr class="even">
<td>
RIO BRANCO
</td>
<td>
1870
</td>
</tr>
<tr class="odd">
<td>
CRUZEIRO DO SUL
</td>
<td>
731
</td>
</tr>
<tr class="even">
<td>
ASSIS BRASIL
</td>
<td>
374
</td>
</tr>
<tr class="odd">
<td>
MÂNCIO LIMA
</td>
<td>
364
</td>
</tr>
<tr class="even">
<td>
JORDÃO
</td>
<td>
358
</td>
</tr>
<tr class="odd">
<td>
FEIJÓ
</td>
<td>
252
</td>
</tr>
<tr class="even">
<td>
BRASILÉIA
</td>
<td>
237
</td>
</tr>
<tr class="odd">
<td>
SENADOR GUIOMARD
</td>
<td>
186
</td>
</tr>
<tr class="even">
<td>
PLÁCIDO DE CASTRO
</td>
<td>
182
</td>
</tr>
</tbody>
</table>
<p>
Rio Branco não é uma surpresa, dado que é a cidade maior do estado, e
tem boa chance que vai ter mais membros do partido do que outros
lugares. Tarauacá, contudo, é a quarta cidade em termos de população.
</p>
<p>
electionsBR tem bem mais para explorar, e os dados são ricos e vêm em
bases grandes (eventualmente, pode demorar um pouco para baixar tudo). É
um ótimo pacote para utilizar nas suas análises das eleições no Brasil.
É ótimo para incluir na produção de
<a href="http://robertmyles.github.io/ElectionsBR.html">mapas</a>, por
exemplo.
</p>
</blockquote>
<p>
Gostando da série? Veja o primeiro post:
<a href="http://www.ibpad.com.br/blog/analise-de-dados/pacotes-brasileiros-do-r-parte-1-sciencespo-e-soundexbr-do-daniel-marcelino/">SciencesPo
e SoudexBR</a>
</p>

</article>
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

<p>
<fb:comments-count href="http://www.ibpad.com.br/blog/analise-de-dados/pacotes-brasileiros-do-r-parte-2-electionsbr/"></fb:comments-count>
comments
</p>

</section>
</p>
<a href="http://www.ibpad.com.br/blog/analise-de-dados/pacotes-brasileiros-do-r-parte-2-electionsbr/#" class="scroll-up"><span
class="ti-arrow-up"></span></a>

