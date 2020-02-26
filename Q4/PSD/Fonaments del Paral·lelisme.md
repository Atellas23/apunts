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
- Temps paral·lel (amb $P$ CPUs): depèn de com d'intel·ligent sigui l'schedule.

- Temps infinit: temps amb infinits recursos.

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

### Grafs de processos

### Anàlisi d'aplicacions

### Estratègies de paral·lelització

- Només processos: MPI
- Només threads: OpenMP (o semblant) (1 node)
- Híbrid: MPI+OpenMP