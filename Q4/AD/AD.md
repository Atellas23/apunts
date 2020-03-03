# Anàlisi de Dades

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

La PCA dóna un *biplot* de la matriu de dades centrades. S'obté representant+

Amb aquestes instruccions representem

`plot(F[, 1], F[, 2], pch = 19)`

`point(G[, 1], G[, 2], pch = 2, col = "blue")`

`arrows(0, 0, G[, 1], G[, 2])`

<img src="AD.assets/image-20200227093108970.png" alt="image-20200227093108970" style="zoom:80%;" />

