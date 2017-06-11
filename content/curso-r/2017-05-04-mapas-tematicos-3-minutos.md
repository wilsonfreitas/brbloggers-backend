+++
title = "Gráficos miojo: Mapas temáticos do Brasil em 3 minutos ou menos"
date = "2017-05-04 20:26:00"
categories = ["curso-r"]
+++

<div><p class="text-muted text-uppercase mb-small text-right"> Por <a href="http://curso-r.com/author/fernando">Fernando</a> 04/05/2017 </p><div id="post-content"> <p>De todas as visualiza&#xE7;&#xF5;es, mapas s&#xE3;o aquelas que impressionam mais. &#xC9; muito mais f&#xE1;cil algu&#xE9;m se maravilhar com o mapa mais simples do que com o <code>ggplot2</code> mais complicado. Felizmente, considerando essa compara&#xE7;&#xE3;o, o R disponibiliza muitos recursos para construir mapas.</p>
<p>Dentro do <code>tidyverse</code> &#xE9; poss&#xED;vel construir mapas usando a fun&#xE7;&#xE3;o <code>geom_map</code>, do pacote <code>ggplot2</code>, mas est&#xE1; fora do escopo deste post explicar como ela funciona. Aqui vamos apenas descobrir como us&#xE1;-la para agilizar a constru&#xE7;&#xE3;o de um gr&#xE1;fico simples.</p>
<p>Na Associa&#xE7;&#xE3;o Brasileira de Jurimetria, n&#xF3;s temos um tipo favorito de mapa. Tipicamente temos interesse em diferenciar as unidades da federa&#xE7;&#xE3;o por alguma vari&#xE1;vel quantitativa, seja ela categorizada ou n&#xE3;o, e a ferramenta certa para isso &#xE9; um mapa tem&#xE1;tico dos estados. Essa necessidade &#xE9; t&#xE3;o frequente que as ferramentas mais importantes para constru&#xE7;&#xE3;o desses gr&#xE1;ficos est&#xE3;o num pacote chamado <code>abjData</code>.</p>
<p>As coisas est&#xE3;o dispostas de tal forma que, a partir de uma tabela que relaciona uma variavel e os estados brasileiros, construir um gr&#xE1;fico similar ao mapa abaixo pode ser feito chamando apenas uma fun&#xE7;&#xE3;o<a href="http://curso-r.com/blog/2017/05/04/2017-05-04-mapas-tematicos-3-minutos/#fn1" class="footnoteRef" id="fnref1"><sup>1</sup></a>.</p>
<pre class="r"><code>dataset %&gt;% constroi_mapa_tematico()</code></pre>
<p><img src="http://curso-r.com/blog/2017-05-04-mapas-tematicos-3-minutos_files/figure-html/unnamed-chunk-4-1.png" width="672"></p>
<p>Neste post, vamos construir a fun&#xE7;&#xE3;o <code>constroi_mapa_tematico</code> e aprender a implementar alguns <code>tweaks</code>.</p>
<div id="a-funcao" class="section level2"> <p>O <code>geom_map</code> &#xE9; uma fun&#xE7;&#xE3;o do <code>ggplot2</code> que renderiza coordenadas de mapas. Ela pega um data_frame especial que diz quais coordenadas usar (e como us&#xE1;-las) e plota no gr&#xE1;fico. Esse mapa normalmente &#xE9; obtido aplicando a fun&#xE7;&#xE3;o <code>fortify</code> em um conjunto de dados geospaciais.</p>
<p>Para os gr&#xE1;ficos que vamos construir aqui, n&#xE3;o vai ser necess&#xE1;rio aplicar a fun&#xE7;&#xE3;o <code>fortify</code>, pois o resultado desse passo j&#xE1; est&#xE1; dispon&#xED;vel no pacote <code>abjData</code> e ele &#xE9; o data_frame <code>br_uf_map</code>. Tudo que vamos precisar fazer &#xE9; pedir que o <code>geom_map</code> use esse cara.</p>
<pre class="r"><code>devtools::install_github(&apos;abjur/abjData&apos;)
#instala o pacote</code></pre>
<pre class="r"><code>constroi_mapa_tematico &lt;- function(dataset){ dataset %&gt;% inner_join(abjData::br_uf_map) %&gt;% { ggplot(.) + geom_map(aes(x = long, y = lat, map_id = id, fill = variavel), color = &apos;gray30&apos;, map = ., data = .) + theme_void() + coord_equal() }
}</code></pre>
<p>O <code>input</code> da fun&#xE7;&#xE3;o &#xE9; uma tabela <code>dataset</code> com duas colunas</p>
<ul>
<li><code>id</code>, que representa as unidades da federa&#xE7;&#xE3;o abreviada;</li>
<li><code>variavel</code>, vari&#xE1;vel num&#xE9;rica (ou fator) que vai colorir o gr&#xE1;fico.</li>
</ul>
<p>No exemplo acima essa tabela era:</p>
<pre class="r"><code>dataset %&gt;% head(10)</code></pre>
<pre><code>FALSE # A tibble: 10 x 2
FALSE id variavel
FALSE &lt;chr&gt; &lt;dbl&gt;
FALSE 1 TO 94.93079
FALSE 2 SP 278.79676
FALSE 3 SE 35.50231
FALSE 4 SC 204.85650
FALSE 5 RS 169.19369
FALSE 6 RR 114.90413
FALSE 7 RO 152.47085
FALSE 8 RN 26.22847
FALSE 9 RJ 107.42855
FALSE 10 PR 148.47011</code></pre>
</div>
<div id="os-tweaks" class="section level2"> <p>A fun&#xE7;&#xE3;o <code>constroi_mapa_tematico</code> devolve um <code>ggplot2</code>, ent&#xE3;o ainda d&#xE1; pra mexer em alguns par&#xE2;metros est&#xE9;ticos ap&#xF3;s a constru&#xE7;&#xE3;o do mapa. As tr&#xEA;s coisas que vamos aprender a fazer s&#xE3;o</p>
<ol>
<li>Adicionar labels e t&#xED;tulos</li>
</ol>
<pre class="r"><code>dataset %&gt;% constroi_mapa_tematico() + ggtitle(&quot;Roubos de carros no Brasil em 2014&quot;) + scale_fill_continuous(name = &quot;Taxa/100 mil hab.&quot;)</code></pre>
<p><img src="http://curso-r.com/blog/2017-05-04-mapas-tematicos-3-minutos_files/figure-html/unnamed-chunk-8-1.png" width="672"></p>
<ol>
<li>Alterar as cores da escala</li>
</ol>
<pre class="r"><code>dataset %&gt;% constroi_mapa_tematico() + ggtitle(&quot;Roubos de carros no Brasil em 2014&quot;) + scale_fill_continuous(name = &quot;Taxa/100 mil hab.&quot;, low = &apos;white&apos;, high = &apos;red&apos;, na.value = &apos;white&apos;)</code></pre>
<p><img src="http://curso-r.com/blog/2017-05-04-mapas-tematicos-3-minutos_files/figure-html/unnamed-chunk-9-1.png" width="672"></p> <pre class="r"><code>dataset %&gt;% constroi_mapa_tematico() + ggtitle(&quot;Roubos de carros no Brasil em 2014&quot;) + scale_fill_continuous(name = &quot;Taxa/100 mil hab.&quot;, low = &apos;green&apos;, high = &apos;red&apos;, na.value = &apos;white&apos;, breaks = seq(0,300,50))</code></pre>
<p><img src="http://curso-r.com/blog/2017-05-04-mapas-tematicos-3-minutos_files/figure-html/unnamed-chunk-10-1.png" width="672"></p>
</div> </div></div>
