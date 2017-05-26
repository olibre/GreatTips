Études de cas
=============


Ariane 5
--------

### La théorie

https://www.youtube.com/watch?v=_rNmszfIvAw

### Vol d'inauguration

4 juin 1996, Ariane 501, Vol 88 (4 satellites)  
https://www.youtube.com/watch?v=fCnO-UYF3co


Chronologie
-----------

* **1981** Conception Ariane 4
* **1987** Conception Ariane 5
* **1988** à **2003** Ariane 4, 15 ans de service, 97% de succès (116 lancements)
* **199x** Décision de réutiliser le *Système de Référence Inertielle* d'Ariane 4 réputé fiable.  
  Pour éviter de refaire des tests (800 kF),  
  on garde la phase de calibration qui est nécessaire pour Ariane 4 seulement.
* **1996** Vol inaugural (v88) d'Ariane 5 (fusée 501), échec.
* **1997** Après 16 mois de vérifications, second vol, réussite.

Ce bug a longtemps été le bug le plus coûteux du monde,  
peut-être 3 milliards de francs (de l'époque) pour les 4 satellites,  
le lancement, les 16 mois de retrad du projet et l'image ternie de la marque.


Un petit bug, un grand boum !
-----------------------------

* L'accélération d'Ariane 5 est cinq fois plus élevée qu'Ariane 4
* La valeur *accélération* sur 32 bits et copiée dans un registre de 16 bits  
  trop petit ce qui provoque une interruption matérielle
* Les deux *Système de Référence Inertielle* (même matériel, même logiciel)  
  se désactivent quasi simultannément (à 72 ms près)
* 37 secondes après le décollage, le pilote automatique prend les commandes
* Le *On Board Computer* (OBC) détecte que le SRI 1 est en panne et bascule sur le SRI 2
* Le SRI 2 remonte une erreur, mais l'OBC considère comme valeur de navigation,  
  et braque au maximum la trajectoire de la fusée
* Un des deux boosters est arraché à cause de la pression trop élevée  
  et déclenche le système d'autodestruction de la fusée
* Les débris de la fusée tombent dans la mangrove et sont récupérés en partie   
  dont l'EEPROM contenant les informations d'erreur


Code source Ada
---------------

[![Scan du code source Ada du SRI][AdaCode]][AdaRef]

[AdaCode]: ./bug-Ariane-501_by-JeanJacquesLevy-INRIA-2010.jpg "La composante verticale (variable L_M_BV_32) est vérifiée avant conversion 16 bits, mais pas pour la composante horizontale"
[AdaRef]:  http://moscova.inria.fr/~levy/talks/10enslongo/enslongo.pdf


Le petit bug
------------

Les bornes -32768..32767 de la composante **V**erticale `BV` sont vérifiées :

```ada
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

-------

Mais pas pour l'**H**orizontale `BH` :

```ada
P_M_DERIVE(T_ALG.E_BH) := UC_16S_EN_16NS (TDB.T_ENTIER_16S
                                   ((1.0/C_M_LSB_BH) *
                                   G_M_INFO_DERIVE(T_ALG.E_BH)));
```


Commission d'enquête
--------------------

* [Rapport][Ariane5rapport] rendu un mois après le désastre d'Ariane 501  
  (lire aussi : [Arnold][arnold] et [Bielefeld][bielefeld])
* Deux aspects importants du rapport
    1. La trajectoire spécifique d'Ariane 5 a été volontairement exclue  
       des considérations de conception de l'élément qui calcule la trajectoire
    2. La commision d'enquête (composée d'ingénieurs logiciel) conclut à un problème logiciel
* [Gérard Le Lann][Ariane5failure] (INRIA) conclut plutôt à un problème d'intégration système
* [Mark Dowson][Ariane5failure] rappelle les réalités du projet
    * Pressions budgétaires et planning
    * Arguments *If it's not broken don't fix it*
    * Politique des managers

[Ariane5rapport]: http://deschamp.free.fr/exinria/divers/ariane_501.html
[arnold]:         http://www.math.umn.edu/~arnold/disasters/ariane5rep.html        "TODO: version anglaise à confirmer..."
[bielefeld]:      http://www.rvs.uni-bielefeld.de/publications/Reports/ariane.html "TODO: à lire..."
[Ariane5failure]: http://cmpe.emu.edu.tr/chefranov/Cmps201-fall2011/Notes/Ariane5failure.pdf


Que retenir du cas Ariane 501 ?
-------------------------------

1. Le **changement** justifie le test
2. Ne pas laisser tomber la **qualité** face
   * aux contraintes budget
   * aux contraintes planning
   * au conservatisme ([continuous refactoring][cr])
   * à la politique...

[cr]: http://programmer.97things.oreilly.com/wiki/index.php/Continuous_Refactoring



[Autres cas](https://en.wikipedia.org/wiki/List_of_software_bugs)
------------

* **1980** [NORAD](https://en.wikipedia.org/wiki/North_American_Aerospace_Defense_Command) alerte d'une attaque de missiles  
  (le logiciel ne gèrait pas la défaillance électrique)
* **1983** Un satellite soviétique alerte d'une attaque de missiles  
  (l'officier russe n'y croit pas)
* **1983** Vancouver Stock Exchange corrige son index de 525 à 1099  
  (erreurs d'arrondi)
* **1985** La NASA [ne détecte aucun trou d'ozone](https://earthobservatory.nasa.gov/Features/RemoteSensingAtmosphere/remote_sensing5.php) pendant 7 ans  
  (grandes variations écartées)
* **1993** Bug du Pentium sur les flottant
* **1998** Désintégration Mars Climate Orbiter  
  (une mesure est en *pound/second* au lieu de *newton/second*)
* Médical : Surdose de rayons X...
* [Avion](https://youtu.be/U0LBj_8xs_w), hélicoptère...


Toyota
------

*Accérelation innatendue du véhicule*

* **2010** Toyota rappelle à nouveau un million de véhicules   
  car ce n'est pas la mécanique qui est en cause  
  mais le [code spaghetti bourré de négligeances](https://linuxfr.org/news/encore-un-exemple-de-code-spaghetti-toyota)    
* Il a fallu attendre une centaine de morts,  
  des milliers d'accidents et une poursuite en justice  
* **2013** [Michael Barr](https://en.wikipedia.org/wiki/Michael_Barr_%28software_engineer%29) trouve [81 514 violations](http://www.safetyresearch.net/Library/BarrSlides_FINAL_SCRUBBED.pdf) des règles de [MISRA C 2004](https://en.wikipedia.org/wiki/MISRA_C#MISRA_C:2004).  
  (les développeurs transgressaient leurs propres règles et sans donner de justifications)  
* Coût : image de la marque et plusieurs milliard $    
  *« Rien n'arrête une Toyota, même pas ses freins. »*


[Knight Capital Group](https://fr.wikipedia.org/wiki/Knight_Capital_Group) (2012)
----------------------

[*Comment perdre 440 million $ en 45 minutes ?*](https://en.wikipedia.org/wiki/Knight_Capital_Group#2012_stock_trading_disruption)

* Pour des besoins de test, une fonction *Power Peg* est codée dans un logiciel de Prod
* Les développeurs gardent ce vieux code *Power Peg* (non utilisé)
* Un technicien oublie d'installer la nouvelle version   
  sur un des huit serveurs SMARS (automate de trading)
* La config active le *Power Peg* qui fait dévier  
  à la hausse et à la baisse les cours de la bourse
* Ce *Power Peg* envoye des ordres pour 397 millions d'actions sur 154 titres du NYSE
* 4 millions d'ordres exécutés perturbent 148 titres (ex: entre 3.50 $ et 14.76 $)


(qu'est devenu KCG ?)
---------------------

* **2012** Le capital (350 millions $) perd 75% dès le lendemain  
* 4 jours après, KCG lève 400 million $  


* **2015** Vente des logiciels *KCG Hotspot* à BATS pour 365 millions $  

* **2017** Virtu Financial achète KCG Holdings pour 1,4 milliard $


Apple [bug](https://en.wikipedia.org/wiki/Unreachable_code#goto_fail_bug) (2014)
-----------

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

**2016** => Nouvelle option [GCC 6 `-Wmisleading-indentation` ](https://developers.redhat.com/blog/2016/02/26/gcc-6-wmisleading-indentation-vs-goto-fail/)


Valve Steam (2015)
-----------

* Le client Linux peut effacer les fichiers

```bash
STEAMROOT="$(cd "${0%/*}" && echo $PWD)"

# Scary!
rm -rf "$STEAMROOT/"*
```

* Le commentaire `Scary!` est d'origine


Que retenir de ces études de cas ?
----------------------------------

* La non-qualité côute plus cher  
  (qui pratique le *quick and dirty* ?)

* Gérer les erreurs  
  Refuser la négligeance
