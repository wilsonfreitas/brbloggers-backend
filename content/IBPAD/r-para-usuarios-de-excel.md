+++
title = "R para Usuários de Excel"
date = "2017-02-22 18:14:10"
categories = ["IBPAD"]
original_url = "http://www.ibpad.com.br/blog/r-para-usuarios-de-excel/"
+++

<div class="post-inner-content">
<p>
<em>\* Publicação de Gordon Shotwell, traduzida pelo IBPAD – post
original pode ser
acessado <a href="http://shotwell.ca/blog/post/r_for_excel_users/">aqui</a></em>
</p>
<p>
<img class="size-medium wp-image-4573 alignleft" src="https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/RparaExcel.jpg?resize=260%2C121%20260w,%20https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/RparaExcel.jpg?resize=100%2C47%20100w,%20https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/RparaExcel.jpg?w=741%20741w" alt="" srcset="https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/RparaExcel.jpg?resize=260%2C121 260w, https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/RparaExcel.jpg?resize=100%2C47 100w, https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/RparaExcel.jpg?w=741 741w">A
primeira ferramenta onde aprendemos a trabalhar com números costuma ser
o Excel.
</p>
<p>
Um dos recursos mais incríveis do Excel é, de fato, sua simplicidade e
sua forma intuitiva de apresentar a ferramenta. Todos os dias, em todo o
mundo, pessoas abrem uma planilha para fazer alguma entrada de dados e,
pouco a pouco, aprendem a fazer tarefas analíticas cada vez mais
complexas. Excel é um mestre no ensino do próprio Excel.
</p>
<p>
R não é assim. A curva de aprendizado para R costuma ser mais íngrime no
começo. Isso pode ser especialmente frustante quando você não consegue
fazer tarefas simples no R como importar arquivos ou plotar um gráfico,
e no Excel são coisas tão intuitivas.
</p>
<p>
<a href="http://www.ibpad.com.br/blog/formacao-em-r/"><br>
</a><a href="http://www.ibpad.com.br/blog/formacao-em-r/"><img class="aligncenter wp-image-4138 size-medium" src="https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=260%2C241%20260w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=768%2C711%20768w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=1024%2C948%201024w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=100%2C93%20100w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?w=1225%201225w" srcset="https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=260%2C241 260w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=768%2C711 768w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=1024%2C948 1024w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=100%2C93 100w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?w=1225 1225w"></a>
</p>
<p>
<a href="http://www.ibpad.com.br/blog/formacao-em-r/">Quer dar um passo
adiante? Conheça a nossa formação em R do IBPAD</a>
</p>
<p>
Essa é a dificuldade de aprender a programar. Linguagens de programação
são projetados para serem gerais em sua aplicação e para permitir que
você realize uma enorme variedade de tarefas complexas com o mesmo
conjunto básico de ferramentas. O custo desta generalidade é uma curva
de aprendizagem íngreme. Quando você começa a aprender a fazer tarefas
básicas em R, você também está aprendendo a fazer coisas complexas no
caminho. À medida que você aprende cada vez mais, o custo marginal de
análises complexas diminui. Excel é o oposto, e é muito fácil no início,
mas o custo marginal aumenta com a complexidade do problema. Uma
representação gráfica disso se aproximaria a isso:
</p>
<p>
<img class="alignnone size-large wp-image-4576" src="https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/R-Vs-Excel.jpg?resize=1024%2C870%201024w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/R-Vs-Excel.jpg?resize=260%2C221%20260w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/R-Vs-Excel.jpg?resize=768%2C652%20768w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/R-Vs-Excel.jpg?resize=100%2C85%20100w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/R-Vs-Excel.jpg?w=1436%201436w" alt="" srcset="https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/R-Vs-Excel.jpg?resize=1024%2C870 1024w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/R-Vs-Excel.jpg?resize=260%2C221 260w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/R-Vs-Excel.jpg?resize=768%2C652 768w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/R-Vs-Excel.jpg?resize=100%2C85 100w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/R-Vs-Excel.jpg?w=1436 1436w">No
início, quando você está tentando realizar coisas simples como
equilibrar um orçamento ou inserir alguns dados à mão, R é
definitivamente mais difícil de aprender do que o Excel. No entanto,
quando tarefas ficam mais complexas, tornam-se mais fáceis de realizar
em R do que no Excel, porque as estruturas de núcleo do Excel são
projetados para casos de uso relativamente simples e não são as melhores
para problemas mais complexos. Isto não quer dizer que você não pode
resolver uma variedade de problemas complexos com o Excel, mas a
ferramenta não vai facilitar sua vida.
</p>
<p>
Para muitos de nós, a dor de aprender a programar é dor do fracasso.
Quando o programa lhe dá uma mensagem de erro incompreensível, parece
que está dizendo que você é estúpido e lhe falta aptidão para
programação. Mas depois de programar por um tempo, você aprende que
ninguém realmente entende esses erros, e todo mundo se sente como um
impostor quando seu programa falha. A dor que você sente não é a dor do
fracasso, é apenas a dor da aprendizagem.
</p>
<h3>
Por que aprender coisas novas é tão difícil?
</h3>
<p>
A dificuldade de aprender uma nova ferramenta é causada por dois
obstáculos:
</p>
<h4>
Obstáculo \# 1:
</h4>
<p>
A ferramenta é diferente do que você conhece. Quando você conhece
intimamente uma ferramenta, você desenvolve um vocabulário nessa
ferramenta, você lembra dos atalhos, fórmulas e de onde tudo está
visualmente. Mesmo depois de muito tempo sem usar Excel, é muito fácil
voltar a usá-lo, quase como andar de bicicleta. Quando você está
aprendendo uma nova ferramenta, você não conhece nenhuma dessas coisas,
e isso torna o aprendizado mais difícil. Além disso, você sabe onde
procurar ajuda em ferramentas conhecidas ou como fazer perguntas do
Google de tal forma que você encontre respostas úteis. Nessa nova
ferramenta, você não conhece nenhuma dessas coisas.
</p>
<h4>
Obstáculo \# 2:
</h4>
<p>
A maneira como a nova ferramenta quer que você pense sobre o problema é
diferente da maneira como você está acostumado a pensar sobre o
problema. Por exemplo, se você está acostumado a colocar sua análise em
uma grade retangular, passar para uma ferramenta que é projetada em
torno de comandos vai ser difícil.
</p>
<p>
Esse obstáculo costuma ser de longe a maior barreira para os usuários de
Excel. A maioria das pessoas que aprendem R tem alguma base em
programação. Os modelos mentais subjacentes às linguagens como Matlab ou
Python, bem como pacotes estatísticos como SPSS e SAS, têm muito em
comum com R. Excel, por outro lado, faz você pensar sobre problemas
analíticos de uma maneira muito diferente, e não há muitos recursos para
traduzir um para o outro.
</p>
<h3>
Quatro diferenças fundamentais entre R e Excel
</h3>
<h4>
1.  Análise baseada em texto
    </h4>
    <p>
    O Excel é baseado na planilha física ou planilha de contador. Este é
    um grande pedaço de papel com linhas e colunas. Os registros são
    armazenados na primeira coluna à esquerda, os cálculos sobre esses
    registros foram armazenados nas caixas à direita, e a soma desses
    cálculos foi totalizada na parte inferior. Isso seria um modelo
    referencial de computação, que tem algumas qualidades:
    </p>
    <ul>
    <li>
     Os dados e computação são geralmente armazenados no mesmo local;
    </li>
    <li>
     Os dados são identificados pela sua localização na planilha.
    Geralmente, você não nomeia um intervalo de dados no Excel, mas em
    vez disso se refere a ele por sua localização, por exemplo:$A1:C$36;
    </li>
    <li>
    Os cálculos geralmente têm a mesma forma que os dados. Em outras
    palavras, se você quiser multiplicar 20 números armazenados nas
    células A1:An por 2, você precisará de 20 cálculos: =A1 \* 2, =A2 \*
    2, …., =An \* 2.
    </li>
    </ul>
    <h5>
    A análise de dados baseada em texto é diferente:
    </h5>
    <ul>
    <li>
    Dados e computação são separados. Você tem um arquivo que armazena
    os dados e outro arquivo que armazena os comandos que dizem ao
    programa como manipular esses dados. Isso leva a um tipo de modelo
    processual no qual os dados brutos são alimentados através de um
    conjunto de instruções e aparecem do outro lado, manipulados;
    </li>
    <li>
    Bases de dados são geralmente referenciadas pelo nome. Em vez de ter
    um conjunto de dados que mora no intervalo de
    $A1:C$36, voc&\#xEA; nomeia o conjunto de dados quando quiser&\#xA0;l&\#xEA;-lo, e referir-se-&\#xE1; a ele por esse nome sempre que voc&\#xEA; quiser fazer algo com ele. Voc&\#xEA; pode fazer isso com o Excel nomeando intervalos de c&\#xE9;lulas, mas n&\#xE3;o &\#xE9; comum de ser feito.&lt;/li&gt; &lt;/ul&gt; &lt;h4&gt;2) Estruturas de dados&lt;/h4&gt; &lt;p&gt;Excel tem apenas uma estrutura de dados b&\#xE1;sicos: a c&\#xE9;lula. As c&\#xE9;lulas s&\#xE3;o extremamente flex&\#xED;veis, pois podem armazenar informa&\#xE7;&\#xF5;es num&\#xE9;ricas, de caracteres, l&\#xF3;gicas ou de f&\#xF3;rmulas. O custo dessa flexibilidade &\#xE9; a imprevisibilidade. Por exemplo, voc&\#xEA; pode armazenar o caractere &\#x201C;6&\#x201D; em uma c&\#xE9;lula quando voc&\#xEA; quer armazenar o n&\#xFA;mero 6.&lt;/p&gt; &lt;p&gt;A estrutura de dados R b&\#xE1;sica &\#xE9; um vetor. Voc&\#xEA; pode pensar em um vetor como uma coluna em uma planilha do Excel com a limita&\#xE7;&\#xE3;o de que todos os dados nesse vetor devem ser do mesmo tipo. Se for um vetor de caracteres, cada elemento deve ser um caractere, se for um vetor l&\#xF3;gico, cada elemento deve ser VERDADEIRO ou FALSO; Se &\#xE9; num&\#xE9;rico voc&\#xEA; pode confiar que cada elemento &\#xE9; um n&\#xFA;mero. N&\#xE3;o h&\#xE1; tal restri&\#xE7;&\#xE3;o no Excel: voc&\#xEA; pode ter uma coluna de n&\#xFA;meros juntamente com um texto explicativo. Isso n&\#xE3;o &\#xE9; permitido em R.&lt;/p&gt; &lt;h4&gt;3) Itera&\#xE7;&\#xE3;o&lt;/h4&gt; &lt;p&gt;Itera&\#xE7;&\#xE3;o &\#xE9; um dos recursos mais poderosos das linguagens de programa&\#xE7;&\#xE3;o e &\#xE9; uma grande novidade para os usu&\#xE1;rios do Excel. Itera&\#xE7;&\#xE3;o &\#xE9; apenas pedir para o computador fazer a mesma coisa v&\#xE1;rias vezes seguidas por um determinado per&\#xED;odo. Talvez voc&\#xEA; queira desenhar o mesmo gr&\#xE1;fico com base em cinquenta conjuntos de dados diferentes, ou ler e filtrar v&\#xE1;rias bases de dados. Em uma linguagem de programa&\#xE7;&\#xE3;o como R voc&\#xEA; escreve um script que funciona para todos os casos em que voc&\#xEA; deseja aplic&\#xE1;-lo e ent&\#xE3;o diz ao computador para aplic&\#xE1;-lo.&lt;/p&gt; &lt;p&gt;Os analistas do Excel costumam fazer muito dessa itera&\#xE7;&\#xE3;o. Por exemplo, se um analista do Excel quiser combinar dez arquivos .xls diferentes em um arquivo grande, eles provavelmente abrir&\#xE1; cada um individualmente, copiar&\#xE1; os dados e colar&\#xE1;-los em uma planilha principal. O analista est&\#xE1; efetivamente tomando o lugar de um&lt;em&gt; for loop&lt;/em&gt; fazendo uma coisa repetidamente at&\#xE9; que uma condi&\#xE7;&\#xE3;o seja atendida.&lt;/p&gt; &lt;h4&gt;4) Simplifica&\#xE7;&\#xE3;o atrav&\#xE9;s da abstra&\#xE7;&\#xE3;o&lt;/h4&gt; &lt;p&gt;Outra grande diferen&\#xE7;a &\#xE9; que a programa&\#xE7;&\#xE3;o incentiva voc&\#xEA; a simplificar sua an&\#xE1;lise, abstraindo fun&\#xE7;&\#xF5;es comuns a partir dessa an&\#xE1;lise. No exemplo abaixo voc&\#xEA; pode achar que tem que ler o mesmo tipo de arquivos repetidamente e verificar se eles t&\#xEA;m o n&\#xFA;mero certo de linhas. R permite que voc&\#xEA; escreva uma fun&\#xE7;&\#xE3;o que faz isso:&lt;/p&gt; &lt;div id="crayon-5943a53cf311c312558989" class="crayon-syntax crayon-theme-classic crayon-font-monaco crayon-os-pc print-yes notranslate"&gt; &lt;div class="crayon-plain-wrap"&gt;&lt;textarea class="crayon-plain print-no"&gt; read\_and\_check &lt;- function(file){&\#xA0; out &lt;- read.csv(file)&\#xA0; if(nrow(out) == 0) {&\#xA0;&\#xA0;&\#xA0; stop(&quot;Essa planilha est&\#xE1; vazia!&quot;)&\#xA0; } else {&\#xA0;&\#xA0; &\#xA0; out&\#xA0; } }&lt;/textarea&gt;&lt;/div&gt; &lt;div class="crayon-main"&gt; &lt;table class="crayon-table"&gt; &lt;tr class="crayon-row"&gt; &lt;td class="crayon-nums "&gt; &lt;/td&gt; &lt;td class="crayon-code"&gt;&lt;div class="crayon-pre"&gt;&lt;div class="crayon-line" id="crayon-5943a53cf311c312558989-1"&gt;&lt;span class="crayon-v"&gt;read\_and\_check&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-o"&gt;&lt;&lt;/span&gt;&lt;span class="crayon-o"&gt;-&lt;/span&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-t"&gt;function&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-v"&gt;file&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&lt;span class="crayon-sy"&gt;{&lt;/span&gt;&\#xA0;&lt;/div&gt;&lt;div class="crayon-line crayon-striped-line" id="crayon-5943a53cf311c312558989-4"&gt;&lt;span class="crayon-h"&gt; &lt;/span&gt;&lt;span class="crayon-r"&gt;stop&lt;/span&gt;&lt;span class="crayon-sy"&gt;(&lt;/span&gt;&lt;span class="crayon-s"&gt;&quot;Essa planilha est&\#xE1; vazia!&quot;&lt;/span&gt;&lt;span class="crayon-sy"&gt;)&lt;/span&gt;&\#xA0;&lt;/div&gt;&lt;/div&gt;&lt;/td&gt; &lt;/tr&gt; &lt;/table&gt; &lt;/div&gt; &lt;/div&gt; &lt;p&gt;Tudo que essa fun&\#xE7;&\#xE3;o faz &\#xE9; ler um arquivo .csv e verificar se ele tem mais de zero linhas. Se n&\#xE3;o, ele retorna um erro. Caso contr&\#xE1;rio, retorna o arquivo (que &\#xE9; chamado de &\#x201C;out&\#x201D;). Esta &\#xE9; uma abordagem poderosa porque ajuda a poupar tempo e a reduzir erros. Por exemplo, se voc&\#xEA; quiser verificar se o arquivo tem mais de 23 linhas, voc&\#xEA; s&\#xF3; precisa alterar a condi&\#xE7;&\#xE3;o em um lugar e n&\#xE3;o em v&\#xE1;rias planilhas.&lt;/p&gt; &lt;p&gt;N&\#xE3;o h&\#xE1; realmente nenhum an&\#xE1;logo para esses tipos de fun&\#xE7;&\#xF5;es em um fluxo de trabalho baseado em Excel, e quando a maioria dos analistas chegar a este ponto come&\#xE7;ar&\#xE3;o a escrever c&\#xF3;digo VBA para fazer parte desse trabalho.&lt;/p&gt; &lt;h5&gt;Exemplo: Juntar duas tabelas&lt;/h5&gt; &lt;p&gt;Para exemplificar, vamos juntar duas tabelas no Excel e no R. Vamos dizer que temos duas tabelas de dados, uma com algumas informa&\#xE7;&\#xF5;es sobre carros e outra com a cor desses carros, e queremos juntar os dois juntos. Para o prop&\#xF3;sito deste exerc&\#xED;cio, vamos supor que o n&\#xFA;mero de cilindros em um carro determina a sua cor.&lt;/p&gt; &lt;div id="crayon-5943a53cf3125692655978" class="crayon-syntax crayon-theme-classic crayon-font-monaco crayon-os-pc print-yes notranslate"&gt; &lt;div class="crayon-plain-wrap"&gt;&lt;textarea class="crayon-plain print-no"&gt; library(dplyr) library(knitr) cars &lt;- mtcars colours &lt;- data\_frame( &\#xA0; cyl = unique(cars$cyl),
      colour = c("Blue", "Green", "Eggplant") )  kable(cars\[1:10, \])
    \#kable is just for displaying the table
    </textarea>
    </div>
    <table class="crayon-table">
    <tr class="crayon-row">
    <td class="crayon-nums ">
    </td>
    <td class="crayon-code">
     <span class="crayon-h"> </span><span
    class="crayon-v">colour</span><span class="crayon-h"> </span><span
    class="crayon-o">=</span><span class="crayon-h"> </span><span
    class="crayon-e">c</span><span class="crayon-sy">(</span><span
    class="crayon-s">"Blue"</span><span class="crayon-sy">,</span><span
    class="crayon-h"> </span><span class="crayon-s">"Green"</span><span
    class="crayon-sy">,</span><span class="crayon-h"> </span><span
    class="crayon-s">"Eggplant"</span><span class="crayon-sy">)</span>

    <span class="crayon-e">kable</span><span
    class="crayon-sy">(</span><span class="crayon-v">cars</span><span
    class="crayon-sy">\[</span><span class="crayon-cn">1</span><span
    class="crayon-o">:</span><span class="crayon-cn">10</span><span
    class="crayon-sy">,</span><span class="crayon-h">
    </span><span class="crayon-sy">\]</span><span
    class="crayon-sy">)</span><span class="crayon-h"> </span><span
    class="crayon-c">\#kable is just for displaying the table</span>

    </td>
    </tr>
    </table>

    </div>
    <p>
    <img class="alignnone size-full wp-image-4503" src="https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela-1.png?w=962%20962w,%20https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela-1.png?resize=260%2C128%20260w,%20https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela-1.png?resize=768%2C379%20768w,%20https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela-1.png?resize=100%2C49%20100w" alt="" srcset="https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela-1.png?w=962 962w, https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela-1.png?resize=260%2C128 260w, https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela-1.png?resize=768%2C379 768w, https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela-1.png?resize=100%2C49 100w">
    </p>

    <p>
    <img class="alignnone size-full wp-image-4502" src="https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela-2.png?w=963%20963w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela-2.png?resize=260%2C50%20260w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela-2.png?resize=768%2C147%20768w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela-2.png?resize=100%2C19%20100w" alt="" srcset="https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela-2.png?w=963 963w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela-2.png?resize=260%2C50 260w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela-2.png?resize=768%2C147 768w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela-2.png?resize=100%2C19 100w">
    </p>
    <p>
    No Excel você provavelmente faria isso usando a função VLOOKUP(),
    que leva uma chave e um intervalo e, em seguida, procuraria o valor
    dessa chave dentro desse intervalo. Um exemplo de planilha dessa
    abordagem pode ser
    visto <a href="https://docs.google.com/spreadsheets/d/1K2IqdXX2MoUB4BorRcBcruS7spCvRtDwqXV-4gYAob4/edit">aqui</a>.
    Observe que em cada célula de pesquisa existe alguma versão de
    =vlookup(C4,$H2:I$5, 2, FALSE).
    </p>
    <p>
    Isso ilustra algumas coisas. Primeiro, o cálculo tem a mesma forma
    que os dados, e acontece no mesmo arquivo que os dados. Temos tantas
    fórmulas quanto temos coisas que queremos pesquisar, e elas são
    colocadas ao lado do conjunto de dados. Se você usou esta
    aproximação você pode provavelmente recordar de erros no processo de
    escrever e de encher esta fórmula. Em segundo lugar, os dados são
    referidos pela sua localização na folha. Se movimentarmos a tabela
    de consulta para outra folha, ou para outro lugar nessa folha, isso
    vai estragar a análise. Em terceiro lugar, observe que a primeira
    entrada da coluna cyl no armazenamento de planilha em C2 é
    armazenada como texto, o que causa erro na função de pesquisa. Em R,
    você teria que armazenar todos os valores de calendário como um
    vetor numérico ou de caracteres. Para fazer a mesma coisa em R, nós
    usaríamos este código:
    </p>
    <textarea class="crayon-plain print-no">
    left\_join(cars, colours, by = "cyl") %&gt;%  filter(row\_number()
    %in% 1:10) %&gt;% \# to display only a subset of the data   kable()
    </textarea>

    <table class="crayon-table">
    <tr class="crayon-row">
    <td class="crayon-nums ">
    </td>
    <td class="crayon-code">
    <span class="crayon-e">left\_join</span><span
    class="crayon-sy">(</span><span class="crayon-v">cars</span><span
    class="crayon-sy">,</span><span class="crayon-h"> </span><span
    class="crayon-v">colours</span><span class="crayon-sy">,</span><span
    class="crayon-h"> </span><span class="crayon-v">by</span><span
    class="crayon-h"> </span><span class="crayon-o">=</span><span
    class="crayon-h"> </span><span class="crayon-s">"cyl"</span><span
    class="crayon-sy">)</span><span class="crayon-h"> </span><span
    class="crayon-o">%</span><span class="crayon-o">&gt;</span><span
    class="crayon-o">%</span> <span class="crayon-h"> </span>

    <span class="crayon-e">filter</span><span
    class="crayon-sy">(</span><span
    class="crayon-e">row\_number</span><span
    class="crayon-sy">(</span><span class="crayon-sy">)</span><span
    class="crayon-h"> </span><span class="crayon-o">%</span><span
    class="crayon-st">in</span><span class="crayon-o">%</span><span
    class="crayon-h"> </span><span class="crayon-cn">1</span><span
    class="crayon-o">:</span><span class="crayon-cn">10</span><span
    class="crayon-sy">)</span><span class="crayon-h"> </span><span
    class="crayon-o">%</span><span class="crayon-o">&gt;</span><span
    class="crayon-o">%</span><span class="crayon-h"> </span><span
    class="crayon-c">\# to display only a subset of the data</span>

    </td>
    </tr>
    </table>

    <p>
    <img class="alignnone size-large wp-image-4578" src="https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Tabela2.jpg?resize=1024%2C455%201024w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Tabela2.jpg?resize=260%2C116%20260w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Tabela2.jpg?resize=768%2C341%20768w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Tabela2.jpg?resize=100%2C44%20100w" alt="" srcset="https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Tabela2.jpg?resize=1024%2C455 1024w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Tabela2.jpg?resize=260%2C116 260w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Tabela2.jpg?resize=768%2C341 768w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Tabela2.jpg?resize=100%2C44 100w">Aqui
    nós nos referimos aos dados pelo seu nome, usamos uma função para
    operar em toda a tabela ao invés de linha a linha. Como a
    consistência é imposta para cada vetor, não podemos armazenar
    acidentalmente uma entrada de caractere em um vetor numérico.
    </p>
    <p>
    <strong>Iteração</strong>
    </p>
    <p>
    Se quiséssemos obter o deslocamento médio para cada cor de carro, a
    maioria dos usuários de Excel provavelmente faria essa iteração
    manualmente, primeiro selecionando a tabela, classificando-a por cor
    e, em seguida, escolhendo os intervalos que eles queriam
    média analisar. Um analista mais sofisticado provavelmente usaria a
    função averageif()para escolher os critérios que eles queriam média,
    e assim evitaria alguns erros. Ambas as abordagens são implementadas
    na guia iteração da planilha.
    </p>
    <p>
    Em R você faria algo como isto:
    </p>
    <textarea class="crayon-plain print-no">
    left\_join(cars, colours, by = "cyl") %&gt;%   group\_by(colour)
    %&gt;%   summarize(mean\_displacement = mean(disp)) %&gt;%   kable()
    </textarea>

    <table class="crayon-table">
    <tr class="crayon-row">
    <td class="crayon-nums ">
    </td>
    <td class="crayon-code">
    <span class="crayon-e">left\_join</span><span
    class="crayon-sy">(</span><span class="crayon-v">cars</span><span
    class="crayon-sy">,</span><span class="crayon-h"> </span><span
    class="crayon-v">colours</span><span class="crayon-sy">,</span><span
    class="crayon-h"> </span><span class="crayon-v">by</span><span
    class="crayon-h"> </span><span class="crayon-o">=</span><span
    class="crayon-h"> </span><span class="crayon-s">"cyl"</span><span
    class="crayon-sy">)</span><span class="crayon-h"> </span><span
    class="crayon-o">%</span><span class="crayon-o">&gt;</span><span
    class="crayon-o">%</span>

     <span class="crayon-h"> </span><span
    class="crayon-e">summarize</span><span
    class="crayon-sy">(</span><span
    class="crayon-v">mean\_displacement</span><span class="crayon-h">
    </span><span class="crayon-o">=</span><span class="crayon-h">
    </span><span class="crayon-e">mean</span><span
    class="crayon-sy">(</span><span class="crayon-v">disp</span><span
    class="crayon-sy">)</span><span class="crayon-sy">)</span><span
    class="crayon-h"> </span><span class="crayon-o">%</span><span
    class="crayon-o">&gt;</span><span class="crayon-o">%</span>

    </td>
    </tr>
    </table>

    <p>
    <img class="alignnone size-large wp-image-4579" src="https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Tabela3.jpg?resize=1024%2C179%201024w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Tabela3.jpg?resize=260%2C46%20260w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Tabela3.jpg?resize=768%2C134%20768w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Tabela3.jpg?resize=100%2C18%20100w" alt="" srcset="https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Tabela3.jpg?resize=1024%2C179 1024w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Tabela3.jpg?resize=260%2C46 260w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Tabela3.jpg?resize=768%2C134 768w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Tabela3.jpg?resize=100%2C18 100w">O
    que isto faz é pegar o conjunto de dados, dividi-lo pela variável de
    agrupamento, neste caso, a cor, e, em seguida, aplicar a função na
    função summarize de cada grupo. A diferença é que nós estamos nos
    referindo às coisas pelo nome em vez da posição – há uma linha de
    código que aplica a função ao conjunto de dados inteiro, e todas as
    ações iterativas são armazenadas no script.
    </p>
    <p>
    Generalização através de funções são um dos aspectos mais difíceis
    no aprendizado de uma linguagem de programação. É importante falar
    sobre elas pois são comuns e podem ser bastante desanimadoras para
    os usuários do Excel, porque eles são totalmente estranhos ao seu
    fluxo de trabalho. Uma função é uma maneira de usar código existente
    em novos objetos.  Uma função que se encaixa no caso descrito acima
    pode parecer assim:
    </p>
    <textarea class="crayon-plain print-no">
    join\_and\_summarize &lt;- function(df, colour\_df){  
    left\_join(df, colour\_df, by = "cyl") %&gt;%     group\_by(colour)
    %&gt;%     summarize(mean\_displacement = mean(disp)) }
    </textarea>

    <table class="crayon-table">
    <tr class="crayon-row">
    <td class="crayon-nums ">
    </td>
    <td class="crayon-code">
    <span class="crayon-v">join\_and\_summarize</span><span
    class="crayon-h"> </span><span class="crayon-o">&lt;</span><span
    class="crayon-o">-</span><span class="crayon-h"> </span><span
    class="crayon-t">function</span><span
    class="crayon-sy">(</span><span class="crayon-v">df</span><span
    class="crayon-sy">,</span><span class="crayon-h"> </span><span
    class="crayon-v">colour\_df</span><span
    class="crayon-sy">)</span><span class="crayon-sy">{</span>

     <span class="crayon-h"> </span><span
    class="crayon-e">left\_join</span><span
    class="crayon-sy">(</span><span class="crayon-v">df</span><span
    class="crayon-sy">,</span><span class="crayon-h"> </span><span
    class="crayon-v">colour\_df</span><span
    class="crayon-sy">,</span><span class="crayon-h"> </span><span
    class="crayon-v">by</span><span class="crayon-h"> </span><span
    class="crayon-o">=</span><span class="crayon-h"> </span><span
    class="crayon-s">"cyl"</span><span class="crayon-sy">)</span><span
    class="crayon-h"> </span><span class="crayon-o">%</span><span
    class="crayon-o">&gt;</span><span class="crayon-o">%</span>

       <span class="crayon-h"> </span><span
    class="crayon-e">summarize</span><span
    class="crayon-sy">(</span><span
    class="crayon-v">mean\_displacement</span><span class="crayon-h">
    </span><span class="crayon-o">=</span><span class="crayon-h">
    </span><span class="crayon-e">mean</span><span
    class="crayon-sy">(</span><span class="crayon-v">disp</span><span
    class="crayon-sy">)</span><span class="crayon-sy">)</span>

    </td>
    </tr>
    </table>

    <p>
    O que está entre as chaves <span id="crayon-5943a53cf3134495990185"
    class="crayon-syntax crayon-syntax-inline crayon-theme-classic crayon-theme-classic-inline crayon-font-monaco"><span
    class="crayon-pre crayon-code"><span
    class="crayon-t">function</span><span
    class="crayon-sy">(</span><span class="crayon-sy">)</span><span
    class="crayon-h"> </span><span class="crayon-sy">(</span><span
    class="crayon-e">dfe </span><span
    class="crayon-v">colour\_df</span><span
    class="crayon-sy">)</span></span></span>  são chamados de
    “argumentos”, e quando você utiliza a função tudo o que faz é pegar
    os objetos reais que você fornece à função e os conecta para onde
    quer que esse argumento apareça dentro das chaves. Neste caso, nós
    ligaríamos cars para o argumento dfe, e colours para o
    argumento colour\_df. A função, em seguida, basicamente substitui
    todos os df com carros e colour\_df com cores e, em seguida, avalia
    o código.
    </p>
    <textarea class="crayon-plain print-no">
    join\_and\_summarize(cars, colours) %&gt;%   kable()
    </textarea>

    <table class="crayon-table">
    <tr class="crayon-row">
    <td class="crayon-nums ">
    </td>
    <td class="crayon-code">
    <span class="crayon-e">join\_and\_summarize</span><span
    class="crayon-sy">(</span><span class="crayon-v">cars</span><span
    class="crayon-sy">,</span><span class="crayon-h"> </span><span
    class="crayon-v">colours</span><span class="crayon-sy">)</span><span
    class="crayon-h"> </span><span class="crayon-o">%</span><span
    class="crayon-o">&gt;</span><span class="crayon-o">%</span>

    </td>
    </tr>
    </table>

    <p>
    <img class="alignnone size-large wp-image-4580" src="https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela4.jpg?resize=1024%2C183%201024w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela4.jpg?resize=260%2C47%20260w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela4.jpg?resize=768%2C138%20768w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela4.jpg?resize=100%2C18%20100w" alt="" srcset="https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela4.jpg?resize=1024%2C183 1024w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela4.jpg?resize=260%2C47 260w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela4.jpg?resize=768%2C138 768w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/tabela4.jpg?resize=100%2C18 100w"><strong>Conclusão</strong>
    </p>
    <p>
    Usuários de Excel têm uma maneira de pensar a análise de dados muito
    rígida, e isso torna o aprendizado do de R mais difícil. No entanto,
    aprender a programar permitirá que você faça coisas que você não
    pode fazer no Excel, e realmente vale a pena a dor de aprender uma
    nova linguagem.
    </p>
    <p>
    <a href="http://www.ibpad.com.br/blog/formacao-em-r/"><br>
    </a><a href="http://www.ibpad.com.br/blog/formacao-em-r/"><img class="aligncenter wp-image-4138 size-medium" src="https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=260%2C241%20260w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=768%2C711%20768w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=1024%2C948%201024w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=100%2C93%20100w,%20https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?w=1225%201225w" srcset="https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=260%2C241 260w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=768%2C711 768w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=1024%2C948 1024w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?resize=100%2C93 100w, https://i2.wp.com/www.ibpad.com.br/wp-content/uploads/2017/02/Vitrine-R.png?w=1225 1225w"></a>
    </p>
    <p>
    <a href="http://www.ibpad.com.br/blog/formacao-em-r/">Quer dar um
    passo adiante? Conheça a nossa formação em R do IBPAD</a>
    </p>
    </div>

