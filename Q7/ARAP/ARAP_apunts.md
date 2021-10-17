<center>
    <font size="+4">
        <b>
            Aprenentatge per Reforç i Aprenentatge Profund
        </b>
    </font><br/>
    <font size="+1"><span style="color:grey"><i>
    Apunts basats en el curs 2021-22 impartit per en Josep Vidal
    </i>
    </span>
    </font>
<br/>
<br/>
</center>
<div style="page-break-after: always;"/>

# **Chapter 1.** Introduction to Reinforcement Learning
# **Chapter 2.** Multi-Armed Bandits

Let's introduce the chapter with an example. Suppose there exists a finite field of flowers with infinite (but random) supply of nectar. You are a bee, following discrete-time physics, and have to decide in which flower to land and gather nectar from at each step of your life, to obtain the most nectar. Each choice you make (from the first one onward) will be based on previous experience: if you know that a certain flower gets you more nectar most of the time, you will favor that one over the others. Nectar here is called **reward**, and each flower has a randomly distributed reward, following a certain (typically unknown) distribution $f(r\vert \text{flower = }i)$. You, the bee, then, have to decide iteratively which flower to choose, and as you are a smart bee, you will use gathered past information. This kind of **on-line decision making** involves a trade-off between **exploitation**, taking the most rewarding action according to our experience, and **exploration**, gathering more information about the environment to take better decisions. It is easy to see that generally, one may need to sacrifice short-term benefit to obtain good long-term cumulative reward.

This chapter owes its name to one-armed bandits, slot machines that manage to empty the pockets of a lot of people visiting casinos. Each "arm" or action is akin to the flowers in the previous example. There are two main settings in multi-armed bandit problems:

- Stochastic environment: the rewards are independent and identically distributed (iid from now on).
- Adversarial environment: the rewards are chosen deterministically by an adversary which at time $t$ may know all the past but not the currently selected arm.

We will mainly focus on stochastic multi-armed bandits, and then we will mention context and adversarial bandits.

## Stochastic Multi-Armed Bandits

Let us first formalize the concept of a multi-armed bandit.

**Definition 1. (Multi-armed bandit)** *A multi-armed bandit is a tuple $\langle\mathcal A,\mathcal R\rangle$, where $\mathcal A$ is a set of $m=\abs{\mathcal A}$ actions or "arms". At each step $t$, the agent selects an action $a_t\in\mathcal A$, which generates a reward $r_t$ that follows an unknown distribution $\mathcal R_{a_t}$, taking values in $\mathcal R$, with an unknown probability density function, $r\sim f(r\vert a)$.*

It is important to remember that actions do not affect, in this setting, the rewards that may be obtained in the future. With this situation, our objective is to take appropriate decisions to maximize the cumulative reward, $R_t:=\sum_{\tau=1}^tr_\tau$.

In order to make this situation mathematically tractable, we have to define several concepts.

**Definition 2. (Multi-armed bandit setting)** *In order to handle multi-armed bandits, we define the following:*

- *The action-value function: the expected reward from action $a$, which can be expressed as $Q(a):=\mathbb E[r\vert A=a]$.*

- *The optimum value:* $V^*:=Q(a^*):=\max_{a\in\mathcal A}Q(a)$.*

- *The regret: the opportunity loss for one step,* $l_t=\mathbb E[V^*-r_t]$.

- *The total regret: the cumulative opportunity loss over time $t$:*
  $$
  \begin{split}
  L_t=\mathbb E\left[\sum_{\tau=1}^tV^*-r_\tau\right]=\sum_{a\in\mathcal A}\mathbb E\left[N_t(a)\right]\left(V^*-Q(a)\right)\\
  =\sum_{a\in\mathcal A}\mathbb E\left[N_t(a)\right]\Delta_a,
  \end{split}
  $$
  *which implicitly defines $N_t(a)$ as the number of pulls for arm $a$ up to time $t$.*

As can be clearly observed, minimizing the total regret is equivalent to maximizing the cumulative reward, as minimizing the total regret means ensuring small counts $N_t(a)$ for large gaps $\Delta_a$. But, we do not know the gaps beforehand!

The main problem is that **we do not know the value of each action**. We need to guess it **from experience**. At any time step, there are actions that will have been better before according to our experience. Taking those actions (the *greedy* actions) is **exploitation**, while choosing the other actions for their potential is **exploration**. Both cannot be simultaneous: at each step, we must decide if we explore or if we exploit. Exploring is worse in the short term, but may pay off on the long run. To estimate the value of each action $a$, we just "average" the rewards that have been gained up to time $t$ by choosing action $a$, this is, following
$$
\hat Q_t(a)=\frac{1}{N_t(a)}\sum_{\tau=1}^tr_t^a.
$$
To avoid strange results, we will say that the reward of an action which was not selected at time $t$ is 0. Now, we will see four different approaches to select actions at each step of a MAB algorithm.

### Approach 1. Random exploration

In the random exploration technique, we explore with a certain probability $\varepsilon$, and exploit with probability $1-\varepsilon$. This is called the **$\varepsilon$-greedy algorithm**,
$$
a_t=\begin{cases}\arg\max_a\hat Q_t(a) & \text{with probability }1-\varepsilon,\\
\text{random action} & \text{with probability }\varepsilon.
\end{cases}
$$
We will be making a lot of errors, and regret will be linear in time, as every possible action will be sampled an infinite number of times as $t\to\infty$. To solve this, we can take a decaying schedule for $\varepsilon$, for example
$$
\varepsilon_t=\min\left\{1,\frac{\delta\abs{\mathcal A}}{t}\right\},\quad\delta>0
$$
works and we obtain a logarithmic asymptotic total regret provided that $\delta\geq\frac{1}{\min_{a\neq a^*}\Delta_a^2}$. The best performance is attained when $\delta$ is close to this bound, as studied in [this article](https://link.springer.com/content/pdf/10.1023/A:1013689704352.pdf). 

```python
def decay_epsilon(previous_epsilon):
    # perform epsilon decay
    ...
    return epsilon

def bandit(action):
    # generate reward for action
    ...
    return reward

m = 10 # number of actions
Q = np.random.normal(size=m)
N = np.zeros(m)
steps = 500
for t in range(steps):
    eps = decay_epsilon(epsilon)
    a = 0 # action in this time step
    p = np.random.uniform(low = 0, high = 1)
    if p > eps:
        a = np.argmax(Q)
    else:
        a = np.random.randint(m)
    r = bandit(a)
    N[a] += 1
    Q[a] += (r-Q[a])/N[a]
```

### Approach 2.

### Approach 3.

### Approach 4.

### Lower performance bound

Generally, the performance of any decision algorithm on a MAB depends on how much do the probability distributions of each arm resemble the optimal one, this is, how similar is $f(r\vert a)$ to $f(r\vert a^*)$ for $a\neq a^*$. The formal result about this is the following:

**Theorem 1. (Lai & Robbins)** *In a multi-armed bandit setting, the asymptotical total regret produced by an algorithm is at least logarithmic in the number of steps:*
$$
\lim_{t\to\infty}\geq\log{t}\sum_{a\neq a^*}\frac{\Delta_a}{D\big(f(r\vert a)\ \vert\ f(r\vert a^*)\big)}\approx O\left(\sum_{a\neq a^*}\frac{1}{\Delta_a}\right),
$$
*where $D$ is the Kullback-Leibler divergence between two probability density functions.*

### Incremental implementation and tracking

Even if rewards were deterministic at any given time, some exploration is needed if average rewards for each arm change over time. An implementation of $\hat Q(a)$ that requires constant memory and computational effort is one we have already used,
$$
\hat Q_{t+1}(a)=\hat Q_t(a)+\frac{1}{N_{t+1}(a)}\left(r_{t+1}^a-\hat Q_t(a)\right).
$$
We can check that this makes sense. We first start with the actual definition of our approximation of $Q(a)$, which is the "average" reward of action $a$
$$
\hat Q_{t+1}(a)=\frac{1}{N_{t+1}(a)}\sum_{\tau=1}^{t+1}r_\tau^a
$$
and let us manipulate the expression:
$$
\cdots=\frac{1}{N_{t+1}(a)}\left(r_{t+1}^a+\sum_{\tau=1}^tr^a_\tau\right)=\frac{1}{N_{t+1}(a)}\left(r_{t+1}^a+N_t(a)\hat Q_t(a)\right).
$$
Of course, it only makes sense that we do this when action $a$ was selected at time $t+1$, else the value of $\hat Q_{t+1}(a)=\hat Q_t(a)$ remains unchanged. So, if we keep on with the assumption that $a$ was selected at time $t+1$, then $N_{t+1}(a)=N_t(a)+1$, and hence,
$$
\begin{split}
\cdots=\frac{1}{N_{t+1}(a)}\left(r_{t+1}^a+\left(N_{t+1}(a)-1\right)\hat Q_t(a)\right)\\
=\frac{1}{N_{t+1}(a)}r_{t+1}^a+\left(1-\frac{1}{N_{t+1}(a)}\right)\hat Q_t(a)\\
=\boxed{\frac{1}{N_{t+1}(a)}\left(r_{t+1}^a-\hat Q_t(a)\right)+\hat Q_t(a)}
\end{split}
$$
which is the expression that we have used.

If rewards were to change over time, we can exploit this implementation by replacing the $\frac{1}{N_{t+1}(a)}$ with an $\alpha\in(0,1)$.



# **Chapter 3.** Markov Decision Processes

Markov decision processes formally describe an environment for reinforcement learning, where

- Decisions influence the state to where the agent will go next (unlike what happened in multi-armed bandits).
- State transitions have some degree of memory.

We will proceed step by step.

## Markov Processes

A **Markov process** is a stochastic model describing a sequence of observed states in which the probability of each state depends only on the previous state. It can be defined as a tuple $\langle\mathcal S, \mathcal P\rangle$.

In a Markov process, given the present, the future is independent of the past. Mathematically,
$$
\Pr\left(S_{t+1}\vert S_1,\ldots,S_t\right)=\Pr\left(S_{t+1}\vert S_t\right).
$$
The state transition probabilities are defined as
$$
\begin{matrix}
p(s'\vert s):=\Pr\left(S_{t+1}=s'\vert S_t=s\right), & \mathcal S=\{s_1,\ldots,s_n\},\\
\sum_{s'\in S}p(s'\vert s)=1.
\end{matrix}
$$

## Markov Reward Processes

A **Markov reward process** is a Markov process with return values. It can be defined as a tuple $\langle\mathcal S,\mathcal P,\mathcal R,\gamma\rangle$, and the rewards may be defined as $R_s=\mathbb E\left[R_{t+1}\vert S_t=s\right]$. The **return** $G_t$ is the total discounted reward from step $t$; it is a random variable,
$$
G_t=R_t+\gamma R_{t+1}+\gamma^2R_{t+2}+\cdots=\sum_{k\geq0}\gamma^kR_{t+k}.
$$
The parameter $\gamma$ avoids optimising over an infinite horizon. If it is very close to zero, then this leads to myopic evaluation of the return. With $\gamma$ close to one, we have far-sighted evaluation.

Why, though, do we "discount" (as with $\gamma\in[0,1)$, each power of this number weighs less and less) the value of rewards when time grows? The reason is that animal/human behaviour shows patterns of preferring immediate reward over delayed reward for its actions.  Also, this is mathematically convenient and easy to handle, even though uncertainty about the future may not be fully represented. The parameter, $\gamma$, goes from 0, included, to 1, not included, but this could be different (including or crossing 1) if all sequences terminate, and could even favor future rewards over immediate ones. The take away message from all of this is that **rewards can be scaled**, and the Markov reward process is unchanged. If we substract the mean from the rewards (by estimating it, for example), the process changes.

### Bellman Equation for Markov Reward Processes

Let us now define the **state value function** of a Markov reward process as the **expected return starting from state** $s$,
$$
v(s)=\mathbb E\left[G_t\vert S_t=s\right].
$$
This can be decomposed into two parts, **immediate reward** and **discounted value of the successor state**:
$$
\begin{split}
v(s)=\mathbb E\left[G_t\vert S_t=s\right]=\mathbb E\left[\sum_{k\geq0}\gamma^kR_{t+k}\vert S_t=s\right]\\
=\mathbb E\left[R_t+\gamma\left(R_{t+1}+\gamma R_{t+2}+\ldots\right)\vert S_t=s\right]\\
=R_s+\gamma\mathbb E\left[G_{t+1}\vert S_t=s\right].
\end{split}
$$
Then, the second term is (without taking the constant $\gamma$ into account),
$$
\begin{split}
\mathbb E\left[G_{t+1}\vert S_t=s\right]=\sum_{g_{t+1}\in\mathcal G}g_{t+1}\Pr(G_{t+1}=g_{t+1}\vert S_t=s)\\
=\sum_{g_{t+1}\in\mathcal G}\sum_{s'\in\mathcal S}g_{t+1}\Pr(G_{t+1}=g_{t+1},S_{t+1}=s'\vert S_t=s)\\
=\sum_{g_{t+1}\in\mathcal G}\sum_{s'\in\mathcal S}g_{t+1}\Pr(G_{t+1}=g_{t+1}\vert S_{t+1}=s',S_t=s)\cdot p(s'\vert s)\\
=\sum_{s'\in\mathcal S}\mathbb E\left[G_{t+1}\vert S_{t+1}=s',S_t=s\right]\cdot p(s'\vert s).
\end{split}
$$
Note that the expectation in the last expression does not really depend on $S_t$, but only on $S_{t+1}$, as the state at $t$ is not accounted for in the sum for $G_{t+1}$. Hence, we have the following:
$$
\begin{split}
\cdots=\sum_{s'\in\mathcal S}\mathbb E\left[G_{t+1}\vert S_{t+1}=s'\right]\cdot p(s'\vert  s)\\
=\sum_{s'\in\mathcal S}v(s')\cdot p(s'\vert s),
\end{split}
$$
and, finally, using all the expressions,
$$
v(s)=\color{red}R_s\color{black}+\color{blue}\sum_{s'\in S}v(s')\cdot p(s'\vert s)\color{black},
$$
accounting for the <span style='color:red'>immediate reward</span> and the <span style='color:blue'>discounted value of the successor state</span>.

The state value function $v(s)$ can be computed from the matrix Bellman equation:
$$
\begin{bmatrix}
v(1)\\
\vdots\\
v(n)
\end{bmatrix}=\begin{bmatrix}
R_1\\
\vdots\\
R_n
\end{bmatrix}+\gamma\begin{bmatrix}
p(s_1\vert s_1) & \cdots & p(s_n\vert s_1)\\
\vdots & \ddots & \vdots\\
p(s_1\vert s_n) & \cdots & p(s_n\vert s_n)
\end{bmatrix}\begin{bmatrix}
v(1)\\
\vdots\\
v(n)
\end{bmatrix}.
$$
This equation can also be written shortly as $\mathbf{v=R+\gamma Pv}$, which can be solved easily for $\mathbf v$ by inverting a matrix, this is, by calculating $\mathbf v=\left(\text{Id}-\gamma \mathbf P\right)^{-1}\mathbf R$. Inversion is a costly operation ($O(n^3)$), and direct solutions are only feasible for small-sized Markov reward processes.

## Markov Decision Processes

A **Markov decision process** is a Markov reward process with decisions. Under the Markov assumption, any action affects both the immediate reward and the next stage. It can be defined by a tuple $\langle\mathcal S,\mathcal A,\mathcal P, \mathcal R,\gamma\rangle$, with $\mathcal A$ being a finite set of possible actions. The **model components** predict the reaction of the environment:

- $\mathcal P$ is a state transition probability matrix characterizing the environment, and whose elements are:
  $$
  p(s'\vert s,a):=\Pr\left(S_{t+1}=s'\vert S_t=s,A_t=a\right).
  $$

- $\mathcal R$ is a reward function $\mathcal S\times\mathcal A\to\R$, mapping an action $a\in\mathcal A$ and a state $s\in\mathcal S$ to
  $$
  R_s^a\equiv R(s,a):=\mathbb E\left[R_{t+1}\vert S_t=s,A_t=a\right].
  $$

We define the **history** of a Markov decision process as the sequence of $S,R,A$ (state, reward, action) that tracks what has happened in the process up until time $t$, $H_t=S_1R_1A_1\cdots A_{t-1}S_tR_t$. It is worth noting that the Markov property of Markov decision processes works with both variables (actions $\mathcal A$ and states $\mathcal S$), meaning that
$$
\Pr(S_{t+1}=s'\vert S_t=s,A_t=a,S_{t-1}=s_{t-1},A_{t-1}=a_{t-1})=\Pr(S_{t+1}=s'\vert S_t=s,A_t=a).
$$
To completely formally define a Markov decision process, we also need to define the total reward $G_t$ over an episode as the return from Markov reward processes,
$$
G_t=R_t+\gamma R_{t+1}+\gamma^2R_{t+2}+\gamma^3R_{t+3}+\cdots,
$$
and also the **agent's policy**,
$$
\pi(a\vert s)=\Pr(\text{take action }a\ \vert\text{ from state }s).
$$
One of our goals will be to learn to take the best decisions possible, that is, finding the optimal decision policy, which we define as the one having the greatest expected total reward,
$$
\pi^*(a\vert s)=\arg\max_\pi{\mathbb E_\pi[G_t]}.
$$

A policy is a distribution of possible actions given the states. It fully defines the behaviour of an agent, and can be deterministic or random.

### Maximisation of reward

We now define a the **value of state** $s$ as the expected cumulative reward depending on the policy, that is,
$$
v_\pi(s)=\mathbb E_\pi[G_t\vert S_t=s]=\mathbb E_\pi[R_t+\gamma R_{t+1}+\gamma^2R_{t+2}+\cdots\vert S_t=s].
$$
Our goal is to maximise this value, by choosing the most suitable actions associated to each state. With this value function in mind, it may be better to sacrifice immediate reward to gain long-term one over several time steps.

We also define the **action-value function**,
$$
q_\pi(s,a)=\mathbb E_\pi\left[G_t\vert S_t=s,A_t=a\right]=R^a_s+\gamma\sum_{s'\in\mathcal S}p(s'\vert s,a)v_\pi(s').
$$
Given an MDP and a policy $\pi$, the state sequence is a Markov sequence. Also, the state-reward sequence $S_1R_1S_2R_2\ldots$ is an MRP, where the transition probabilities and the rewards are:
$$
P^\pi_{s\to s'}:=\sum_{a\in\mathcal A}\pi(a\vert s)p(s'\vert s,a),\qquad R^\pi_s:=\sum_{a\in\mathcal A}\pi(a\vert s)R_s^a.
$$
[exemple 3.2 és important]



v(s) valor de l'estat

"state value function" v(s)=E[G_t | S_t=s]=E[R_t+gamma*R_t+1+... | S_t=s]

"state-action value function" q(s,a) --> pi(a|s) politica optima

q_pi(s,a)=E_pi[G_t | S_t=s, A_t=a]=R_s^a+gamma·sum(s' in S, p(s' | s, a)·v_pi(s'))

​	-> volem escriure la v_pi(s') en funcio de q_pi(s', a)

​	v_pi(s)=sum(a in A, pi(a | s)·q_pi(s, a))

# **Chapter 4.** Dynamic Programming

[diapositiva 4]

algorismes:

- policy iteration
- value iteration

Sub-problemes que ajuden a solucionar aixo de dalt:

**Policy evaluation:** resolucio de l'eq lineal de Bellman de forma eficient
$$
\mathbf v^\pi=\mathbf R^\pi+\gamma\mathbf P^\pi\mathbf v^\pi
$$
iterativament,
$$
\mathbf v^\pi_{k+1}=\mathbf R^\pi+\gamma\mathbf P^\pi\mathbf v_k^\pi,\quad\gamma\in(0,1)
$$
bellman: "convergencia garantida quan k->infty"

**Policy improvement:**
$$
q_\pi(s,a)=\sum_{r,s'}p(r,s\vert s',a)(r+\gamma\mathbf v_\pi(s'))
$$


# **Chapter 5.** Monte Carlo Methods

