Réflexions sur les tests unitaires
==================================
<!--.slide: data-background="#061" data-background-transition="zoom"-->


The Way of Testivus
-------------------

[Alberto Savoia](http://www.artima.com/weblogs/viewpost.jsp?thread=203994) (2007)

1.  If you write code, write tests <!--.element: class="fragment"--> 
2.  Don’t get stuck on unit testing dogma <!--.element: class="fragment"--> 
3.  Embrace unit testing karma <!--.element: class="fragment"--> 
4.  Think of code and test as one <!--.element: class="fragment"--> 
5.  The test is more important than the unit <!--.element: class="fragment"--> 
6.  The best time to test is when the code is fresh <!--.element: class="fragment"--> 
7.  Tests not run waste away <!--.element: class="fragment"--> 
8.  An imperfect test today is better than a perfect test someday <!--.element: class="fragment"--> 
9.  An ugly test is better than no test <!--.element: class="fragment"--> 
10. Sometimes, the test justifies the means <!--.element: class="fragment"--> 
11. Only fools use no tools <!--.element: class="fragment"--> 
12. Good tests fail <!--.element: class="fragment"--> 

<!--.element: class="fragment"--> What is important for you?  
What about *"Good tests fail"*?


Do not write tests to find bugs
-------------------------------

Si la finalité était de trouver des bugs et que l'on n'en trouve pas,  
alors on peut se dire qu'écrire des tests ne sert à rien.

La finalité est autre : <!--.element: class="fragment"-->

* Détecter les changements dans le code   <!--.element: class="fragment"-->  
  qui causent des régressions.  

* Et si le code ne change plus =>   <!--.element: class="fragment"-->  
  Garder des builds à xx heures  
  car le code pourrait changer.


Que veut dire *"Test Unitaire"* ?
---------------------------------
<!--.slide: data-background="#610" data-background-transition="zoom"-->

De quoi parle t'on quand on parle de *"Test Unitaire"* ?


Une bonne définition du *"Test Unitaire"*
-----------------------------------------

* Les tests unitaires ne doivent pas interférer entre eux  
  (même un test avec lui-même). <!--.element: class="fragment"--> 

    * Donc ils peuvent tous être exécutés en parallèle <!--.element: class="fragment"--> 
    * Pas d'accés aux ressources file-system, réseau, affinité CPU, base de données, horloge... <!--.element: class="fragment"--> 

* Ce qui est unitaire, c'est la fonctionnalité testée <!--.element: class="fragment"--> 

    * Donc un test unitaire peut tester plusieurs classes et fonctions <!--.element: class="fragment"--> 


Ce qui n'est pas un *"Test Unitaire"*
-------------------------------------

[Michael Feathers](http://www.artima.com/weblogs/viewpost.jsp?thread=126923) (2005)

* It talks to the database <!--.element: class="fragment"--> 
* It communicates across the network <!--.element: class="fragment"--> 
* It touches the file system <!--.element: class="fragment"--> 
* It can't run at the same time as any of your other unit tests <!--.element: class="fragment"--> 
* You have to do special things to your environment to run it   <!--.element: class="fragment"-->   
  (such as editing config files)

<p class="fragment">   
**Les tests qui font cela ne sont pas mauvais,**  
**mais ils sont à séparer des vrais _"Tests Unitaires"_**  
**afin que ces derniers puissent être exécutés de façon optimale.**
</p>
