Réflexions sur les tests unitaires
==================================


The Way of Testivus
-------------------

[Alberto Savoia](http://www.artima.com/weblogs/viewpost.jsp?thread=203994) (2007)

1.  If you write code, write tests
2.  Don’t get stuck on unit testing dogma
3.  Embrace unit testing karma
4.  Think of code and test as one
5.  The test is more important than the unit
6.  The best time to test is when the code is fresh
7.  Tests not run waste away
8.  An imperfect test today is better than a perfect test someday
9.  An ugly test is better than no test
10. Sometimes, the test justifies the means
11. Only fools use no tools
12. Good tests fail

(What is important for you?  
What about *"Good tests fail"*?)


Do not write tests to find bugs
-------------------------------

Si la finalité était de trouver des bugs et que l'on n'en trouve pas,  
alors on peut se dire qu'écrire des tests ne sert à rien.

La finalité est autre :  
Détecter les changements dans le code  
qui causent des régressions.  
Et si le code ne change plus =>  
Garder des builds à xx heures car le code pourrait changer.


Que veut dire *"Test Unitaire"* ?
---------------------------------

De quoi parle t'on quand on parle de *"Test Unitaire"* ?


Une bonne définition du *"Test Unitaire"*
-----------------------------------------

* Les tests unitaires ne doivent pas interférer entre eux (même un test avec lui-même).

    * Donc ils peuvent tous être exécutés en parallèle
    * Pas d'accés aux ressources file-system, réseau, affinité CPU, base de données, horloge...

* Ce qui est unitaire, c'est la fonctionnalité testée

    * Donc un test unitaire peut tester plusieurs classes et fonctions


Ce qui n'est pas un *"Test Unitaire"*
-------------------------------------

[Michael Feathers](http://www.artima.com/weblogs/viewpost.jsp?thread=126923) (2005)

* It talks to the database
* It communicates across the network
* It touches the file system
* It can't run at the same time as any of your other unit tests
* You have to do special things to your environment to run it  
  (such as editing config files)

**Les tests qui font cela ne sont pas mauvais,**  
**mais ils sont à séparer des vrais _"Tests Unitaires"_**  
**afin que ces derniers puissent être exécutés de façon optimale.**
