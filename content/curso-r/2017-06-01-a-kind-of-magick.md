+++
title = "A kind of magick"
date = "2017-06-01 20:26:00"
categories = ["curso-r"]
+++

<div><p class="text-muted text-uppercase mb-small text-right"> Por <a href="http://curso-r.com/author/william">William</a> 01/06/2017 </p><div id="post-content"> <p>J&#xE1; vimos como o Rstudio se torna uma ferramenta poderosa quando combinado com certos pacotes, como o <code>knitr</code> e <code>shiny</code>, ou outros recursos, como o <em>markdown</em> e o <em>git</em>. Hoje, veremos como transformar o Rstudio num elegante e interativo editor de imagens utilizando o pacote <code>magick</code>.</p>
<p>Este <em>post</em> &#xE9; um breve resumo das funcionalidades do <code>magick</code>. Para uma apresenta&#xE7;&#xE3;o completa, visite o <a href="https://cran.r-project.org/web/packages/magick/vignettes/intro.html">vignette do pacote</a>.</p>
<p>J&#xE1; usamos o magick em outros posts do blog (&#xE0;s vezes por tr&#xE1;s das cortinas) para tratar imagens. Esse pacote &#xE9; um <em>wrapper</em> da biblioteca <a href="https://www.imagemagick.org/Magick++/STL.html">ImageMagick</a>, provavelmente a biblioteca <em>open-source</em> para processamento de imagens mais amig&#xE1;vel dispon&#xED;vel hoje em dia.</p>
<div id="instalacao" class="section level2"> <p>No Windows ou OS-X, instale via CRAN:</p>
<pre class="r"><code>install.packages(&quot;magick&quot;)</code></pre>
<p>No Linux, consulte o <a href="https://cran.r-project.org/web/packages/magick/vignettes/intro.html#build_from_source">vignette do Magick</a> para mais informa&#xE7;&#xF5;es.</p>
</div>
<div id="lendo-e-escrevendo-imagens" class="section level2"> <p>Para come&#xE7;ar a usar as fun&#xE7;&#xF5;es do <code>magick</code>, carregue o pacote.</p>
<pre class="r"><code>library(magick)
library(magrittr)</code></pre>
<p>Vamos utilizar a seguinte imagem como exemplo neste post:</p>
<p><img src="http://curso-r.com/blog/2017-06-01-a-kind-of-magick_files/figure-html/unnamed-chunk-3-1.png" width="768"></p>
<p>A fun&#xE7;&#xE3;o <code>image_read()</code> l&#xEA; imagens de arquivos, como <code>.jpg</code> ou <code>png</code>. Diversas outras extens&#xF5;es s&#xE3;o suportadas. Utilize <code>str(magick::magick_config())</code> para verificar quais formatos est&#xE3;o dispon&#xED;veis na sua vers&#xE3;o do ImageMagick.</p>
<pre><code>## format width height colorspace filesize
## 1 JPEG 2745 1780 RGB 662239</code></pre>
<p>A fun&#xE7;&#xE3;o <code>image_write()</code> exporta imagens em qualquer um dos formatos suportados.</p>
<pre class="r"><code>image_write(freddie, path = &quot;freddie_png.png&quot;, format = &quot;png&quot;)</code></pre>
<p><strong>Dica</strong>: no Rstudio, pasta rodar o objeto <code>freddie</code> para visualizar a imagem no painel <em>Viewer</em>.</p>
</div>
<div id="convertendo" class="section level1"> <p>Ao ler uma imagem com o magick, ela &#xE9; guardada em mem&#xF3;ria em seu formato original. Para converter essa imagem, utilizamos a fun&#xE7;&#xE3;o <code>image_convert()</code>.</p>
<pre class="r"><code>freddie_png &lt;- image_convert(freddie, &quot;png&quot;)
image_info(freddie_png)
## format width height colorspace filesize
## 1 png 2745 1780 RGB 0</code></pre>
<p>Neste ponto voc&#xEA; j&#xE1; deve ter reparado que as (principais) fun&#xE7;&#xF5;es do pacote <code>magick</code> utilizam o prefixo <code>image_</code>.</p>
</div>
<div id="cortando-e-editando" class="section level1"> <p>A maioria das transforma&#xE7;&#xF5;es que voc&#xEA; pode fazer com as imagens utilizar&#xE1; um par&#xE2;metro <code>geometry</code>. Esse par&#xE2;metro requer uma sintaxe especial, da forma AXB+C+D, sendo que cada elemento (A, B, C e D) &#xE9; opcional. Veja alguns exemplos:</p>
<ul>
<li><code>image_crop(image, &quot;100x150+50+20&quot;)</code>: recorta uma regi&#xE3;o de tamanho 100px x 150px, come&#xE7;ando +50px da esquerda para a direita e +20px de cima para baixo;</li>
<li><code>image_scale(image, &quot;200&quot;)</code>: redimensiona proporcionalmente ao comprimento: 200px;</li>
<li><code>image_scale(image, &quot;x200&quot;)</code>: redimensiona proporcionalmente &#xE0; altura: 200px;</li>
<li><code>image_border(frink, &quot;red&quot;, &quot;20x10&quot;)</code>: adiciona uma borda de 20px (esquerda/direita) e 10px (cima/baixo)</li>
</ul>
<p>Para mais detalhes sobre essa sintaxe, consulte <a href="http://www.imagemagick.org/Magick++/Geometry.html">este link</a>.</p>
<p>Vamos testar essas fun&#xE7;&#xF5;es na nossa imagem!</p>
<p>Come&#xE7;aremos a redimensionando para facilitar o uso e a visualiza&#xE7;&#xE3;o de algumas fun&#xE7;&#xF5;es.</p>
<pre class="r"><code>freddie_resized &lt;- image_scale(freddie, &quot;500&quot;)
image_info(freddie_resized)
## format width height colorspace filesize
## 1 JPEG 500 324 RGB 0</code></pre>
<p>Agora, vamos recortar um peda&#xE7;o.</p>
<pre class="r"><code>image_crop(freddie_resized, &quot;100x150+280+30&quot;)</code></pre>
<p><img src="http://curso-r.com/blog/2017-06-01-a-kind-of-magick_files/figure-html/unnamed-chunk-9-1.png" width="384"></p>
<p>Colocar uma borda.</p>
<pre class="r"><code>image_border(freddie_resized, &quot;purple&quot;, &quot;20x10&quot;)</code></pre>
<p><img src="http://curso-r.com/blog/2017-06-01-a-kind-of-magick_files/figure-html/unnamed-chunk-11-1.png" width="768"></p>
<p>Gir&#xE1;-la de ponta-cabe&#xE7;a.</p>
<pre class="r"><code>image_flip(freddie_resized)</code></pre>
<p><img src="http://curso-r.com/blog/2017-06-01-a-kind-of-magick_files/figure-html/unnamed-chunk-13-1.png" width="768"></p>
<p>E inverter a dire&#xE7;&#xE3;o.</p>
<pre class="r"><code>image_flop(freddie_resized)</code></pre>
<p><img src="http://curso-r.com/blog/2017-06-01-a-kind-of-magick_files/figure-html/unnamed-chunk-15-1.png" width="768"></p>
<p>Com o pipe, fica f&#xE1;cil aplicar todas as fun&#xE7;&#xF5;es ao mesmo tempo.</p>
<pre class="r"><code>freddie_resized %&gt;% image_crop(&quot;100x150+280+30&quot;) %&gt;% image_border(&quot;purple&quot;, &quot;20x10&quot;) %&gt;% image_flip %&gt;% image_flop</code></pre>
<p><img src="http://curso-r.com/blog/2017-06-01-a-kind-of-magick_files/figure-html/unnamed-chunk-17-1.png" width="384"></p>
</div>
<div id="filtros-e-efeitos" class="section level1"> <p>Agora vamos aplicar alguns filtros e efeitos.</p>
<pre class="r"><code>image_blur(freddie_resized, 10, 5)</code></pre>
<p><img src="http://curso-r.com/blog/2017-06-01-a-kind-of-magick_files/figure-html/unnamed-chunk-19-1.png" width="672"></p>
<pre class="r"><code>image_noise(freddie_resized)</code></pre>
<p><img src="http://curso-r.com/blog/2017-06-01-a-kind-of-magick_files/figure-html/unnamed-chunk-21-1.png" width="672"></p>
<pre class="r"><code>image_annotate(freddie_resized, &quot;Farrokh Bulsara&quot;, size = 30, color = &quot;red&quot;, boxcolor = &quot;white&quot;, degrees = 9, location = &quot;+60+30&quot;)</code></pre>
<p><img src="http://curso-r.com/blog/2017-06-01-a-kind-of-magick_files/figure-html/unnamed-chunk-23-1.png" width="672"></p>
</div>
<div id="o-que-mais-da-para-fazer" class="section level1"> <p>Realmente recomendamos uma leitura do Vignette do magick para ter uma boa ideia de tudo o que ele permite fazer. Al&#xE9;m de v&#xE1;rias outras ferramentas de edi&#xE7;&#xE3;o para imagens est&#xE1;ticas, ainda &#xE9; poss&#xED;vel mexer com GIFs e anima&#xE7;&#xF5;es! Ou fazer coisas como:</p>
<pre class="r"><code>library(ggplot2)
library(grid) qplot(speed, dist, data = cars, geom = c(&quot;point&quot;, &quot;smooth&quot;))
grid.raster(freddie_cropped, width = 0.15, height = 0.3, hjust = -2, vjust = 1)</code></pre>
<pre><code>## `geom_smooth()` using method = &apos;loess&apos;</code></pre>
<p><img src="http://curso-r.com/blog/2017-06-01-a-kind-of-magick_files/figure-html/unnamed-chunk-25-1.png" width="672"></p>
</div> </div></div>
