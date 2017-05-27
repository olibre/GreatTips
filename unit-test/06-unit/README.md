Que veut dire le U dans TU ?
============================
<!--.slide: data-background="#034" data-background-transition="zoom"-->

*Quelle granularité ?*


Test a feature #1
-----------------

Pour tester une classe, une approche est d'avoir un test pour chaque fonction de la classe.  
Cela permet de respecter la couverture des fonctionnalités de la classe.  
De plus, un échec permet tout de suite de localiser la régression.

Test       |   | Code
-----------|---|---------
`test1()`  | ->| `function1()`
`test2()`  | ->| `function2()`
`test3()`  | ->| `function3()`
`test4()`  | ->| `function4()`
`test5()`  | ->| `function5()`
`test6()`  | ->| `function6()`

Quelles sont les limitations de cette approche ?


Test `std::vector` #1
---------------------

Testons la classe `std::vector` en se limitant aux fonctions suivantes :

    empty();
    size();
    push_back();
    pop_back();
    clear();

Comment implémenter chacun de ces tests ?

    test_empty();
    test_size();
    test_push_back();
    test_pop_back();
    test_clear();

Est-ce que chaque test peut tester une seule fonction ?


Test a feature #2
-----------------

En fait, les tests vérifient plusieurs aspects de la classe
qui nécessitent de combiner plusieurs fonctions.

Test                                     |   | Code
-----------------------------------------|---|--------------
`test1()`                                | ->| `function1()`
`test2()`                                | ->| `function2()`
`test3()`                                | ->| `function3()`
`test4()`                                | ->| `function4()`
`test5()`                                | ->| `function5()`
`test6()`                                | ->| `function6()`

Test                                     |   | Code
-----------------------------------------|---|--------------
`test10()`<br> `test11()`<br> `test20()`<br> `test21()`<br> `test22()`<br> `test30()`<br> `test31()`<br> `test40()`<br> `test41()`<br> `test42()`<br> `test50()`<br> `test51()`<br> `test52()`<br> `test60()`<br> `test61()` | ->  | `function1()`<br> `function2()`<br> `function3()`<br> `function4()`<br> `function5()`<br> `function6()`


Test `std::vector` #2
---------------------

Écrire les **GUT**s de la classe std::vector  
(se limiter aux fonctions suivantes)

    empty();
    size();
    push_back();
    pop_back();
    clear();


Test a feature #3
-----------------

Une classe = un ensemble de tests.

Test                                                              |   | Code
------------------------------------------------------------------|---|------------
`test10()`<br> `test11()`<br> `test20()`<br> `test21()`<br> `...` | ->| `function1()`<br> `function2()`<br> `function3()`<br> `function4()`<br> `function5()`<br> `function6()`

Test                                                              |   | Code
------------------------------------------------------------------|---|------------
`test10()`<br> `test11()`<br> `test20()`<br> `test21()`<br> `...` | ->| `ClassA` &emsp; &emsp;

Des suggestions ?


Test a feature #3
-----------------

* Mais quand deux classes sont intimement liées ?
* Les séparer avec des *dummy* / *stub* / *fake* / *mock* ?
* Et pouquoi pas les considérer comme faisant partie de la même fonctionnalité ?

Test                                                   |   | Code
-------------------------------------------------------|---|------------
`test10()`<br> `test11()`<br> `test20()`<br> `test21()`| ->| `ClassA`

Test                                                   |   | Code
-------------------------------------------------------|---|------------
`test10()`<br> `test11()`<br> `test20()`<br> `test21()`| ->| `ClassA`<br> `ClassB`


Test a feature #4
-----------------

* Et que faire des dépendances ?
* Les découpler avec *dummy* / *stub* / *fake* / *mock* ?
* Et pouquoi pas les considérer comme faisant partie de la même fonctionnalité ?
* On va pas découpler les `std::` &emsp; Non ?

Test                                                   |   | Code
-------------------------------------------------------|---|------------
`test10()`<br> `test11()`<br> `test20()`<br> `test21()`| ->| `ClassA`<br> `ClassB` &emsp; &emsp; &emsp; &emsp; &emsp; &emsp; &emsp;

Test                                                   |   | Code                 |   | Dependency
-------------------------------------------------------|---|----------------------|---|------------
`test10()`<br> `test11()`<br> `test20()`<br> `test21()`| ->| `ClassA`<br> `ClassB`| ->| `ClassC`<br> `ClassD`<br> `ClassE`


Granularity of Unit Test
------------------------

* Bien doser la granularité d'un test unitaire
* Suivre son instinct
* Penser à une fonctionnalité unitaire dans son ensemble
* Ne pas s'embêter à découpler quand cela n'apporte pas grand chose


One class = Multiple features
-----------------------------

* Que faire si on se rend compte que la classe expose différentes fonctionnalités ?
* Cela est révélateur d'une conception bancale...
* Solutions
    1. Coder différents jeux de tests unitaires indépendants ;
    2. Mieux : Découper la classe en fonctionnalités distinctes ([continuous refactoring][cr]) ;
    3. Encore mieux: Écrire les tests avant la classe, cela permet de corriger de rectifier le tir avant de devoir réécrire la fonctionnalité.

[cr]: http://programmer.97things.oreilly.com/wiki/index.php/Continuous_Refactoring
