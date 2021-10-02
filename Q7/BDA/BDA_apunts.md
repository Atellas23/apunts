<center>
    <font size="+4">
        <b>
            Bases de Dades Avançades
        </b>
    </font><br/>
    <font size="+1"><span style="color:grey"><i>
    Apunts basats en el curs 2021-22 impartit per l'Alberto Abelló
    </i>
    </span>
    </font>
<br/>
<br/>
</center>
<div style="page-break-after: always;"/>

# **Tema 1.** Data Warehousing
Els objectius d'aquest tema són els següents:

1. Explicar els diferents requisits, característiques, tipus d'usuaris i eines d'una base de dades <span style="color:red">decisional</span> en comparació amb una base de dades <span style="color:red">operativa</span>.
2. Definir i caracteritzar un *data warehouse* (magatzem de dades, DW).
3. Distingir *data warehouse*, *data mart* i *operational data store* en una arquitectura de tres capes.
4. Explicar la importància de les metadades en un entorn decisional. Enumerar-ne els diferents tipus.

## Dades operacionals i analítiques
Definim primerament què són <span style="color:red">dades operacionals</span> i què són <span style="color:red">dades analítiques</span>:

- Les **dades operacionals** estan pensades per la operativa d'una empresa.
- Les **dades analítiques** serveixen per a prendre decisions.

Per tractar amb aquestes dades tenim diverses opcions, dues de les quals volem posar en contrast:

- **OLTP:** (*OnLine Transacion Processing*) és un tipus de processament que facilita i administra aplicacions transaccionals, usualment per entrada de dades i processament i recuperació de transaccions. Es basen en una arquitectura client-servidor ja que solen ser utilitzats per empreses amb una xarxa informàtica distribuïda.
	- L'OLTP té dos clars beneficis: la simplicitat, i l'eficiència a l'hora tant de processar les transaccions com en termes de l'espai utilitzat per emmagatzemar les dades.
    - En canvi, té també dos inconvenients: la seguretat del sistema (injeccions SQL) i els costos econòmics i temporals que suposa fer transaccions directament sobre una taula relacional.
- **DW:** (*Data Warehouse*) és una col·lecció de dades orientada a un àmbit determinat, integrat (amb fonts diverses), no volàtil (les dades no canvien) i variant en el temps que ajuda a prendre decisions a l'entitat que l'utilitza. Els DW s'usen per generar informes i fer anàlisi de dades, i es consideren un dels components principals de la *Business Intelligence*.

## Data Warehousing
Un **data warehouse** és una col·lecció de dades no volàtil, orientada a un àmbit, integrada i variant en el temps, dirigida a ajudar el procés de presa de decisions.

- **Orientada a un àmbit** vol dir que els sistemes de presa de decisions estan orientats a temes concrets (organitzats per temes) i tenen diferents procediments i idiosincràsies corresponents a les dades.
- **Variant en el temps** vol dir que es poden conservar dades històriques, cosa que contrasta amb un sistema de transaccions, on sovint només es consideren dades recents.
- **No volatilitat** vol dir que un cop les dades es troben dins el data warehouse, no canvien. No voldrem perdre cap tipus de dades, ja que podrien ser útils en un futur.
- **Integrat** vol dir que no tenim una visió tancada sobre el tema que estem analitzant, sinó que integrem informació de diverses fonts i de les pròpies dades.

El **data warehousing** és un procés (no un producte) pel qual montem i gestionem dades de diverses fonts amb l'objectiu d'obtenir una sola visió (parcial o completa) d'un tema complex.

Molt relacionats amb els data warehouses estan els **data marts**, una versió especial d'emmagatzament de dades: es tracta de subconjunts d'un data warehouse més especializats que el conjunt gran, per exemple en una àrea concreta d'un negoci, orientats a l'anàlisi i que tenen per objectiu aportar perspectiva al procés de presa de decisions. Es poden pensar com un "aparador" de dades, en el sentit que s'exposen les dades específiques que ens interessen, no necessàriament totes de les que disposem, ni amb tota la granularitat que aquestes puguin tenir. Els data marts són més fàcils de gestionar i tenen millor rendiment i cost que un data warehouse, pel fet de ser més petits que aquests, però tenen un inconvenient: per cadascun que fem servir, haurem de passar pels processos d'importació, neteja i processament, i podem pedre molt de temps.

Els data marts poden adoptar dues arquitectures diferents, diferenciades en el procés de creació:

- Arquitectura *top-down*: primer definim un DW, i després sel·leccionem les dades i construïm els DM.
- Arquitectura *bottom-up*: primer creem els DM, i després els integrem en un sol DW.

Entre els DM i les BD operacionals, hi ha un **magatzem de dades corporatiu** que evita perdre dades, fa les connexions, la integració de les diverses fonts, etc. Requereix temps per ser fabricat.

Entre un DW i les fonts de dades posem una capa intermitja, una altra base de dades, per a que tot funcioni a temps real. Aquesta BD intermitja es coneix com **operational data store**, i està orientada a un àmbit específic per tractar temes concrets més simplement, seguint l'estratègia de dividir i vèncer.

## Metadades
El prefix *meta* en ciència s'usa per denotar un canvi. En filosofia, implica un concepte més abstracte que el que segueix. Les *metadades* són dades que parlen sobre la natura d'altres dades, i serveixen per interpretar-les. Són fonamentals pel procés de presa de decisions.

Les dades són una representació de fets, conceptes i instruccions, útils per a la comunicació, la interpretació i el procés tant per éssers humans com per mitjans automatitzats. La informació, en el processament de dades i màquines d'oficina, és el significat que es dóna a les dades a partir de les regles convencionals usades en la seva representació.

### Dades derivades, resumides i agregades
Les **dades derivades** són dades que s'obtenen a partir d'altres dades. Per exemple, quan obtenim l'edat d'una persona a partir del seu aniversari. Aquestes les podem emmagatzemar físicament, i això té els següents avantatges i inconvenients:

- No és realment necessari.
- Millora el temps de consulta.
- Consumeix espai.
- La freqüència de recarregament de les dades (per exemple, per tornar a derivar-les) s'ha de tenir en compte.
- Els algorismes d'accés poden canviar depenent de si les desem físicament o no.

Les metadades s'emmagatzemen en el **repositori de metadades**, que connecta amb totes les capes de l'arquitectura. En aquest repositori podem tenir informació sobre:

- La localització de les dades.
- Les relacions entre les dades tècniques i les metadades empresarials.
- Els mecanismes d'extracció que s'han de fer servir per un tipus de dades determinat.
- Les restriccions d'integritat de l'empresa, entre altres normes internes.
- Informació d'accés i autorització.
- Esquemes (i versions d'aquests).
- Els continguts i l'estructura de les dades que tenim emmagatzemades.
- Les fonts de les dades.
- La integració de les dades.
- Actualitzacions.
- Estadístiques sobre els continguts del DW.
- Estructures d'accés.
- Documentació general.
- Algorismes de derivació i agregació.

Les metadades es fan servir en molts processos diferents: (exercici 0.1)

- **Selecció de dades:** aquí ens poden ser útils la font de les dades, el perfil (el seu contingut, si ens interessen), l'antiguitat del fitxer, els permisos d'accés, la mida/quantitat de les dades.
- **Pre-processament de dades:** ens pot ser útil saber el tipus i format de dades, si hi ha valors que faltin, el seu esquema (taules, claus, ...), la mida/quantitat de les dades, les unitats de les dades.
- **Mineria de dades i aprenentatge automàtic:** pot ser útil saber les dates (*timestamps*) per poder fer mostreig, o saber si les dades són contínues o discretes, l'algorisme d'aprenentatge, la distribució de les dades, la separació train/test, els hiperparàmetres de l'algorisme.
- **Evaluació i interpretació:** pot ser útil saber en quines unitats estan les dades que tenim, una contextualització de les dades, la precisió del resultat, la dificultat del problema.

## Diferències entre OLTP i DW

**OLPT** (*OnLine Transaction Processing*) i **DW **(*Data Warehousing*) són els dos processos que coneixem per emmagatzemar i tractar quantitats grans de dades per poder analitzar-les. Què diferencia aquests processos? Principalment, el **DW és decisional i no operacional**, és a dir, que està orientat a temes concret. A més, els **DW** contenen molta quantitat d'informació, ja que integren moltes fonts de dades, i en contenen diverses versions. En canvi, **OLTP és operacional i no decisional**. No permet redundància de les dades, que han d'estar constantment actualitzades, i no està orientat a cap tema en concret sinó que té per objectiu aglutinar totes les dades que puguin ser útils de cara a l'operativitat d'una empresa. A més a més, es gestiona per transaccions, de manera que es controla la concurrència d'accés.

**Exercici 0.2**

| Advantages of using a DBMS                                   | Advantages of using separate files                           |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| Hi ha restriccions d'integritat                              | És molt simple, pot anar bé quan no hem de fer una anàlisi gaire complexa |
| El tipus de dades està inclòs dins el DMBS                   | No cal gestionar permisos                                    |
| Si hi ha algun problema (se'n va la llum, es perd un fitxer) hi pot haver replicació o persistència | No és tan estricte en temes de format i coherència/completesa de cada fila |
| Hi ha accés per SQL                                          |                                                              |
| Indexació i eficiència                                       |                                                              |
| Escalabilitat                                                |                                                              |


# **Tema 2.** Disseny Multidimensional
# **Tema 3.** Disseny Multidimensional Avançat

# **Apèndix 1.** Preguntes d'examen

## Tema 1. Data Warehousing

1. **Correspon el DW a la unió de les dades dels DM?**

   No. Podrien faltar dades històriques, que als DM no tenen per què ser-hi, podrien faltar fonts de dades que són al DW però que per algun motiu no ens han interessat en crear els DM, o podríem estar perdent granularitat de les dades 

2. **Quins problemes ens trobaríem si només tinguéssim DM, sense cap DW corporatiu vertebrador?**

   Podríem perdre dades, i tindríem diferents visions (en els processos de neteja, agrgació, ...). A més a més, estaríem fent la mateixa feina moltes vegades quan volguéssim analitzar les dades de diferents DM (ja que les hauríem d'integrar cada vegada, regularitzar, etc).

