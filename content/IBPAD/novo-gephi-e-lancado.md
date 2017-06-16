+++
title = "Novo Gephi é lançado"
date = "2015-12-21 13:56:28"
categories = ["IBPAD"]
original_url = "http://www.ibpad.com.br/blog/comunicacao-digital/novo-gephi-e-lancado/"
+++

<p>
Para a felicidade de muitos, Gephi 0.9 é lançado com importantes
mudanças.
</p>
<blockquote class="twitter-tweet">
<p>
Gephi 0.9 binaries created!
<a href="https://t.co/QqEHhIDaKc">https://t.co/QqEHhIDaKc</a> – Official
announcement still to come
<a href="https://t.co/2Hc71dRQzp">pic.twitter.com/2Hc71dRQzp</a>
</p>
<p>
— Gephi graph viz (@Gephi)
<a href="https://twitter.com/Gephi/status/678682779744243712">December
20, 2015</a>
</p>
</blockquote>
<p>
Um dos mais esperados lançamentos para os analistas de redes aconteceu.
Depois de longos e ansiosos meses de espera o Gephi 0.9 foi lançado com
importantes excelentes modificações. Testamos e aprovamos!
</p>
<p>
<strong>Java </strong>
</p>
<p>
Compatibilidade com o Java 8 e o Java 7 em todas as plataformas. (Sim,
agora você deve conseguir rodar o Gephi no MAC sem problemas)
</p>
<blockquote class="twitter-tweet">
<p>
New version 0.9 of <a href="https://twitter.com/Gephi">@Gephi</a>
running smoothly on OSX + Java 8. Big performance improvement too.
</p>
<p>
— Derek Greene (@derekgreene)
<a href="https://twitter.com/derekgreene/status/678896535510376448">December
21, 2015</a>
</p>
</blockquote>
<p>
<strong>Desempenho</strong>
</p>
<p>
Todo o “core” do Gephi foi redesenhado e agora ele é leve, mas muito
mais leve. Segundo o
<a href="https://gephi.wordpress.com/2015/12/04/gephi-boosts-its-performance-with-new-graphstore-core/">Blog
do Gephi</a> a nova versão reduziu de 40 a 100 vezes o tempo de
processamento da CPU em algumas operações. Em relação a utilização da
memória, a redução chega a 2x menos (pode cancelar aquela sua compra de
mais 16gb =\])
</p>
<table>
<tbody>
<tr>
<th>
Comparação
</th>
<th>
Gephi 0.8.2
</th>
<th>
Gephi 0.9
</th>
<th>
Melhora
</th>
</tr>
<tr>
<td>
Grafo simples
</td>
<td>
115MB
</td>
<td>
52MB
</td>
<td>
2.2X
</td>
</tr>
<tr>
<td>
Grafo com 5 colunas de atributos
</td>
<td>
186MB
</td>
<td>
55MB
</td>
<td>
3.4X
</td>
</tr>
</tbody>
</table>
<p>
<a href="https://gephi.org/users/download/"><img class="aligncenter wp-image-222" src="https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2016/10/fsb-comunicacao.png?fit=352%2C73" alt="downloadgephi"></a>
</p>
<p>
<strong>Mudança na aba de aparência</strong>
</p>
<p>
A aba aparência agora ficou muito mais simples e intuitiva. A separação
de “classificação/ranking” e partição mudou. A lógica agora é: alterar
cores, alterar tamanhos (mudaram aquele diamante estranho), alterar
cores dos textos e tamanho dos rótulos.
</p>
<p>
<img class="alignleft size-medium wp-image-215" src="https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2016/10/LOGO_UFRGS_vertical_azul.png?fit=900%2C674" alt="PARTICAOERANKING">
</p>
<p>
A possibilidade antiga de ver um gráfico de pizza sumiu. No lugar ficou
a seleção de partição, para suas variáveis qualitativas categóricas
(lado esquerdo da imagem) ou de classificação/ranking, para suas
variáveis quantitativas discretas/contínuas ou ordinais.
</p>
<p>
<img class="alignleft size-medium wp-image-216" src="https://i1.wp.com/ibpad.com.br/wp-content/uploads/2015/12/paleta-300x209.png?resize=300%2C209" alt="paleta">
</p>
<p>
A paleta de cores na seleção de partição está ótima. Acho que esse era
um dos maiores problemas para os <em>heavy users</em> do Gephi. Antes,
se você mudasse a seleção de qual atributo gostaria de particionar o
gráfico, você perderia toda a sua seleção de cores.
</p>
<p>
<img class="alignleft size-medium wp-image-217" src="https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2016/10/ufpr_1000.jpg?fit=900%2C590" alt="paleta2">Além
de não perder a seleção, a briga para selecionar boas cores acabou (ou
quase). Foi implementado um módulo de geração de paletas. Você vai poder
escolher um tema e criar a quantidade de cores adequada para o seu
grafo.
</p>
<p>
<strong>Suporte para multi-grafos</strong>
</p>
<p>
Agora é possível importar e criar grafos com relações diferentes.
</p>
<blockquote class="twitter-tweet">
<p>
Oh yeah, multi edge !
<a href="https://twitter.com/hashtag/Gephi?src=hash">\#Gephi</a> 0.9
<a href="https://t.co/RD4bB1UcNb">pic.twitter.com/RD4bB1UcNb</a>
</p>
<p>
— Matthieu Totet (@Totetmatt)
<a href="https://twitter.com/Totetmatt/status/678673762372349952">December
20, 2015</a>
</p>
</blockquote>
<p>
Além disso, ficou muito mais fácil para importar múltiplos grafos. Agora
basta selecionar vários arquivos e abrir!
</p>
<p>
Ainda tem várias boas mudanças. Selecionamos algumas das mais esperadas
por aqui. Quem quiser conferir basta entrar no site do
<a href="https://github.com/gephi/gephi/wiki/Releases">Gephi</a>.
</p>
<p>
<img class="alignleft" src="https://i1.wp.com/blogantigo.ibpad.com.br/wp-content/uploads/2015/09/analiseredes-150x150.png?resize=150%2C150" alt="">Em
Dezembro o IBPAD vai oferecer o seu curso de Análise de Redes para
Mídias Sociais utilizando a nova versão do Gephi em Brasília e São
Paulo.
<a href="http://www.ibpad.com.br/services/comunicacao-digital/analise-de-redes-para-midias-sociais/?utm_medium=blog&amp;utm_source=Blog&amp;utm_campaign=arssp01&amp;utm_term=lancgephi&amp;utm_content=59">Quem
quiser conferir é só dar uma olhada no site do IBPAD. </a>
</p>

