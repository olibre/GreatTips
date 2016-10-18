Good Unit Tests (GUTs)
======================

Inspiration come from trainings provided by [**Kevlin Henney**](http://www.infoq.com/author/Kevlin-Henney#Presentations) (see this [presentation](
http://www.slideshare.net/Kevlin/what-we-talk-about-when-we-talk-about-unit-testing)) and many other Unit-Testing documents. 

| Kevlin is a consultant and trainer on languages, design, and development process.
|--------------------------------------------
| ![Cover of the book 97 Things Every Programmer Should Know (2010)](http://akamaicovers.oreilly.com/images/9780596809492/cat.gif) ![Cover of the book 97 Things Every Java Programmer Should Know (2017)](http://akamaicovers.oreilly.com/images/0636920048824/cat.gif) ![Kevlin's face](http://programmer.97things.oreilly.com/wiki/images/9/98/Kevlin_251x228.jpg)


Test your code
==============

| *The Pragmatic Programmer*  <br> by Andrew Hunt <br> and David Thomas <br><br><br><br><br><br> Tip 49 <br> *Test your software <br> or your users will.*           | ![Book cover](https://upload.wikimedia.org/wikipedia/en/8/8f/The_pragmatic_programmer.jpg)
|--------------------------------------------------|---


Technical debt
==============

Most of old projects have
    
* Technology debt (outdated underlying technologies)
* Documentation debt (too little or too much)
* **Test debt**

Que veut dire "Test Unitaire" ?
===============================

De quoi parle t'on quand on parle de "Test Unitaire" ?

Un bonne définition du "Test Unitaire"
======================================

* Les tests unitaires ne doivent pas interférer entre eux (même un test avec lui-même).
    
    * Donc ils peuvent tous être exécutés en parallèle
    * Pas d'accé aux ressources file-system, réseau, affinité CPU, base de données

* Ce qui est unitaire, c'est la fonctionnalité testée
    
    * Donc un test unitaire peut tester plusieurs classes et fonctions

Ce qui n'est pas un "Test Unitaire"
===================================

By [Michael Feathers](http://www.artima.com/weblogs/viewpost.jsp?thread=126923) (2005)

* It talks to the database ;
* It communicates across the network ;
* It touches the file system ;
* It can't run at the same time as any of your other unit tests ;
* You have to do special things to your environment (such as editing config files) to run it.

Les tests qui font cela ne sont pas mauvais,
mais ils sont à séparer des vrais "Tests Unitaires"
afin que ces derniers puissent être exécutés de façon optimale.

https://books.google.fr/books?id=QJA3dM8Uix0C


Test before or after development
================================

* Plain Old Test Unit (POUT) = Write the test **AFTER** the feature
* [Test-Driven Development](https://fr.wikipedia.org/wiki/Test_driven_development) (TDD) = Write the test **BEFORE** the feature
* Defect-Driven Testing (DDT) = Write the test **BEFORE** the fix


Out of scope 
============

* Defect-Driven Development (DDD)
* Design-Driven Development (D3)
* [Behavior-Driven Development](https://fr.wikipedia.org/wiki/Behavior_driven_development) (BDD)
* [Acceptance Test–Driven Development](https://en.wikipedia.org/wiki/Acceptance_test%E2%80%93driven_development) (ATDD)
* Example-Driven Development (EDD)
* Story test–Driven Development (SDD)
* [Feature-Driven Development](https://en.wikipedia.org/wiki/Feature-driven_development) (FDD)
* [Domain-Driven Design](https://en.wikipedia.org/wiki/Domain-driven_design) (DDD)
* [Model-Driven Engineering](https://en.wikipedia.org/wiki/Model-driven_engineering) (MDE)
* [Model-driven architecture](https://en.wikipedia.org/wiki/Model-driven_architecture) (MDA)
* [Model-Driven Software Development](https://en.wikipedia.org/wiki/Model-driven_engineering) (MDSD)


Where is Good Unit Tests?
=========================

* POUT, TDD and DDT can produce GUTs.
* GUTs are the result

But... What are GUTs?


Laver ses mains
===============

Par Philippe Bourgeon (2016)

> Le test unitaire est comme le [lavage des mains](https://fr.wikipedia.org/wiki/Ignace_Philippe_Semmelweis) avant une intervention chirurgicale. Cette simple mesure au XIXe siècle a permis des progrès considérables.
>
> Certaines méthodes de programmation des années 90 pronnaient le [raffinnement](https://fr.wikipedia.org/wiki/Raffinement) : le développeur écrivaient des tartines de commentaires avant d'écrire le code. Les tests unitaires sont une bien meilleure solution car les écrits restent (commentaires) et le code s'envole (change). Donc le test est une documentation interactive avec le code : cette documentation est forcée d'évoluer avec le code.


Good Unit Test = Specification
==============================

Les tests unitaires représentnent la spécification du code.

* Unit Test conveys knowledge.
* Unit Test tells a story.
* Function names are phrases (using underscore).


Words *must* and *should*
=========================

Préférer *must* à *shall* car plus explicite.

Attention *should* dans les spec veut dire *optional*.
Donc non testé => Éviter *should*


Unit Test coding rules
======================

> *function names are phrases*

Les règles de codage sont différentes pour le code à destination de la prod et celui des tests unitaires.


The Way of Testivus
===================

From [Alberto Savoia](http://www.artima.com/weblogs/viewpost.jsp?thread=203994) (2007).

1.  If you write code, write tests.
2.  Don’t get stuck on unit testing dogma.
3.  Embrace unit testing karma.
4.  Think of code and test as one.
5.  The test is more important than the unit.
6.  The best time to test is when the code is fresh.
7.  Tests not run waste away.
8.  An imperfect test today is better than a perfect test someday.
9.  An ugly test is better than no test.
10. Sometimes, the test justifies the means.
11. Only fools use no tools.
12. Good tests fail.

What is important for you?

Next section is opposite to last point "Good tests fail".


Do not write unit tests to find bugs
====================================

Si la finalité était de trouver des bugs et que l'on n'en trouve pas,
alors on peut se dire qu'écrire des tests ne sert à rien.

La finalité est autre : Détecter les changements dans le code qui causent des régressions.
Et si le code ne change plus => Continuons à lancer les tests unitaires car cela pourrait changer.


Ariane 5 en vidéo
=================

La théorie
----------

https://www.youtube.com/watch?v=_rNmszfIvAw

Vol d'inauguration
------------------

4 juin 1996, Ariane 501, Vol 88 (4 satellites)  
https://www.youtube.com/watch?v=fCnO-UYF3co


Projet Ariane 5
===============

* 1981 : Conception Ariane 4
* 1987 : Conception Ariane 5
* 1988 à 2003 : Ariane 4, 15 ans de service, 97% de succès (116 lancements)
* 199x : Décision de réutiliser le *Système de Référence Inertielle* (SRI) d'Ariane 4 (réputé fiable). Pour éviter de refaire des tests (800 kF), la calibration n'est pas désactivée (nécessaire pour Ariane 4).
* 1996 : Vol inaugural (v80) d'Ariane 5 (501)


Ariane 501
==========

*Un petit bogue, un grand boum !*

* Le coût du lancement et des 4 satellites est de 2 milliard de francs
* L'accélération d'Ariane 5 est cinq fois plus élevée que Ariane 4
* Cette valeur sur 32 bits et copiée dans un registre de 16 bits trop petit ce qui provoque une interruption matérielle
* Les deux SRI (même matériel, même logiciel) se désactivent quasi simultannément (à 72 ms près)
* 37 secondes après le décollage, le pilote automatique prend les commandes
* Le *On Board Computer* (OBC) détecte que le SRI 1 est en panne et bascule sur le SRI 2
* Le SRI 2 remonte une erreur, mais l'OBC considère comme valeur de navigation, et braque au maximum la trajectoire de la fusée
* Un des deux boosters est arrachée à cause de la pression trop élevée et déclenche le système d'autodestruction de la fusée
* Les débris de la fusée tombent dans la mangrove et sont récupérés en partie dont l'EEPROM contenant les informations d'erreur


Code source Ariane 501
======================

![Scan du code source Ada du SRI](http://olibre.github.io/CppCoding/GUTs/bug-Ariane-501_by-JeanJacquesLevy-INRIA-2010.jpg)

Bug Ariane 501
==============

```ada
L_M_BV_32 := TBD.T_ENTIER_32S ((1.0/C_M_LSB_BV) * G_M_INFO_DERIVE(T_ALG.E_BV));

if L_M_BV_32 > 32767 then
	P_M_DERIVE(T_ALG.E_BV) := 16#7FFF#;
elsif L_M_BV_32 < -32768 then
	P_M_DERIVE(T_ALG.E_BV) := 16#8000#;
else
	P_M_DERIVE(T_ALG.E_BV) := UC_16S_EN_16NS(TDB.T_ENTIER_16S(L_M_BV_32));
end if;

P_M_DERIVE(T_ALG.E_BH) := UC_16S_EN_16NS(TDB.T_ENTIER_16S ((1.0/C_M_LSB_BH) * G_M_INFO_DERIVE(T_ALG.E_BH)));
```
Dans ce code source Ada, les Bornes -32768..32767 sont vérifiées pour BV (**V**érticale), mais pas pour BH (**H**orizontale).


Commission d'enquête Ariane 501 
===============================

* Rapport rendu un mois après le désastre d'Ariane 501
* Deux aspects importants du rapport
    1. La trajectoire spécifique d'Ariane 5 a été volontairement exclue des considérations de conception de l'élément qui calcule la trajectoire
    2. La commision d'enquête (composée d'ingénieurs logiciel) conclut à un problème logiciel
* Gérard Le Lann (INRIA) conclut plutôt à un problème d'intégration système
* Mark Dowson rappelle les réalités des projets
    * Pressions budgétaire et planning
    * Arguments *If it's not broke don't fix it*
    * Politique des managers

Sources
-------
* http://deschamp.free.fr/exinria/divers/ariane_501.html
* http://www.math.umn.edu/~arnold/disasters/ariane5rep.html (semble être la version anglaise du précédent)
* http://cmpe.emu.edu.tr/chefranov/Cmps201-fall2011/Notes/Ariane5failure.pdf
* http://moscova.inria.fr/~levy/talks/10enslongo/enslongo.pdf
* http://www.rvs.uni-bielefeld.de/publications/Reports/ariane.html (non lu mais parrait intéressant)


Conclusions Ariane 501 
======================

* Les tests sont utililes pour vérifier tout changement
* Attention aux contraintes budget / planning / politique


Couverture de code
==================

Le but du test unitaire n'est pas de faire du coverage.
Toutefois coder en faisant des tests unitaires revient à couvrir un maximum de code.
Du coup les indicateurs de coverage permettent de vérifier si on a oublié quelque chose.


Test coverage
=============

Coverage levels

* **File**/**Class**/**Function**
* **Line**/**Statement**
* **Branch** (exemple : toutes les combinaisons de `if(a && b && c)`)
* **Value** (couverture des plages de valeurs)


Coverage pourcentage
====================

Do not specify a pourcentage.
Just request a high coverage and review what is not covered/tested.

* If the untested/uncovered part is not relevant => Unit-Test can be considered as OK.
* But if something is missing => Add tests to cover this part.


Testivus and code coverage
==========================

Story from [Alberto Savoia](http://www.artima.com/weblogs/viewpost.jsp?thread=203994) ([forum](http://www.artima.com/forums/flat.jsp?forum=106&thread=204677)) (2007).

A programmer asked:

- I am ready to write some unit tests. What code coverage should I aim for?

The great master replied:

- Don’t worry about coverage, just write some good tests.

...

Later, a second programmer asked the same question. The great master pointed at a pot of boiling water and said:

- How many grains of rice should put in that pot?
- How can I possibly tell you? It depends on how many people you need to feed, how hungry they are, what other food you are serving, how much rice you have available, and so on.
- Exactly

...

A third programmer came and asked the same question. The master replied:

- 80%

...

After, a young apprentice approached the great master:

- Great master, today I overheard you answer the same question about code coverage with three different answers. Why?
- The first programmer is new and just getting started with testing. Right now he has a lot of code and no tests. He has a long way to go; focusing on code coverage at this time would be depressing and quite useless. He can worry about coverage later.  
  The second programmer, on the other hand, is quite experience both at programming and testing. When I replied by asking how many grains of rice I should put in a pot, I helped to realize that the amount of testing necessary depends on a number of factors, and the programmer knows those factors better than I do – it’s her code after all. There is no single, simple, answer, and she’s smart enough.
- I see, but if there is no single simple answer, then why did you answer the third programmer ‘80%’?
- The third programmer wants only simple answers, even when there are no simple answers, and then does not follow them anyway.



Is it the RIGHT 20%?
====================

On question [*"What is a reasonable code coverage % for unit tests?"*](http://stackoverflow.com/a/90089/938111), Jon Limjap shared his anecdote:

We have a huge project. I noted that, with 700 unit tests, we only have 20% code coverage.

Scott Hanselman replied:

> Is it the RIGHT 20%? Is it the 20% that represents the code your users hit the most? You might add 50 more tests and only add 2%.


Goodhart's law
==============

https://en.wikipedia.org/wiki/Goodhart's_law

Original:

> Any observed statistical regularity will tend to collapse once pressure is placed upon it for control purposes.
Goodhart's law

Simplified:

> When a measure becomes a target, it ceases to be a good measure

Personal French translation:

> Dès qu’un métrique devient un objectif, la mesure perd de son utilité.

Exemples

Quand un manager exige 90% de couverture de code,
alors le développeur est incité à laisser des lignes de code testées
mais sans aucune utilité (ou même, à en rajouter).


Continous testing
=================

The Pragmatic Programmer by Andrew Hunt and David Thomas

Tip 62

> * **Test early**
> * **Test often**
> * **Test automatically**


TDD
===

Écrire les tests unitaires au départ puis écrire le code de façon à faire fonctionner ces tests unitaires revient à écrire son code sous contrat. : changer le code c'est se confronter au contrat défini dans les tests unitaires. Et c'est plus rassurant que le cassage de code soit détecté au plus tôt car un développeur ne peut pas tout savoir sur le code qu'il modifie.

Il aura un moyen de constater si les modifications cassent des choses qu'il n'a pas prêté attention ou que l'on ne lui a pas dite.




Tester les invariants et propriétés
===================================

After *Code coverage* comes *Value coverage*.

1. Exemple de QuickCheck avec GTest  
   https://github.com/xinhuang/qcp

2. CppQuickCheck va plus loin que QuickCheck++
   en ajoutant la sélection aléatoire des générateurs de valeurs
   et la minimisation (shrinking) des données en entrée pour reproduire le problème  
   https://github.com/grogers0/CppQuickCheck

3. autocheck va encore plus loin que CppQuickCheck en passant à C++11  
    https://github.com/thejohnfreeman/autocheck/wiki  
    https://labs.spotify.com/2015/06/25/rapid-check/

4. rapidcheck est une autre alternative intéressante avec shrinking
   et compatibilité STL/CMake/GTest/GMock/BoostTest/…  
   https://github.com/emil-e/rapidcheck


Unit-Test Frameworks C++14 features
===================================

* [Catch](https://github.com/philsquared/Catch)
* [Mettle](https://github.com/jimporter/mettle)

See also https://en.wikipedia.org/wiki/List_of_unit_testing_frameworks#C.2B.2B


Test-Driven Development
=======================

Développement piloté par les tests.




Découpler ses tests unitaires
=============================

Sometimes environement is simulated and needs modeling.

Test doubles
------------

1. Dummy (empty shell, no implementation)
2. Stub (minimal implementations, static, provide always the same response, do not conatains assert)
3. Fake (act like the real object, but in a simpler way)
4. Mock (contains assert)
5. Spy (record events)
