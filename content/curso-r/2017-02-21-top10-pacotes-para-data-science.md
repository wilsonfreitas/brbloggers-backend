+++
title = "Top 10 pacotes para data science"
date = "2017-02-21"
categories = ["curso-r"]
+++

<div><p class="text-muted text-uppercase mb-small text-right"> Por <a href="http://curso-r.com/author/athos">Athos</a> 21/02/2017 </p><div id="post-content"> <p>O R mudou muito nos &#xFA;ltimos 5 anos gra&#xE7;as a cria&#xE7;&#xF5;es de novos pacotes focados nas quest&#xF5;es mais pr&#xE1;ticas do dia a dia de um cientista de dados. Abaixo coloquei meu top 10 de pacotes que revolucionaram o jeito de programar em R e fizeram meu trabalho mais &#xE1;gil e prazeroso:</p>
<div id="purrr-manipulacao-de-vetores-e-listas" class="section level3"> <p>Nosso d&#xE9;cimo lugar colocou o <code>for</code> em perigo de extin&#xE7;&#xE3;o. Com ele, aplicar fun&#xE7;&#xF5;es em vetores, listas ou combina&#xE7;&#xF5;es dos dois &#xE9; uma tarefa de poucas linhas e sem a necessidade de &#xED;ndices i, j, k&#x2019;s confusos. E ainda, com o advento das <a href="https://cran.r-project.org/web/packages/tibble/tibble.pdf">tibbles</a>, seus data.frames ganharam potencial de guardar muito mais do que meros n&#xFA;meros e strings e o purrr &#xE9; seu mais forte aliado na hora de criar as chamadas <a href="https://jennybc.github.io/purrr-tutorial/ls13_list-columns.html"><em>list-columns</em></a>.</p>
</div>
<div id="caret-modelagem-estatistica" class="section level3"> <p>Se voc&#xEA; procura modelagem estat&#xED;stica (ferramenta b&#xE1;sica do cientista de dados), d&#xEA; chance ao <a href="http://caret.r-forge.r-project.org/">caret</a>. Esse pacote compilou os mais consagrados algoritmos de modelos preditivos (vulgo <em>machine learning</em>) j&#xE1; feitos no R e ainda implementou ferramentas t&#xED;picas de um processo de constru&#xE7;&#xE3;o de modelos, por exemplo, cross-validation, ajuste de hiperpar&#xE2;metros, bases treino/teste, pr&#xE9;-processamentos e at&#xE9; paraleliza&#xE7;&#xE3;o. Al&#xE9;m das diferentes t&#xE9;cnicas de ajuste de modelos, os seus respectivos diagn&#xF3;sticos e visualiza&#xE7;&#xF5;es tamb&#xE9;m foram convenientemente compiladas, tudo num mesmo lugar, fazendo a procura de pe&#xE7;as no gigantesco balde do R ser menos custosa.</p>
</div>
<div id="knitrrmarkdown-relatorios" class="section level3"> <p>A dupla <a href="https://yihui.name/knitr/">knitr</a> e <a href="http://rmarkdown.rstudio.com/">rmarkdown</a> fizeram do R de patinho feio para o rei dos holofotes. Depois deles, relat&#xF3;rios no R s&#xE3;o f&#xE1;ceis, bonitos e flex&#xED;veis. Escrever em RMarkdown &#xE9; como escrever um rascunho, que depois &#xE9; transformado em um arquivo decente em qualquer formato: pdf, word e html s&#xE3;o os mais comuns. A ideologia por tr&#xE1;s do RMarkdown &#xE9; trazer o foco para a an&#xE1;lise e deixar as perfumarias para segundo plano o m&#xE1;ximo poss&#xED;vel.</p>
<p>OBS: todos os posts desse blog s&#xE3;o feitos em RMarkdown!</p>
</div>
<div id="stringr-manipulacao-de-strings" class="section level3"> <p>Stringr te d&#xE1; tudo para extrair, criar e transformar strings. As fun&#xE7;&#xF5;es aceitam <a href="https://stat.ethz.ch/R-manual/R-devel/library/base/html/regex.html">regex</a> extremamente vers&#xE1;ril e eficiente. Minera&#xE7;&#xE3;o de texto vira brincadeira.</p>
</div> <div id="shiny-criacao-de-aplicativos-web" class="section level3"> <p><a href="https://shiny.rstudio.com/">Shiny</a> d&#xE1; o poder de fazer aplica&#xE7;&#xF5;es na web a um analista de dados sem nenhum conhecimento pr&#xE9;vio de html, css e javascript. Acredite se quiser, agora, fazer sites interativos e orientados por dados n&#xE3;o &#xE9; mais exclusividade dos desenvolvedores web. Com uma curva de aprendizagem ligeiramente alongada, pode-se criar de dashboards est&#xE1;ticos a mapas personalizados a l&#xE1; google maps! &#xC9; uma &#xF3;tima maneira de apresentar resultados e serve muito bem como produto final de ferramentas de gest&#xE3;o.</p>
</div>
<div id="tidyr-transformacao-de-data.frames" class="section level3"> <p>As principais fun&#xE7;&#xF5;es s&#xE3;o <code>gather()</code> e <code>spread()</code>. Elas pivotam/despivotam data.frames, ou derretem/condensam data.frames. Ela merece nosso quarto lugar porque possui uma grande sinergia com os terceiro e segundo lugares. N&#xE3;o raramente precisamos rearranjar conjunto de colunas em um par de colunas chave/valor ou vice-versa. Pivotar/despivotar &#xE9; particularmente muito chato de fazer em SQL e o <a href="https://blog.rstudio.org/2014/07/22/introducing-tidyr/">tidyr</a> faz isso parecer trivial. Ele tamb&#xE9;m possui outras fun&#xE7;&#xF5;es &#xFA;teis que recomendo dar uma olhada (ex: <code>unite()</code>, <code>separete()</code>).</p>
</div>
<div id="dplyr-manipulacao-de-data.frames" class="section level3"> <p>Nossa medalha de bronze vai para <a href="https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html">dplyr</a> porque ele trouxe os verbos de manipula&#xE7;&#xE3;o de base de dados para o n&#xED;vel mais simples e intuitivo. S&#xE3;o eles:</p>
<ul>
<li><code>filter()</code> filtra linhas</li>
<li><code>arrange()</code> ordena linhas</li>
<li><code>select()</code> seleciona colunas</li>
<li><code>distinct()</code> retira linhas duplicadas</li>
<li><code>mutate()</code> constr&#xF3;i novas colunas</li>
<li><code>group_by()</code> + <code>summarise()</code> sumariza valores por um ou mais fatores</li>
</ul>
<p>E o pacote vai muito al&#xE9;m desses verbos. Vale a pena explorar suas fun&#xE7;&#xF5;es se voc&#xEA; precisa deixar sua base pronta para analisar.</p>
<p>OBS: foi feito para funcionar com o <em>&#x201C;pipe&#x201D;</em> (%&gt;%).</p>
</div>
<div id="ggplot2-visualizacao" class="section level3"> <p>A medalha de prata eu acho que &#xE9; o pacote mais famoso do R.</p>
<p>O R &#xE9; conhecido pela sua rica capacidade gr&#xE1;fica, mas foi o <a href="http://docs.ggplot2.org/current/">ggplot2</a> que trouxe a alegria de viver para os usu&#xE1;rios minimamente preocupados com a boa apar&#xEA;ncia de suas visualiza&#xE7;&#xF5;es. O <a href="http://docs.ggplot2.org/current/">ggplot2</a> permite usar a &#x201C;gram&#xE1;tica de gr&#xE1;ficos&#x201D; (<a href="http://vita.had.co.nz/papers/layered-grammar.pdf"><em>grammar of graphics</em></a>) para construir gr&#xE1;ficos em camadas e customiz&#xE1;veis. H&#xE1; uma pequena curva de aprendizado, mas o tempo investido se paga no primeiro gr&#xE1;fico gerado. Gr&#xE1;ficos que seriam veradeiras obras da engenharia se feitas no R-base n&#xE3;o passariam de 5 linhas de <a href="http://docs.ggplot2.org/current/">ggplot2</a> e ainda ficariam mais bonitos!</p>
<p>Indispens&#xE1;vel na caixa de ferramentas de qualquer cientista de dados.</p>
</div>
<div id="magrittr-pipe" class="section level3"> <p>A medalha de ouro nos fornece o tal do <em>pipe</em> (%&gt;%). Em vez de <code>h(g(f(x)))</code>, escreva <code>x %&gt;% f %&gt;% g %&gt;% h</code>. Pronto! &#xC9; tudo o que o <em>pipe</em> faz. Voc&#xEA; pode se perguntar por que raios isso merece o nosso primeiro lugar, mas acredite: o <em>pipe</em> &#xE9; revolucion&#xE1;rio. Ele mudou o jeito de se programar em R. Com ele o ganho em legibilidade dos c&#xF3;digos e agilidade na programa&#xE7;&#xE3;o &#xE9; inimagin&#xE1;vel. E ainda abriu portas para desenvolvimento de pacotes que sem ele n&#xE3;o seriam vi&#xE1;veis, incluindo o dplyr e tidyr.</p>
<p>E por isso que ele merece estar no primeiro lugar na nossa lista e no logo da nossa p&#xE1;gina.</p>
</div>
<div id="mencoes-honrosas" class="section level3"> <p>Outros pacotes tamb&#xE9;m merecem destaque! As med&#xE1;lhas de honra ao m&#xE9;rito v&#xE3;o para:</p>
<ul>
<li><strong>forcats</strong> (utilidades para fatores)</li>
<li><strong>Rcpp</strong> (R para C++)</li>
<li><strong>FactoMiner</strong> (an&#xE1;lise multivariada)</li>
<li><strong>RODBC</strong> (conex&#xE3;o com banco de dados)</li>
<li><strong>httr/xml2/rvest</strong> (ferramentas para web)</li>
<li><strong>flexdashboard</strong> (rmarkdown para formato de dashboard)</li>
<li><strong>janitor</strong> (limpeza de dados para modelagem)</li>
<li><strong>plyr</strong> (manipula&#xE7;&#xE3;o de vetores, listas e data.frames)</li>
<li><strong>roxygen2</strong> (cria&#xE7;&#xE3;o de pacotes de R)</li>
<li><strong>devtools</strong> (ferramentas diversas)</li>
<li><strong>htmlwidgets</strong> (integra&#xE7;&#xE3;o entre R e bibliotecas JavaScript)</li>
<li><strong>leaflet</strong> (mapas interativos)</li>
</ul>
<p>E voc&#xEA;, concorda? Coloque nos coment&#xE1;rios os pacotes que moram em seu cora&#xE7;&#xE3;o! =)</p>
</div> </div></div>
