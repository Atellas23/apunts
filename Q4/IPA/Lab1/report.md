# Introducció al Processament Audiovisual

## Pràctica 1: Modelat Estadístic de la Senyal I. Processos sense memòria.

### 1. Processos sense memòria de senyals d'imatge

Primer de tot, veiem amb quines imatges treballarem. Les carreguem totes amb `ima = Image_Read()`, i les podem veure amb `Image_Display(ima)`:

- *Im1_Sea.png*:

<img src="report.assets/image-20200228072207211.png" alt="image-20200228072207211" style="zoom:30%;" />

- *Im2_Clock.png*:

<img src="report.assets/image-20200228072233383.png" alt="image-20200228072233383" style="zoom:60%;" />

- *Im3_Drops.png*:

<img src="report.assets/image-20200228072253052.png" alt="image-20200228072253052" style="zoom:20%;" />

- *Im4_White.png*:

<img src="report.assets/image-20200228072318435.png" alt="image-20200228072318435" style="zoom:30%;" />

- *Im5_Boy.png*:

![image-20200228072357152](report.assets/image-20200228072357152.png)

#### 1.1. Histogrames d'imatges.

Els histogrames de les diferents imatges són:

- Imatge 1: *Im1_Sea.png*

<img src="report.assets/image-20200226172612478.png" alt="image-20200226172612478" style="zoom:80%;" />

L'histograma de la primera imatge té un rang de grisos força ampli, el que es relaciona amb el contrast notable de la imatge original.

- Imatge 2: *Im2_Clock.png*

<img src="report.assets/image-20200226170422321.png" alt="image-20200226170422321" style="zoom:80%;" />

En la segona imatge, podem veure que la majoria de pixels tenen valors baixos, propers al negre, i que el rang de l'histograma és bastant estret. Això reflecteix el fet que la imatge és molt fosca, i poc contrastada.

- Imatge 3: *Im3_Drops.png*

<img src="report.assets/image-20200226170439217.png" alt="image-20200226170439217" style="zoom:80%;" />

En aquesta tercera imatge veiem que els valors dels pixels es concentren en el centre del rang dinàmic. Això reflecteix el fet que la imatge té molts tons grisos semblants.

- Imatge 4: *Im4_White.png*

<img src="report.assets/image-20200226170458099.png" alt="image-20200226170458099" style="zoom:80%;" />

Aquí podem veure clarament pics de quantitat de pixels concentrats tots a la part superior del rang dinàmic dels pixels, ja que la imatge original és tota blanca i no s'hi observa cap mena de detall a simple vista. Altre cop, tots els valors dels píxels es troben en un tros molt estret del rang dinàmic, el que ens dóna informació sobre el poc contrast de la imatge.

- Imatge 5: *Im5_Boy.png*

<img src="report.assets/image-20200226172156634.png" alt="image-20200226172156634" style="zoom:80%;" />

En aquesta imatge passa una cosa semblant a la imatge 3; tenim valors concentrats en el centre, el que reflecteix el fet que la imatge té molts tons de gris d'intensitat semblant.

#### 1.2. Contrast d'imatges (lineal i no lineal).

Executant la instrucció `Ima_1 = Image_Contrast(ima1, [0.25 0.75], [0.0 1.0])` veiem com canvia la imatge 1 de la següent manera:

<img src="report.assets/image-20200226173746103.png" alt="image-20200226173746103" style="zoom:50%;" />				$\longrightarrow$					<img src="report.assets/image-20200226173804989.png" alt="image-20200226173804989" style="zoom:50%;" />				$\longrightarrow$		 <img src="report.assets/image-20200226173853529.png" alt="image-20200226173853529" style="zoom:50%;" />

La imatge del centre representa la transformació que fa la funció sobre l'histograma.

##### 1.2.a. Millora del contrast d'una imatge.

Hem d'incrementar el contrast de la imatge *Im5_Boy.png*. Observant l'histograma, veiem que la densitat de pixels està concentrada entre 0.3 i 0.65. Per tant, fem `Image_Contrast(ima5, [0.3 0.65], [0.0 1.0])`, i queda:

<img src="report.assets/image-20200226222308104.png" alt="image-20200226222308104" style="zoom:80%;" />

Fent això, hem perdut informació, perquè més enllà del 0.65 hi havia també valors més elevats de pixels. Per tant, no es pot recuperar exactament la mateixa imatge. Tot i això, fent la transformació inversa se'n pot aconseguir una de molt semblant.

##### 1.2.b. Abans de comptar gotes.

Amb els mètodes que tenim, binaritzar exactament és impossible, però ens hi podem acostar molt. En particular, observant l'histograma,

<img src="report.assets/image-20200226223040186.png" alt="image-20200226223040186" style="zoom:50%;" />

veiem que hi ha molts pixels amb valor al voltant del $0.6\cdot256$. Però, provant amb diversos valors, hem considerat que el millor és enviar l'interval $[0.4749,0.475]$ a l'interval $[0,1]$ amb la instrucció `Image_Contrast(ima3, [0.4749 0.475], [0.0 1.0])`. Aquesta transformació té el gràfic següent:

<img src="report.assets/image-20200226223519164.png" alt="image-20200226223519164" style="zoom: 80%;" />

Aquí el *clipping* és gairebé perfecte, tot i que el pendent podria ser més vertical.

##### 1.2.c. Una imatge blanca?

Aparentment, *Im4_White.png* és una imatge completament blanca. Però si observem l'histograma podem veure que hi ha valors que no són blancs. Per tant, si transformem l'histograma amb la instrucció `Image_Contrast(ima4, [0.9839 1.0], [0.0 1.0])`, la imatge ens queda:

<img src="report.assets/image-20200226223930216.png" alt="image-20200226223930216" style="zoom:80%;" />

i ampliant la zona de l'esquerra, trobem el preu d'una *Lasagne Bolognaise*,

![image-20200226224035074](report.assets/image-20200226224035074.png)

que són 9.50€.

#### 1.2.d. La imatge va ser manipulada.

La imatge va ser efectivament manipulada. Si fem `Image_Contrast(ima2, [0.002 0.025], [0.0 1.0])`, podem veure un reflexe del rellotge a la superfície on es recolza aquest. En aquest reflexe, es veu que ni tan sols els nombres del rellotge són nombres romans, sinó aràbics. Això és incongruent, i per tant fa sospitar que la imatge ha estat retocada. Si el reflexe fos la versió real, serien dos quarts de nou.

​									<img src="report.assets/image-20200226224654405.png" alt="image-20200226224654405" style="zoom:80%;" /> <img src="report.assets/image-20200226224725649.png" alt="image-20200226224725649" style="zoom:80%;" />

#### 1.2.e. Imatge negativa.

Per invertir la imatge, fem `Image_Contrast(ima1, [0.0 1.0], [1.0 0.0])`. El resultat és el següent:

<img src="report.assets/image-20200226225422288.png" alt="image-20200226225422288" style="zoom:80%;" />

#### 1.2.f. Utilitzant el paràmetre $\gamma$.

Si mirem l'histograma de la imatge *Im5_Boy.png*, com hem dit abans es veu que la densitat de pixels esta concentrada a la zona de 0.3 a 0.65. Farem la transformació de l'histograma amb el paràmetre $\gamma$ igual a 0.5 i a 2.0:

```matlab
Image_Contrast(ima5, [0.3 0.65], [0.0 1.0], 0.5);
```

<img src="report.assets/image-20200228072644915.png" alt="image-20200228072644915" style="zoom:60%;" />

```matlab
Image_Contrast(ima5, [0.3 0.65], [0.0 1.0], 2.0);
```

<img src="report.assets/image-20200228072557890.png" alt="image-20200228072557890" style="zoom:60%;" />

Amb $\gamma<1$, la imatge s'aclara, perquè el rang dels blancs s'expandeix, mentre que el dels negres es comprimeix. El contrari passa amb $\gamma>1$: el rang dels negres s'expandeix, i el dels blancs es comprimeix, així que la imatge es veu més fosca.

#### 1.3. Equalització de l'histograma

