+++
title = "R na Nuvem!"
date = "2017-04-28 01:48:04"
categories = ["IBPAD"]
original_url = "http://www.ibpad.com.br/blog/r-na-nuvem/"
+++

<p>
Computação na “nuvem” é uma área muito animadora para quem está
trabalhando com dados. Pense na possibilidade de não precisar deixar o
computador ligado um tempão pra fazer aquela captura, ou de conseguir
bem mais memória só para rodar aquela análise? O céu é o limite.
</p>
<p>
Existem várias opções para trabalhar com o R em uma nuvem. Neste post
nós vamos focar na Amazon Web Services (AWS), um dos serviços mais
populares da área. Você pode ler os
<a href="https://aws.amazon.com/blogs/big-data/running-r-on-aws/">guias</a>
no website do AWS, ou usar pacotes do R mesmo (do projeto
<a href="http://cloudyr.github.io/">cloudyR</a>), ou usar uma Amazon
Machine Image (AMI), que cria uma máquina virtual no EC2, o <em>Amazon
Elastic Compute Cloud</em>. A terceira é uma ótima opção para R, dado
que <a href="http://www.louisaslett.com/">Louis Aslett</a> tem criado
uma AMI que já tem RStudio na máquina virtual.
</p>
<p>
O primeiro passo é criar conta na AWS. Se tiver conta, pode fazer o
login, e depois ir para o site do Louis que tem as AMIs do Rstudio:
<a href="http://www.louisaslett.com/RStudio_AMI/">http://www.louisaslett.com/RStudio\_AMI/</a>.
No lado direito, tem uma lista de regiões e tipos de instâncias. Eu usei
a de ‘US East, Virginia’; tentei a de São Paulo mas não funcionou.
</p>
<p>
<img class="alignnone size-medium wp-image-4890" src="https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/louis.png?resize=260%2C295%20260w,%20https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/louis.png?resize=88%2C100%2088w,%20https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/louis.png?resize=80%2C90%2080w,%20https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/louis.png?w=505%20505w" alt="" srcset="https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/louis.png?resize=260%2C295 260w, https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/louis.png?resize=88%2C100 88w, https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/louis.png?resize=80%2C90 80w, https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/louis.png?w=505 505w">
</p>
<p>
Ao clicar, você vai acessar a uma serie de guias no site da AWS para
iniciar a sua máquina virtual com uma lista de opções.
</p>
<p>
<img class="alignnone size-medium wp-image-4893" src="https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/sec_group.png?resize=260%2C24%20260w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/sec_group.png?resize=100%2C9%20100w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/sec_group.png?w=671%20671w" alt="" srcset="https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/sec_group.png?resize=260%2C24 260w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/sec_group.png?resize=100%2C9 100w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/sec_group.png?w=671 671w">
</p>
<p>
Nessa lista, você pode escolher o tipo de instância — pode escolher uma
máquina de memória maior etc. Umas são pagas, e outras são de graça. Uma
opção que é importante é a segurança (‘Security Groups’). Aqui, temos
que criar um novo grupo de segurança para usar RStudio diretamente
do<br> browser.
</p>
<p>
<img class="alignnone size-medium wp-image-4894" src="https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/tcp.png?resize=260%2C54%20260w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/tcp.png?resize=768%2C159%20768w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/tcp.png?resize=1024%2C212%201024w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/tcp.png?resize=100%2C21%20100w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/tcp.png?w=1253%201253w" alt="" srcset="https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/tcp.png?resize=260%2C54 260w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/tcp.png?resize=768%2C159 768w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/tcp.png?resize=1024%2C212 1024w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/tcp.png?resize=100%2C21 100w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/tcp.png?w=1253 1253w">
</p>
<p>
Você pode chamar o grupo ‘Rstudio’. Da lista drop-down, selecione
‘Create Custom TCP Rule’. Põe 22 no Port Range, ou algo que inclua 22,
como 0-80. Depois pode clicar em ‘Launch’.
</p>
<p>
<img class="alignnone size-medium wp-image-4892" src="https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/keys.png?resize=260%2C140%20260w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/keys.png?resize=100%2C54%20100w,%20https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/keys.png?w=695%20695w" alt="" srcset="https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/keys.png?resize=260%2C140 260w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/keys.png?resize=100%2C54 100w, https://i1.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/keys.png?w=695 695w">
</p>
<p>
O AWS vai te perguntar sobre key pairs. Não é necessário para usar
RStudio no AWS, então pode clicar ‘Continue without keys’. Se você quer
utilizar o ssh para acessar o RStudio server depois, esta etapa vai ser
necessária. Agora nós podemos ir na página das instâncias. Pode ser que
demore um pouquinho para a sua instância começar, mas quando começar vai
ter um circulo verde ao lado da instância e a palavra ‘running’ ao lado.
Se você clica na instância, vai te mostrar as detalhes dela, onde pode
achar o endereço IP para fazer login no RStudio.
</p>
<p>
Copie o ‘IPv4 Public IP’ e cole no search bar no seu browser. Vai te
levar a uma página de Rstudio para fazer login: o Username é ‘rstudio’ e
a senha é ‘rstudio’ também (você pode mudar depois). Vai abrir o Rstudio
no seu browser, rodando dos servidores do Amazon!
</p>
<p>
<img class="alignnone size-medium wp-image-4891" src="https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/Rstudio.png?resize=260%2C136%20260w,%20https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/Rstudio.png?resize=768%2C402%20768w,%20https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/Rstudio.png?resize=1024%2C536%201024w,%20https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/Rstudio.png?resize=100%2C52%20100w,%20https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/Rstudio.png?w=1262%201262w" alt="" srcset="https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/Rstudio.png?resize=260%2C136 260w, https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/Rstudio.png?resize=768%2C402 768w, https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/Rstudio.png?resize=1024%2C536 1024w, https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/Rstudio.png?resize=100%2C52 100w, https://i0.wp.com/www.ibpad.com.br/wp-content/uploads/2017/03/Rstudio.png?w=1262 1262w">
</p>
<p>
No <code>Welcome.R</code>, o script que vai abrir nessa página, tem umas
instruções para mudar senhas e tal. O Louis também tem feito um pacote
para R para cuidar dos detalhes para você e tem mais detalhes nesse
script (em inglês). É simples: carrega o pacote e usar a função
<code>passwd()</code>, que vai te pedir para a sua senha existente
(“rstudio”) e para uma nova. Daí clica no <code>Edit</code> no RStudio,
e <code>Clear Console</code> (ou <code>Cntrl + L</code>).
</p>
<textarea class="crayon-plain print-no">
library('RStudioAMI') passwd() \# Current password (rstudio if not
changed yet):
</textarea>

<table class="crayon-table">
<tr class="crayon-row">
<td class="crayon-nums ">
</td>
<td class="crayon-code">
<span class="crayon-p">\# Current password (rstudio if not changed yet):
</span>

</td>
</tr>
</table>

<p>
Agora você está pronto para fazer análise no R na nuvem!
</p>

