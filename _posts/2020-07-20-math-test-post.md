---
layout: post
title: Math test post
tags: About Obscurantism
comments: true
---

Just seeing if I can make the math typesetting work.  Nothing to see here, kid... move
along.  

<!-- https://intuitive-theory.com/jekyll-styling-syntax/ -->
<!-- https://hw311.me/en/jekyll/2019/01/23/support-latex-in-jekyll-blog/ -->

Inline equation: $f(x) = \frac{1}{sqrt(2\pi)} e^{-x^2 / 2}$  

A longer example: $\max\limits_\theta L_{\theta_0}(\theta)$, subject to $D_{KL}^{\rho_{\theta_0}}(\theta_0,\theta)\le\delta$, where $D_{KL}^\rho(\theta_1,\theta_2)=\mathbb{E}\_{s\sim\rho}[D\_{KL}(\pi\_{\theta_1}(\cdot\vert s)\mid\mid\pi\_{\theta_2}(\cdot\vert s))]$  

Display equation:  

$$f(x) = \frac{1}{sqrt(2\pi)} e^{-x^2 / 2}$$  

Another:  

$$\begin{multline}
\shoveleft
\begin{aligned}
G_t&=R_{t+1}+\gamma R_{t+2}+\gamma^2 R_{t+3}+\gamma^3 R_{t+4}+...\\
&=R_{t+1}+\gamma(R_{t+2}+\gamma R_{t+3}+\gamma^2 R_{t+4})+...\\
&=R_{t+1}+\gamma G_{t+1}\\
\end{aligned}
\end{multline}$$  

Oh, Maxwell...  

$$
\begin{align}
  \nabla\times\vec{\mathbf{B}}-\frac{1}{c}\frac{\partial\vec{\mathbf{E}}}{\partial t} &= \frac{4\pi}{c}\vec{\mathbf{j}} \\
  \nabla\cdot\vec{\mathbf{E}} &= 4\pi\rho \\
  \nabla\times\vec{\mathbf{E}}+\frac{1}{c}\frac{\partial\vec{\mathbf{B}}}{\partial t} &= \vec{\mathbf{0}} \\
  \nabla\cdot\vec{\mathbf{B}} &= 0
\end{align}
$$

$$
\begin{align*}
  \dot{x} &= \sigma(y - x) \\
  \dot{y} &= \rho x - y - xz \\
  \dot{z} &= -\beta z + xy
\end{align*}
$$

![Hmpf.]({{ site.baseurl }}/images/hmpf.png)
