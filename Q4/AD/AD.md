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
- Transformació logit per probabilitats $y=\ln\left(\frac{p}{1-p}\right).$
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

