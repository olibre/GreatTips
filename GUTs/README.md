Good Unit Tests (GUTs)
======================

Inspiration come from trainings provided by [**Kevlin Henney**](http://www.infoq.com/author/Kevlin-Henney#Presentations) (see this [presentation](
http://www.slideshare.net/Kevlin/what-we-talk-about-when-we-talk-about-unit-testing)) and many other Unit-Testing documents. 

| Kevlin is a consultant and trainer on languages, design, and development process.
|--------------------------------------------
| ![Cover of the book 97 Things Every Programmer Should Know (2010)](http://akamaicovers.oreilly.com/images/9780596809492/cat.gif) ![Cover of the book 97 Things Every Java Programmer Should Know (2017)](http://akamaicovers.oreilly.com/images/0636920048824/cat.gif) ![Kevlin's face](http://programmer.97things.oreilly.com/wiki/images/9/98/Kevlin_251x228.jpg)

Définition du terme "test unitaire"
===================================

* Les tests unitaires ne doivent pas interférer entre eux (même un test avec lui-même).
    
    * Donc ils peuvent tous être exécutés en parallèle
    * Pas d'accé aux ressources file-system, réseau, affinité CPU, base de données

* Ce qui est unitaire, c'est la fonctionnalité testée
    
    * Donc un tests unitaire (une fonctionnalité unitaire) peut tester plusieurs classes et fonctions


The Way of Testivus
===================

From [Alberto Savoia](http://www.artima.com/weblogs/viewpost.jsp?thread=203994) ([forum](http://www.artima.com/forums/flat.jsp?forum=106&thread=204677)) (2007).

* If you write code, write tests.
* Don’t get stuck on unit testing dogma.
* Embrace unit testing karma.
* Think of code and test as one.
* The test is more important than the unit.
* The best time to test is when the code is fresh.
* Tests not run waste away.
* An imperfect test today is better than a perfect test someday.
* An ugly test is better than no test.
* Sometimes, the test justifies the means.
* Only fools use no tools.
* Good tests fail.



Do not write unit tests to find bugs
====================================

Si la finalité était de trouver des bugs et que l'on n'en trouve pas,
alors on peut se dire qu'écrire des tests ne sert à rien.

La finalité est autre : Détecter les changements dans le code qui causent des régressions.
Et si le code ne change plus => Continuons à lancer les tests unitaires car cela pourrait changer.


Unit Test coding rules
======================

Les coding rules sont différentes pour le code à destination de la prod et celui des tests.


Unit Test = Specification
=========================

Test conveys/tells knowledge/story

* function names are phrases using underscore
* Les tests unitaires sont la doc/spécification du code pour la prod

Words *must* and *should*
=========================

Préférer *must* à *shall* car plus explicite.

Attention *should* dans les spec veut dire *optional*.
Donc non testé => éviter *should*


Découpler son unité de test
===========================

1. stub
2. mock
3. spy
4. fake
5. dummy




Testivus and code coverage
==========================

Story from [Alberto Savoia](http://www.artima.com/weblogs/viewpost.jsp?thread=203994) ([forum](http://www.artima.com/forums/flat.jsp?forum=106&thread=204677)) (2007).

A programmer asked:

> - I am ready to write some unit tests. What code coverage should I aim for?

The great master replied:

> - Don’t worry about coverage, just write some good tests.

...

Later, a second programmer asked the same question.

The great master pointed at a pot of boiling water and said:

> - How many grains of rice should put in that pot?

The programmer, looking puzzled, replied:

> - How can I possibly tell you? It depends on how many people you need to feed, how hungry they are, what other food you are serving, how much rice you have available, and so on.
> 
> - Exactly

The second programmer smiled and left.

...

A third programmer came and asked the same question. The master replied:

> - Eighty percent and no less!

The third programmer smiled and left.

...

After, a young apprentice approached the great master:

> - Great master, today I overheard you answer the same question about code coverage with three different answers. Why?

The great master:

> - The first programmer is new and just getting started with testing. Right now he has a lot of code and no tests. He has a long way to go; focusing on code coverage at this time would be depressing and quite useless. He’s better off just getting used to writing and running some tests. He can worry about coverage later.  
    The second programmer, on the other hand, is quite experience both at programming and testing. When I replied by asking her how many grains of rice I should put in a pot, I helped her realize that the amount of testing necessary depends on a number of factors, and she knows those factors better than I do – it’s her code after all. There is no single, simple, answer, and she’s smart enough to handle the truth and work with that.
>
> - I see, but if there is no single simple answer, then why did you answer the third programmer ‘Eighty percent and no less’?
>
> - The third programmer wants only simple answers – even when there are no simple answers … and then does not follow them anyway.






Prevent Test debt
=================

* Test early
* Test often
* Test automatically




Several coverage levels
=======================

* File/Function coverage
* Statement coverage = Couverture de code source (les lignes de code)
* Branch coverage = Couverture de branches, exemple : toutes les combinaisons de `if(a && b && c)`
* Value coverage = Couverture de données


Coverage pourcentage
====================

Do not specify a pourcentage.
Just request a high coverage and review what is not covered/tested.

* If the untested/uncovered part is not relevant => Unit-Test can be considered as OK.
* But if something is missing => Add tests to cover this part.


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


Utilité de la couverture de code
================================

Le but du test unitaire n'est pas de faire du coverage.
Toutefois coder en faisant des tests unitaires revient à couvrir un maximum de code.
Du coup les indicateurs de coverage permettent de vérifier si on a oublié quelque chose.

L'idée de faire des tests unitaires a été comparé au lavage des mains avant une intervention chirurgicale. 
Cette simple mesure a une certaine époque a permis de faire un progrès considérable dans les résultats post opératoires.
Écrire les tests unitaires au départ puis écrire le code de façon à faire fonctionner ces tests unitaires revient à écrire son code sous contrat.
À une certaine époque certains devs écrivaient des tartines de commentaires avant d'écrire le code.
Les tests unitaires sont une bien meilleure solution car les écrits restent et le code change.
Si un dev veut changer du code il va se confronter au contrat défini dans les tests unitaires.
Il aura un moyen de constater si ses modifications cassent des choses qu'il n'a pas prêté attention ou que l'on ne lui a pas dite.
C'est une doc interactive avec le code et qui évolue, s'enrichit avec le code.



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

