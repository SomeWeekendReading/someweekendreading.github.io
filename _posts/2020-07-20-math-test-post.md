---
layout: post
title: Math test post
tags: About Obscurantism
comments: true
---

Just seeing if I can make the math typesetting work.  Nothing to see here, kid... move
along.  

<!-- https://intuitive-theory.com/jekyll-styling-syntax/ -->

Inline equation: $f(x) = \frac{1}{sqrt(2\pi)} e^{-x^2 / 2}$  

A longer example: $\max\limits_\theta L_{\theta_0}(\theta)$, subject to $D_{KL}^{\rho_{\theta_0}}(\theta_0,\theta)\le\delta$, where $D_{KL}^\rho(\theta_1,\theta_2)=\mathbb{E}\_{s\sim\rho}[D\_{KL}(\pi\_{\theta_1}(\cdot\vert s)\mid\mid\pi\_{\theta_2}(\cdot\vert s))]$  

Display equation:  

$$f(x) = \frac{1}{sqrt(2\pi)} e^{-x^2 / 2}$$  

  

$$\begin{multline}
\shoveleft
\begin{aligned}
G_t&=R_{t+1}+\gamma R_{t+2}+\gamma^2 R_{t+3}+\gamma^3 R_{t+4}+...\\
&=R_{t+1}+\gamma(R_{t+2}+\gamma R_{t+3}+\gamma^2 R_{t+4})+...\\
&=R_{t+1}+\gamma G_{t+1}\\
\end{aligned}
\end{multline}$$  

![Hmpf.]({{ site.baseurl }}/images/hmpf.png)
