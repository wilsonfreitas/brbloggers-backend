+++
title = "Você está a menos de 1 km de um Hambúrguer?"
date = "2017-04-10 20:26:00"
categories = ["curso-r"]
+++

<div><p>Se voc&#xEA; estiver no centro de S&#xE3;o Paulo, quanto ser&#xE1; que voc&#xEA; precisa andar para achar uma hamburgueria? Ser&#xE1; que a sua casa fica a menos de 1 km de hospitais, delagacias ou corpo de bombeiros? Neste post, veremos como utilizar uma das APIs do Google Maps para obter informa&#xE7;&#xF5;es de geolocaliza&#xE7;&#xE3;o a partir de uma pesquisa simples. Em seguida, vamos gerar mapas com o pacote <code>leaflet</code> para visualizar os dados coletados e responder essas perguntas.</p><div id="passo-1-configurar-a-api-do-google-places" class="section level2"> <p>A API que vamos utilizar para acessar os dados do Google Maps &#xE9; a <a href="https://developers.google.com/places/web-service/?hl=pt-br">Google Places</a>. Para configur&#xE1;-la, voc&#xEA; precisa fazer o seguinte:</p>
<ol>
<li>criar um projeto no <a href="https://console.developers.google.com/iam-admin/projects">Google APIs</a>;</li>
<li>adicionar a <strong>Google Places API Web Service</strong> &#xE0; sua biblioteca de APIs;</li>
<li>obter uma <a href="https://support.google.com/googleapi/answer/6158862">chave de API</a>; e</li>
<li>enviar uma requisi&#xE7;&#xE3;o.</li>
</ol>
<p>Para mais informa&#xE7;&#xF5;es sobre os itens 1, 2 e 3, bastar acessar os links acima. Aqui, vamos focar em como fazer o item 4.</p>
</div><div id="passo-2-baixar-os-dados-da-api" class="section level2"> <p>A API do Google Places permite fazer <a href="https://developers.google.com/places/web-service/search">alguns tipos de buscas</a>, como estabelecimentos espec&#xED;ficos pr&#xF3;ximos a um local ou dentro de uma regi&#xE3;o pr&#xE9;-delimitada. Nosso objetivo aqui &#xE9; requisitar os dados de todos os estabelecimentos, como hospitais, delegacias, supermercados, escolas etc, dentro de um raio de busca em torno de um ponto espec&#xED;fico. Neste contexto, a requisi&#xE7;&#xE3;o deve ser feita a partir de um link da forma</p>
<blockquote>
<p><a href="https://maps.googleapis.com/maps/api/place/radarsearch/output?parameters" class="uri">https://maps.googleapis.com/maps/api/place/radarsearch/output?parameters</a></p>
</blockquote>
<p>substituindo <em>output</em> pelo formato da sa&#xED;da, <code>xml</code> ou <code>json</code>, e <em>parameters</em> pelos par&#xE2;metros de busca. Utilizaremos aqui o formato <code>json</code>, <em>Javascript Object Notation</em>. Para mais informa&#xE7;&#xF5;es sobre JSON, consulte <a href="http://www.devmedia.com.br/introducao-ao-formato-json/25275">este link</a>.</p>
<p>Utilizaremos as seguintes bibliotecas nesta an&#xE1;lise:</p>
<pre class="r"><code>library(tibble)
library(magrittr)
library(dplyr)
library(stringr)
library(purrr)
library(RCurl)
library(jsonlite)
library(leaflet)</code></pre>
<p>O que precisamos fazer &#xE9; criar a url de requisi&#xE7;&#xE3;o, acess&#xE1;-la, guardar os dados no formato <code>json</code> em um objeto e convert&#xEA;-lo para um data frame. A fun&#xE7;&#xE3;o <code>get_googlemaps_data()</code> abaixo faz exatamente isso. Mais especificamente, ela recebe os par&#xE2;metros de busca, uma chave de API e retorna um data frame com os dados de geolocaliza&#xE7;&#xE3;o (latitude e longitude) dos resultados encontrados.</p>
<ul>
<li>O argumento <code>keyword=</code> recebe o termo a ser pesquisado, isto &#xE9;, se estivermos pesquisando por escolas, esse argumento receber&#xE1; a string <code>&apos;escola&apos;</code>.</li>
<li>O argumento <code>type=</code> recebe um termo para filtrar os estabelecimentos pesquisados. Por exemplo: <code>keyword = &apos;restaurante&apos;</code> e <code>type = &apos;vegetariano&apos;</code>.</li>
<li>Os argumentos <code>central_lat=</code> e <code>central_log=</code> representam, respectivamente, a latitude e a longitude do ponto central da busca. Os valores <em>default</em> s&#xE3;o os do centro da cidade de S&#xE3;o Paulo.</li>
<li>O argumento <code>radius=</code> indica o raio m&#xE1;ximo de busca. O <em>default</em> &#xE9; 15 Km.</li>
<li>O argumento <code>key=</code> deve receber a sua chave de API.</li>
</ul>
<pre class="r"><code>get_googlemaps_data &lt;- function(keyword, type = &quot;&quot;, central_lat = -23.55052, central_log = -46.63331, radius = 15000, key) { basic_url = &quot;https://maps.googleapis.com/maps/api/place/radarsearch/json?&quot; if(type != &quot;&quot;) { type %&lt;&gt;% str_replace_all(&quot; &quot;, &quot;+&quot;) %&gt;% # Os espa&#xE7;os precisam ser str_c(&quot;&amp;type=&quot;, .) # substitu&#xED;dos por &apos;+&apos;. } complete_url &lt;- str_c(basic_url, # Criando a url de requisi&#xE7;&#xE3;o &quot;location=&quot;, # com os par&#xE2;metros de busca. central_lat, &quot;,&quot;, central_log, &quot;&amp;radius=&quot;, radius, type, &quot;&amp;keyword=&quot;, str_replace_all(keyword, &quot; &quot;, &quot;+&quot;), &quot;&amp;key=&quot;, key) json &lt;- RCurl::getURL(complete_url) # Acessando a URL. list_info &lt;- jsonlite::fromJSON(json) # Transformando json em lista. # Guardando a latitude e longitude em um df, assim como o lugar pesquisado. df &lt;- tibble::tibble(lat = list_info$results$geometry$location$lat, long = list_info$results$geometry$location$lng, place = keyword) return(df)
}
</code></pre>
<p>Com a fun&#xE7;&#xE3;o <code>get_googlemaps_data()</code> em m&#xE3;o, basta rodar o c&#xF3;digo <code>get_googlemaps_data(&quot;mercado&quot;, key = sua_API_key)</code> para obter a geolocaliza&#xE7;&#xE3;o de at&#xE9; 200 mercados em um raio de at&#xE9; 15 Km do centro de S&#xE3;o Paulo. Sim, o limite &#xE9; de 200 resultados. N&#xE3;o encontrei maneiras de aumentar esse limite.</p>
<p>Tamb&#xE9;m podemos utilizar a fun&#xE7;&#xE3;o <code>purrr:map_df()</code> para gerar um data frame com v&#xE1;rias buscas. A fun&#xE7;&#xE3;o <em>map</em> mapeia uma determinada fun&#xE7;&#xE3;o em cada elemento de um vetor/lista, retornando um data frame. Ainda n&#xE3;o estamos construindo os mapas.</p>
<pre class="r"><code>places &lt;- c(&quot;pronto socorro&quot;, &quot;delegacia&quot;, &quot;bombeiros&quot;, &quot;hamburguer&quot;, &quot;pizza&quot;) df_places &lt;- places %&gt;% purrr::map_df(.f = get_googlemaps_data, key = key)</code></pre>
<p>&#xC0;s vezes, a requisi&#xE7;&#xE3;o pode retornar com algum erro. N&#xE3;o consegui descobrir o porqu&#xEA; isso acontece. Nestes casos, a fun&#xE7;&#xE3;o <code>get_googlemaps_data()</code> tamb&#xE9;m retornar&#xE1; um erro, provavelmente na constru&#xE7;&#xE3;o do data frame. Se isso acontecer, basta rodar a fun&#xE7;&#xE3;o novamente, gerando uma nova requisi&#xE7;&#xE3;o.</p>
</div><div id="passo-3-os-mapas" class="section level2"> <p>Para construir os mapas, vamos utilizar a fun&#xE7;&#xE3;o <code>leaflet::leaflet()</code>. A ideia &#xE9;, para cada ponto da pesquisa, adicionar um c&#xED;rculo de raio igual a 1 Km. Dessa forma, se voc&#xEA; estiver fora desses c&#xED;rculos, quer dizer que voc&#xEA; estar&#xE1; a mais de um quil&#xF4;metro de um dos estabelecimentos pesquisados. Veja os exemplos a seguir.</p>
<div id="hospitais" class="section level3"> <p>Eu pesquisei por &#x201C;pronto socorro&#x201D; porque a pesquisa hospitais tamb&#xE9;m resulta em hospitais veterin&#xE1;rios. Um desafio para quem for reproduzir a an&#xE1;lise: coletar apenas a geolocaliza&#xE7;&#xE3;o de hospitais p&#xFA;blicos.</p>
<pre class="r"><code>df_places %&gt;% dplyr::filter(place == &quot;pronto socorro&quot;) %&gt;% leaflet %&gt;% addTiles() %&gt;% addCircles(lng = ~long, lat = ~lat, weight = 5, radius = 1000, color = &quot;blue&quot;, fillOpacity = 0.5)</code></pre> </div>
<div id="delegacias" class="section level3"> <pre class="r"><code>df_places %&gt;% dplyr::filter(place == &quot;delegacia&quot;) %&gt;% leaflet %&gt;% addTiles() %&gt;% addCircles(lng = ~long, lat = ~lat, weight = 5, radius = 1000, color = &quot;blue&quot;, fillOpacity = 0.5)</code></pre> </div>
<div id="bombeiros" class="section level3"> <pre class="r"><code>df_places %&gt;% dplyr::filter(place == &quot;delegacia&quot;) %&gt;% leaflet %&gt;% addTiles() %&gt;% addCircles(lng = ~long, lat = ~lat, weight = 5, radius = 1000, color = &quot;blue&quot;, fillOpacity = 0.5)</code></pre> </div>
<div id="hamburguerias" class="section level3"> <p>Repare que o &#xFA;nico local na regi&#xE3;o mais central de SP em que voc&#xEA; pode ficar a mais de um quil&#xF4;metro de uma hamburgueria &#xE9; no meio do parque Ibirapuera.</p>
<pre class="r"><code>df_places %&gt;% dplyr::filter(place == &quot;hamburguer&quot;) %&gt;% leaflet %&gt;% addTiles() %&gt;% addCircles(lng = ~long, lat = ~lat, weight = 5, radius = 1000, color = &quot;blue&quot;, fillOpacity = 0.5)</code></pre> </div>
<div id="pizzarias" class="section level3"> <p>Se a busca devolvesse todos os resultados poss&#xED;veis, esse mapa teria um c&#xED;rculo azul com ~15 km de raio formado por milhares de c&#xED;rculos menores. =D</p>
<pre class="r"><code>df_places %&gt;% dplyr::filter(place == &quot;pizza&quot;) %&gt;% leaflet %&gt;% addTiles() %&gt;% addCircles(lng = ~long, lat = ~lat, weight = 5, radius = 1000, color = &quot;blue&quot;, fillOpacity = 0.5)</code></pre> <p>Sem d&#xFA;vidas, a utiliza&#xE7;&#xE3;o dos dados aqui foi bem superficial, apenas ilustrativa. O ideal seria juntar essas informa&#xE7;&#xF5;es de geolocaliza&#xE7;&#xE3;o com dados de criminalidade, sa&#xFA;de p&#xFA;blica, socioecon&#xF4;micos, consumo etc. Dependendo da disponibilidade de dados, h&#xE1; espa&#xE7;o para muitas an&#xE1;lises interessantes utilizando essas informa&#xE7;&#xF5;es do Google Maps. Com certeza voltaremos neste assunto em posts futuros. =)</p>
<p>Coment&#xE1;rios? Sugest&#xF5;es? Cr&#xED;ticas? Voc&#xEA; est&#xE1; a menos de um quil&#xF4;metro dos coment&#xE1;rios! Deixe a sua mensagem!</p>
</div>
</div></div>
