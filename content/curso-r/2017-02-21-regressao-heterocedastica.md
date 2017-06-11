+++
title = "Modelando a variância da normal"
date = "2017-03-09 11:07:31"
categories = ["curso-r"]
+++

<div id="post-content"> <p>Verificar as suposi&#xE7;&#xF5;es dos modelos &#xE9; muito importante quando fazemos infer&#xEA;ncia estat&#xED;stica. Em particular, a suposi&#xE7;&#xE3;o de homocedasticidade<a href="http://curso-r.com/blog/2017/03/09/2017-02-21-regressao-heterocedastica/#fn1" class="footnoteRef" id="fnref1"><sup>1</sup></a> dos modelos de regress&#xE3;o linear &#xE9; especialmente importante, pois modifica o c&#xE1;lculo de erros padr&#xE3;o, intervalos de confian&#xE7;a e valores-p.</p>
<p>Neste post, vou mostrar tr&#xEA;s pacotes do R que ajustam modelos da forma</p>
<p><span class="math display">\[ Y_i = \beta_0 + \sum_{k=1}^p\beta_kx_{ik} + \epsilon_i, \ i = 1,\ldots,n\]</span></p>
<p><span class="math display">\[ \epsilon_{i} \sim \textrm{N}(0,\sigma_i), \ i = 1,\ldots,n \ \textrm{independentes, com }\sigma_i^2 = \alpha x_i^2. \]</span></p>
<p>Al&#xE9;m de mostrar como se faz, tamb&#xE9;m vou ilustrar o desempenho dos pacotes em um exemplo simulado. O modelo que gerar&#xE1; os dados do exemplo ter&#xE1; a seguinte forma funcional</p>
<p><span class="math display">\[ Y_i = \beta x_i + \epsilon_i, \ i = 1,...n \]</span> <span class="math display">\[ \epsilon_i \sim N(0, \sigma_i)\text{ independentes, com }\sigma_i = \alpha\sqrt{|x_i|},\]</span></p>
<p>e os par&#xE2;metros do modelo ser&#xE3;o os valores <span class="math inline">\(\beta = 1\)</span> e <span class="math inline">\(\alpha = 4\)</span>. A heterocedasticidade faz com que os pontos desenhem um cone ao redor da reta de regress&#xE3;o.</p>
<pre class="r"><code>library(ggplot2) N &lt;- 1000 set.seed(11071995)
X &lt;- sample((N/100):(N*3), N)
Y &lt;- rnorm(N,X,4*sqrt(X)) qplot(X,Y) + theme_bw(15) + geom_point(color = &apos;darkorange&apos;)</code></pre>
<p><img src="http://curso-r.com/blog/2017-02-21-regressao-heterocedastica_files/figure-html/unnamed-chunk-1-1.png" width="672"></p>
<pre class="r"><code>X2 &lt;- sqrt(X)
dataset &lt;- data.frame(Y,X,X2)</code></pre>
<div id="usando-o-pacote-gamlss" class="section level3"> <p>Quando se ajusta um GAMLSS, voc&#xEA; pode modelar os par&#xE2;metros de loca&#xE7;&#xE3;o, escala e curtose ao mesmo tempo em que escolhe a distribui&#xE7;&#xE3;o dos dados dentre uma grande gama de op&#xE7;&#xF5;es. Escolhendo a distribui&#xE7;&#xE3;o normal e modelando apenas os par&#xE2;metros de loca&#xE7;&#xE3;o e escala, o GAMLSS ajusta modelos lineares normais com heterocedasticidade.</p>
<p>No c&#xF3;digo abaixo, o par&#xE2;metro <code>formula = Y ~ X-1</code> indica que a fun&#xE7;&#xE3;o de regress&#xE3;o ser&#xE1; constitu&#xED;da por um preditor linear em <code>X</code> sem intercepto. J&#xE1; o par&#xE2;metro <code>sigma.formula = ~X2-1</code> indica que o desvio padr&#xE3;o ser&#xE1; modelado por um preditor linear em <code>X2</code> (ou raiz de <code>X</code>), tamb&#xE9;m sem intercepto.</p>
<pre class="r"><code>library(gamlss) fit_gamlss &lt;- gamlss::gamlss(formula = Y ~ X-1, sigma.formula = ~X2-1, data = dataset, family = NO())</code></pre>
<pre><code>GAMLSS-RS iteration 1: Global Deviance = 17872.29 GAMLSS-RS iteration 2: Global Deviance = 17870.67 GAMLSS-RS iteration 3: Global Deviance = 17870.67 </code></pre>
<p>Conforme descrito no sum&#xE1;rio abaixo, a estimativa de alfa est&#xE1; muito abaixo do valor simulado.</p>
<pre class="r"><code>summary(fit_gamlss)</code></pre>
<pre><code>******************************************************************
Family: c(&quot;NO&quot;, &quot;Normal&quot;) Call: gamlss::gamlss(formula = Y ~ X - 1, sigma.formula = ~X2 - 1, family = NO(), data = dataset) Fitting method: RS() ------------------------------------------------------------------
Mu link function: identity
Mu Coefficients: Estimate Std. Error t value Pr(&gt;|t|) X 0.996942 0.005131 194.3 &lt;2e-16 ***
---
Signif. codes: 0 &apos;***&apos; 0.001 &apos;**&apos; 0.01 &apos;*&apos; 0.05 &apos;.&apos; 0.1 &apos; &apos; 1 ------------------------------------------------------------------
Sigma link function: log
Sigma Coefficients: Estimate Std. Error t value Pr(&gt;|t|) X2 0.1791449 0.0009606 186.5 &lt;2e-16 ***
---
Signif. codes: 0 &apos;***&apos; 0.001 &apos;**&apos; 0.01 &apos;*&apos; 0.05 &apos;.&apos; 0.1 &apos; &apos; 1 ------------------------------------------------------------------
No. of observations in the fit: 1000 Degrees of Freedom for the fit: 2 Residual Deg. of Freedom: 998 at cycle: 3 Global Deviance: 17870.67 AIC: 17874.67 SBC: 17884.49 ******************************************************************</code></pre>
</div>
<div id="usando-o-pacote-dglm" class="section level3"> <p>Quando se ajusta um Modelo Linear Generalizado Duplo (MLGD em portugu&#xEA;s e DGLM em ingl&#xEA;s), voc&#xEA; tem uma flexibilidade parecida com a de um GAMLSS. Entretanto, voc&#xEA; n&#xE3;o pode definir um modelo para a curtose e a classe de distribui&#xE7;&#xF5;es dispon&#xED;vel &#xE9; bem menor.</p>
<p>O c&#xF3;digo abaixo, similar ao utilizado para ajustar o GAMLSS, ajusta um DGLM aos dados simulados.</p>
<pre class="r"><code>library(dglm) fit &lt;- dglm(Y~X-1, dformula = ~X2-1,data = dataset, family = gaussian, method = &apos;reml&apos;)</code></pre>
<pre><code>Warning: glm.fit: algorithm did not converge</code></pre>
<p>Novamente, verifica-se que o alfa estimado est&#xE1; muito distante do verdadeiro alfa.</p>
<pre class="r"><code>summary(fit)</code></pre>
<pre><code>
Call: dglm(formula = Y ~ X - 1, dformula = ~X2 - 1, family = gaussian, data = dataset, method = &quot;reml&quot;) Mean Coefficients: Estimate Std. Error t value Pr(&gt;|t|)
X 0.9969432 0.008981392 111.001 0
(Dispersion Parameters for gaussian family estimated as below ) Scaled Null Deviance: 27197.48 on 1000 degrees of freedom
Scaled Residual Deviance: 3090.08 on 999 degrees of freedom Dispersion Coefficients: Estimate Std. Error z value Pr(&gt;|z|)
X2 0.3577322 0.001166004 306.8019 0
(Dispersion parameter for Gamma family taken to be 2 ) Scaled Null Deviance: 1628.301 on 1000 degrees of freedom
Scaled Residual Deviance: 6526.59 on 999 degrees of freedom Minus Twice the Log-Likelihood: 17870.76 Number of Alternating Iterations: 18 </code></pre>
</div>
<div id="usando-o-pacote-rstan" class="section level3"> <p><a href="http://mc-stan.org/">Stan</a> &#xE9; uma linguagem de programa&#xE7;&#xE3;o voltada para descrever e manipular objetos probabil&#xED;sticos, como por exemplo vari&#xE1;veis aleat&#xF3;rias, processos estoc&#xE1;sticos, distribui&#xE7;&#xF5;es de probabilidades etc. Essa linguagem foi projetada para tornar intuitivo e simples o ajuste de modelos estat&#xED;sticos. Em particular, a forma de descrever modelos bayesianos &#xE9; bem c&#xF4;moda.</p>
<p>O <code>stan</code> possui v&#xE1;rias interfaces para <code>R</code>. A mais b&#xE1;sica &#xE9; o <code>rstan</code>, que ser&#xE1; utilizada aqui. A principal fun&#xE7;&#xE3;o desse pacote &#xE9; a fun&#xE7;&#xE3;o <code>rstan</code>, que possui dois par&#xE2;metros b&#xE1;sicos:</p>
<ul>
<li>um par&#xE2;metro <code>model_code =</code>, que recebe um c&#xF3;digo que descreve o modelo na linguagem <code>stan</code>.</li>
<li>um par&#xE2;metro <code>data =</code>, que recebe uma lista contendo os inputs do modelo, tais como dados coletados, par&#xE2;metros de distribui&#xE7;&#xF5;es a priori, etc.</li>
</ul>
<p>Embora esse seja o m&#xED;nimo que a fun&#xE7;&#xE3;o precisa, tamb&#xE9;m podemos passar outras componentes. O par&#xE2;metro <code>verbose = FALSE</code> faz com que a fun&#xE7;&#xE3;o n&#xE3;o imprima nada enquanto roda e o par&#xE2;metro <code>control = list(...)</code> passa uma lista de op&#xE7;&#xF5;es de controle para o algoritmo de ajuste.</p>
<p>O retorno da fun&#xE7;&#xE3;o <code>stan()</code> &#xE9; um objeto do tipo <code>stanfit</code>, que pode ser sumarizado da mesma forma que outros modelos em R, utilizando a fun&#xE7;&#xE3;o <code>summary()</code> e a fun&#xE7;&#xE3;o <code>plot()</code>.</p>
<p>O c&#xF3;digo abaixo ilustra a aplica&#xE7;&#xE3;o da fun&#xE7;&#xE3;o <code>stan()</code> ao nosso exemplo.</p>
<pre class="r"><code>library(rstan) scode &lt;- &quot;data { int&lt;lower=0&gt; N; vector[N] y; vector[N] x;
}
parameters { real beta; real&lt;lower=0&gt; alpha;
}
model { beta ~ normal(0,10); alpha ~ gamma(1,1); y ~ normal(beta * x, alpha * sqrt(x));
}&quot; dados &lt;- list(N = nrow(dataset), y = dataset$Y, x = dataset$X) fit_stan &lt;- rstan::stan(model_code = scode, verbose = FALSE, data = dados, control = list(adapt_delta = 0.99))</code></pre>
<p>A figura abaixo descreve os intervalos de credibilidade obtidos para cada par&#xE2;metro do modelo. O ponto central de cada intervalo representa as estimativas pontuais dos par&#xE2;metros. Como se nota, as estimativas do modelo utilizando <code>stan</code> est&#xE3;o bem pr&#xF3;ximas dos valores verdadeiros.</p>
<pre class="r"><code>plot(fit_stan)</code></pre>
<p><img src="http://curso-r.com/blog/2017-02-21-regressao-heterocedastica_files/figure-html/unnamed-chunk-8-1.png" width="672"></p>
</div> </div>
