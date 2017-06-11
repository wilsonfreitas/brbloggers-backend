+++
title = "Lollapalooza segundo Spotify - Web Scraping, API do Spotify e tidyverse"
date = "2017-03-27"
categories = ["curso-r"]
+++

<div class="col-md-9" id="blog-post"> <p class="text-muted text-uppercase mb-small text-right"> Por <a href="http://curso-r.com/author/athos">Athos</a> 27/03/2017 </p> <div id="post-content"> <p>No dia em que fui ao Lollapalooza eu descobri o <a href="https://github.com/tiagomendesdantas/Rspotify">Rspotify</a>, um wraper da API do Spotify e da&#xED; me veio a ideia de juntar infos dos dois assuntos.</p>
<p>A brincadeira aqui vai envolver</p>
<ul>
<li>Web Scraping - para baixar e estruturar as tabelas de programa&#xE7;&#xE3;o do Lolapalooza SP 2017</li>
<li>API do Spotify - por meio do pacote Rspotify</li>
<li>todos os pacotes do tidyverse</li>
</ul>
<p>Lollapalooza deste ano em S&#xE3;o Paulo contou com 47 bandas distribu&#xED;das em quatro palcos. A gra&#xE7;a &#xE9; associar a programa&#xE7;&#xE3;o do Lolla com as informa&#xE7;&#xF5;es de popularidade das bandas fornecidas pelo Spotify. Abaixo eu vou descrever como peguei os dados, listar as tr&#xEA;s hip&#xF3;teses que criei e gerar alguns gr&#xE1;ficos pra discut&#xED;-las.</p>
<div id="base-de-dados" class="section level2"> <div id="pre-requisitos" class="section level3"> <p><strong>Pacotes</strong></p>
<pre class="r"><code># instala o Rspotify
if(!require(&quot;Rspotify&quot;)) devtools::install_github(&quot;tiagomendesdantas/Rspotify&quot;)</code></pre>
<pre class="r"><code>library(Rspotify)
library(magrittr)
library(forcats)
library(stringi)
library(lubridate)
library(httr)
library(rvest)
library(tidyverse)</code></pre>
<p>O <code>Rspotify</code> &#xE9; um pacote novo e que ainda n&#xE3;o est&#xE1; no CRAN, mas j&#xE1; est&#xE1; funcional.</p>
<p><strong>Conta no Spotify</strong></p>
<p>Para utilizar a API do Spotify &#xE9; necess&#xE1;rio ter um cadastro no site deles, como se pode imaginar.</p>
<p><strong>App no Spotify</strong></p>
<p>Para voc&#xEA; receber um c&#xF3;digo de acesso para usar a API deles &#xE9; preciso criar um <em>App</em> dentro da sua conta do Spotify, esse &#xE9; o pr&#xE9;-requisito mais burocr&#xE1;tico de todos. Eu aprendi a fazer isso seguindo os passos do README do pr&#xF3;prio pacote <code>Rspotify</code> no Github <a href="https://github.com/tiagomendesdantas/Rspotify">(veja aqui)</a>.</p>
<p>No fim, voc&#xEA; ter&#xE1; um <code>app_id</code>, um <code>client_id</code> e um <code>client_secret</code> em m&#xE3;os.</p>
</div> <div id="extraindo-a-popularidade-das-bandas-do-lollapalooza-no-spotify" class="section level3"> <p>Agora vamos usar o pacote <code>Rspotify</code> para extrair as popularidades das bandas que est&#xE3;o listadas no data.frame <code>lolla2017_programacao</code>. Para tanto, usei uma playlist oficial no Spotify feita pela pr&#xF3;pria equipe do Lollapalooza. Essa playlist &#xE9; identificada pelo id <code>1mHoPn6JpbtWtoBuvSXrVm</code> l&#xE1; no banco de dados do Spotify.</p>
<pre class="r"><code>meu_token &lt;- spotifyOAuth(app_id, client_id, client_secret) # coloque aqui suas infos fornecidas pelo Spotify.</code></pre>
<pre class="r"><code>lolla2017_playlist &lt;- getPlaylistSongs(&quot;lollabr&quot;, &quot;1mHoPn6JpbtWtoBuvSXrVm&quot;, token = meu_token) %&gt;% mutate(artistInfo = map(artistId, getArtistinfo), artist = artist %&gt;% tolower) %&gt;% rename(track_popularity = popularity, track_id = id) %&gt;% unnest(artistInfo) %&gt;% select(artist, id, name, popularity, followers)</code></pre>
<p>Algumas bandas ficaram de fora da playlist e por isso fiz uma pesquisa por nome do artista na pr&#xF3;pria API do Spotify para recuperar o respectivo id. A fun&#xE7;&#xE3;o que faz isso &#xE9; a <code>searchArtist()</code>.</p>
<pre class="r"><code># recuperando infos dos artistas esquecidos pela playlist ---------------------- possibly_searchArtist &lt;- possibly(searchArtist, NA_character_) artistas_fora_da_playlist &lt;- lolla2017_programacao %&gt;% filter(!artist %in% lolla2017_playlist$artist) %$% artist %&gt;% data_frame(artist = .) %&gt;% mutate(search_artist = map(artist, ~ .x %&gt;% possibly_searchArtist), artist_info = map2(search_artist, artist, ~ { if(.x %&gt;% is.na) {data.frame(search_artist = NA)} else { .x %&gt;% mutate(name = name %&gt;% tolower) %&gt;% filter(name %in% .y) %&gt;% head(1) }})) %&gt;% select(-search_artist) %&gt;% unnest(artist_info) %&gt;% select(artist, id, name, popularity, followers) </code></pre>
<p><strong>Resultado</strong></p>
<table>
<thead> </thead>
<tbody>
<tr class="odd">
<td>ricci</td>
<td>1EUMh6DZo2CfpolG75YQBL</td>
<td>ricci</td>
<td>49</td>
<td>6116</td>
</tr>
<tr class="even">
<td>jimmy eat world</td>
<td>3Ayl7mCk0nScecqOzvNp6s</td>
<td>jimmy eat world</td>
<td>66</td>
<td>361785</td>
</tr>
<tr class="odd">
<td>89 fm</td>
<td>NA</td>
<td>NA</td>
<td>NA</td>
<td>NA</td>
</tr>
<tr class="even">
<td>martin garrix</td>
<td>60d24wfXkVzDSfLS6hyCjZ</td>
<td>martin garrix</td>
<td>85</td>
<td>2244761</td>
</tr>
<tr class="odd">
<td>illusionize</td>
<td>3RloA7E4XMItSP4FjMBv3L</td>
<td>illusionize</td>
<td>46</td>
<td>30054</td>
</tr>
</tbody>
</table>
</div>
<div id="juntando-tudo" class="section level3"> <p>Agora vamos juntar a programa&#xE7;&#xE3;o do Lolla com as infos do Spotify. A chave &#xE9; <code>artist</code>.</p>
<pre class="r"><code>lolla2017 &lt;- left_join(lolla2017_programacao, lolla2017_playlist %&gt;% bind_rows(artistas_fora_da_playlist), by = &quot;artist&quot;) %&gt;% select(-id, -name) %&gt;% dplyr::filter(followers %&gt;% is.na %&gt;% not) </code></pre>
<p><strong>Base final</strong></p>
<table>
<thead> </thead>
<tbody>
<tr class="odd">
<td>sabado</td>
<td>Palco Skol</td>
<td>cage the elephant</td>
<td>2017-03-25 16:25:00</td>
<td>2017-03-25 17:25:00</td>
<td>72</td>
<td>745453</td>
</tr>
<tr class="even">
<td>sabado</td>
<td>Palco Skol</td>
<td>metallica</td>
<td>2017-03-25 21:00:00</td>
<td>2017-03-25 23:00:00</td>
<td>80</td>
<td>3047126</td>
</tr>
<tr class="odd">
<td>sabado</td>
<td>Palco Skol</td>
<td>doctor pheabes</td>
<td>2017-03-25 12:05:00</td>
<td>2017-03-25 13:05:00</td>
<td>20</td>
<td>313</td>
</tr>
<tr class="even">
<td>sabado</td>
<td>Palco Skol</td>
<td>rancid</td>
<td>2017-03-25 18:35:00</td>
<td>2017-03-25 19:35:00</td>
<td>60</td>
<td>220182</td>
</tr>
<tr class="odd">
<td>sabado</td>
<td>Palco Skol</td>
<td>suricato</td>
<td>2017-03-25 14:15:00</td>
<td>2017-03-25 15:15:00</td>
<td>41</td>
<td>52326</td>
</tr>
<tr class="even">
<td>sabado</td>
<td>Palco Onix</td>
<td>the 1975</td>
<td>2017-03-25 17:30:00</td>
<td>2017-03-25 18:30:00</td>
<td>77</td>
<td>1600845</td>
</tr>
<tr class="odd">
<td>sabado</td>
<td>Palco Onix</td>
<td>the outs</td>
<td>2017-03-25 13:10:00</td>
<td>2017-03-25 14:10:00</td>
<td>28</td>
<td>3788</td>
</tr>
<tr class="even">
<td>sabado</td>
<td>Palco Onix</td>
<td>the xx</td>
<td>2017-03-25 19:40:00</td>
<td>2017-03-25 20:55:00</td>
<td>76</td>
<td>2383923</td>
</tr>
</tbody>
</table>
</div>
</div>
<div id="resultados" class="section level2"> <div id="hipotese-i" class="section level3"> <blockquote>
<p><strong>Hip&#xF3;tese I:</strong> a organiza&#xE7;&#xE3;o usou a estrat&#xE9;gia de distribuir a popularidade das bandas uniformemente no dia.</p>
</blockquote>
<p>Um dos v&#xE1;rios desafios log&#xED;sticos que o evento tem &#xE9; a aloca&#xE7;&#xE3;o das bandas na grade hor&#xE1;ria nos quatro diferentes palcos.</p>
<p>Eu fui no evento no s&#xE1;bado e ouvi falar que a banda <em>Cage The Elephant</em> tinha sido uma das primeiras bandas a se apresentar. Sabia da popularidade da banda (segundo o Spotify, est&#xE1; mais popular do que <em>The Strokes</em>) e na hora estranhei a decis&#xE3;o do evento de coloc&#xE1;-los para tocar t&#xE3;o cedo.</p>
<pre class="r"><code>lolla2017_grafico &lt;- lolla2017 %&gt;% mutate(hora = map2(hora_ini, hora_fim, ~ seq(.x, .y, 30*60) %&gt;% floor_date(&quot;30 minutes&quot;))) %&gt;% unnest(hora) %&gt;% group_by(dia, hora, palco) %&gt;% summarise(artist = first(artist), n = n(), mean_popularity = mean(popularity)) lolla2017_grafico %&gt;% ggplot(aes(x = ymd_hm(format(hora, &quot;2017-03-26 %H%M&quot;)), y = mean_popularity, colour = palco)) + geom_line() + geom_point() + geom_point(data = lolla2017_grafico %&gt;% filter(artist %in% &quot;cage the elephant&quot;), colour = &quot;red&quot;, size = 2) + geom_text(data = lolla2017_grafico %&gt;% filter(artist %in% &quot;cage the elephant&quot;) %&gt;% head(1), aes(label = artist), colour = &quot;red&quot;, hjust = 0, vjust = -1) + facet_wrap(~dia) + labs(x = &quot;Hora do dia&quot;, y = &quot;Popularidade m&#xE9;dia&quot;) + theme(text = element_text(size = 16))</code></pre>
<p><img src="http://curso-r.com/blog/2017-03-27-lollapalooza-sp-2017-segundo-spotify_files/figure-html/unnamed-chunk-12-1.png" width="864"></p>
<p>O gr&#xE1;fico acima vai de acordo com o senso comum de que os populares ficam para o final, n&#xE3;o ajudando a confirmar a hip&#xF3;tese de que o <em>Cage The Elefant</em> estava mal posicionado.</p>
</div>
<div id="hipotese-ii" class="section level3"> <blockquote>
<p><strong>Hip&#xF3;tese II:</strong> em termos de popularidade das bandas, o dia de domingo estava melhor do que o dia de s&#xE1;bado.</p>
</blockquote>
<p>Em conversas com amigos e conhecidos reparei que a maioria ou iria no domingo ou preferiria ir no domingo caso tivesse oportunidade. Isso me fez levantar a d&#xFA;vida se realmente havia maior concentra&#xE7;&#xE3;o de bandas boas no domingo.</p>
<pre class="r"><code>ggplot(lolla2017 %&gt;% mutate(artist = artist %&gt;% fct_reorder(popularity, .desc = TRUE))) + geom_bar(aes(x = artist, y = popularity, fill = dia), stat = &quot;identity&quot;, position = &quot;dodge&quot;) + theme(text = element_text(size = 16), axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.4))</code></pre>
<p><img src="http://curso-r.com/blog/2017-03-27-lollapalooza-sp-2017-segundo-spotify_files/figure-html/unnamed-chunk-13-1.png" width="864"></p>
<pre class="r"><code>ggplot(lolla2017) + geom_density(aes(fill = dia, x = popularity, colour = dia), fill = NA) + theme(text = element_text(size = 16), axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.4))</code></pre>
<p><img src="http://curso-r.com/blog/2017-03-27-lollapalooza-sp-2017-segundo-spotify_files/figure-html/unnamed-chunk-14-1.png" width="864"></p>
<p>Conclus&#xE3;o: nada indica que houve desbalanceamento. Acho que meu c&#xED;rculo de amigos tem algum vi&#xE9;s estranho.</p>
</div>
<div id="hipotese-iii" class="section level3"> <blockquote>
<p><strong>Hip&#xF3;tese III:</strong> a popularidade das bandas nos diferentes palcos estava equilibrada.</p>
</blockquote>
<p>Quando me questionei da hip&#xF3;tese I tamb&#xE9;m pensei na dificuldade de posicionar as bandas nos diferentes palcos. J&#xE1; que teriam milhares de pessoas disputando espa&#xE7;o, seria do interesse da organiza&#xE7;&#xE3;o deix&#xE1;-los o mais espalhado poss&#xED;vel por v&#xE1;rios motivos: melhor fluxo das filas, maior conforto, menos risco de acidentes, entre outros, e um bom jeito de fazer isso seria deixando os palcos igualmente atrativos para n&#xE3;o haver uma grande aglomera&#xE7;&#xE3;o em um &#xFA;nico ponto.</p>
<pre class="r"><code>ggplot(lolla2017 %&gt;% mutate(palco = palco %&gt;% as.factor %&gt;% fct_reorder(popularity, mean))) + geom_boxplot(aes(fill = palco, y = popularity, x = 1)) + theme(text = element_text(size = 16), axis.text.x = element_blank()) + labs(x = &quot;&quot;)</code></pre>
<p><img src="http://curso-r.com/blog/2017-03-27-lollapalooza-sp-2017-segundo-spotify_files/figure-html/unnamed-chunk-15-1.png" width="864"></p>
<p>O palco Skol teve menor varia&#xE7;&#xE3;o de popularidade, costumou contar sempre com artistas de m&#xE9;dia a alta popularidade, mas os palcos AXE e Onix foram visitados por artista de peso. O palco Perry&#x2019;s foi o mais visitado por artistas de menor express&#xE3;o.</p>
</div>
</div> </div> </div>
