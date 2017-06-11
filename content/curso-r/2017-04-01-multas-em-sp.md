+++
title = "Multas em São Paulo"
date = "2017-04-01 11:07:31"
categories = ["curso-r"]
+++

<div id="post-content"> <p>H&#xE1; bastante tempo tenho vontade de fazer an&#xE1;lises usando dados de multas de S&#xE3;o Paulo. O problema &#xE9;: estes dados est&#xE3;o dispon&#xED;veis? Na teoria, sim. Os dados de multas, como quantidade de multas por tipo de infra&#xE7;&#xE3;o, dia e hor&#xE1;rio, e outros s&#xE3;o divulgados no <a href="http://mobilidadesegura.prefeitura.sp.gov.br/QvAJAXZfc/opendoc.htm?document=Painel_Mobilidade_Segura.qvw&amp;host=QVS%40c65v27i&amp;anonymous=true">portal da Mobilidade Segura</a> da Prefeitura de S&#xE3;o Paulo. Na pr&#xE1;tica, &#xE9; um pouco diferente. Apesar do site fornecer uma op&#xE7;&#xE3;o de exporta&#xE7;&#xE3;o, a tabela exportada n&#xE3;o &#xE9; completa e muitas informa&#xE7;&#xF5;es ficam faltando. D&#xE1; bastante trabalho para exportar todas as informa&#xE7;&#xF5;es.</p>
<p>Para n&#xE3;o ter o trabalho de exportar tabela por tabela, fiz uma requisi&#xE7;&#xE3;o para a prefeitura, por meio da Lei de Acesso &#xE0; Informa&#xE7;&#xE3;o, pedindo acesso direto ao banco de dados que fornece as informa&#xE7;&#xF5;es para o Portal. A resposta foi a seguinte:</p>
<blockquote>
<p>Prezado Senhor Daniel, Agradecemos o contato e informamos que o seu pedido foi indeferido com fundamento no art. 16, inciso III, do Decreto n&#xBA; 53.623/2012, pois a base de dados cont&#xE9;m informa&#xE7;&#xF5;es pessoais que n&#xE3;o podem ser disponibilizadas a terceiros. Os demais dados encontram-se inseridos no Painel Mobilidade Segura para consulta pelos interessados com a possibilidade de exportar arquivos. Informamos ainda que na &#xE9;poca da sua solicita&#xE7;&#xE3;o, os pain&#xE9;is se encontravam atualizados, visto que a atualiza&#xE7;&#xE3;o mensal ocorre ap&#xF3;s os 70 dias da data da infra&#xE7;&#xE3;o</p>
</blockquote>
<p>A resposta ao meu ver &#xE9; totalmente contradit&#xF3;ria: ao mesmo tempo que eu n&#xE3;o posso receber os dados porque eles s&#xE3;o confidenciais, eu posso obt&#xEA;-los pelo site, que &#x201C;oferece possibilidade de exporta&#xE7;&#xE3;o de arquivos&#x201D;. (???)</p>
<p>Antes mesmo de pedir acesso ao banco de dados tinha pensado em desenvolver um webscrapper para fazer o download autom&#xE1;tico das planilhas, mas a tecnologia com a qual o portal foi desenvolvido (QlikView) dificulta muito o desenvolviento.</p>
<p>Sobrou fazer o download manual mesmo. At&#xE9; agora fiz o download de todos as planilhas de 2014 a 2016 contendo infra&#xE7;&#xF5;es capturadas tanto eletr&#xF4;nica quanto manualmente de carros (ainda faltam &#xF4;nibus, utilit&#xE1;rios, etc.) por hora do dia. Isso quer dizer que j&#xE1; temos planilhas suficientes para criar uma tabela:</p>
<ul>
<li>tipo de ve&#xED;culo (sempre seria carro)</li>
<li>data (2014 a 2016)</li>
<li>hora do dia</li>
<li>eletronica/manual</li>
<li>motivo da multa</li>
<li>localizacao da multa (quando for um radar)</li>
<li>quantidade de multas</li>
</ul>
<p>Disponibilizei esses dados <a href="https://github.com/dfalbel/spmultas">neste reposit&#xF3;rio</a> do Github.</p>
<p>Agora com as an&#xE1;lises a seguir, espero criar curiosidade e interesse para que mais pessoas possam ajudar no download completo dos dados. Na p&#xE1;gina inicial do reposit&#xF3;rio, adicionei, um mini-tutorial de como voc&#xEA; pode ajudar fazendo os downloads.</p>
<p>Vamos &#xE0;s an&#xE1;lises.</p>
<div id="obter-os-dados" class="section level2"> <pre class="r"><code>download.file(&quot;https://github.com/dfalbel/spmultas/raw/master/data/carros_eletronicas.rda&quot;, &quot;carros_eletronicas.rda&quot;)
load(&quot;carros_eletronicas.rda&quot;)</code></pre>
<p>A partir de agora, voc&#xEA; possui carregado um <code>data.frame</code> chamado <code>carros_eletronicas</code> que possui as informa&#xE7;&#xF5;es das multas para carros de forma eletr&#xF4;nica.</p>
<p>Em primeiro lugar, vamos analisar a quantidade de multas por dia em S&#xE3;o Paulo desde 2014.</p>
</div>
<div id="visualizar-a-serie" class="section level2"> <pre class="r"><code>carros_eletronicas %&gt;% group_by(data) %&gt;% summarise(qtd = sum(qtd)) %&gt;% ggplot(aes(data, qtd)) + geom_line()</code></pre>
<p><img src="http://curso-r.com/blog/2017-04-01-multas-em-sp_files/figure-html/unnamed-chunk-3-1.png" width="672"></p>
<p>Vemos nesse gr&#xE1;fico que o n&#xFA;mero de multas (por radar) era sempre por volta de 10.000 durante 2014, em 2015 foi aumentando bastante durante o ano e em 2016 se estabilizou. Vamos ver agora, por tipo de enquadramento, isto &#xE9;, por motivo da multa.</p>
<p>Existem 11 tipos de enquadramentos eletr&#xF4;nicos. Para a visualiza&#xE7;&#xE3;o ficar mais f&#xE1;cil, vamos primeiro agrupar em grandes temas:</p>
<ul>
<li>Avan&#xE7;ar o sinal vermelho</li>
<li>Executar convers&#xE3;o proibida</li>
<li>Parar sobre faixa de pedestres</li>
<li>Rod&#xED;zio</li>
<li>Velocidade</li>
<li>Transitar em faixa de &#xF4;nibus ou exclusiva p/ determinado ve&#xED;culo</li>
</ul>
<p>O agrupamento final ficou assim:</p>
<pre class="r"><code>depara &lt;- carros_eletronicas %&gt;% group_by(enquadramento) %&gt;% summarise(qtd = sum(qtd)) %&gt;% arrange(qtd) %&gt;% select(-qtd)
depara$agrup_enquadramento &lt;- c(&quot;Convers&#xE3;o proibida&quot;, &quot;Velocidade&quot;, &quot;Faixa de Pedestres&quot;, &quot;Faixa de &#xF4;nibus&quot;, &quot;Sinal vermelho&quot;, &quot;Faixa de &#xF4;nibus&quot;, &quot;Convers&#xE3;o proibida&quot;, &quot;Faixa de &#xF4;nibus&quot;, &quot;Velocidade&quot;, &quot;Rod&#xED;zio&quot;, &quot;Velocidade&quot; ) depara %&gt;% knitr::kable()</code></pre>
<table>
<thead> </thead>
<tbody>
<tr class="odd">
<td>Executar Operacao De Conversao A Esquerda Em Local Proibido Pela Sinalizacao</td>
<td>Convers&#xE3;o proibida</td>
</tr>
<tr class="even">
<td>Transitar Em Velocidade Superior A Maxima Permitida Em Mais De 50%</td>
<td>Velocidade</td>
</tr>
<tr class="odd">
<td>Parar Sobre Faixa De Pedestres Na Mudanca De Sinal Luminoso (Fisc Eletronica)</td>
<td>Faixa de Pedestres</td>
</tr>
<tr class="even">
<td>Transitar Na Faixa/Pista Da Esquerda Regul Circulacao Exclusiva Determ Veiculo</td>
<td>Faixa de &#xF4;nibus</td>
</tr>
<tr class="odd">
<td>Avancar O Sinal Vermelho Do Semaforo - Fiscalizacao Eletronica</td>
<td>Sinal vermelho</td>
</tr>
<tr class="even">
<td>Transitar Na Faixa/Pista Da Direita Regul Circulacao Exclusiva Determ Veiculo</td>
<td>Faixa de &#xF4;nibus</td>
</tr>
<tr class="odd">
<td>Executar Operacao De Conversao A Direita Em Local Proibido Pela Sinalizacao</td>
<td>Convers&#xE3;o proibida</td>
</tr>
<tr class="even">
<td>Transitar Na Faixa Ou Via Exclusiva Regulam P/Transp Publ Coletivo Passag</td>
<td>Faixa de &#xF4;nibus</td>
</tr>
<tr class="odd">
<td>Transitar Em Velocidade Superior A Maxima Permitida Em Mais De 20% Ate 50%</td>
<td>Velocidade</td>
</tr>
<tr class="even">
<td>Transitar Em Local/Horario Nao Permitido Pela Regulamentacao - Rodizio</td>
<td>Rod&#xED;zio</td>
</tr>
<tr class="odd">
<td>Transitar Em Velocidade Superior A Maxima Permitida Em Ate 20%</td>
<td>Velocidade</td>
</tr>
</tbody>
</table>
<pre class="r"><code>carros_eletronicas %&gt;% left_join(depara, by = &quot;enquadramento&quot;) %&gt;% group_by(data, agrup_enquadramento) %&gt;% summarise(qtd = sum(qtd)) %&gt;% ggplot(aes(data, qtd, color = agrup_enquadramento)) + geom_line()</code></pre>
<p><img src="http://curso-r.com/blog/2017-04-01-multas-em-sp_files/figure-html/unnamed-chunk-5-1.png" width="672"></p>
<p>No gr&#xE1;fico, vemos que em 2015, o tipo de multa que mais aumentou em quantidade foi velocidade e rod&#xED;zio.</p>
</div>
<div id="curiosidades" class="section level2"> <p>Anteriormente vimos como se comportou o n&#xFA;mero de multas de maneira geral na cidade. Vamos agora matar algumas curiosidades.</p>
<ol>
<li>Quais s&#xE3;o os hor&#xE1;rios com mais multas em SP?</li>
</ol>
<pre class="r"><code>carros_eletronicas %&gt;% group_by(hora) %&gt;% summarise(qtd = sum(qtd)) %&gt;% ggplot(aes(x = hora, y = qtd)) + geom_bar(stat = &quot;identity&quot;)</code></pre>
<p><img src="http://curso-r.com/blog/2017-04-01-multas-em-sp_files/figure-html/unnamed-chunk-6-1.png" width="672"></p>
<p>Notamos que o maior n&#xFA;mero de multas ocorre justamente na hora do rush. Isto &#xE9;, entre 7 e 10 da manh&#xE3; e 17h e 19h. Isso at&#xE9; faz sentido, mas nessas horas o tr&#xE2;nsito da cidade est&#xE1; todo parado. Ser&#xE1; que a distribui&#xE7;&#xE3;o fica diferente por tipo de multa? Principalmente as de velocidade.</p>
<pre class="r"><code>carros_eletronicas %&gt;% left_join(depara, by = &quot;enquadramento&quot;) %&gt;% group_by(hora, agrup_enquadramento) %&gt;% summarise(qtd = sum(qtd)) %&gt;% ggplot(aes(x = hora, y = qtd, fill = agrup_enquadramento)) + geom_bar(stat = &quot;identity&quot;)</code></pre>
<p><img src="http://curso-r.com/blog/2017-04-01-multas-em-sp_files/figure-html/unnamed-chunk-7-1.png" width="672"></p>
<p>Veja que interessante! O grande respons&#xE1;vel pelo pico da hora do rush &#xE9; o rod&#xED;zio. (Essa &#xE9; justamente a hora em que ele est&#xE1; valendo.) As multas de velocidade diminuem um pouco durante o tr&#xE2;nsito e acontecem mais durante o dia e n&#xE3;o durante a noite como poder&#xED;amos imaginar. Vemos tamb&#xE9;m que as multas de farol vermelho acontecem mais durante a madrugada.</p>
<ol>
<li>Qual &#xE9; o dia da semana com mais multas?</li>
</ol>
<pre class="r"><code>carros_eletronicas %&gt;% left_join(depara, by = &quot;enquadramento&quot;) %&gt;% group_by(dia_da_semana = wday(data), agrup_enquadramento) %&gt;% summarise(qtd = sum(qtd)) %&gt;% ggplot(aes(x = dia_da_semana, y = qtd, fill = agrup_enquadramento)) + geom_bar(stat = &quot;identity&quot;)</code></pre>
<p><img src="http://curso-r.com/blog/2017-04-01-multas-em-sp_files/figure-html/unnamed-chunk-8-1.png" width="672"></p>
<p>O dia da semana com mais multas &#xE9; quinta feira. Nos finais de semana, aumenta muito o n&#xFA;mero de multas por excesso de velocidade (claro, as ruas est&#xE3;o mais vazias).</p>
<ol>
<li>Quais s&#xE3;o os radares que mais multam em SP? E porque?</li>
</ol>
<pre class="r"><code>top10_locais &lt;- carros_eletronicas %&gt;% group_by(local) %&gt;% summarise(n = sum(qtd)) %&gt;% arrange(desc(n)) %&gt;% slice(1:10)
knitr::kable(top10_locais)</code></pre>
<table>
<thead> </thead>
<tbody>
<tr class="odd">
<td>Avenida Assis Chateaubriand X Acesso Pte Das Bandeiras, A.Sen/C. Bran</td>
<td>321629</td>
</tr>
<tr class="even">
<td>Avenida Assis Chateaubriand (A. Senna/C. Branco), Alca Da Ponte Das Bandeiras</td>
<td>318745</td>
</tr>
<tr class="odd">
<td>Av Dos Bandeirantes(Marginal/Imigrantes) A Mais 34 Metros Da Av Washington Luis</td>
<td>291277</td>
</tr>
<tr class="even">
<td>Av Das Nacoes Unidas-Pista Central-(Interlagos/C.Branco) A Menos 7,3m Do Km 5,5</td>
<td>162318</td>
</tr>
<tr class="odd">
<td>Av Morvan D De Figueiredo (As/Cb), A Mais 3m R Amazonas Da Silva-Fx Excl Onibus</td>
<td>153131</td>
</tr>
<tr class="even">
<td>Rua Hungria (Interlagos/Castelo Branco) A Menos 20 Metros Da Avenida Reboucas</td>
<td>139048</td>
</tr>
<tr class="odd">
<td>Av Morvan Dias De Figueiredo (As/Cb),A Mais 3m R Amazonas Da Silva</td>
<td>137064</td>
</tr>
<tr class="even">
<td>Rodovia Presidente Dutra (As/Cb), A Menos 75m Da Pte Pr J Quadros</td>
<td>134454</td>
</tr>
<tr class="odd">
<td>Av Aricanduva (Bairro/Centro), A Mais15m Da Av Matapi - Fx Exclusiva De Onibus</td>
<td>127690</td>
</tr>
<tr class="even">
<td>Av Embaixador Macedo Soares, Sob Ponte Nova Fepasa, Sentido C. Branco/A. Senna</td>
<td>124927</td>
</tr>
</tbody>
</table>
<p>Agora vamos ver os motivos, em cada um desses lugares.</p>
<pre class="r"><code>top10_locais %&gt;% left_join(carros_eletronicas, by = &quot;local&quot;) %&gt;% left_join(depara, by = &quot;enquadramento&quot;) %&gt;% mutate(local = stringr::str_wrap(local, width = 20) %&gt;% forcats::fct_reorder(-n)) %&gt;% group_by(local, agrup_enquadramento) %&gt;% summarise(qtd = sum(qtd)) %&gt;% ggplot(aes(x = local, y = qtd, fill = agrup_enquadramento)) + geom_bar(stat = &quot;identity&quot;)</code></pre>
<p><img src="http://curso-r.com/blog/2017-04-01-multas-em-sp_files/figure-html/unnamed-chunk-10-1.png" width="1000px"></p>
<p>Por incr&#xED;vel que pare&#xE7;a, nos dois radares com mais multas, o motivo da multa &#xE9; convers&#xE3;o proibida. A foto de onde fica esse radar saiu em uma <a href="http://www1.folha.uol.com.br/cotidiano/2015/07/1660793-radar-campeao-aplica-375-mil-multas-em-um-ano-na-ponte-das-bandeiras.shtml">not&#xED;cia sobre o mesmo tema</a> na Folha de S&#xE3;o Paulo.</p>
<p><img src="http://curso-r.com/blog/2017-04-01-multas-em-sp_files/figure-html/unnamed-chunk-11-1.png" width="672"></p>
</div> </div>
