+++
title = "leaflet com markerCluster"
date = "2017-03-01 20:26:00"
categories = ["curso-r"]
+++

<div><p class="text-muted text-uppercase mb-small text-right"> Por <a href="http://curso-r.com/author/julio">Julio</a> 01/03/2017 </p><div id="post-content"> <p>O <a href="http://curso-r.com/blog/2017/03/01/2017-02-21-markercluster/leafletjs.com"><em>leaflet</em></a> &#xE9; uma biblioteca javascript para cria&#xE7;&#xE3;o de mapas interativos. O pacote <a href="https://rstudio.github.io/leaflet/"><code>leaflet</code></a> do R &#xE9; um <a href="http://curso-r.com/blog/2017/03/01/2017-02-21-markercluster/www.htmlwidgets.org/"><code>htmlwidget</code></a> que permite gerar esses mapas de forma direta no R, para usar em documentos <code>RMarkdown</code> e Shiny.</p>
<p>Uma das ferramentas que mais gosto do leaflet &#xE9; a fun&#xE7;&#xE3;o <code>markerClusterOptions()</code>, que permite agrupar pontos no mapa em conjuntos de v&#xE1;rios pontos.</p>
<p>Como exemplo, utilizaremos uma base de dados que cont&#xE9;m a localiza&#xE7;&#xE3;o e informa&#xE7;&#xF5;es das varas da Justi&#xE7;a Estadual no Brasil. A Tabela <a href="http://curso-r.com/blog/2017/03/01/2017-02-21-markercluster/#tab:aj">1</a> mostra as cinco primeiras linhas dessa base. A coluna <code>lab</code> j&#xE1; foi trabalhada para ser adicionada nos marcadores do mapa como popup.</p>
<table>
<caption><span id="tab:aj">Table 1: </span>Primeiras cinco linhas da base de dados de varas estaduais do Brasil.</caption>
<thead> </thead>
<tbody>
<tr class="odd">
<td>-21.243369</td>
<td>-48.80407</td>
<td>SP</td>
<td>Santa Ad&#xE9;lia</td>
<td>VARA &#xDA;NICA</td>
<td><b>VARA &#xDA;NICA</b>PRA&#xC7;A DR. ADHEMAR DE BARROS 255Santa Ad&#xE9;lia - SP, CEP 15950-000Santa Ad&#xE9;lia - SP<p>Telefone indispon&#xED;vel</p></td>
</tr>
<tr class="even">
<td>-3.102226</td>
<td>-67.95186</td>
<td>AM</td>
<td>Santo Ant&#xF4;nio do I&#xE7;&#xE1;</td>
<td>VARA DA COMARCA DE SANTO ANT&#xD4;NIO DO I&#xC7;&#xC1;</td>
<td><b>VARA DA COMARCA DE SANTO ANT&#xD4;NIO DO I&#xC7;&#xC1;</b>HUGO RIBEIRO S/NSanto Ant&#xF4;nio do I&#xE7;&#xE1; - AM, CEP 69680-000Santo Ant&#xF4;nio do I&#xE7;&#xE1; - AM<p>(097) 9791-8763</p></td>
</tr>
<tr class="odd">
<td>-3.067617</td>
<td>-59.95668</td>
<td>AM</td>
<td>Manaus</td>
<td>2&#xBA; VARA DE FAM&#xCD;LIA E SUCESS&#xD5;ES</td>
<td><b>2&#xBA; VARA DE FAM&#xCD;LIA E SUCESS&#xD5;ES</b>RUA PARAIBA S/NManaus - AM, CEP 69079-265Manaus - AM<p>(092) 9233-0351</p></td>
</tr>
<tr class="even">
<td>-8.623957</td>
<td>-35.95085</td>
<td>PE</td>
<td>Cupira</td>
<td>VARA UNICA DA COMARCA DE CUPIRA</td>
<td><b>VARA UNICA DA COMARCA DE CUPIRA</b>RUA JOSE LUIZ DA SILVEIRA BARROS 146Cupira - PE, CEP 55460-000Cupira - PE<p>(081) 8137-3813</p></td>
</tr>
<tr class="odd">
<td>-24.705883</td>
<td>-47.55834</td>
<td>SP</td>
<td>Iguape</td>
<td>JUIZADO ESPECIAL C&#xCD;VEL E CRIMINAL</td>
<td><b>JUIZADO ESPECIAL C&#xCD;VEL E CRIMINAL</b>RUA 9 DE JULHO 169Iguape - SP, CEP 11920-000Iguape - SP<p>(013) 3841-2401</p></td>
</tr>
</tbody>
</table>
<p>Para utilizar o pacote <code>leaflet</code>, basta instalar o pacote via <code>install.packages()</code>. Na Figura <a href="http://curso-r.com/blog/2017/03/01/2017-02-21-markercluster/#fig:mapa">1</a>, experimente passear pelo mapa. Procure tamb&#xE9;m algum lugar que tenha v&#xE1;rias varas juntas, para ver o que o <code>markerCluster</code> faz nesse caso.</p>
<pre class="r"><code>library(dplyr)
library(leaflet)
dados_aj_lab %&gt;% leaflet() %&gt;% addTiles() %&gt;% addMarkers(lng = ~long, lat = ~lat, popup = ~lab, clusterOptions = markerClusterOptions())</code></pre>
<div class="figure"><span id="fig:mapa"></span> <p class="caption">
Figure 1: Mapa das varas estaduais do Brasil.
</p>
</div>
<ul>
<li>A fun&#xE7;&#xE3;o <code>leaflet()</code> carrega o motor do <em>leaflet</em>, ainda em branco.</li>
<li>A fun&#xE7;&#xE3;o <code>addTiles()</code> adiciona as camadas de mapas de acordo com o zoom. &#xC9; poss&#xED;vel escolher temas para essas camadas.</li>
<li>A fun&#xE7;&#xE3;o <code>addMarkers()</code> mapeia as varas da base de dados de acordo com as respectivas latitude e longitude.
<ul>
<li>Note que &#xE9; necess&#xE1;rio adicionar um <code>~</code> antes das vari&#xE1;veis para mape&#xE1;-las da base de dados.</li>
<li>A op&#xE7;&#xE3;o <code>popup</code> permite adicionar um bal&#xE3;o com informa&#xE7;&#xF5;es ao clicar num marcador.</li>
<li>A op&#xE7;&#xE3;o <code>clusterOptions</code> faz a m&#xE1;gica que agrupa os pontos. A regi&#xE3;o azul observada ao colocar o mouse sobre um cluster &#xE9; a casca convexa dos marcadores agrupados.</li>
</ul></li>
</ul> </div></div>
