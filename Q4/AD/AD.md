# Anàlisi de Dades

[TOC]



## 1. Introducció i pre-processament de dades

### 1.1. Introducció

Estudiarem dos tipus de dades en aquest curs:

- Conjunts de dades multivariades (moltes observacions i moltes variables).
- Sèries temporals (variables que s'observen de manera repetida en el temps, diàriament, setmanalment, mensualment, etc).

Les sub-disciplines de l'estadística dedicades a l'anàlisi de dades així són **l'anàlisi multivariat** i **l'anàlisi de sèries temporals**, i tractarem ambdues tècniques en aquest curs.

### 1.2. Pre-processament

Generalment no es recomana ajustar models estadístics directament sobre *datasets* sense processar. Existeixen moltes tècniques de <span style='color:blue'>netejat de dades</span> i <span style='color:blue'>pre-processament</span> que ajuden a assegurar la qualitat de les dades i que faciliten una anàlisi amb més sentit. El pre-processament presenta diverses característiques importants:

- Conversió de l'arxiu de dades a un format adequat.
- Evitar duplicacions.
- Comprovar l'existència de <span style='color:blue'>dades mancants</span>, *<span style='color:blue'>outliers</span>* i <span style='color:blue'>zeros</span>.
- Comprovar si s'han de fer transformacions sobre les dades.

### 1.3. Valors mancants

**Treballant amb valors mancants:** N'existeixen? Com estan codificats? Quin percentatge de les dades falta? Es concentren els valors mancants en algunes variables o individus?

#### Classificació dels valors mancants

1. *Missing Completely At Random* (MCAR):
   - Hi ha valors mancants, però es pot intentar veure un *dataset* hipotètic d'individus observats completament.
   - Si les observacions són una mostra aleatòria d'aquestes dades ideals, aleshores les dades mancants són MCAR.
   - Les observacions que falten són també observacions aleatòries d'aquest *dataset*.
   - Descartar els valors mancants no és molt problemàtic si no n'hi ha gaires.
2. *Missing At Random* (MAR):
   - La probabilitat que un resultat falti per una variable particular pot dependre de les altres dades observades (per exemple d'altres variables que sí que han estat observades).
   - Condicionat a les dades observades, aquesta probabilitat pot no dependre dels valors de la variable.
3. *Missing Not At Random* (MNAR):
   - La probabilitat d'un valor mancant depèn en els valors de la variable en consideració, inclús després de controlar les relacions amb altres variables rellevants.

#### Opcions d'actuació

##### Esborrar dades mancants

Si esborrem les dades mancants, la mida de la mostra es redueix, i perdem poder per detectar efectes interessants. La inferència estadística podria estar esbiaixada si les dades mancants no són MCAR.

##### Imputació de dades mancants

###### Imputació per la mitjana

Se substitueixen els valors mancants per la mitjana de les observacions. Això atenua l'efecte de la variable explicativa sobre la variable resposta.

![image-20200213093808158](C:\Users\alexb\AppData\Roaming\Typora\typora-user-images\image-20200213093808158.png)

###### Imputació per regressió

Se substitueixen els valors mancants per el valor de la recta de regressió. Es podria subestimar la variància real de les dades.

![image-20200213093833105](C:\Users\alexb\AppData\Roaming\Typora\typora-user-images\image-20200213093833105.png)

###### Imputació per regressió estocàstica

Es substitueixen els punts pels valors de la regressió lineal més un soroll tret de $\mathcal{N}(0,s_e^2)$.

![image-20200213093846857](C:\Users\alexb\AppData\Roaming\Typora\typora-user-images\image-20200213093846857.png)

###### Imputació múltiple

S'aplica molts cops la imputació per regressió estocàstica i es fa cada cop la recta de nou. Finalment, el valor se substitueix per la mitjana de tots aquests.

![image-20200213093901096](C:\Users\alexb\AppData\Roaming\Typora\typora-user-images\image-20200213093901096.png)

### 1.4. Zeros

Tractar zeros és una operació delicada, ja que es poden confondre els zeros per valors mancants (per exemple, com fa MS Excel amb les cel·les en blanc). Per tant, és molt important la manera de codificar les dades, i resulta essencial utilitzar un **codi especial a la base de dades** per indicar si la dada és, en efecte, mancant. Per exemple, en `R`, fem servir ` NA` pels valors mancants. 

### 1.5. *Outliers*

Podem tenir *outliers* univariats, bivariats, o multivariats. Els dos primers els podem identificar amb diagrames univariants i bivariants, però per detectar els multivariats és més complicat.

**Com s'actua sobre els *outliers*?**

- Primer cal comprovar si el valor correspon a una mesura correcta o és clarament errònia o impossible. Per exemple, es pot consultar a la gent que ha generat les dades en qüestió.
- Depenent de la tècnica estadística utilitzada, un *outlier* pot ser problemàtic o no. Si es considera problemàtica l'existència d'*outliers*, es pot considerar una transformació de les dades per atenuar-ne l'efecte.

Per tant, es fa l'anàlisi amb i sense els *outliers*, i es comparen resultats.

### 1.6. Transformacions

En estadística s'utilitzen molt les transformacions de les variables aleatòries. Per quins motius s'utilitzen?

- Per reduir els efectes dels *outliers*.
- Per fer una distribució més simètrica.
- Per produir homoscedasticitat.
- Per aconseguir normalitat aproximada.
- Per eliminar una restricció que opera sobre les dades
- ...

**<span style='color:green'>Transformacions comunes</span>:**

- $y=\ln(x)$ (zeros no permesos).
- $y=\sqrt{x}$ (zeros permesos).
- Transformació *logit* per probabilitats $y=\ln\left(\frac{p}{1-p}\right).$
- Substituir les observacions pel seu rang (?) /// la seva posició (?).
- Transformació de la potència $y=x^a$.
- Transformació de Box-Cox.

#### Transformació de Box-Cox

La transformació de Box-Cox es pot utilitzar per aconseguir normalitat aproximada en una variable aleatòria. La seva expressió analítica és
$$
y_i^{(\lambda)}=\begin{cases}\frac{y_i^\lambda-1}{\lambda}\ \ \quad\lambda\neq0\\ \ln(y_i)\quad\lambda=0\end{cases}.
$$
El valor òptim de $\lambda$ s'aconsegueix per màxima versemblança.

## 2. Àlgebra de matrius aplicada a l'anàlisi multivariant

### Resum de vectors i matrius

- **Norma-2:** $\|x\|_2=\sqrt{x^Tx}=\sqrt{\sum_{i=1}^dx_i^2};\|\alpha x\|_2=|\alpha|\cdot\|x\|_2.$
- **Producte escalar:** $<x,y>_2=x^Ty=x_1y_1+\cdots+x_dy_d;<x,y>=0\iff x\perp y.$
- **Angle:** $\cos{\theta}=\frac{<x,y>_2}{\|x\|_2\cdot\|y\|_2}.$
- **Descomposició espectral i SVD:**

### Matrius bàsiques a l'anàlisi multivariant

- **Matriu de dades:** $X_{n\times p}.$
- **Vector de mitjana mostral:** $\boldsymbol m_{p\times1}=\left(\frac{1}{d}\boldsymbol 1^TX\right)^T.$
- **Matriu de dades centrades:** $X_c=X-\boldsymbol 1_{n\times1}\boldsymbol m^T=\left(I-\frac{1}{n}\boldsymbol1\boldsymbol1^T\right)X.$
- **Matriu centradora:** $H=I-\frac{1}{n}\boldsymbol1\boldsymbol1^T\implies X_c=HX.$
- **Matriu de dades estandaritzades:** $X_s=X_cD^{-1}$, on $D_s=\text{diag}(s_1,\ldots,s_p)$ és la matriu de les desviacions típiques de les columnes de $X$. Per tant, $X_s=HXD_s^{-1}.$
- **Matriu de covariàncies mostrals:** $S=\frac{1}{n-1}X_c^TX_c.$
- **Matriu de correlacions mostrals:** $R=D_s^{-1}SD_s^{-1}=\frac{1}{n-1}D_s^{-1}X^TH^THXD_s^{-1}=\frac{1}{n-1}X_s^TX_s.$

#### Distàncies importants a l'anàlisi multivariant

- **Euclidiana:**

$$
\delta_{rs}=\sqrt{(x_s-x_s)^T(x_r-x_s)}=\left(\sum_{i=1}^p|x_{ri}-x_{si}|^2\right)^\frac{1}{2}.
$$



- **Distància de Mahalanobis:**

$$
\delta_{rs}=\left((x_r-x_s)^TS^{-1}(x_r-x_s)\right)^\frac{1}{2}.
$$

- **Distància de Minkowski:**

$$
\delta_{rs}=\left(\sum_{i=1}^p|x_{ri}-x_{si}|^\lambda\right)^\frac{1}{\lambda}.
$$

## 3. Anàlisi de components principals (PCA)

Els objectius principals de l'**Anàlisi de components principals (PCA)** són:

- Reduir el nombre de variables.
- Una visualització de la matriu de dades a través d'un *biplot*.

### Teoria de la PCA

Busquem combinacions lineals de les variables originals,
$$
F_1=a_{11}X_1+a_{12}X_2+\cdots+a_{1p}X_p\\
F_2=a_{21}X_1+a_{22}X_2+\cdots+a_{2p}X_p\\
\vdots\\
F_p=a_{p1}X_1+a_{p2}X_2+\cdots+a_{pp}X_p\\
$$
tals que satisfacin:

- $F_1,F_2,\ldots,F_p$ no correlades.
- $\text{Var}(F_1)$ màxima.
- $\text{Var}(F_1)\geq\text{Var}(F_2)\geq\cdots\geq\text{Var}(F_p)$.
- $a_{i1}^2+a_{i2}^2+\cdots+a_{ip}^2=1.\qquad(-1\leq a_{ij}\leq1)$

Tots els coeficients i valors propis es poden obtenir de la **descomposició espectral** de la matriu de covariàncies, $S=AD_\lambda A^T$. Les **components principals** s'obtenen calculant
$$
\begin{matrix}
F_p & = & X_c & A.\\
(n\times p) & & (n\times p) & (p\times p)
\end{matrix}
$$
Els valors propis corresponen a les variàncies de les components principals perquè
$$
\frac{1}{n-1}F_p^TF_p=\frac{1}{n-1}(X_cA)^TX_cA=\frac{1}{n-1}A^TX_c^TX_cA=A^TSA=A^TAD_\lambda A^TA=D_\lambda.
$$
Una manera alternativa de fer PCA és utilitzant la **descomposició en valors singulars (SVD)** de la matriu de dades centrada, $X_c=UDA^T$. Les components principals aleshores es calculen amb $F_p=X_cA=UD$. Els valors singulars al quadrat es relacionen amb la variància dels components principals perquè
$$
\frac{1}{n-1}F_p^TF_p=\frac{1}{n-1}(UD)^TUD=\frac{1}{n-1}D^2=D_\lambda.
$$
Aquesta aproximació és molt convenient per construir *biplots*.

### *Biplots*

Un *biplot* és una eina molt útil per explorar gràficament dades multivariants. És una generalització multivariant de l'*scatterplot*, però difereix d'aquest en alguns aspectes:

- Típicament té més de dos eixos.
- Els eixos no són perpendiculars, sinó que tendeixen a ser oblics.
- La matriu de dades es representa de manera aproximada, no exacta.

Un *biplot* és una visualització de les files i columnes d'una matriu que és òptima en termes de mínims quadrats.

Per fer un *biplot* d'una matriu, primer l'hem de factoritzar
$$
X_{n\times p}=F_{n\times r}G_{r\times p}^T\qquad(1)
$$
en el producte d'una matriu de **marcadors de files**, $F$, i una matriu de **marcadors de columnes**, $G$. Aquesta factorització també existeix en un scatterplot ordinari,
$$
X_{n\times2}=X_{n\times2}I_{2\times2}.
$$
La factorització $(1)$ no és única; amb qualsevol aplicació lineal invertible $T$ tenim
$$
X_{n\times p}=F_{n\times r}TT^{-1}G_{r\times p}^T=\tilde F_{n\times r}\tilde G_{r\times p}^T.\qquad(2)
$$

#### *Biplots* i el producte escalar

En un *biplot*, els valors de les dades s'aproximen amb el **producte escalar ordinari** entre dos vectors:

<img src="AD.assets/image-20200227095710124.png" alt="image-20200227095710124" style="zoom:80%;" />

Veiem que, efectivament,
$$
\cos\theta=\frac{\|p_i\|}{\|f_i\|}=\frac{f_i^Tg_j}{\|f_i\|\cdot\|g_i\|},\quad \|p_i\|=\frac{f_i^Tg_j}{\|g_j\|},\quad x_{ij}\approx f_i^Tg_j=\|p_i\|\cdot\|g_j\|.
$$

#### *Biplots* a la PCA

La PCA dóna un *biplot* de la matriu de dades centrades. S'obté representant conjuntament les dues primeres components principals (les primeres dues columnes de $F_p$) i els dos primers vectors propis (primeres dues columnes de $G_s$). Les files de $F_p$ es representen normalment amb punts, i les files de $G_s$ amb fletxes. Les coordenades $F_p$ s'anomenen <span style='color:blue'>coordenades principals</span>, i les coordenades $G_s$ s'anomenen <span style='color:blue'>coordenades estàndar</span>. Aquestes últimes compleixen $G_s^TG_s=I$.

Es pot fer un escalat alternatiu del *biplot*. Utilitzant $D_s$ la matriu diagonal amb les desviacions típiques de les components principals,
$$
X_c=F_pD_s^{-1}D_sG_s^T=F_sD_sG_s^T=F_sG_p^T,\\ G_p=G_sD_s.
$$
Aquest *biplot* representa les <span style='color:blue'>components principals estandaritzades</span>, $F_s=F_pD_s^{-1}$. Tenim, per tant, dos *biplots*:

- $X_c=F_pG_s^T$ (*biplot* de <span style='color:blue'>forma</span>)
- $X_c=F_sG_p^T$ (*biplot* de <span style='color:blue'>covariància</span>)

En general, els *biplots* de forma es centren en la **representació de distàncies**, mentre que els *biplots* de covariància es centren en representar la **estructura de correlació**.

#### Propietats dels *biplots*

- En el *biplot* de forma, les distàncies euclidianes entre punts aproximen les distàncies euclidianes entre files de la matriu de dades.
- En el *biplot* de covariància:
  - Les distàncies euclidianes entre punts aproximen les distàncies de Mahalanobis entre files de la matriu de dades.
  - La longitud d'una fletxa aproxima la desviació típica de la variable corresponent.
  - L'angle entre dues fletxes aproxima la correlació entre les variables corresponents.

#### *Biplots* a R

Amb aquestes instruccions

```R
plot(F[, 1], F[, 2], pch = 19)
points(G[, 1], G[, 2], pch = 2, col = "blue")
arrows(0, 0, G[, 1], G[, 2])
```

podem representar el següent *biplot*:

<img src="AD.assets/image-20200227093108970.png" alt="image-20200227093108970" style="zoom:80%;" />

### Quantes components utilitzem?

Els criteris a considerar són els següents:

- El **percentatge de variància explicada**; volem que sigui $>80\%$.
- El **mòdul del valor propi corresponent**; volem valors propis $>\bar\lambda$.
- L'**scree-plot**; ens dona una visualització gràfica dels valors propis, és a dir, de quanta variància explica cada component.
- Tests de significància amb els valors propis.

Si ho plantegem matemàticament,
$$
\text{tr}(S)=\text{tr}(AD_\lambda A^T)=\text{tr}(D_\lambda),\\
\sum_{i=1}^p\text{Var}(X_i)=\sum_{i=1}^p\text{Var}(F_i)=\sum_{i=1}^p\lambda_i,
$$

| Component             | $F_1$                     | $F_2$                                 | $\cdots$ | $F_p$                         |
| --------------------- | ------------------------- | ------------------------------------- | -------- | ----------------------------- |
| **Variància**         | $\lambda_1$               | $\lambda_2$                           | $\cdots$ | $\lambda_p$                   |
| **Fracció**           | $\lambda_1/\sum\lambda_i$ | $\lambda_2/\sum\lambda_i$             | $\cdots$ | $\lambda_p/\sum\lambda_i$     |
| **Fracció acumulada** | $\lambda_1/\sum\lambda_i$ | $(\lambda_1+\lambda_2)/\sum\lambda_i$ | $\cdots$ | $\sum\lambda_i/\sum\lambda_i$ |

#### Tipus de PCA

Hi ha dos tipus de PCA. Els càlculs es poden basar en

- La **matriu de covariàncies** $S$:
  - No és invariant respecte l'escala de mesura.
  - La variable amb variància més gran domina.
- La **matriu de correlacions** $R$:
  - És invariant respecte l'escala de mesura.
  - Totes les variables contribueixen de la mateixa manera.

#### Interpretació

Les components es poden interpretar amb l'ajuda dels coeficients de les variables, de les correlacions entre variables i components, i amb el *biplot*. Si l'objectiu és tenir una imatge de la matriu de dades, aleshores la interpretació de les components podria no ser necessària.

### Sobre la bondat d'ajust

Dels valors propis de l'anàlisi, es pot calcular la bondat d'ajust total d'una solució $k$-dimensional. També es pot calcular la bondat d'ajust per cada fila i columna de la matriu de dades. La bondat d'ajust de les variables també es pot calcular com l'$R^2$ en una regressió sobre les components principals.

## 4. Escalament Multidimensional (MDS)

### Introducció

**Objectiu:** en base a certa informació respecte les **distàncies** (o similituds) entre $n$ objectes, volem construir una configuració d'$n$ punts en un espai de dimensió baixa (un <span style='color:blue'>mapa</span>).

#### Terminologia

- Proximitat
- Similaritat ($s_{rs}$)
- dissimilaritat/dissimilitud o **distància** ($d_{rs}$)

Una mesura de **similaritat** $s$ satisfà les següent propietats:

- $s(A,B)=s(B,A).$
- $s(A,B)>0.$
- $s(A,B)$ augmenta quan $A$ i $B$ s'assemblen més.

Una mesura de **distància** $\delta$ satisfà les següents propietats:

- $\delta(A,B)=\delta(B,A).$
- $\delta(A,B)\geq0.$
- $A=B\implies\delta(A,B)=0.$

Una funció de distància $\delta$ s'anomena una **mètrica** si, a més de les propietats de distància, satisfà les següents propietats addicionals:

- $A=B\impliedby\delta(A,B)=0.$
- La desigualtat triangular: $\delta(A,B)\leq\delta(A,C)+\delta(C,B).$

### Mesures de dissimilaritat

S'utilitzen bastant les distàncies introduïdes amb anterioritat a l'apartat 2, que són les següents:

- **Euclidiana:**

$$
\delta_{rs}=\sqrt{(x_s-x_s)^T(x_r-x_s)}=\left(\sum_{i=1}^p|x_{ri}-x_{si}|^2\right)^\frac{1}{2}.
$$

​		Cal notar que la distància Euclidiana generalitza fàcilment a $p$ variables, sent la distància de Minkowski per $\lambda=p$.

- **Distància de Mahalanobis:**

$$
\delta_{rs}=\left((x_r-x_s)^TS^{-1}(x_r-x_s)\right)^\frac{1}{2}.
$$

- **Distància de Minkowski:**

$$
\delta_{rs}=\left(\sum_{i=1}^p|x_{ri}-x_{si}|^\lambda\right)^\frac{1}{\lambda}.
$$

A l'escalat multidimensional mètric, la configuració dels punts s'obté **directament** de les distàncies. Al MDS no-mètric, només és important l'ordre de les distàncies. Tenim diverses opcions per escalar les distàncies i intentar representar les dades:

- $d_{rs}\approx\delta_{rs}:$ escalament clàssic.
- $\delta_{rs}\approx f(\delta_{rs})$ amb $f(\delta_{rs})=\alpha+\beta\delta_{rs}:$ escalament mètric.
- $\delta_{rs}=f(\delta_{rs})$ amb $f(\delta{rs})$ monòtona qualsevol: escalament no-mètric.

### MDS mètric

També es coneix com **escalament clàssic** o **anàlisi de les coordenades principals (PCO)**. Donats $n$ objectes amb dissimilaritats $\delta_{rs}$ volem trobar punts a l'espai euclidià tals que $d_{rs}\approx\delta_{rs}$. L'aplicació més clàssica és, donada una matriu de distàncies entre ciutats, construïr un mapa de la seva disposició.

Sigui $X$ la matriu de coordenades amb la solució, i $x_r,x_s$ dues files de $X$. Fem $\delta^2_{rs}=(x_r-x_s)^T(x_r-x_s)$. Sigui $B$ una matriu de producte interior, amb
$$
b_{rs}=x_r^Tx_s.
$$
Assumirem que la solució està centrada a l'origen, és a dir, que
$$
\sum_{r=1}^nx_{ri}=0.
$$
Si fem
$$
d^2_{rs}=x_r^Tx_r+x_s^Tx_s-2x_r^Tx_s,\\
b_{rs}=x_r^Tx_s=-\frac{1}{2}\left(d^2_{rs}-x_r^Tx_r-x_s^Tx_s\right),\\
b_{rs}=-\frac{1}{2}\left(d^2_{rs}-\frac{1}{n}\sum_{s=1}^nd^2_{rs}-\frac{1}{n}\sum_{r=1}^nd^2_{rs}+\frac{1}{n^2}\sum_{r=1}^n\sum_{s=1}^nd^2_{rs}\right).
$$
Definim $a_{rs}=-\frac{1}{2}d^2_{rs}$, és a dir que $b_{rs}=a_{rs}-a_{r*}-a_{*s}+a_{**}$, i això forma una matriu $A$ tal que
$$
B=HAH,\ H=I-\frac{1}{n}\boldsymbol1\boldsymbol1^T,
$$
i també $B=XX^T$. Volem aproximar $B$ en un espai de dimensió baixa, i ho farem indirectament, via la matriu de productes escalars.

- Sigui $B$ una matriu qualsevol $n\times n$ simètrica que volem aproximar, pel teorema espectral real diagonalitza en una base de vectors propis ortogonals amb valors propis reals,

$$
B=VD_\lambda V^T=\sum_{i=1}^n\lambda_iv_iv_i^T,
$$

​		amb $D_\lambda=\text{diag}(\lambda_1,\ldots,\lambda_n)$ i $V=(v_1,\ldots,v_n)$. Si aproximem $B$ per
$$
\tilde B:=V_{(*,1:k)}D_{\lambda(1:k,1:k)}\left(V_{*,1:k}\right)^T,
$$
​		tenim l'aproximació de rang $k$ per mínims quadrats de $B$.

- Teníem $B=XX^T=VD_\lambda V^T$. Aleshores, les coordenades de la solució són $\boxed{X=VD_\lambda^\frac{1}{2}.}$
- ***IMPORTANT!*** Sempre hi haurà un valor propi nul, i la solució està aniuada en les solucions de dimensió superior.

#### Algorisme per l'escalament clàssic

1. Calculem la matriu de distàncies.
2. Calculem $a_{rs}=-\frac{1}{2}\delta^2_{rs}.$
3. Centrem dues vegades $A$ per obtenir $B=HAH.$
4. Calculem la descomposició espectral de $B$.
5. La solució és $X=VD_\lambda^\frac{1}{2}$.

**Bondat d'ajust:** com de bé aproximem la matriu de distàncies?
$$
\frac{\sum_{i=1}^P\lambda_i}{\sum_{i=1}^{n-1}\lambda_i}.
$$
Si $B$ no és positiva semi-definida,
$$
\frac{\sum_{i=1}^P\lambda_i}{\sum_{i=1}^{n-1}\vert\lambda_i\vert},\qquad\text{ o }\qquad\frac{\sum_{i=1}^P\lambda_i}{\sum_{\lambda_i>0}\lambda_i}.
$$
**Definició:** una matriu de distàncies s'anomena **euclidiana** si existeix una configuració de punts a l'espai euclidià tals que les seves distàncies vénen donades per $D$. És a dir, per alguna $p$ existeixen punts $x_1,x_2,\ldots,x_n$ tals que $d_{rs}^2=(x_r-x_s)^T(x_r-x_s)$.

**Teorema:** una matriu de distàncies $D$ és euclidiana si i només si $B$ ($=HAH$, com s'ha definit prèviament) és positiva semi-definida.

#### Similitud de les dades

A vegades, les dades es donen en forma de **similituds** $c_{rs}$. En una matriu de similitud $C$ es compleix $c_{rs}=c_{sr}$ i $c_{rs}\leq c_{rr}$. Aquestes es poden convertir en distàncies fent $\delta_{rs}=\sqrt{c_{rr}-2c_{rs}+c_{ss}}$. Si $C$ és positiva semi-definida, aleshores la matriu de distàncies obtinguda serà euclidiana.

### MDS no-mètric

Definim el factor d'**estrés** de l'escalament com
$$
\text{STRESS}(\delta,X)=\sqrt{\frac{\sum_{r\neq s}^n(f(\delta_{rs})-d_{rs})^2}{\sum_{r\neq s}d^2_{rs}}},
$$
i la minimització d'aquest factor com
$$
\text{stress}(\Delta,\hat X)=\min_{\text{all }X}\text{STRESS}(\Delta,X).
$$
Minimitzem la funció objectiu numèricament, començant des de certa configuració inicial.

#### Procediment

1. Triem una mesura de la distància.
2. Triem una transformació monòtona $f$.
3. Escollim un algorisme per minimitzar el factor d'estrés.

Per no quedar atrapats en òptims locals, experimentem amb diverses configuracions inicials, i comparem el factor d'estrés entre solucions $1,2,3,\ldots,k-$dimensionals.

Per saber si l'escalament és adient, podem mirar diverses coses:

- Diagrama bivariant de $\delta_{rs}$ vs. $d_{rs}$.
- Representació del factor d'estrés contra el nombre de dimensions.
- Degeneració; quants punts hi ha amb les mateixes $d_{rs}$.
- Càlcul dels residus $d_{rs}-f(\delta_{rs})$.

### Exemples

## 5. Anàlisi de correspondències

### Introducció

**Objectiu:** estudiar les relacions entre variables categòriques, i donar-ne una visualització útil.

Existeixen dos tipus d'anàlisi de correspondències:

- <span style='color:blue'>Anàlisi de correspondències simple</span> (CA): dues variables categòriques.
- <span style='color:blue'>Anàlisi de correspondències múltiple</span> (MCA): diverses variables categòriques.

### Perfils

Utilitzarem la següent notació:

- $N$ serà la **taula de contingència** $I\times J$.
- $P=\frac{N}{n}$, amb $n=\boldsymbol1^TN\boldsymbol1$. Notem que $\boldsymbol1^TP\boldsymbol1=1.$
- $P$ és, per tant, una matriu de probabilitats (la **matriu de correspondència**).
- Les **masses de les files** són:

$$
r_i=\sum_{j=1}^Jp_{ij},\quad\boldsymbol r=P\boldsymbol1,\quad D_r=\text{diag}(\boldsymbol r).
$$

- Les **masses de les columnes** són:

$$
c_j=\sum_{i=1}^Ip_{ij},\quad\boldsymbol c=P^T\boldsymbol1,\quad D_c=\text{diag}(\boldsymbol c).
$$

**Definició:** un perfil és un vector d'elements no-negatius que sumen 1.

### Inèrcia

### *Biplots*

### MCA

#### Indicador

#### MCA *Burt*





