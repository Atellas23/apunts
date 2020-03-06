# Paral·lelisme i sistemes distribuïts

## Fonaments del Paral·lelisme

### HPC

### Arquitectura HPC

Threads > cores --> direm que és un procés **concurrent**

Threads = cores --> direm que és un procés **paral·lel**

### Concurrent/Paral·lel

- Afinitat: "lligar" processos a conjunt de CPUs (idealment, 1 < - > 1)

- Tasca: feina (algoritme, bucle, el que sigui) que no subdividirem. Idealment van a 1 core. Executar un programa és executar **totes** les tasques.

- Temps seqüencial ($T(1)$): suma del cost de totes les tasques.
- Temps paral·lel (amb $p$ cores, $T(p)$): depèn de com d'intel·ligent sigui l'schedule.

- Temps infinit: temps amb infinits recursos. Cost del camí crític.

- Overhead: fer massa paral·lelisme i que el programa vagi més lent

- Equilibri de la càrrega:
  - Càrrega: quantitat de feina d'una tasca. Per exemple, nombre d'iteracions d'un bucle, nombre d'elements que calcula la tasca...
  - L'objectiu és equilibrar la càrrega a nivell de procés (que tots tinguin més o menys la mateixa feina).

**Com estimar els límits de la paral·lelització?**

- Utilitzant el graf de tasques i el camí crític.
- Utilitzant la Llei d'Amdhal: marca un límit en quant a la màxima acceleració que podem aconseguir en un programa.
  - Donat un programa seqüencial, la llei d'Amdhal dóna un límit sobre l'*speedup* que es pot aconseguir en un programa. Utilitza el percentatge de programa paral·lelitzable i no paral·lelitzable.
- **Paral·lelisme**$:=\frac{T(1)}{T(\infty)}.$

### Mètriques d'avaluació

### Anàlisi teòrica d'algorismes paral·lels

### Grafs de tasques

### Anàlisi d'aplicacions

Per planificar, és típic de posar tot el camí crític en un mateix core.

#### *Speedup* ($\sigma$)

L'acceleració que aconsegueix una aplicació. S'expressa en funció del nombre $p$ de processadors:
$$
\sigma(p)=\frac{T(1)}{T(p)}.
$$

#### Eficiència ($\eta$)

L'eficiència ens dona una mesura de com aprofitem els recursos que tenim.
$$
\eta(p)=\frac{\text{Speedup(p)}}{p}.
$$
Si l'eficiencia es mes gran que 0.7, es poden utilitzar mes recursos.

#### Llei d'Amdhal

La llei d'Amdhal dóna un límit sobre la màxima acceleració que es pot aconseguir en un programa paral·lelitzant-lo. Utilitza el percentatge de programa paral·lelitzable i no paral·lelitzable, anomenat *parallel fraction*, $\phi$.

**Idea:** si tenim una fracció $\phi$ del programa que podem accelerar, $(1-\phi)T(1)$ serà el mínim temps d'execució del nostre programa. Això és correspon a un cas no real, on acceleraríem la resta (la fracció $\phi$ del programa) fins a l'infinit.

El temps total, $T(p)$, el podem posar com a suma del temps no accelerat i el temps accelerat:
$$
T(p)=\text{temps_no_accelerat}+\text{temps_accelerat}(p).
$$
Tenim, doncs, $\text{temps_no_accelerat}=(1-\phi)T(1)$, i $\text{temps_accelerat}(p)=\frac{\phi}{p}T(1)$. Aleshores, en general,
$$
\sigma(p)=\frac{T(1)}{(1-\phi)T(1)+\frac{\phi T(1)}{p}}=\boxed{\frac{1}{1-\phi+\frac{\phi}{p}}.}
$$
Si es vol estimar el màxim *speedup*, fem
$$
\lim_{p\to+\infty}\sigma(p)=\frac{1}{1-\phi}.
$$

### Estratègies de paral·lelització

- Només processos: MPI
- Només threads: OpenMP (o semblant) (1 node)
- Híbrid: MPI+OpenMP

## Entorns d'HPC

### Sistemes de cues

Els sistemes de cues gestionen els recursos computacionals disponibles en un entorn d'HPC. Per poder executar qualsevol programa aquí, hem de

1. Demanar recursos (dins dels nostres límits).
2. Executar els nostres programes utilitzant aquests recursos.
   - Podem executar un nombre qualsevol de programes associats a una única petició de recursos.

$\text{SLURM}$ és un sistema de cues *open source*. Depenent de la instal·lació, l'administrador defineix **particions** o **QoS**:

- Les **particions** són grups de nodes que tenen associats uns límits:
  - Nombre màxim de nodes.
  - Temps màxim d'execució.
- **QoS** (Quality of Service) és un concepte més nou. Defineix límits associats a la petició:
  - La seva prioritat.
  - Els límits.
  - Una partició associada.