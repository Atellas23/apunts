# Sèries Temporals

## 1. Processos Estocàstics

Una **sèrie temporal** és una seqüència ordenada d'observacions del mateix fenomen. Típicament, les observacions han estat mesurades en instants de temps equiespaiats.
$$
\left\{X_t\right\}_{t=1,\ldots,T}=\left\{X_1,\ldots,X_T\right\}
$$
Descriure i predir sèries temporals és crucial en diverses àrees del coneixement, incloent finances, econometria, processament del senyal i un llarg etc. Els nostres objectius són:

- **Descripció:** descriure patrons temporals en una sèrie: efectes regulars/estacionals, ciclicitat, tendències, outliers, canvis sobtats, etc.
- **Estimació:** estimar valors dels paràmetres de la sèrie.
- **Validació:** validar els parametres estimats i decidir si els paràmetres estimats són significatius o no.
- **Predicció:** predir valors futurs de la sèrie temporal.

Per explorar les dades, les representem fent un gràfic en funció del temps. Podem identificar les següents components:

- Tendència ($T_t$): tendència a llarg termini. Es representa per la mitjana mòbil d'ordre $s$.

$$
T_t=\frac{1}{s}\sum_{i=1}^sX_{t-s/2+i}
$$

- Efecte estacional ($S_t$): patró que es repeteix periòdicament amb el mateix període. Es representa per l'índex estacional.

$$
S_t=X_t-T_t
$$

- Efecte cíclic ($C_t$): patró que es repeteix periòdicament amb període no constant. No és fàcil de modelar a causa del període canviant.
- Soroll aleatori ($w_t$). És el que queda de treure les components anteriors a la sèrie.

<center>
	<figure>
        <img src="TS.assets/image-20200520190455087.png" style="zoom:80%;" />
    </figure>
    <figcaption>
        A dalt la sèrie, just a sota la sèrie tendència, la sèrie d'efectes estacionals i el soroll aleatori.
    </figcaption>
</center>

El nostre objectiu és trobar un model matemàtic que reflecteixi el comportament de les dades observades. Tenim en principi dos models a contemplar:

- **Models deterministes:** el valor esperat de $X_t$ depèn d'una funció paramètrica $F$ de $t$, i la component aleatòria no depèn dels valors anteriors:

$$
X_t=F(t)+Z_t,\quad Z_t\sim\mathcal N\left(0,\sigma_Z^2\right)
$$

- **Models estocàstics:** el valor esperat de $X_t$ depèn dels valors anteriors $X_{t-1},X_{t-2},\ldots$ i/o dels valors anteriors de la component aleatòria $Z_{t-1},Z_{t-2},\ldots$, més una component aleatòria independent del passat:

$$
X_t=G(X_{t-1},X_{t-2},\ldots,Z_{t-1},Z_{t-2},\ldots)+Z_t,\quad Z_t\sim\mathcal N\left(0,\sigma_Z^2\right)
$$

Seguirem la metodologia de Box-Jenkins:

<center>
    <figure>
        <img src="TS.assets/image-20200520191430462.png" style="zoom:80%;" />
    </figure>
</center>

