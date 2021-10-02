<center>
    <font size="+4">
        <b>
            Aprenentatge Automàtic 2
        </b>
    </font><br/>
    <font size="+1"><span style="color:grey"><i>
    Apunts basats en el curs 2021-22 impartit per en Lluís Belanche
    </i>
    </span>
    </font>
<br/>
<br/>
</center>
<div style="page-break-after: always;"/>

# **Chapter 1.** Introduction to Kernel-based Machine Learning
What do we want in a satisfactory machine learning model? The following list (which will be referenced by calling **desiderata**) is a concise compilation of what reasonable expectations we might have for a good model:

- We want **robustness** to outliers, errors and/or wrong model assumptions.
- The model should be **efficient** in a computational sense, which is necessary to handle large datasets.
- We want the model to be **flexible** to perform different tasks.
- We want **controllable non-linearity** to deliver a complexity surplus and accept explicit complexity control.
- We want the mode to be **versatile**, to accept different data types, and to be able to incorporate prior knowledge of data.
- An finally, most importantly we want **good generalization** to unseen data.





**CAI template**

## <u>Information Retrieval</u>

The origins of information retrieval come from librarians, government agencies, census, etc. Gradually, the information that was contained in all of these sources was digitalized. With the appearance of the internet and the (closed or private and then world-wide) web, everybody could set up data on the internet (and hence sometimes information). These are the pillars of the field of information retrieval: the web and the information it contains.

This field uses techniques from many disciplines: computer architecture, data structures and algorithmics, networks, logic and discrete mathematics, databases, probabilistic and statistical laws, AI, or image and sound processing, to name a few. In information retrieval, we may not know where the information resides, or if it even exists. We do not have a fixed schema, or we may not even know what information we want to retrieve exactly.

We may use, for example, a couple of search procedures which illustrate what do we need to specify to set up a formal information retrieval environment.

- **Example 1.** Hierarchical or taxonomical search: in this search procedure, we have the information containers (documents) organized hierarchically, that is, grouped by increasingly general concepts that contain each other. For example, a giraffe is found in taxonomy (from more to less general): Animalia -> Chordata -> Mammalia -> Artiodactyla -> Giraffidae -> Giraffa.
- **Example 2.** Faceted search: in this search procedure, we combine characteristics or properties of the piece of information we are searching for. For example, "it is black and yellow, and lives near the equator" may return a number of different animals and plants.

From these two search examples, we can conclude that we need:

- A certain notion of what a **document** is (an abstraction of a real document).
- To define what is an **admissible query** (for example, an SQL query, or an HTTP request).
- A **relevance** measure of the documents within our reach, that is, a two-argument function for pairs (query, document) that measures how much information relevant to the query does the document carry.

To sum this all up, let's summarize what the information retrieval process is:

1. **Offline stage.** In this stage, we must crawl, pre-process and index the documents we find. The goal of this stage is to prepare data structures as to make online query processing fast. This stage can afford time-consuming computations, and must produce relatively compact data structures.
2. **Online stage.** In this stage, we receive and process queries. Then, we must retrieve relevant documents, rank them, format the answer to the query and return it to the user. This stage should be very fast (almost instantaneous) and may use additional information from the user, adverts, etc.

## <u>Pre-processing</u>
Within document pre-processing, we may have the following (non-closed) list of potential actions:

- Parsing: extracting structure from text.
- Tokenization: decomposing character sequences into individual units to be handled.
- Enriching: annotating units with additional information.
- Lemmatization and stemming: reducing words to roots.

### Tokenization
Tokenization decomposes text into individual units, for example words, and is similar to lexical analysis in compilers. Usual problems in tokenization include how to treat hyphens, letter casing, punctuation symbols, which words can be ignored (stopwords) and how to identify them, etc. Some words may mean different things when used as a noun or as an adverb, for example. In summary, tokenization is strongly language-dependent, has to be adapted to the application we want to serve, is crucial for efficient retrieval and requires many many hard-coding of language structures, rules and exceptions into retrieval systems. A step beyond tokenization may be **Named Entity Recognition**.

### Enriching
Enriching means that each term is associated to additional information (metadata) that can be helpful to retrieve more adequate documents for certain queries. For instance, enriching may encode synonyms, related words, definitions, categories, part-of-speech (POS) tagging (such as adverb, verb, noun), etc. A step beyond enriching text is **Word Sense Disambiguation**.

### Lemmatization and stemming
Stemming consists of removing suffixed and preffixes from words to make them relate to each other in the face of the computer. Lemmatization consists of reducing a word to its linguistic root. In comparison, stemming is simple and faster than lemmatization, but is often impossible in some languages due to structure and way of writing. Lemmatization, on the other hand, is much slower and may require much more processing, but is more accurate and can be used in a wider variety of languages.

## <u>Math review & Text Statistics</u>
### Mathematical reminder

As a reminder, say we have a random variable $X$ and a (random or non-random) parameter $Y$, then $\Pr(X=x|Y=y)$ is the probability of $X=x$ conditioned to the event $Y=y$, and is equal to $\frac{\Pr(X=x,\ Y=y)}{\Pr(Y=y)}$. It is also important to remember **Bayes' Theorem**,
$$
\Pr(X=x|Y=y)=\frac{\Pr(Y=y|X=x)\cdot\Pr(X=x)}{\Pr(Y=y)},
$$
as well as the notion of **independence between random variables**, which is attained by definition if $\Pr(X=x,\ Y=y)=\Pr(X=x)\cdot\Pr(Y=y)$, or equivalently if $\Pr(X=x|Y=y)=\Pr(X=x)$.

The notion of **expectation**, expected value, or mean is also quite useful, and is defined as ($X$ is a discrete variable, $Y$ is a continuous one):
$$
\mathbb E[X]=\sum_{x\in\mathcal X}x\cdot\Pr(X=x),\\
\mathbb E[Y]=\int_{\mathcal Y}y\cdot f_Y(y)\ dy.
$$
Its major property as a mathematical operator is its linearity, and additionally, if $X$ and $Y$ are now independent random variables of any kind (continuous or discrete), then it follows that
$$
\mathbb E[X\cdot Y]=\mathbb E[X]\cdot\mathbb E[Y].
$$
In this section we will also make use of some results around the widely studied **harmonic series**, $\sum_{n\geq1}\frac1n$, and its very much related cousin of complex argument, the Riemann Zeta function,
$$
\zeta(s)=\sum_{n\geq 1}\dfrac{1}{n^s}.
$$
It may be useful to remember that when $s$ is restricted to the real numbers $\mathbb R$, this series only converges (in a real-valued function sense) when $s>1$.

### Text Statistics

The key question in this section is: how are texts constituted? Obviously, some words are very frequent and some appear less. The basic questions here are:

- How many different words do we/texts use frequently?
- How much more frequent exactly are frequent words?

In fact, there are very precise **empirical laws** that govern this behaviour in most human languages.

#### Heavy tails

In the statistical analysis of natural and artificial phenomena, it is common to observe that the resulting empirical probability distributions "decrease slowly" compared to Gaussian distributions, or exponential family distributions in general. This means that the empirical distributions show heavy tails, which is to say, infrequent objects ammount to a substantial probability density. This happens in phenomena such as:

- Texts (Zipf's law)
- People names
- Website popularities
- Wealth of individuals, companies, regions, countries, ...
- Earthquake intensity

#### Power laws in text

##### Zipf-Mandelbrot Equation

In text statistics, the frequency of words specifically follows a power law, the **Zipf-Mandelbrot equation**, which is governed by corpus-dependent (that is, text- or document-dependent) parameters $a,b,c$. The equation tells us that the relative frequency of the $n$-th most common word is approximately $\frac{c}{(n+b)^a}$. This was postulated by Zipf in the 1930's with $a=1$, and was further developed in subsequent studies.

Power laws in a certain document may be detected by trying to estimate the exponent of a harmonic sequence. To do this,

1. Sort the items by decreasing frequency.
2. Plot them against their position in the sorted sequence, that is, against their rank.
3. Adjust the axes to obtain a log-log plot.
4. Up to this point, there should appear a shape close to a straight line.
   1. Of course, there will be some rounding to integer absolute frequencies from the power law.
5. With the plot, we can approximate the law's parameters.

Naturally, longer texts tend to use wider lexicon. However, the longer the text already seen, the lesser the chances of finding new, not yet processed words.

##### Herdan's or Heaps' Law

The number of different words is usually described by a polynomial of degree less than 1 on the text length. Again, like in the Zipf-Mandelbrot case, this is easily seen by using log-log plots.

For a text of length $N$, say that we tend to find $d$ words. How do we relate these two variables? If we impose a straight line in a log-log plot, we get
$$
\log d=k_1+\beta\cdot\log N\implies d=k\cdot N^\beta
$$
The value of $\beta$ varies with language and type of text. With finite vocabulary, we do not necessarily have a greater value for $\beta$ for very large values of $N$.
