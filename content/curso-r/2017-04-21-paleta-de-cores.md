+++
title = "K-means e paleta de cores"
date = "2017-04-22 11:07:31"
categories = ["curso-r"]
+++

<div id="post-content"> <p>Uma aplica&#xE7;&#xE3;o interessante de algoritmos de clusteriza&#xE7;&#xE3;o &#xE9; a obten&#xE7;&#xE3;o de paletas de cores a partir de imagens. Veja como isso pode ser feito usando o R.</p>
<p>Em primeiro lugar, vamos ler a imagem como uma matriz para o R. Existem diversas bibliotecas para carregar as imagens, vamos usar aqui a <a href="https://cran.r-project.org/package=jpeg"><code>jpeg</code></a>. Para esse caso ela &#xE9; melhor porque j&#xE1; l&#xEA; a imagem no formato que precisamos.</p>
<pre class="r"><code>library(jpeg)
library(magrittr)
img &lt;- readJPEG(&quot;img/david-bowie.jpg&quot;)</code></pre>
<p>A imagem lida pelo pacote <code>jpeg</code> &#xE9; representada por um <code>array</code> com dimens&#xF5;es: <code>c(altura, largura, n_bandas)</code> que no nosso caso &#xE9; <code>c(1100, 727, 3)</code>. O n&#xFA;mero de bandas &#xE9; 3: R, G e B.</p>
<p>Podemos exibir a imagem no R, convertendo o array, primeiro em um obheto do tipo <code>raster</code> e depois simplesmente usando a fun&#xE7;&#xE3;o <code>plot</code>.</p>
<pre class="r"><code>plot(as.raster(img))</code></pre>
<p><img src="http://curso-r.com/blog/2017-04-21-paleta-de-cores_files/figure-html/unnamed-chunk-3-1.png" width="1536"></p>
<p>O problema de obter a paleta de cores de uma imagem pode ser formulado como um problema de clusteriza&#xE7;&#xE3;o: &#x201C;obter grupos de individuos que possuem a menor diferen&#xE7;a dentro de cada um e a maior diferen&#xE7;a poss&#xED;vel entre os grupos de acordo com algumas caracter&#xED;sticas das unidades amostrais&#x201D;.</p>
<p>Nesse caso, os indiv&#xED;duos s&#xE3;o os pixels da imagem e as caracter&#xED;sticas que estamos interessados s&#xE3;o os valores de R, de G e de B (valores que representam a cor do pixel). Para o algortimos de clusteriza&#xE7;&#xE3;o, precisamos de uma matriz com as 3 colunas R, G e B e largura*altura (numero de pixels) linhas representado os indiv&#xED;duos. &#xC9; exatamente essa convers&#xE3;o que o trecho de c&#xF3;digo a seguir realiza.</p>
<pre class="r"><code>img_matrix &lt;- apply(img, 3, as.numeric)</code></pre>
<p>Agora temos uma matriz com 3 colunas e 799.700 linhas. Vamos aplicar agora o algoritmo k-means, para organizar cada um desses pixels em um grupo. O K-means pede o n&#xFA;mero de grupos como input, vamos come&#xE7;ar com 6.</p>
<pre class="r"><code>km &lt;- kmeans(img_matrix, centers = 6)</code></pre>
<p>O objeto gerado pela fun&#xE7;&#xE3;o <code>kmeans</code> armazena um vetor chamado <code>cluster</code> (do tamanho do n&#xFA;mero de linhas da matriz) com um identificador do grupo de cada observa&#xE7;&#xE3;o da matriz.</p>
<p>A cor que representa cada um dos grupos &#xE9; representada pelo vetor c(r, g, b) com a m&#xE9;dia de todas as observa&#xE7;&#xF5;es de cada um dos grupos. Podemos obter isso com algumas manipula&#xE7;&#xF5;es usando o <code>dplyr</code>.</p>
<pre class="r"><code>library(tibble)
library(dplyr)
## ## Attaching package: &apos;dplyr&apos;
## The following objects are masked from &apos;package:stats&apos;:
## ## filter, lag
## The following objects are masked from &apos;package:base&apos;:
## ## intersect, setdiff, setequal, union
img_df &lt;- tibble( r = img_matrix[,1], g = img_matrix[,2], b = img_matrix[,3], cluster = km$cluster )
centroides &lt;- img_df %&gt;% group_by(cluster) %&gt;% summarise_all(mean) centroides
## # A tibble: 6 x 4
## cluster r g b
## &lt;int&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt;
## 1 1 0.0996826 0.04366903 0.2398452
## 2 2 0.6239192 0.28335790 0.1897367
## 3 3 0.8857289 0.77915257 0.6688482
## 4 4 0.2721465 0.36412137 0.4901613
## 5 5 0.3789830 0.11857741 0.1558412
## 6 6 0.7195362 0.54881786 0.4098359</code></pre>
<p>Tamb&#xE9;m transformamos uma cor r, g e b em uma representa&#xE7;&#xE3;o hexadecimal. Assim conseguimos um vetor de caracteres que representa a a paleta de cores.</p>
<pre class="r"><code>centroides &lt;- centroides %&gt;% mutate(cor = rgb(r, g, b))
centroides$cor
## [1] &quot;#190B3D&quot; &quot;#9F4830&quot; &quot;#E2C7AB&quot; &quot;#455D7D&quot; &quot;#611E28&quot; &quot;#B78C69&quot;</code></pre>
<p>Para exibir a paleta vamos usar a seguinte fun&#xE7;&#xE3;o que foi copiada e levemente modificada <a href="https://github.com/karthik/wesanderson">daqui</a></p>
<pre class="r"><code>exibir &lt;- function(x) { n &lt;- length(x) old &lt;- par(mar = c(0.5, 0.5, 0.5, 0.5)) on.exit(par(old)) image(1:n, 1, as.matrix(1:n), col = x, ylab = &quot;&quot;, xaxt = &quot;n&quot;, yaxt = &quot;n&quot;, bty = &quot;n&quot;)
}
exibir(sort(centroides$cor))</code></pre>
<p><img src="http://curso-r.com/blog/2017-04-21-paleta-de-cores_files/figure-html/unnamed-chunk-8-1.png" width="672"></p>
<p>Assim obtivemos uma paleta de cores da imagem que mostramos anteriormente. Vamos colocar todo o c&#xF3;digo que fizemos passo a passo aqui em uma &#xFA;nica fun&#xE7;&#xE3;o para podermos facilmente criar a paleta de cores para outras imagens.</p>
<pre class="r"><code>criar_paleta &lt;- function(img, num_cores){ # transforma a imagem em uma matriz img_matrix &lt;- apply(img, 3, as.numeric) # treina o algoritmo de k m&#xE9;dias km &lt;- kmeans(img_matrix, centers = num_cores) img_df &lt;- tibble( r = img_matrix[,1], g = img_matrix[,2], b = img_matrix[,3], cluster = km$cluster ) # calcula os centroides dos grupos centroides &lt;- img_df %&gt;% group_by(cluster) %&gt;% summarise_all(mean) # transforma a cor em hexadecimal centroides &lt;- centroides %&gt;% mutate(cor = rgb(r, g, b)) # vetor de cores sort(centroides$cor)
}</code></pre>
<p>Vejamos agora o que acontece com essa bela imagem do filme Moonrise Kingdom do Wes Anderson, que &#xE9; famoso por fazer filmes com belas paletas de cores.</p>
<pre class="r"><code>moonrise &lt;- readJPEG(&quot;img/moonrise-kingdom.jpg&quot;)
plot(as.raster(moonrise))</code></pre>
<p><img src="http://curso-r.com/blog/2017-04-21-paleta-de-cores_files/figure-html/unnamed-chunk-10-1.png" width="1536"></p>
<pre class="r"><code>paleta &lt;- criar_paleta(moonrise, 6)
exibir(paleta)</code></pre>
<p><img src="http://curso-r.com/blog/2017-04-21-paleta-de-cores_files/figure-html/unnamed-chunk-11-1.png" width="672"></p>
<p>&#xC9; isso. Se voc&#xEA; gostou, tente fazer com outras imagens e compartilhe com a gente os resultados.</p> </div>
