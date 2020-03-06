# Machine Learning 1

[TOC]

## 1. Introduction to Machine Learning

Machine learning is a field that lies at the intersection of statistics, probability, computer science, and optimization. The main goal is to explore **automatic methods for inferring models from data** (for example: finding structure, making predictions).

<span style='color:green'>Examples of learning tasks:</span>

- <span style='color:brown'>SUPERVISED LEARNING:</span> uses labeled data.
  - **Classification:** predicting a class or category to each example; note multi-label, probabilistic generalizations.
  - **Regression:** predicting a real value for each example; note multi-variable generalization.
- <span style='color:brown'>UNSUPERVISED LEARNING:</span> does not use or have data labels.
  - **Clustering:** discovering homogeneous groups (clusters) in data.
  - **Dimensionality reduction:** finding lower-dimensional data representations.
  - **Density estimation:** estimating the probabilistic mechanism that generates data.
  - **Novelty detection:** finding anomalous/novel/outlying data.
- <span style='color:brown'>SEMI-SUPERVISED LEARNING:</span> uses partly labeled data.
  - **Ranking:** ordering examples according to some criterion.
  - **Reinforcement:** delayed rewarding.
- <span style='color:brown'>TRANSFER LEARNING:</span> learning in a new task through the transfer of knowledge from a related task that has already been learned.

### Useful probability and statistics facts

- **<span style='color:brown'>Central Limit Theorem</span>:**

  If $X_1,\ldots,X_n$ are *independent identically distributed random variables*, with $\mathbb E[X_i]=\mu$ and $\text{Var}(X_i)=\sigma^2$, then the sample mean

$$
\frac{X_1+\ldots+X_n}{n}\sim\mathcal N\left(\mu,\frac{\sigma^2}{n}\right)
$$

​		approaches a normal distribution as $n\rightarrow\infty$.

- **<span style='color:brown'>Product rule</span>:**

  If $X_1,\ldots,X_n$ have a joint probability distribution $p(X_1,\ldots,X_n)$, then we can factorize the distribution as the product

$$
p(X_1,\ldots,X_n)=p(X_1)\prod_{i=2}^np(X_i|X_1,\ldots,X_{i-1}).
$$

- **<span style='color:brown'>Bayes Theorem</span>:**

$$
P(B_i|A)=\frac{P(A|B_i)P(B_i)}{\sum_jP(A|B_j)P(B_j)}=\frac{P(A|B_i)P(B_i)}{P(A)}.
$$



- **<span style='color:brown'>Bayes formula for densities</span>:**

  In a data analysis context, $\theta$ is a parameter vector and the following equality holds:

$$
\pi_{\text{POST}}(\theta|\text{data})=\frac{\pi_{\text{LIK}}(\text{data}|\theta)\cdot\pi_{\text{PRIOR}}(\theta)}{\int_{\Theta}\pi_{\text{LIK}}(\text{data}|\theta)\cdot\pi_{\text{PRIOR}}(\theta)d\theta}.
$$

​		This can also be expressed loosely as
$$
P(\theta|D)=\frac{P(D|\theta)P(\theta)}{P(D)}=\frac{P(D|\theta)P(\theta)}{\int_\Theta P(D|\theta)P(\theta)d\theta},
$$
​		where $D$ is the data. This expression gives rise to the notions of **likelihood**, **prior**, **posterior**, and **unconditional (expected likelihood)** distributions:

- $P(\theta)$: <u>prior probability</u>, confidence in $\theta$ before observing $D$.
- $P(D|\theta)$: <u>likelihood</u>, probability of observing $D$ if parameters are $\theta$.
- $P(D)$: <u>expected likelihood</u> of observing data $D$, also <u>unconditional</u>.
- $P(\theta|D)$: <u>posterior probability</u>, confidence in $\theta$ after observing $D$.



- **<span style='color:brown'>Conjugacy</span>:**

  **Definition:** Suppose a prior distribution $\pi_{\text{PRIOR}}(\theta)$ belongs to a class of parametrized distributions $\Pi$. Then the distribution is said to be **conjugate** with respect to a likelihood $\pi_{\text{LIK}}(\cdot|\theta)$ if the posterior distribution $\pi_{\text{POST}}(\theta|\cdot)\in\Pi$.

  Remember that $\pi_{\text{POST}}(\theta|\cdot)\propto\pi_{\text{LIK}}(\cdot|\theta)\pi_{\text{PRIOR}}(\theta).$ For example, Gaussian is conjugate to Gaussian, and Beta is conjugate to Binomial.

<span style='color:green'>Using the posterior:</span>
$$
\hat\theta_{\text{MAP}}:=\text{argmax}_{\theta\in\Theta}\{P(\theta|D)\}\text{: the value of }\theta\text{ that maximizes the posterior.}
\\
\hat\theta_{\text{ML}}:=\text{argmax}_{\theta\in\Theta}\{P(D|\theta)\}\text{: the value of }\theta\text{ that maximizes the likelihood.}
\\
\hat\theta_{\text{EV}}:=\mathbb{E}[P(\theta|D)]=\int_{\Theta}P(\theta|D)\cdot P(\theta)d\theta\text{: the expected value of theta.}
$$

### Inductive bias

**<span style='color:blue'>Example:</span>** complete the following series: $2,4,6,8,...$

**Answer 1:** 132 (model 1: $f(n)=n^4-10n^3+35n^2-48n+24$)

**Answer 2:** 10 (model 2: $f(n)=2n$)

How can we rule out the more complex model?

1. Supply more training data: $2,4,6,8,10,12,14,...$

2. Regularize: add penalty to higher-order terms.

3. Reduce the hypothesis space; for example, restrict to quadratic models.
   $$
   \text{Class of functions: }\mathcal F:=\{f_\theta:\mathcal X\rightarrow\mathcal Y\ |\ \theta\in\Theta\}.
   $$

So, the conclusions are this: based *only* on training data $D$, there is no means of choosing which function $f$ is better (generalitzation is not *guaranteed*). Thus, we must add control to the **fitting ability** of our methods (complexity control).
$$
\text{true error}(f)\leq\text{training error}(f)+\text{complexity of }f.
$$

### Formulation of ML

![image-20200214212648087](C:\Users\alexb\AppData\Roaming\Typora\typora-user-images\image-20200214212648087.png)

$X$ are the measured variables, $Z$ are the unmeasured ones, $y$ is the true function and $y'$, which would be $\hat y$, is the modeled function. There are some important translations from Statistics to ML and vice-versa:

|                       Machine Learning                       |                          Statistics                          |
| :----------------------------------------------------------: | :----------------------------------------------------------: |
|                            model                             |                            model                             |
|                       parameter/weight                       |                    parameter/coefficient                     |
|                            train                             |                             fit                              |
|                            learn                             |                        infer/estimate                        |
|                          regression                          |                          regression                          |
|                        classification                        |                        discrimination                        |
|                          clustering                          |                  clustering/classification                   |
|                  inputs/features/variables                   |   independent variables, explanatory variables, predictors   |
|                        ouputs/targets                        |                 dependent/response variables                 |
|                      instances/examples                      |                   individuals/observatiobs                   |
| error/loss function, training/empirical error, true/generalization error | fit criterion, deviance resubstitution/in-sample error, predictive, out-sample error |

#### Prediction vs. inference

**Prediction:** produce a good estimate for the predicted variable.

**Inference:**

1. Which predictors actually affect the target variable?
2. How strong are these dependencies?
3. Are these relationships positive or negative?

### Common Tasks

- **Regression:** The goal is to predict some quantitative outcome subject to probabilistic uncertainty.

- **Classification:** The goal is to obtain a model based on available **training data** (*known* examples) with high classification accuracy on  unseen *unknown* examples (**test data**), i.e. achieving good **generalization**.

- **Clustering:** The goal is to find homogeneous groups of data and set them apart accordingly. Looks like a very different task from regression or classification, but it's both of them with some added difficulty: it has an inherent large subjectivity.

**Why are these tasks stochastic?** 

We have a (complete) input data object $(x,z)$ and an output data object $y$. The true relationship is $f_c:\mathcal X\times\mathcal Z\rightarrow\mathcal Y$, that is $f_c(x,z)=y$. When we measure data about $f_c$, we measure only the $x$ portion of the input variables. Therefore, the relation between $x$ and $y$ becomes stochastic.

#### Setting up the tasks

There are (at least) two ways of setting up these tasks formally:

##### Optimization view

$$
\min_{\theta\in\Theta}E(\theta):=\frac{1}{n}\sum_{i=1}^nl(y_i,f_\theta(x_i))+\Omega(f_\theta).
$$

true error of $f_\theta\leq$ training error of $f_\theta$ + complexity of $f_\theta$ (empirical risk + regularizer)

$l(y_i,f_\theta(x_i))$ is called the *loss/error function*.

##### Statistics view

Use Bayes' formula to compute $P(\theta|\text{data})$ and choose one according to this (posterior) distribution.

Many times these two views can yield the same results (which is good!). An example would be LSQ $\equiv$ MaxLik+Gaussian.

The most general description of the data generation mechanism is in terms of the pdf $p(x,y)$ in the joint input-output space: this is the key to generalization.
$$
p(x,y)=p(y|x)\cdot p(x),\text{ where }p(x)=\int p(y,x)\ dy.
$$
Some techniques use $p(x)$, others do not. The important pdf is $p(y|x)$. *Discriminative* methods use only $p(y|x)$, while *generative* methods use the joint pdf $p(x,y)$.

**So, what is a Machine Learning algorithm/technique?**

A ML algorithm gets a dataset $D$ and returns a model of $D$ ( a representation of $D$ that either gives structure to $D$ or that allows to make predictions on unseen observations), together with an estimation of the model quality. The algorithm itself typically determines the model space $\mathcal F$ and the loss function $l$.

**And why are linear models so nice?**

We will begin our analyses with linear models and techniques. A model is linear when, up to an invertible mapping, it is **a linear function of its parameters**; $f_\theta(x)$ is linear when is depends linearly on $\theta$, but we do not say anything about $x$. For example, $f_\theta(x)=\sum_{i=0}^m\theta_i\sin(\exp(-x_i^2))$ is linear. A linear model:

- **Is analytically tractable:** we have closed-form solutions or fast convergent iterative methods for the solution.
- **Has a unique solution:** there are no local optima.
- **Is highly interpretable.**
- **Is amenable to inference:** we can ask (and answer) questions about the importance and weight on the target of the different variables.
- Has **user-defined fitting ability**, via the basis functions.
- Is capable of being **regularized:** complicated models can be penalized.

#### General form of a linear model

A linear model has a general expression as
$$
f(x;\theta)=g\left(\theta_0+\sum_{i=1}^h\theta_i\varphi_i(x)\right).
$$
The functions $\varphi_i$ are called **basis functions** (they constitute a *feature map*) and are non-linear wrt $x$. $g$ is a strictly monotonic function: in Neural Networks, this is called an **activation function**.

### On data pre-processing

Each problem requires a different approach in what concerns data cleaning and preparation. This pre-processing procedure is very important because it can have a deep impact on performance; it can easily take us a significant part of the time. So, the important things to take into account on data pre-processing are:

- Treatment of missing, anomalous, and incoherent or incorrect values.
- Coding of non-continuous or non-ordered variables.
- Possible elimination of irrelevant or redundant variables (*feature selection*).
- Creation of new variables that can be useful (*feature extraction*).
- Normalization of the variables (standardization).
- Transformations of the variables (for example, corrections of serious skewness and/or kurtosis)

Non-standard data (images, audio, text...) may need completely *ad hoc* treatments.

## 2. Linear Data Visualization

### Dimensionality reduction

There are two main goals associated to these techniques:

- **Signal representation:** the goal is to represent the data accurately in a lower-dimensional space.
- **Signal classification:** the goal is to enhance the class-discriminatory information in the lower-dimensional space.

Unfortunately, there is no systematic way to generate non-linear transforms, so we will focus on **linear** methods for **feature extraction**:

- <span style='color:brown'>PCA</span>: Principal Components Analysis.
- <span style='color:brown'>FDA/LDA</span>: Fisher's Discriminant Analysis.
- <span style='color:brown'>ICA</span>: Independent Components Analysis.

### Principal Components Analysis

<span style='color:red'>**ho farem a AD en principi**</span>

### Fisher's Discriminant Analysis

FDA is a technique for **dimensionality reduction, supervised classification, feature extraction and data visualization**.

**<span style='color:blue'>Idea:</span>** projection of the data onto a lower dimensional linear space, such that the separability of projected data is maximized.

Fisher's idea is to regard **dot product** as the projection $y$ of some $x\in\R^p$ from classes $\omega_1$ or $\omega_2$, via a projection vector $w$: $y=w^Tx\in\R$. In order to find a good projection vector, we need to define a measure of separation between the projections:
$$
m_k=\frac{1}{n_k}\sum_{i\in\omega_k}x_i,\qquad k\in\{1,2\},
$$
where $n_1+n_2=n$ is the number of examples on every class. We then choose to maximize the *squared* distance between the projected means,
$$
(\mu_2-\mu_1)^2=(w^Tm_2-w^Tm_1)^2=(w^T(m_2-m_1))^2.
$$
However, the distance between the projected means is not a very good measure since it does not take into account the dispersion (**scatter**) within the classes. The problem is that the covariance matrices for each class are far from being diagonal. We actually want to look for the projection where examples from the same class are projected very close to one another and the projected means are as far apart as possible:

<img src="ML1.assets/image-20200220172900080.png" alt="image-20200220172900080" style="zoom:50%;" />

The solution (proposed by R. Fisher) is to maximize a function that represents the difference between the means, normalized by a measure of the within-class scatter:

1. $\forall k$ a class we define the scatter as

$$
s_k^2=\sum_{i\in\omega_k}\left(w^Tx_i-\mu_k\right)^2,\qquad k\in\{1,2\}.
$$

2. The total scatter is $s_1^2+s_2^2$.
3. Fisher's idea was to maximize the following function:

$$
J(w)=\frac{(\mu_2-\mu_1)^2}{s_1^2+s_2^2}.
$$

It can be shown that $J(w)$ can be rewritten as:
$$
J(w)=\frac{(\mu_2-\mu_1)^2}{s_1^2+s_2^2}=\frac{w^TS_Bw}{w^TS_Ws},
$$
where

- $S_B=(m_2-m_1)(m_2-m_1)^T$ is the **between-class scatter matrix** (rank 1).
- $S_W=\sum_{i\in\omega_1}(x_1-m_1)(x_1-m_1)^T+\sum_{i\in\omega_2}(x_1-m_2)(x_1-m_2)^T$ is the **within-class scatter matrix**.

To find the maximum of $J$ we derive and equal to zero,
$$
\frac{\part J}{\part w}=0,
$$
and upon solving we arrive at the following **generalized eigenvalue problem**:
$$
\left(S_W^{-1}S_B\right)w=J(w)w;
$$
solving it yields $\boxed{\hat w=S_W^{-1}(m_1-m_2),}$ known as **Fisher's Linear Discriminant** (1936), although it is not a discriminant but a specific choice for projection down to one dimension.

FDA generalizes very gracefully for $K$ class problems: the only restriction is that the maximum number of projection directions is $K-1$. FDA can also be derived as the Maximum Likelihood result for the case of Gaussian class-conditional densities with equal covariance matrices; in this case, it is known as LDA.

***WARNING!*** FDA is able to extract a maximum of $K-1$ projection directions, maybe insufficient for complex data. PCA is able to extract $d$ projection directions, but it is not clear how many are necessary.

#### Counterparts

**When will FDA presumably fail?** If the classes are far from Gaussian, the FDA projections will not be able to preserve any complex structure; for an example, this image:

<img src="ML1.assets/image-20200220171928773.png" alt="image-20200220171928773" style="zoom:70%;" />

FDA will also fail when the discriminatory information is not in the mean but rather in the *variance* of the data (e.g., if $J(w)=0$); for example,

<img src="ML1.assets/image-20200220172136456.png" alt="image-20200220172136456" style="zoom:50%;" />

## 3. Theory for regression and linear models (I).

### The regression framework

Given data $D=\{(x_n,t_n)\}_{n=1,\ldots,N}$, where $x_n\in\R^d,t_n\in\R$,

- **Statistics:** estimation of a continuous random variable $T$ conditioned on a random vector $X$.
- **Mathematics:** estimation of a real function $f$ based on a finite number of *noisy* examples $(x_n,f(x_n))$.

The departing statistical setting is $t_n=f(x_n)+\varepsilon_n$; a model is any approximation of $f$. We assume $\varepsilon_n$ are iid random variables such that $\mathbb E[\varepsilon_n]=0$ and $\text{Var}(\varepsilon_n)=\sigma^2<\infty$, and that $\varepsilon_n$ and $x_n$ are independent variables.

The **risk** of a model $y$ is
$$
R(y):=\int_\R\int_{\R^d}L(t,y(\boldsymbol{x}))p(t,\boldsymbol{x})\ d\boldsymbol{x}\ dt,
$$
where $L$ is a suitable **loss** function that satisfies:

- $L(t,y(\boldsymbol x))\geq0$
- $L(t,y(\boldsymbol x))=0\impliedby t=y(\boldsymbol x)$ (not necessarily in the other direction)
- $L(t,y(\boldsymbol x))$ does not increase when $|t-y(\boldsymbol x)|$ decreases.

$L$ is closely related to the distribution of the noise model $\varepsilon_n$.

<span style='color:blue'>**Example:**</span> if we assume for example that $\varepsilon_n\sim\mathcal N\left(0,\sigma^2\right)$, using a maximum likelihood argument it can be shown that the *right* loss function is the **square error**:
$$
L_{\text{SE}}(t,y(\boldsymbol x)):=(t-y(\boldsymbol x))^2.
$$
The **risk** is therefore
$$
R(y)=\int_\R\int_{\R^d}(t-y(\boldsymbol x))^2p(t|\boldsymbol x)p(\boldsymbol x)\ d\boldsymbol x\ dt
$$
If we enjoy complete freedom to choose $y$, the solution is:
$$
y^*(\boldsymbol x)=\int_\R tp(t|\boldsymbol x)\ dt=f(\boldsymbol x),
$$
known as the **regression function**. Since $\mathbb E[\varepsilon_n]=0$, we can alternatively express the regression setting by stating that $t$ is a continuous random variable such that $f(\boldsymbol x)=\mathbb E[t\ |\ X=\boldsymbol x]$.

**Claim:** $y^*(\boldsymbol x)=f(\boldsymbol x).$

**Proof:**
$$
y^*(\boldsymbol x)=\mathbb E[t\ |\ X=\boldsymbol x]=\mathbb E[f(\boldsymbol x)+\varepsilon\ |\ X=\boldsymbol x]=\\=\mathbb E[f(\boldsymbol x)\ |\ X=\boldsymbol x]+\mathbb E[\varepsilon\ |\ X=\boldsymbol x]=f(\boldsymbol x)+0=\\=f(\boldsymbol x).\qquad\qquad\qquad\qquad\qquad\qquad\qquad\qquad\ \square
$$
In a practical setting, we don't know $p(t|\boldsymbol x)$. Instead, we have a finite i.i.d. **data sample** of $N$ labeled observations $D=\{(\boldsymbol x_n,t_n)\}_{n=1,\ldots,N}$, where $\boldsymbol x_n\in\R^d,t_n\in\R$. Then, **intuition** tells us to solve for $y$
$$
\min_y\int_{\R^d}(f(\boldsymbol x)-y(\boldsymbol x))^2p(\boldsymbol x)\ d\boldsymbol x.
$$
This is equivalent to minimizing the risk function; we'll see this in the next part. For now, we must impose restrictions on the possible solutions $y$, this is, we must restrict the search space to a specific **class of functions** $\mathcal Y$.

We can compute an approximation to the true risk, called the **empirical risk**, by averaging the loss function on the available data $D$:
$$
R_{\text{emp}}(y):=\frac{1}{N}\sum_{n=1}^N(t_n-y(\boldsymbol x_n))^2.
$$
This quantity is also known as the **apparent error**. The **Empirical Risk Minimization (ERM)** principle stats that a learning algorithm should choose a hypothesis (model) $\hat y$ which minimizes the empirical risk among a predefined class of functions $\mathcal Y$:
$$
\hat y:=\arg\min_{y\in\mathcal Y}R_{\text{emp}}(y).
$$
The quantity $R_{\text{emp}}(\hat y)$ is known as the **training error**. In theoretical ML, we are very much interested in:

- How this error fluctuates as a function of the data $D$.
- How far this error is from the true error, this is, to bound $|R_{\text{emp}}(\hat y)-R(y)|$; at the very least, to bound $|\mathbb E[R_{\text{emp}}(\hat y)]-R(y)|$.
- How far this error is from the best possible error, this is, to bound $|R_{\text{emp}}(\hat y)-R(y^*)|$; at the very least, to bound $|\mathbb E[R_{\text{emp}}(\hat y)]-R(y^*)|$.

### Bias-Variance analysis

Recall the assumption that $\varepsilon_n\sim\mathcal N(0,\sigma^2)$. In this case, using the square error, the risk can be decomposed as:
$$
R(y)=\int_\R\int_{\R^d}(t-y(\boldsymbol x))^2p(t,\boldsymbol x)\ d\boldsymbol x\ dt=\int_\R\int_{\R^d}(t-f(\boldsymbol x))^2p(t,\boldsymbol x)\ d\boldsymbol x\ dt\\+\int_{\R^d}(f(\boldsymbol x)-y(\boldsymbol x))^2p(\boldsymbol x)\ d\boldsymbol x=\sigma^2+\int_{\R^d}(f(\boldsymbol x)-y(\boldsymbol x))^2p(\boldsymbol x)\ d\boldsymbol x=\boxed{\sigma^2+\text{MSE}(y),}
$$
where $f$ is the **regression function**. Therefore, we arrive at $R(y)=\sigma^2+\text{MSE}(y)$. We can now *forget* about $\sigma^2$ and the risk and instead aim at minimizing the $\text{MSE}(y)$:
$$
\text{MSE}(y)=\int_{\R^d}(f(\boldsymbol x)-y(\boldsymbol x))^2p(\boldsymbol x)\ d\boldsymbol x.
$$
A **learning algorithm** for **regression** is a procedure that, given data $D$ and the search space $\mathcal Y$, outputs a model $y_D\in\mathcal Y$ that aims at minimizing $\text{MSE}(y)$.

Consider now one particular $\boldsymbol x_0$; different $D$ will produce different $y_D$ and therefore different predictions $y_D(\boldsymbol x_0)$. Let us concentrate on the quantity $(f(\boldsymbol x_0)-y(\boldsymbol x_0))^2$: we wish to eliminate the dependence on $D$. Therefore, we investigate its expected value, $\mathbb E\left[(f(\boldsymbol x_0)-y(\boldsymbol x_0))^2\right]$, taking over all possible $D$ of size $N$. If we develop a little more their formulas,
$$
\mathbb E\left[(f(\boldsymbol x_0)-y(\boldsymbol x_0))^2\right]=(f(\boldsymbol x_0)-\mathbb E[y_D(\boldsymbol x_0)])^2+\mathbb E\left[(y_D(\boldsymbol x_0)-\mathbb E[y_D(\boldsymbol x_0)])^2\right].
$$
We can interpret these summands as $f(\boldsymbol x_0)-\mathbb E[y_D(\boldsymbol x_0)]=\text{Bias}(y_D(\boldsymbol x_0))$, and $\mathbb E\left[(y_D(\boldsymbol x_0)-\mathbb E[y_D(\boldsymbol x_0)])^2\right]=\text{Var}(y_D(\boldsymbol x_0))$. Then, the formula is more clearly stated as
$$
\text{MSE}(y_D(\boldsymbol x_0))=\text{Bias}^2(y_D(\boldsymbol x_0))+\text{Var}(y_D(\boldsymbol x_0)),
$$
and the **risk** can be expressed as a sum of three summands:
$$
R(y_D(\boldsymbol x_0))=\sigma^2+\text{Bias}^2(y_D(\boldsymbol x_0))+\text{Var}(y_D(\boldsymbol x_0)).
$$
The derivation above depends on a particular point $\boldsymbol x_0$, so let us put it all back in place within their integrals:
$$
\text{Bias}^2(y_D)=\int_{\R^d}\text{Bias}^2(y_D(\boldsymbol x))p(\boldsymbol x)\ d\boldsymbol x,\\
\text{Var}(y_D)=\int_{\R^d}\text{Var}(y_D(\boldsymbol x))p(\boldsymbol x)\ d\boldsymbol x,\\
\boxed{R(y_D)=\sigma^2+\text{Bias}^2(y_D)+\text{Var}(y_D).}
$$

In general, an **underfit** model will have a big bias, while an **overfit** model will have a high variance. The *abilityi to fit* has a name: it's called the **complexity** of the function class. Both models that are more or less complex than needed will tend to have large prediction errors. In the former, this will be dominated by the variance term, while in the latter, it will be dominated by the (square) bias term.

## 4. Regression theory and linear regression models (II)

Our departing statistical model still is
$$
t_n=f(\boldsymbol x_n)+\varepsilon_n,\ \boldsymbol x_n\in\R^d,\ t\in\R
$$
where $\varepsilon_n$ is a continuous rv such that $\mathbb E[\varepsilon_n]=0$ and $\text{Var}(\varepsilon_n)=\sigma^2$. Let's assume again that we further model $\varepsilon_n\sim\mathcal N\left(0,\sigma^2\right)$, and:
$$
f(\boldsymbol x)\approx y(\boldsymbol x;\boldsymbol\beta)=\sum_{i=0}^d\beta_ix_i=\boldsymbol\beta^T\boldsymbol x
$$
with $\boldsymbol x=(1,x_1,\ldots,x_d)^T$ and $\boldsymbol\beta=(\beta_0,\beta_1,\ldots,\beta_d)^T$. Suppose we have an iid sample of $N$ labeled observations $D=\{(\boldsymbol x_n,t_n)\}_{n=1,\ldots,N}$, where $\boldsymbol x_n\in\R^d,t_n\in\R$. Therefore, our statistical model is $t_n\sim\mathcal N\left(y(\boldsymbol x_n;\boldsymbol\beta),\sigma^2\right)$ or:
$$
p(t_n|\boldsymbol x_n;\theta)=\frac{1}{\sqrt{2\pi\sigma^2}}\exp\left(-\frac{1}{2\sigma^2}\left(t_n-\boldsymbol\beta^T\boldsymbol x_n\right)^2\right),
$$
with unknown parameters $\theta:=\{\beta_0,\beta_1,\ldots,\beta_p,\sigma^2\}$. Put $\boldsymbol t=(t_1,\ldots,t_N)^T$ and $X_{N\times(d+1)}$ the matrix of the $\boldsymbol x_n$. Define the **likelihood** as $\mathcal L(\theta):=P(\boldsymbol t|X;\theta)$. Let us maximize the log-likelihood:
$$
l(\theta):=\log\mathcal L(\theta)=\log\prod_{n=1}^Np(t_n|\boldsymbol x_n;\theta)=\sum_{n=1}^N\log{p(t_n|\boldsymbol x_n;\theta)}=\\
=-\frac{N}{2}\log\left(2\pi\sigma^2\right)-\frac{1}{2\sigma^2}\sum_{n=1}^N\left(t_n-\boldsymbol\beta^T\boldsymbol x_n\right)^2=\\
=-\frac{N}{2}\log\left(2\pi\sigma^2\right)-\frac{1}{2\sigma^2}(\boldsymbol t-X\boldsymbol\beta)^T(\boldsymbol t-X\boldsymbol\beta)=\\
=-\frac{N}{2}\log\left(2\pi\sigma^2\right)-\frac{1}{2\sigma^2}\|\boldsymbol t-X\boldsymbol\beta\|^2.
$$
If we derive this wrt $\boldsymbol\beta$ and $\sigma^2$, and set equal to zero, we get:
$$
\frac{\part l}{\part\boldsymbol\beta}=-\frac{1}{2\sigma^2}\left(-2X^T\boldsymbol t+2X^TX\boldsymbol\beta\right)=0\\
\frac{\part l}{\part\sigma^2}=-\frac{N}{2\sigma^2}+\frac{1}{2\sigma^4}(\boldsymbol t-X\boldsymbol\beta)^T(\boldsymbol t-X\boldsymbol\beta)=0.\\
$$
Therefore, we can calculate the estimates for both parameters:
$$
\boldsymbol{\hat\beta}=\left(X^TX\right)^{-1}X^T\boldsymbol t,\\
\hat\sigma^2=\frac{1}{N}(\boldsymbol t-X\boldsymbol{\hat\beta})^T(\boldsymbol t-X\boldsymbol{\hat\beta})=\frac{1}{N}\|\boldsymbol t-X\boldsymbol{\hat\beta}\|^2.
$$
Note that $\hat\sigma^2=R_{\text{emp}}(y_D)$, which is a **biased estimator** for $\sigma^2$. An unbiased estimator is
$$
\bar\sigma^2=\frac{N}{N-d}\hat\sigma^2.
$$
It's also known that $\boldsymbol{\hat\beta}$ is an unbiased estimator of $\boldsymbol\beta$ and that $\text{Var}(\boldsymbol{\hat\beta})=\left(X^TX\right)^{-1}\sigma^2$. All of this implies that $\boldsymbol{\hat\beta}\sim\mathcal N\left(\boldsymbol\beta,\left(X^TX\right)^{-1}\sigma^2\right)$.

The matrix $X^+=\left(X^TX\right)^{-1}X^T$ is known as the **Moore-Penrose pseudo-inverse** of $X$. It is the generalization of the notion of an inverse matrix to non-square matrices. It has the property that $X^+X=I$, although in general $XX^+\neq I$. However, both are symmetric.

**Theorem.** Let $X_{N\times M}$, with $N>M$. If the column vectors of $X$ are linearly independent, *i.e.*, if $\text{rank}(X)=M$, then:

1. The matrix $X^TX$ is symmetric and positive definite. In particular, it is non-singular.
2. The least squares problem

$$
\min_{\boldsymbol\beta\in\R^M}\|\boldsymbol t-X\boldsymbol\beta\|^2,
$$

​		has a unique solution.

3. This solution can be found solving the so-called Gauss' normal equations,

$$
\left(X^TX\right)\boldsymbol\beta=X^T\boldsymbol t
$$

​		for $\boldsymbol\beta$.

### Quality of the fit

- In statistics, $-2l=-2\log\mathcal L$ is called the **deviance**.
- In ML, this quality measure is the **square error**:

$$
N\log\left(2\pi\sigma^2\right)+\frac{1}{\sigma^2}\|\boldsymbol t-X\boldsymbol{\hat\beta}\|^2
$$

- A much better quantity to report is the $\text{NRMSE}$,

$$
\text{NRMSE}(\boldsymbol{\hat\beta})=\sqrt{\frac{\|\boldsymbol t-X\boldsymbol{\hat\beta}\|^2}{(N-1)\text{Var}(\boldsymbol t)}}.
$$

In statistics, $R^2=1-\text{NRMSE}^2$ is the proportion of the target variability *explained* by the model.

### Leaping forward: basis functions

Recall that a model is **linear** if up to an invertible function its parameters play a linear role in the model. For example,
$$
y(x;\boldsymbol\beta)=\sum_{j=0}^d\beta_jx^j,\ x\in\R
$$
is a polynomial on $x$, but also a linear model on $\boldsymbol\beta$.

A simple but powerful idea is the introduction of **basis functions**:
$$
y(\boldsymbol x;\boldsymbol w)=\sum_{j=0}^Mw_j\varphi_j(\boldsymbol x)=\boldsymbol w^T\boldsymbol\varphi(\boldsymbol x),
$$
where $\varphi_0(\boldsymbol x)=1,\boldsymbol\varphi(\boldsymbol x)=\left(1,\varphi_1(\boldsymbol x),\ldots,\varphi_M(\boldsymbol x)\right)^T,\boldsymbol w=\left(w_0,w_1,\ldots,w_M\right)^T$. This is still a **linear model**. Define $\boldsymbol t=\left(t_1,\ldots,t_N\right)^T$ as the vector of targets, and $\boldsymbol\varphi_{N\times(M+1)}$ as the matrix of the $\boldsymbol\varphi_{ij}=\varphi_j(\boldsymbol x_i),i=1,\ldots,N,j=1,\ldots,M$:
$$
\boldsymbol\varphi=\begin{pmatrix}
1 & \varphi_1(\boldsymbol x_1) & \varphi_2(\boldsymbol x_1) & \cdots & \varphi_M(\boldsymbol x_1) \\
1 & \varphi_1(\boldsymbol x_2) & \varphi_2(\boldsymbol x_2) & \cdots & \varphi_M(\boldsymbol x_2) \\
\cdots & \cdots & \cdots & \ddots & \cdots \\
1 & \varphi_1(\boldsymbol x_N) & \varphi_2(\boldsymbol x_N) & \cdots & \varphi_M(\boldsymbol x_N) \\
\end{pmatrix}.
$$
So, let us maximize the new log-likelihood: the Gauss' normal equations are
$$
\left(\boldsymbol\varphi^T\boldsymbol\varphi\right)w=\boldsymbol\varphi^T\boldsymbol t
$$
and their solution is
$$
\boldsymbol{\hat w}=\left(\boldsymbol\varphi^T\boldsymbol\varphi\right)^{-1}\boldsymbol\varphi^T\boldsymbol t=\boldsymbol\varphi^+\boldsymbol t,\\
\hat\sigma^2=\frac{1}{N}(\boldsymbol t-\boldsymbol\varphi\boldsymbol{\hat w})^T(\boldsymbol t-\boldsymbol\varphi\boldsymbol{\hat w})=\frac{1}{N}\|\boldsymbol t-\boldsymbol\varphi\boldsymbol{\hat w}\|^2.
$$

### Singular Value Decomposition

The direct computation of the pseudo-inverse of $\boldsymbol\varphi$ has two major drawbacks:

- When $M$ is large, $\boldsymbol\varphi^T\boldsymbol\varphi$ is a large $(M+1)\times(M+1)$ matrix; then, the computation of the required inverse $\left(\boldsymbol\varphi^T\boldsymbol\varphi\right)^{-1}$ can be costly.
- If $\boldsymbol\varphi^T\boldsymbol\varphi$ is singular, or close to, then the required inverse $\left(\boldsymbol\varphi^T\boldsymbol\varphi\right)^{-1}$ can be impossible, or numerically delicate.

**Theorem.** Every matrix $X_{N\times M}$ can be expressed as $X=U\Delta V^T$, with $U\in\mathcal M_N(\R)$,$V\in\mathcal M_M(\R)$,$\Delta\in\mathcal M_{N\times M}(\R)$ diagonal. The columns of $U$ are the eigenvectors of $XX^T$, and the columns of $V$ are the eigenvectors of $X^TX$.

Let $\text{rank}(X)=r\leq\min(N,M)$. Then exactly $r$ elements $\lambda_k$ in the diagonal of $\Delta$ are strictly positive; the remaining elements are null. These $\lambda_k>0$ are called the **singular values** and correspond to the square roots of the positive eigenvalues of $XX^T$ (same as $X^TX$).

Sometimes an *economy* size decomposition is delivered: If $X$ is $N\times M$ with $N>M$, then only the first $M$ columns of $U$ are given and $\Delta$ is $M\times M$.

#### SVD for least squares

Given the least squares problem
$$
\min_{\boldsymbol w\in\R^M}\|\boldsymbol t-X\boldsymbol w\|^2,
$$
the solution can be obtained with the SVD as:

- Compute the economy size SVD of $X=U\Delta V^T$.
- Solve for $\boldsymbol w$ as $\boldsymbol{\hat w}=V\text{diag}\left(\lambda_k^{-1}\right)U^T\boldsymbol t$, where only the $\lambda_k>0$ are considered.

### Regularized least squares

The maximum likelihood framework can yield unstable parameter estimates, specially when

- the explanatory variables are highly correlated;
- there is an insufficient number of observations $(N)$ relative to the number of predictors (basis functions $M+1$ or dimensions $d+1$).

In the context of regression with Gaussian noise (square error), it is quite common to penalize the parameter vector. Define the **penalized empirical error** as:
$$
R_{\text{emp}}(y(\cdot;\boldsymbol w)):=\|\boldsymbol t-\boldsymbol\varphi\boldsymbol w\|^2+\lambda\|\boldsymbol w\|^2,\ \lambda>0.
$$
If we set its derivative wrt $\boldsymbol w$ equal to zero
$$
-2\boldsymbol\varphi^T\boldsymbol t+2\boldsymbol\varphi^T\boldsymbol\varphi\boldsymbol w+2\lambda\boldsymbol w=0,
$$
we solve for $\boldsymbol w$ and we get
$$
\boxed{
\boldsymbol{\hat w}=(\boldsymbol\varphi^T\boldsymbol\varphi+\lambda I)^{-1}\boldsymbol\varphi^T\boldsymbol t.
}
$$
This is known as **Tikhonov** or $L_2$ **regularization** in ML. Perhaps it's best known as **ridge regression** in statistics, where it's usually explained as a "penalized log-likelihood". This can also be derived from Bayesian statistics arguments. Tikhonov regularization has some advantages:

- Pushing the length of the parameter vector $\|\boldsymbol w\|$ to $0$ allows the fit to be under explicit control with the regularization parameter $\lambda$.
- The matrix $\boldsymbol\varphi^t\boldsymbol\varphi$ is positive semi-definite; therefore $\boldsymbol\varphi^T\boldsymbol\varphi+\lambda I$ is guaranteed to be positive definite (hence non-singular), for all $\lambda>0$.