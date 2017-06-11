+++
title = "As cores da Marvel vs DC"
date = "2017-05-01 20:26:00"
categories = ["curso-r"]
+++

<div id="post-content"> <p>A cor &#xE9; uma diferen&#xE7;a not&#xE1;vel entre os filmes da Marvel e da DC. Enquanto a Disney/Marvel Studios costuma lan&#xE7;ar filmes com tons mais claros e alegres, a Warner tem optado por cen&#xE1;rios escuros, com um aspecto mais sombrios. Essas escolhas s&#xE3;o um reflexo do clima das hist&#xF3;rias de cada universo: aventuras engra&#xE7;aralhas com um drama superficial vs seja l&#xE1; o que passa na cabe&#xE7;a do <a href="http://retalhoclub.com.br/wp-content/uploads/2017/03/03.jpg">Zack Snyder</a>.</p>
<p>Para estudar melhor a paleta de cores utilizadas nos filmes, vamos aplicar a an&#xE1;lise introduzida pelo Dani <a href="http://curso-r.com/blog/2017/04/22/2017-04-21-paleta-de-cores/">neste post</a>, com pequenas altera&#xE7;&#xF5;es. Como amostra, selecionei 10 imagens de Batman vs Superman e 10 do Capit&#xE3;o Am&#xE9;rica: guerra civil. Tentando deixar a an&#xE1;lise o menos subjetiva poss&#xED;vel, escolhi imagens de cenas emblem&#xE1;ticas e dos principais personagens. Abaixo as imagens que peguei de cada filme.</p>
<p><img src="http://curso-r.com/blog/2017-05-01-as-paletas-de-cores-da-marvel-vs-dc_files/figure-html/unnamed-chunk-1-1.png" width="768"></p>
<p><img src="http://curso-r.com/blog/2017-05-01-as-paletas-de-cores-da-marvel-vs-dc_files/figure-html/unnamed-chunk-2-1.png" width="768"></p>
<p>Seguindo a an&#xE1;lise do Dani, vamos utilizar as seguintes bibliotecas para a an&#xE1;lise.</p>
<pre class="r"><code>library(jpeg)
library(tidyverse)
library(glue)</code></pre>
<p>Eu salvei as imagens em arquivos do tipo &#x201C;bvs_n.jpg&#x201D; e &#x201C;cw_n.jpg&#x201D;, com n variando de 1 a 10. Isso facilitou a leitura desses arquivos. O c&#xF3;digo abaixo mostra como criar um vetor com o caminho das 10 imagens de cada filme. Se voc&#xEA; quiser saber mais sobre a fun&#xE7;&#xE3;o <code>glue()</code>, visite <a href="http://curso-r.com/blog/2017/04/17/2017-04-08-glue/">este post</a>.</p>
<pre class="r"><code>arquivos_bvs &lt;- glue(&quot;images/bvs_{n}.jpg&quot;, n = 1:10)
arquivos_cw &lt;- glue(&quot;images/cw_{n}.jpg&quot;, n = 1:10)</code></pre>
<p>Como vamos trabalhar com mais de uma imagem, eu criei a fun&#xE7;&#xE3;o <code>ler_imagem()</code> para ler os arquivos.</p>
<pre class="r"><code>ler_imagem &lt;- function(caminho) { img &lt;- readJPEG(caminho) %&gt;% apply(3, as.numeric) }</code></pre>
<p>Podemos ent&#xE3;o usar a fun&#xE7;&#xE3;o <code>map()</code> para aplic&#xE1;-la a todos os 10 arquivos. A fun&#xE7;&#xE3;o <code>reduce(rbind)</code> transforma as 10 matrizes de pixels em uma matriz s&#xF3;, como se as imagens estivessem coladas uma embaixo da outra.</p>
<pre class="r"><code>img_bvs &lt;- map(arquivos_bvs, ler_imagem) %&gt;% reduce(rbind)
img_cw &lt;- map(arquivos_cw, ler_imagem) %&gt;% reduce(rbind)</code></pre>
<p>Abaixo est&#xE3;o as fun&#xE7;&#xF5;es <code>cria_paleta()</code> e <code>exibir()</code> do post do Dani. A &#xFA;nica diferen&#xE7;a aqui &#xE9; que a fun&#xE7;&#xE3;o <code>cria_paleta()</code> j&#xE1; recebe a matriz representando a imagem.</p>
<pre class="r"><code>criar_paleta &lt;- function(img_matrix, num_cores){ km &lt;- kmeans(img_matrix, centers = num_cores) img_df &lt;- tibble( r = img_matrix[,1], g = img_matrix[,2], b = img_matrix[,3], cluster = km$cluster ) centroides &lt;- img_df %&gt;% group_by(cluster) %&gt;% summarise_all(mean) centroides &lt;- centroides %&gt;% mutate(cor = rgb(r, g, b)) sort(centroides$cor)
} exibir &lt;- function(x) { n &lt;- length(x) old &lt;- par(mar = c(0.5, 0.5, 0.5, 0.5)) on.exit(par(old)) image(1:n, 1, as.matrix(1:n), col = x, ylab = &quot;&quot;, xaxt = &quot;n&quot;, yaxt = &quot;n&quot;, bty = &quot;n&quot;)
}
</code></pre>
<p>Assim, basta aplicar essas fun&#xE7;&#xF5;es aos objetos <code>img_bvs</code> e <code>img_cw</code> para obter as paletas. Primeiro para o Batman vs Superman:</p>
<pre class="r"><code>paleta_bvs &lt;- criar_paleta(img_bvs, 10)
exibir(paleta_bvs)</code></pre>
<p><img src="http://curso-r.com/blog/2017-05-01-as-paletas-de-cores-da-marvel-vs-dc_files/figure-html/unnamed-chunk-9-1.png" width="768"></p>
<p>E agora para o Capit&#xE3;o Am&#xE9;rica:</p>
<pre class="r"><code>paleta_cw &lt;- criar_paleta(img_cw, 10)
exibir(paleta_cw)</code></pre>
<p><img src="http://curso-r.com/blog/2017-05-01-as-paletas-de-cores-da-marvel-vs-dc_files/figure-html/unnamed-chunk-11-1.png" width="768"></p>
<p>Observe que o filme da DC tem cores mais escuras e fortes, com v&#xE1;rios tons de azul, indicando as cenas noturnas e de chuva. J&#xE1; a paleta da Marvel apresenta cores mais claras, com v&#xE1;rios tons representando o c&#xE9;u p&#xE1;lido das cenas externas.</p>
<p>Podemos fazer a an&#xE1;lise agora para o p&#xF4;ster de cada filme (o que aparece no IMDB):</p>
<p><img src="http://curso-r.com/blog/2017-05-01-as-paletas-de-cores-da-marvel-vs-dc_files/figure-html/unnamed-chunk-12-1.png" width="768"></p>
<pre class="r"><code>img_bvs &lt;- ler_imagem(&quot;images/bvs_poster.jpg&quot;)
paleta_bvs &lt;- criar_paleta(img_bvs, 10)
exibir(paleta_bvs)</code></pre>
<p><img src="http://curso-r.com/blog/2017-05-01-as-paletas-de-cores-da-marvel-vs-dc_files/figure-html/unnamed-chunk-14-1.png" width="768"></p>
<pre class="r"><code>img_cw &lt;- ler_imagem(&quot;images/cw_poster.jpg&quot;)
paleta_cw &lt;- criar_paleta(img_cw, 10)
exibir(paleta_cw)</code></pre>
<p><img src="http://curso-r.com/blog/2017-05-01-as-paletas-de-cores-da-marvel-vs-dc_files/figure-html/unnamed-chunk-16-1.png" width="768"></p>
<p>Veja que os diferentes tons de azul se repete no p&#xF4;ster do Batman vs Superman. J&#xE1; o p&#xF4;ster do Capit&#xE3;o Am&#xE9;rica &#xE9; bem cinzento, com metade da paleta representando <a href="http://media.melty.com.br/article-6991-ratio265_1020/filme-50-tons-de-cinza-jamie-dornan-christian.jpg">tons de cinza</a>.</p>
<p>Fica ent&#xE3;o o desafio de repetir a an&#xE1;lise para outros filmes e compartilhar o resultado com a gente. Coment&#xE1;rios? Sugest&#xF5;es? Cr&#xED;ticas? Mande a sua opini&#xE3;o!</p> </div>
