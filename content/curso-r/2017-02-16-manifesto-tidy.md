+++
title = "Manifesto tidy"
date = "2017-02-15 11:07:31"
categories = ["curso-r"]
+++

<div class="col-md-9" id="blog-post"> <p class="text-muted text-uppercase mb-small text-right"> Por <a href="http://curso-r.com/author/daniel">Daniel</a> 15/02/2017 </p> <div id="post-content"> <p>O <a href="https://cran.r-project.org/web/packages/tidyverse/vignettes/manifesto.html">manifesto das ferramentas tidy</a> do Hadley Wickham &#xE9; um dos documentos mais importantes sobre R dos &#xFA;ltimos tempos. Esse documento formaliza uma s&#xE9;rie de princ&#xED;pios que norteiam o desenvolvimento do <a href="http://tidyverse.org/"><code>tidyverse</code></a>.</p>
<p>O <a href="http://tidyverse.org/"><code>tidyverse</code></a>, tamb&#xE9;m chamado por muitos de <em>hadleyverse</em>, &#xE9; um conjunto de pacotes que, por compartilharem esses princ&#xED;pios do manifesto tidy, podem ser utilizados naturalmente em conjunto. Pode-se dizer que existe o R antes do <code>tidyverse</code> e o R depois do <code>tidyverse</code>. A linguagem mudou muito, a comunidade abra&#xE7;ou fortemente o uso desses princ&#xED;pios e tem muita gente criando pacotes para conversar uns com os outros dessa forma. No entanto, usar a filosofia <em>tidy</em> n&#xE3;o &#xE9; a &#xFA;nica forma de fazer pacotes do R, existem muitos pacotes excelentes que n&#xE3;o utilizam essa filosofia. Como o pr&#xF3;prio texto diz &#x201C;O contr&#xE1;rio de <em>tidyverse</em> n&#xE3;o &#xE9; o <strong>messy</strong>verse, e sim muitos outros universos de pacotes interconectados.&#x201D;.</p>
<p>Os princ&#xED;pios fundamentais do <code>tidyverse</code> s&#xE3;o:</p>
<ol>
<li>Reutilizar estruturas de dados existentes.</li>
<li>Organizar fun&#xE7;&#xF5;es simples usando o <em>pipe</em>.</li>
<li>Aderir &#xE0; programa&#xE7;&#xE3;o funcional.</li>
<li>Projetado para ser usado por seres humanos.</li>
</ol>
<p>No <a href="https://cran.r-project.org/web/packages/tidyverse/vignettes/manifesto.html">texto do manifesto tidy</a> cada um dos lemas &#xE9; descrito de forma detalhada. Aqui, selecionei os aspectos que achei mais importante de cada um deles.</p>
<h3>Reutilizar estruturas de dados existentes</h3>
<ul>
<li>Quando poss&#xED;vel, &#xE9; melhor utilizar estruturas de dados comuns do que criar uma estrutura espec&#xED;fica para o seu pacote.</li>
<li>Geralmente, &#xE9; melhor reutilizar uma estrutura existente mesmo que ela n&#xE3;o se encaixe perfeitamente.</li>
</ul> <h3>Organizar fun&#xE7;&#xF5;es simples usando o <em>pipe</em></h3>
<ul>
<li>Fa&#xE7;a com que suas fun&#xE7;&#xF5;es sejam o mais simples poss&#xED;veis. Uma fun&#xE7;&#xE3;o deve poder ser descrita com apenas uma senten&#xE7;a.</li>
<li>A sua fun&#xE7;&#xE3;o deve fazer uma transforma&#xE7;&#xE3;o no estilo <em>copy-on-modify</em> ou ter um efeito colateral. Nunca os dois.</li>
<li>O nome das fun&#xE7;&#xF5;es devem ser verbos. Exceto quando as fun&#xE7;&#xF5;es do pacote usam sempre o mesmo verbo. Ex: adicionar ou modificar.</li>
</ul> <h3>Aderir &#xE0; programa&#xE7;&#xE3;o funcional</h3>
<ul>
<li>O R &#xE9; uma linguagem de <a href="https://pt.wikipedia.org/wiki/Programa%C3%A7%C3%A3o_funcional">programa&#xE7;&#xE3;o funcional</a>, n&#xE3;o lute contra isso.</li>
</ul> <div id="projetado-para-ser-usado-por-seres-humanos" class="section level3"> <ul>
<li>Desenvolva o seu pacote para ser usado por humanos. Foque em ter uma API clara para que voc&#xEA; escreva o c&#xF3;digo de maneira intuitiva e r&#xE1;pida. Efici&#xEA;ncia dos algoritmos &#xE9; uma preocupa&#xE7;&#xE3;o secund&#xE1;ria, pois gastamos mais tempo escrevendo o c&#xF3;digo do que executando.</li>
</ul> <p>Esses princ&#xED;pios s&#xE3;o bem gerais, mas ajudam bastante a tomar decis&#xF5;es quando estamos escrevendo o nosso c&#xF3;digo. Para finalizar, clique <a href="https://github.com/search?utf8=%E2%9C%93&amp;q=tidy+language%3Ar">aqui</a> e veja uma busca no Github por &#x201C;tidy&#x201D; em reposit&#xF3;rios de R. S&#xE3;o mais de 2000 resultados quase todos seguindo essa filosofia e estendendo o <em>universo arrumado</em>.</p>
</div> </div> </div>
