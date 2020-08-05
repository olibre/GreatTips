Études de cas
=============
<!--.slide: data-background="#253" data-background-transition="zoom"-->


Ariane 5
--------

La théorie
----------

[youtube.com/watch?v=_rNmszfIvAw](https://www.youtube.com/watch?v=_rNmszfIvAw)

------------------------

Le vol d'inauguration
---------------------

4 juin 1996 &nbsp; Ariane 501 &nbsp; Vol 88 &nbsp; 4 satellites  
[youtube.com/watch?v=fCnO-UYF3co](https://www.youtube.com/watch?v=fCnO-UYF3co)


Ariane 4
--------

* **1981**      Conception

* **1988**      Vol inaugural

* **2003**      15 ans de service  
  &emsp; &emsp; 116 lancements  
  &emsp; &emsp; 97% de succès


Ariane 5
--------

* **1987** Conception

* **199x** Décision de réutiliser le  
  &emsp; &emsp; *Système de Référence Inertielle*  
  &emsp; &emsp; d'Ariane 4 (réputé fiable).  
  &emsp; &emsp; Pour éviter de refaire des tests (800 kF)  
  &emsp; &emsp; on garde la phase de calibration  
  &emsp; &emsp; nécessaire pour Ariane 4 seulement.

* **1996** Échec du vol inaugural

* **1997** Réussite du second vol (16 mois)


Coût
----

C'était le bug le plus coûteux du monde.  

3 milliards de francs (de l'époque)  
pour les 4 satellites, le lancement,  
les 16 mois de retard du projet...

Coût de l'image ternie de la marque.


Un petit bug...
---------------

* L'accélération d'Ariane 5 est  
  cinq fois plus élevée qu'Ariane 4.

* La valeur *accélération* sur 32 bits et copiée  
  dans un registre de 16 bits (trop petit)  
  ce qui provoque une interruption matérielle.

* Les deux *Système de Référence Inertielle*  
  (même matériel, même logiciel)  
  se désactivent simultanément (à 72 ms près).

* 37 secondes après le décollage,  
  le pilote automatique prend les commandes.


... un grand boum !
-------------------

* Le *On Board Computer* (OBC) détecte le SRI 1 en panne  
  et bascule sur le SRI 2.

* Le SRI 2 remonte une erreur, mais l'OBC la considère comme  
  valeur de navigation et braque la trajectoire de la fusée.

* Un des deux boosters est arraché à cause de la pression trop élevée  
  et déclenche le système d'auto-destruction de la fusée.

* Les débris de la fusée tombent dans la mangrove  
  et sont récupérés dont l'EEPROM contenant les info de l'erreur.


Code source Ada
---------------

[![Scan du code source Ada du SRI][AdaCode]][AdaRef]

[AdaCode]: ./bug-Ariane-501_by-JeanJacquesLevy-INRIA-2010.jpg "La composante verticale (variable L_M_BV_32) est vérifiée avant conversion 16 bits, mais pas pour la composante horizontale"
[AdaRef]:  http://moscova.inria.fr/~levy/talks/10enslongo/enslongo.pdf


Le petit bug
------------

Test des bornes -32768..32767 de la composante **V**erticale `BV`

```c
L_M_BV_32 := TBD.T_ENTIER_32S ((1.0/C_M_LSB_BV) *
                              G_M_INFO_DERIVE(T_ALG.E_BV));

if L_M_BV_32 > 32767 then
   P_M_DERIVE(T_ALG.E_BV) := 16#7FFF#;
elsif L_M_BV_32 < -32768 then
   P_M_DERIVE(T_ALG.E_BV) := 16#8000#;
else
   P_M_DERIVE(T_ALG.E_BV) := UC_16S_EN_16NS(TDB.T_ENTIER_16S(L_M_BV_32));
end if;
```

<div class="fragment">

<br>

Et pour l'**H**orizontale `BH` ?

<pre><code class="c">
P_M_DERIVE(T_ALG.E_BH) := UC_16S_EN_16NS (TDB.T_ENTIER_16S
                                   ((1.0/C_M_LSB_BH) *
                                   G_M_INFO_DERIVE(T_ALG.E_BH)));
</code></pre>
</div>


Commission d'enquête
--------------------

[Rapport][Ariane5rapport] rendu un mois après l'incident  

1. <!--.element: class="fragment"-->
  Les concepteurs du calculateur de la trajectoire  
  ont volontairement exclu la spécificité d'Ariane 5.

2. <!--.element: class="fragment"-->
  La commission (composée d'ingénieurs logiciel)  
  conclut à un problème logiciel.

<!--.element: class="fragment"--> Lire aussi : [Arnold][arnold] et [Bielefeld][bielefeld]

[Ariane5rapport]: http://deschamp.free.fr/exinria/divers/ariane_501.html
[arnold]:         http://www.math.umn.edu/~arnold/disasters/ariane5rep.html        "TODO: version anglaise à confirmer..."
[bielefeld]:      http://www.rvs.uni-bielefeld.de/publications/Reports/ariane.html "TODO: à lire..."


Enquêtes indépendantes
----------------------

1. <!--.element: class="fragment"-->
   [Gérard Le Lann][Ariane5failure] (INRIA) conclut  
   à un problème d'intégration système

2. <!--.element: class="fragment"-->
   [Mark Dowson][Ariane5failure] insiste sur l'environnement de travail  
    - Pressions budgétaires
    - Pressions sur les délais
    - *If it's not broken don't fix it*
    - Carriérisme des managers, Politique

[Ariane5failure]: http://cmpe.emu.edu.tr/chefranov/Cmps201-fall2011/Notes/Ariane5failure.pdf


Que retenir du cas Ariane 501 ?
-------------------------------

1. <!--.element: class="fragment"-->
   Le **changement** justifie le test

2. <!--.element: class="fragment"-->
   Ne pas laisser tomber la **qualité** face
   * aux contraintes budget
   * aux contraintes planning
   * au conservatisme ([continuous refactoring][cr])
   * à la politique...

[cr]: http://programmer.97things.oreilly.com/wiki/index.php/Continuous_Refactoring



[Autres cas](https://en.wikipedia.org/wiki/List_of_software_bugs)
------------

* **1980** [NORAD](https://en.wikipedia.org/wiki/North_American_Aerospace_Defense_Command) alerte d'une attaque de missiles  
  &emsp; &emsp; (le logiciel ne gérait pas la défaillance électrique)
* **1983** Un satellite soviétique alerte d'une attaque de missiles  
  &emsp; &emsp; (l'officier russe n'y croit pas)
* **1983** Vancouver Stock Exchange corrige son index de 525 à 1099  
  &emsp; &emsp; (erreurs d'arrondi)
* **1985** La NASA [ne détecte aucun trou d'ozone](https://earthobservatory.nasa.gov/Features/RemoteSensingAtmosphere/remote_sensing5.php) pendant 7 ans  
  &emsp; &emsp; (grandes variations écartées)
* **1993** Bug du Pentium sur les flottants
* **1998** Désintégration Mars Climate Orbiter  
  &emsp; &emsp; (unité *pound/second* au lieu de *newton/second*)
* Médical : Surdose de rayons X...
* [Avion](https://youtu.be/U0LBj_8xs_w), hélicoptère...


Toyota
------

*Accélération inattendue du véhicule*

* <!--.element: class="fragment"--> **2010** Toyota rappelle à nouveau un million de véhicules  
  &emsp; &emsp;                              car ce n'est pas la mécanique qui est en cause  
  &emsp; &emsp;                              mais le [code spaghetti bourré de négligences](https://linuxfr.org/news/encore-un-exemple-de-code-spaghetti-toyota)

* <!--.element: class="fragment"--> Il a fallu attendre une centaine de morts,  
  <!-- --->                         des milliers d'accidents et une poursuite en justice

* <!--.element: class="fragment"--> **2013** [Barr](https://en.wikipedia.org/wiki/Michael_Barr_%28software_engineer%29) trouve [80000 violations](http://www.safetyresearch.net/Library/BarrSlides_FINAL_SCRUBBED.pdf) des règles [MISRA C 2004](https://en.wikipedia.org/wiki/MISRA_C#MISRA_C:2004).  
  &emsp; &emsp;                              (les dév. transgressent leurs règles sans se justifier)

* <!--.element: class="fragment"--> Coût : Quelques milliards $ et image de la marque  
  &emsp; &emsp;                     *« Rien n'arrête une Toyota, même pas ses freins. »*


[Knight Capital Group](https://fr.wikipedia.org/wiki/Knight_Capital_Group) (2012)
----------------------

[*Comment perdre 440 millions $ en 45 minutes ?*](https://en.wikipedia.org/wiki/Knight_Capital_Group#2012_stock_trading_disruption)

* <!--.element: class="fragment"--> La fonction de test *Power Peg* est codée dans un logiciel de Prod

* <!--.element: class="fragment"--> Les développeurs gardent ce vieux code *Power Peg* (non utilisé)

* <!--.element: class="fragment"--> Un technicien oublie d'installer la nouvelle version  
  <!-- -->                          sur un des huit serveurs SMARS (automate de trading)

* <!--.element: class="fragment"--> La config active le *Power Peg* qui fait dévier  
  <!-- -->                          à la hausse et à la baisse les cours de la bourse

* <!--.element: class="fragment"--> *Power Peg* achète et vend 397 millions d'actions sur 154 titres (NYSE)

* <!--.element: class="fragment"--> 4 millions d'ordres exécutés perturbent 148 titres (ex: 3.50 $ <-> 14.76 $)


(qu'est devenu KCG ?)
---------------------

* <!--.element: class="fragment"--> **2012** Baisse de la capitalisation (350 millions $) de 75% dès le lendemain

* <!--.element: class="fragment"--> 4 jours après, KCG lève 400 millions $  

* <!--.element: class="fragment"--> **2015** Vente des logiciels *KCG Hotspot* à BATS pour 365 millions $

* <!--.element: class="fragment"--> **2017** Virtu Financial achète *KCG Holdings* pour 1,4 milliard $


[Apple](https://en.wikipedia.org/wiki/Unreachable_code#goto_fail_bug) (2014)
-------

```c
OSStatus SSLVerifySignedServerKeyExchange(...)
{
  OSStatus err;
  ...
  if ((err = SSLHashSHA1.update(&hashCtx, &serverRandom)) != 0)
    goto fail;
  if ((err = SSLHashSHA1.update(&hashCtx, &signedParams)) != 0)
    goto fail;
    goto fail;
  if ((err = SSLHashSHA1.final(&hashCtx, &hashOut)) != 0)
    goto fail;
  ...
fail:
  SSLFreeBuffer(&signedHashes);
  SSLFreeBuffer(&hashCtx);
  return err;
}
```

<!--.element: class="fragment"--> **2016** => Nouvelle option [GCC 6 `-Wmisleading-indentation` ](https://developers.redhat.com/blog/2016/02/26/gcc-6-wmisleading-indentation-vs-goto-fail/)


Valve Steam (2015)
-----------

Ce script peut effacer tout le `$HOME`.

```bash
STEAMROOT="$(cd "${0%/*}" && echo $PWD)"

# Scary!
rm -rf "$STEAMROOT/"*
```

Le commentaire `Scary!` est d'origine.


Que retenir de ces études de cas ?
----------------------------------

* La non-qualité coûte plus cher  <!-- .element: class="fragment" -->  
  (qui pratique le *quick and dirty* ?)

* Gérer les erreurs  <!-- .element: class="fragment" -->  
  Refuser la négligence
