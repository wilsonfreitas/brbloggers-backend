+++
title = "Instalando Anaconda + TensorFlow + Keras para R no Ubuntu 16.04 Server"
date = "2017-06-08 18:12:00"
categories = ["curso-r"]
+++

<div class="col-md-9" id="blog-post"> <p class="text-muted text-uppercase mb-small text-right"> Por <a href="http://curso-r.com/author/athos">Athos</a> 08/06/2017 </p> <div id="post-content"> <p>Compilei um passo a passo mais simplificado dos posts que usei pra conseguir usar o Keras num servidor Ubuntu.</p>
<p>Esse tutorial ensinar&#xE1; como instalar o <a href="https://docs.continuum.io/">Anaconda</a> com Python 3.5 em um servidor Ubuntu 16.04 + Keras para R. Ent&#xE3;o ao final desse post voc&#xEA; ter&#xE1; o Keras direto do seu R pronto para abalar os profundos mares da aprendizagem de m&#xE1;quinas.</p>
<div id="pre-requisitos" class="section level2"> <p>O tutorial sup&#xF5;e que voc&#xEA; possui um servidor Ubuntu 16.04 com R 3.4.0 ou vers&#xE3;o superior instalado.</p>
</div>
<div id="instalando-anaconda-com-python-3.5" class="section level2"> <p>O Keras s&#xF3; funciona com o Python 2.7 ou 3.5, por isso temos que instalar o Anaconda 4.2.0 que &#xE9; a vers&#xE3;o que vem com o Python 3.5.</p>
<p><strong>Passo 1)</strong> Primeiro, sugiro que v&#xE1; ao diret&#xF3;rio <code>/tmp</code> para baixar o arquivo bash do Anaconda.</p>
<pre class="bash"><code>cd /tmp</code></pre>
<p><strong>Passo 2)</strong> Agora fa&#xE7;a o download do bash do Anaconda 4.2.0.</p>
<pre class="bash"><code>curl -O https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh</code></pre>
<p><strong>Passo 3)</strong> Execute o bash.</p>
<pre class="bash"><code>bash Anaconda3-4.2.0-Linux-x86_64.sh</code></pre>
<p><strong>Passo 4)</strong> Voc&#xEA; ver&#xE1; a seguinte sa&#xED;da. Aperta ENTER para continuar.</p>
<pre class="bash"><code>Welcome to Anaconda3 4.2.0 (by Continuum Analytics, Inc.) In order to continue the installation process, please review the license
agreement.
Please, press ENTER to continue</code></pre>
<p><strong>Passo 5)</strong> Da&#xED; vai apertando mais ENTER para ir at&#xE9; o final dos termos de uso. Quando chegar l&#xE1; embaixo, vai perguntar se vc aceita o termos.</p>
<pre class="bash"><code>Do you approve the license terms? [yes|no]</code></pre>
<p><strong>Passo 6)</strong> Escreva <code>yes</code> para aceitar os termos. Deve aparecer um prompt como o mostrado abaixo: hora de escolha o local de instala&#xE7;&#xE3;o. Solte um ENTER caso goste do local padr&#xE3;o oferecido.</p>
<pre class="bash"><code>Anaconda3 will now be installed into this location: /home/athos/anaconda3 - Press ENTER to confirm the location
- Press CTRL-C to abort the installation
- Or specify a different location below [/home/athos/anaconda3] &gt;&gt;&gt; </code></pre>
<p><strong>Passo 7)</strong> Da&#xED; a pergunta seguinte &#xE9; para saber se voc&#xEA; gostaria de fazer o comando <code>conda</code> funcionar quando for chamado no terminal. Pode aceitar.</p>
<pre class="bash"><code>...
installation finished.
Do you wish the installer to prepend the Anaconda3 install location
to PATH in your /home/athos/.bashrc ? [yes|no]
[no] &gt;&gt;&gt; </code></pre>
<p>Neste momento voc&#xEA; ter&#xE1; o Anaconda 4.2.0 pronto para rodar.</p>
<p><strong>Agora, ao R!</strong></p>
</div>
<div id="instalacao-do-keras-no-r" class="section level2"> <p><strong>Passo 8)</strong> Essa parte &#xE9; f&#xE1;cil. Rode os c&#xF3;digos abaixo para para instalar o pacote Keras e o <a href="https://www.tensorflow.org/">Tensorflow</a>.</p>
<pre class="r"><code>devtools::install_github(&quot;rstudio/keras&quot;) # instalar o pacote do Keras para R
keras::install_tensorflow() # instalar o Tensorflow</code></pre>
<p>Pronto! Agora &#xE9; s&#xF3; ser impressionante e destruir no DeepLearning. No <a href="https://rstudio.github.io/keras/">github do Keras</a> tem a documenta&#xE7;&#xE3;o completa pra voc&#xEA; aprender mais sobre como us&#xE1;-lo.</p>
<p>Aquele ax&#xE9;.</p>
</div> </div> </div>
