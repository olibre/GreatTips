Good Unit Tests (GUTs)
======================

Inspiration comes from trainings provided by [**Kevlin**][HKi] [**Henney**][HKs] and many other Unit-Testing documents.

[HKi]: http://www.infoq.com/author/Kevlin-Henney#Presentations "Presentations of Kevlin Henney on infoq.com"
[HKs]: http://www.slideshare.net/Kevlin/what-we-talk-about-when-we-talk-about-unit-testing "One good presentation on slideshare.net"

| Kevlin is a trainer on language and development process.
|--------------------------------------------
| [![book cover][97p]][97L] ![book cover][97j] [![Kevlin's face][KH]][KHw]

[97p]: http://akamaicovers.oreilly.com/images/9780596809492/cat.gif "97 Things Every Programmer Should Know (2010)"
[97L]: http://programmer.97things.oreilly.com/wiki/index.php/Contributions_Appearing_in_the_Book
[97j]: http://akamaicovers.oreilly.com/images/0636920048824/cat.gif "97 Things Every Java Programmer Should Know (2017)"
[KH]:  http://programmer.97things.oreilly.com/wiki/images/9/98/Kevlin_251x228.jpg
[KHw]: https://en.wikipedia.org/wiki/Kevlin_Henney


Who test?
=========

|    | &nbsp;
|----|--------
| Tip 49 <br><br><br> **Test your software <br> or your users will.** | [![Book cover][PImg]][PLink]

[PImg]: http://upload.wikimedia.org/wikipedia/en/8/8f/The_pragmatic_programmer.jpg "The Pragmatic Programmer by Andrew Hunt and David Thomas (1999)"
[PLink]: https://en.wikipedia.org/wiki/The_Pragmatic_Programmer


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
    * Pas d'accés aux ressources file-system, réseau, affinité CPU, base de données

* Ce qui est unitaire, c'est la fonctionnalité testée
    
    * Donc un test unitaire peut tester plusieurs classes et fonctions


Ce qui n'est pas un "Test Unitaire"
===================================

[Michael Feathers](http://www.artima.com/weblogs/viewpost.jsp?thread=126923) (2005)

> * It talks to the database ;
> * It communicates across the network ;
> * It touches the file system ;
> * It can't run at the same time as any of your other unit tests ;
> * You have to do special things to your environment (such as editing config files) to run it.
> 
> Les tests qui font cela ne sont pas mauvais,
> mais ils sont à séparer des vrais "Tests Unitaires"
> afin que ces derniers puissent être exécutés de façon optimale.


Put theory into practice
========================

[**Année bissextile**](https://fr.wikipedia.org/wiki/Ann%C3%A9e_bissextile#R.C3.A8gle_actuelle)

Depuis le calendrier grégorien, l'année est bissextile :

* si l'année est divisible par 4 et non divisible par 100, ou
* si l'année est divisible par 400.


```cpp
bool is_leap_year(int year);
```

Test has its own implementation
===============================

```cpp
//if (year is not divisible by 4) then (it is a common year)
//else if (year is not divisible by 100) then (it is a leap year)
//else if (year is not divisible by 400) then (it is a common year)
//else (it is a leap year)
test()
{
  // Test all years until 10'000
  for (int y=1; y<10*1000; ++y)
  {
    bool leap;
    if (y % 4) leap = false;
    else leap = y % 100 ? true : y % 400;

    // Check if tested code has same value
    x = is_leap_year(y);
    ASSERT_EQUAL(leap, x);
  }
}
```

Feature implemented
===================

```cpp
bool is_leap_year (int year)
{
  bool leap; // value to return

  if (year % 4) leap = false;
  else leap = year % 100 ? true : year % 400;

  return leap;
}
```

One test for one feature
========================

Test     |    | Code
---------|----|---------
`test1()`| -> | `function1()`
`test2()`| -> | `function2()`
`test3()`| -> | `function3()`
`test()` | -> | `is_leap_year()`

```cpp
test()
{
  ASSERT_FALSE( is_leap_year(   7) );
  ASSERT_FALSE( is_leap_year(  17) );
  ASSERT_FALSE( is_leap_year(2002) );
  ASSERT_FALSE( is_leap_year(2003) );
  ASSERT_FALSE( is_leap_year(1700) );
  ASSERT_FALSE( is_leap_year(1800) );
  ASSERT_FALSE( is_leap_year(1900) );
  ASSERT_FALSE( is_leap_year(2100) );
  ASSERT_TRUE(  is_leap_year(1704) );
  ASSERT_TRUE(  is_leap_year(1916) );
  ASSERT_TRUE(  is_leap_year(2012) );
  ASSERT_TRUE(  is_leap_year(2016) );
}
```


With comments
=============

```cpp
test()
{
  // Not Divisible by 4
  ASSERT_FALSE( is_leap_year(   7) );
  ASSERT_FALSE( is_leap_year(  17) );
  ASSERT_FALSE( is_leap_year(2002) );
  ASSERT_FALSE( is_leap_year(2003) );

  // Multiple of 100 except 400
  ASSERT_FALSE( is_leap_year(1700) );
  ASSERT_FALSE( is_leap_year(1800) );
  ASSERT_FALSE( is_leap_year(1900) );
  ASSERT_FALSE( is_leap_year(2100) );

  // Rest
  ASSERT_TRUE(  is_leap_year(1704) );
  ASSERT_TRUE(  is_leap_year(1916) );
  ASSERT_TRUE(  is_leap_year(2012) );
  ASSERT_TRUE(  is_leap_year(2016) );
}
```


One unit test = One assert
==========================

[Roy Osherove](http://programmers.stackexchange.com/questions/7823) (2010)

> **Unit tests should fail for exactly one reason.**  
> That’s why you should use one assert per unit test.

Test                                                            |    | Code
----------------------------------------------------------------|----|---------
`test()`                                                        | -> | `is_leap_year()`
`test1()` <br> `test2()` <br> `test3()` <br> `test4()` <br> ... | -> | `is_leap_year()`


Only one assert per test
========================

```cpp
test_7_is_not_leap() {
  ASSERT_FALSE( is_leap_year(   7) );
}
test_17_is_not_leap() {
  ASSERT_FALSE( is_leap_year(  17) );
}
test_2002_is_not_leap() {
  ASSERT_FALSE( is_leap_year(2002) );
}
test_2003_is_not_leap() {
  ASSERT_FALSE( is_leap_year(2003) );
}
test_1700_is_not_leap() {
  ASSERT_FALSE( is_leap_year(1700) );
}
test_1800_is_not_leap() {
  ASSERT_FALSE( is_leap_year(1800) );
}
test_1900_is_not_leap() {
  ASSERT_FALSE( is_leap_year(1900) );
}
test_2100_is_not_leap() {
  ASSERT_FALSE( is_leap_year(2100) );
}
test_1704_is_leap() {
  ASSERT_TRUE(  is_leap_year(1704) );
}
test_1916_is_leap() {
  ASSERT_TRUE(  is_leap_year(1916) );
}
test_2012_is_leap() {
  ASSERT_TRUE(  is_leap_year(2012) );
}
test_2016_is_leap() {
  ASSERT_TRUE(  is_leap_year(2016) );
}
```


Group asserts within same concept
=================================

[Roy Osherove](http://www.owenpellegrin.com/blog/testing/how-do-you-solve-multiple-asserts/ "How do you solve multiple asserts?") (2010)

> Test one logical CONCEPT per test.  
> You can have multiple asserts on the same object.  
> They will usually be the same concept being tested.

Test                                    |    | Code
----------------------------------------|----|---------
`test()`                                | -> | `is_leap_year()`
`test1()` <br> `test2()` <br> `test3()` | -> | `is_leap_year()`


Group asserts
=============

```cpp
test_not_divisible_by_4_is_not_leap()
{
  ASSERT_FALSE( is_leap_year(   7) );
  ASSERT_FALSE( is_leap_year(  17) );
  ASSERT_FALSE( is_leap_year(2002) );
  ASSERT_FALSE( is_leap_year(2003) );
}

test_multiple_of_100_except_400_is_not_leap()
{
  ASSERT_FALSE( is_leap_year(1700) );
  ASSERT_FALSE( is_leap_year(1800) );
  ASSERT_FALSE( is_leap_year(1900) );
  ASSERT_FALSE( is_leap_year(2100) );
}

test_rest_is_leap()
{
  ASSERT_TRUE(  is_leap_year(1704) );
  ASSERT_TRUE(  is_leap_year(1916) );
  ASSERT_TRUE(  is_leap_year(2012) );
  ASSERT_TRUE(  is_leap_year(2016) );
}
```


Solution from Kevlin
====================

```cpp
TEST(A_year_is_not_a_leap_year, if_it_is_not_divisible_by_4)
{
    ASSERT_FALSE(is_leap_year(2015));
}

TEST(A_year_is_a_leap_year, if_it_is_divisible_by_4_but_not_by_100)
{
    ASSERT_TRUE(is_leap_year(2016));
}

TEST(A_year_is_not_a_leap_year, if_it_is_divisible_by_100_but_not_by_400)
{
    ASSERT_FALSE(is_leap_year(1900));
}

TEST(A_year_is_a_leap_year, if_it_is_divisible_by_400)
{
    ASSERT_TRUE(is_leap_year(2000));
}
```


One unit test = One expectation
===============================

[Kevlin Henney](https://twitter.com/kevlinhenney/status/438707024067825664) (2014)

> Using a **mock**, any test with more than one expectation
> is a test with more than one assertion.


Découpler les Tests Unitaires
=============================

[Test double][td]    | Definition
---------------------|-------------------------------------------
**Dummy** object     | Empty shell, no implementation
[Test **Stub**][ts]  | Minimal implementations, provide always the same response, no assert
[**Fake** object][fo]| Act like the real object, but in a simpler way
[**Mock** object][mo]| Contain assert
Test **Spy**         | Record events

[td]: http://en.wikipedia.org/wiki/Test_double
[ts]: http://en.wikipedia.org/wiki/Test_stubs
[fo]: http://en.wikipedia.org/wiki/Fake_object
[mo]: http://en.wikipedia.org/wiki/Mock_object

    TODO Fournir des exemples pour chacun de ces types de "Test double"

Test a class
============

Test       |     | Code
-----------|-----|---------
`test1()`  | ->  | `function1()`
`test2()`  | ->  | `function2()`
`test3()`  | ->  | `function3()`
`test4()`  | ->  | `function4()`
`test5()`  | ->  | `function5()`
`test6()`  | ->  | `function6()`


Test `std::vector`
==================

```cpp
test_empty();
test_begin();
test_end();
test_size();
test_capacity();
test_reserve();
test_push_back();
test_pop_back();
test_clear();
```


Test a class
============

Test                                       |     | Code
-------------------------------------------|-----|--------------
`test1()`                                  | ->  | `function1()`
`test2()`                                  | ->  | `function2()`
`test3()`                                  | ->  | `function3()`
`test4()`                                  | ->  | `function4()`
`test5()`                                  | ->  | `function5()`
`test6()`                                  | ->  | `function6()`
----------------                           |-----|--------------
`test10()` <br> `test11()`                 | ->  | `function1()`
`test20()` <br> `test21()` <br> `test22()` | ->  | `function2()`
`test30()` <br> `test31()`                 | ->  | `function3()`
`test40()` <br> `test41()` <br> `test42()` | ->  | `function4()`
`test50()` <br> `test51()` <br> `test52()` | ->  | `function5()`
`test60()` <br> `test61()`                 | ->  | `function6()`



Test `std::vector`
==================

```cpp
test_empty_1();
test_empty_2();
test_begin_1();
test_begin_2();
test_end_1();
test_end_2();
test_size_1();
test_size_2();
test_capacity_1();
test_capacity_2();
test_reserve_1();
test_reserve_2();
test_push_back_1();
test_push_back_2();
test_pop_back_1();
test_pop_back_2();
test_clear_1();
test_clear_2();
```


Test a class
============

Test                                       |     | Code
-------------------------------------------|-----|--------------
`test1()`                                  | ->  | `function1()`
`test2()`                                  | ->  | `function2()`
`test3()`                                  | ->  | `function3()`
`test4()`                                  | ->  | `function4()`
`test5()`                                  | ->  | `function5()`
`test6()`                                  | ->  | `function6()`
----------------                           |-----|--------------
`test10()` <br> `test11()`                 | ->  | `function1()`
`test20()` <br> `test21()` <br> `test22()` | ->  | `function2()`
`test30()` <br> `test31()`                 | ->  | `function3()`
`test40()` <br> `test41()` <br> `test42()` | ->  | `function4()`
`test50()` <br> `test51()` <br> `test52()` | ->  | `function5()`
`test60()` <br> `test61()`                 | ->  | `function6()`
----------------                           |-----|--------------
`test10()` <br> `test11()` <br> `test20()` <br> `test21()` <br> `test22()` <br> `test30()` <br> `test31()` <br> `test40()` <br> `test41()` <br> `test42()` <br> `test50()` <br> `test51()` <br> `test52()` <br> `test60()` <br> `test61()` | ->  | `function1()` <br> `function2()` <br> `function3()` <br> `function4()` <br> `function5()` <br> `function6()`


Granularity of Unit Test
========================

Test                                                                  |     | Code
----------------------------------------------------------------------|-----|------------
`test10()` <br> `test11()` <br> `test20()` <br> `test21()` <br> `...` | ->  | `function1()` <br> `function2()` <br> `function3()` <br> `function4()` <br> `function5()` <br> `function6()`
----------------                                                      |-----|------------
`test10()` <br> `test11()` <br> `test20()` <br> `test21()` <br> `...` | ->  | `ClassA`


Granularity of Unit Test
========================

Test                                                      |     | Code
----------------------------------------------------------|-----|------------
`test10()` <br> `test11()` <br> `test20()` <br> `test21()`| ->  | `ClassA`
----------------                                          |-----|------------
`test10()` <br> `test11()` <br> `test20()` <br> `test21()`| ->  | `ClassA` <br> `ClassB`


Granularity of Unit Test
========================

Test                                                      |     | Code                  |     | Dependency
----------------------------------------------------------|-----|-----------------------|-----|------------
`test10()` <br> `test11()` <br> `test20()` <br> `test21()`| ->  | `ClassA`              |     |
----------------                                          |-----|------------           |-----|------------
`test10()` <br> `test11()` <br> `test20()` <br> `test21()`| ->  | `ClassA` <br> `ClassB`|     |
----------------                                          |-----|------------           |-----|------------
`test10()` <br> `test11()` <br> `test20()` <br> `test21()`| ->  | `ClassA` <br> `ClassB`| ->  | `ClassC` <br> `ClassD` <br> `ClassE`


Test before or after development
================================

Process                       | Abbr.| Description
------------------------------|------|-----------------------------
Plain Old Unit Test           | POUT | Write the test **AFTER the feature**
[Test-Driven Development][TDD]| TDD  | Write the test **BEFORE the feature**
Defect-Driven Testing         | DDT  | Write the test **BEFORE the fix**

[TDD]: https://fr.wikipedia.org/wiki/Test_driven_development


Out of scope 
============

* [Test-Driven Decoupling](http://reuzz.net/video/watch/vid01KF44GogeBrs)
* Test-Driven Requirements (TDR)
* Defect-Driven Development (DDD)
* Design-Driven Development (D3)
* [Behavior-Driven Development][BDD] (BDD)
* [Acceptance Test–Driven Development][ATDD] (ATDD)
* Example-Driven Development (EDD)
* [Specification by example][SBE] (SBE)
* Story test–Driven Development (SDD)
* [Feature-Driven Development][FDD] (FDD)
* [Domain-Driven Design][DDD] (DDD)
* [Model-Driven Engineering][MDE] (MDE)
* [Model-driven architecture][MDA] (MDA)
* [Model-Driven Software Development][MDSD] (MDSD)

[BDD]:  http://fr.wikipedia.org/wiki/Behavior_driven_development
[ATDD]: http://en.wikipedia.org/wiki/Acceptance_test%E2%80%93driven_development
[SBE]:  http://en.wikipedia.org/wiki/Specification_by_example
[FDD]:  http://en.wikipedia.org/wiki/Feature-driven_development
[DDD]:  http://en.wikipedia.org/wiki/Domain-driven_design
[MDE]:  http://en.wikipedia.org/wiki/Model-driven_engineering
[MDA]:  http://en.wikipedia.org/wiki/Model-driven_architecture
[MDSD]: http://en.wikipedia.org/wiki/Model-driven_engineering


Where are the GUTs?
===================

**GUT**s = **G**ood **U**nit **T**ests

* POUT may produce GUTs
* TDD must produce GUTs
* DDT should produce GUTs

But... What are really GUTs?


Laver ses mains
===============

Philippe Bourgeon (2016)

> Le test unitaire est comme le [lavage des mains][Semmelweis] avant une intervention chirurgicale.
> Cette simple mesure au XIXe siècle a permis des progrès considérables.
>
> Certaines méthodes de programmation des années 90 pronnaient le [raffinnement][raff] :
> le développeur écrivaient des tartines de commentaires avant d'écrire le code.
>
> Les tests unitaires sont une bien meilleure solution
> car les écrits restent (commentaires) et le code s'envole (change).
> Donc le test est une documentation interactive avec le code :
> cette documentation est forcée d'évoluer avec le code.

[Semmelweis]: http://fr.wikipedia.org/wiki/Ignace_Philippe_Semmelweis
[raff]:       http://fr.wikipedia.org/wiki/Raffinement


Write test for people
=====================

[Gerard Meszaros](http://programmer.97things.oreilly.com/wiki/index.php/Write_Tests_for_People) ([CC-BY-3.0-US](https://creativecommons.org/licenses/by/3.0/us/) 2009), in French:

> Pour qui écrire les tests ?  
> La bonne réponse : Pour ceux qui essayeront de comprendre l'implémentation.
>
> Les bons tests documentent l'implémentation : ils décrivent le fonctionnement du code testé.  
> Pour chaque cas de test :
> 
> * Décrire le context, le point de départ ou les préconditions
> * Expliquer comment l'exigence est satisfaite
> * Décrire le résultat attendu ou les postconditions 


Le Test Unitaire décrit la fonctionnalité testée
================================================

[Nat Pryce et Steve Freeman](https://books.google.fr/books?id=QJA3dM8Uix0C) à la [conférence XP Day 2006 "Are Your Tests Really Driving Your Development?"](http://www.theregister.co.uk/2007/03/09/test_driven_development/), in French:

> Les tests unitaires doivent aller plus loin
> que la simple vérification des fonctionalités exigées.
>
> Les test doivent aussi clairement exprimer
> au lecteur ces fonctionalités exigées.
>
> => **Ces tests doivent formaliser la spécification.**
>
> Les tests qui ne sont pas écrits
> dans leur rôle de specifications à l'esprit
> peuvent être très confus à comprendre. 
>
> La difficulté de compréhension de ce qui est testé
> peut donc beaucoup réduire la facilité
> pour faire évoluer une base de code.


GUTs = Specification
====================

Les tests unitaires représentnent la spécification du code.

* Unit Test conveys knowledge.
* Unit Test tells a story.
* Function names reflect requirements.
* Function names are phrases (with underscores).


*should* and *must*
===================

* Attention *should* dans les spec veut dire *optional*  
  Donc non testé => Éviter *should*
* Exprimer le résultat et non le souhait  
  "X should give Y" --> "X gives Y"
* Préférer *must* à *shall* car plus explicite
* Ommetre *must*  
  "X must give Y" --> "X gives Y"

Unit Test coding rules
======================

> *function names are phrases*

Les règles de codage sont différentes
pour le code à destination de la prod
et celui des tests unitaires.


The Way of Testivus
===================

[Alberto Savoia](http://www.artima.com/weblogs/viewpost.jsp?thread=203994) (2007)

> 1.  If you write code, write tests.
> 2.  Don’t get stuck on unit testing dogma.
> 3.  Embrace unit testing karma.
> 4.  Think of code and test as one.
> 5.  The test is more important than the unit.
> 6.  The best time to test is when the code is fresh.
> 7.  Tests not run waste away.
> 8.  An imperfect test today is better than a perfect test someday.
> 9.  An ugly test is better than no test.
> 10. Sometimes, the test justifies the means.
> 11. Only fools use no tools.
> 12. Good tests fail.

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
* 199x : Décision de réutiliser le *Système de Référence Inertielle* (SRI) d'Ariane 4 (réputé fiable).
  Pour éviter de refaire des tests (800 kF), la calibration n'est pas désactivée (nécessaire pour Ariane 4).
* 1996 : Vol inaugural (v88) d'Ariane 5 (fusée 501)
* 1997 : Après 16 mois de vérifications, second vol, réussite.


Ariane 501
==========

*Un petit bug, un grand boum !*

* Le coût du lancement et des 4 satellites est de 2 milliard de francs
* L'accélération d'Ariane 5 est cinq fois plus élevée que Ariane 4
* Cette valeur sur 32 bits et copiée dans un registre de 16 bits trop petit ce qui provoque une interruption matérielle
* Les deux SRI (même matériel, même logiciel) se désactivent quasi simultannément (à 72 ms près)
* 37 secondes après le décollage, le pilote automatique prend les commandes
* Le *On Board Computer* (OBC) détecte que le SRI 1 est en panne et bascule sur le SRI 2
* Le SRI 2 remonte une erreur, mais l'OBC considère comme valeur de navigation, et braque au maximum la trajectoire de la fusée
* Un des deux boosters est arrachée à cause de la pression trop élevée et déclenche le système d'autodestruction de la fusée
* Les débris de la fusée tombent dans la mangrove et sont récupérés en partie dont l'EEPROM contenant les informations d'erreur


Code source Ada
===============

![Scan du code source Ada du SRI](http://olibre.github.io/CppCoding/GUTs/bug-Ariane-501_by-JeanJacquesLevy-INRIA-2010.jpg)


Un petit bug
============

Pour `L_M_BV_32` (**V**értical), les bornes -32768..32767 sont vérifiées :

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

Mais pas pour l'**H**orizontal :

```ada
P_M_DERIVE(T_ALG.E_BH) := UC_16S_EN_16NS (TDB.T_ENTIER_16S
                                   ((1.0/C_M_LSB_BH) *
                                   G_M_INFO_DERIVE(T_ALG.E_BH)));
```


Commission d'enquête
====================

* Rapport rendu un mois après le désastre d'Ariane 501
* Deux aspects importants du rapport
    1. La trajectoire spécifique d'Ariane 5 a été volontairement exclue des considérations de conception de l'élément qui calcule la trajectoire
    2. La commision d'enquête (composée d'ingénieurs logiciel) conclut à un problème logiciel
* Gérard Le Lann (INRIA) conclut plutôt à un problème d'intégration système
* Mark Dowson rappelle les réalités du projet
    * Pressions budgétaire et planning
    * Arguments *If it's not broke don't fix it*
    * Politique des managers


Que retenir du cas Ariane 501 ?
===============================

1. Le **changement** justifie les tests
2. Ne pas laisser tomber la **qualité** face
   * aux contraintes budget
   * aux contraintes planning
   * aux conservatisme
   * aux politiques...

Références :
    
* http://deschamp.free.fr/exinria/divers/ariane_501.html
* http://www.math.umn.edu/~arnold/disasters/ariane5rep.html (semble être la version anglaise du précédent)
* http://cmpe.emu.edu.tr/chefranov/Cmps201-fall2011/Notes/Ariane5failure.pdf
* http://moscova.inria.fr/~levy/talks/10enslongo/enslongo.pdf
* http://www.rvs.uni-bielefeld.de/publications/Reports/ariane.html (non lu mais parrait intéressant)


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

* Do not specify a pourcentage.
* Just request a high coverage.
* And check what is not covered (= not tested)
  * If the untested part is not relevant => OK (could this code be removed?)
  * Else something important is not tested => Add tests


Testivus and code coverage
==========================

[Alberto Savoia](http://www.artima.com/weblogs/viewpost.jsp?thread=203994) ([forum](http://www.artima.com/forums/flat.jsp?forum=106&thread=204677)) (2007)

> A programmer asked:
> 
> - I am ready to write some unit tests. What code coverage should I aim for?
> 
> The great master replied:
> 
> - Don’t worry about coverage, just write some good tests.
> 
> ...
> 
> Later, a second programmer asked the same question. The great master pointed at a pot of boiling water and said:
> 
> - How many grains of rice should put in that pot?
> - How can I possibly tell you? It depends on how many people you need to feed, how hungry they are, what other food you are serving, how much rice you have available, and so on.
> - Exactly
> 
> ...
> 
> A third programmer came and asked the same question. The master replied:
> 
> - 80%
> 
> ...
> 
> After, a young apprentice approached the great master:
> 
> - Great master, today I overheard you answer the same question about code coverage with three different answers. Why?
> - The first programmer is new and just getting started with testing. Right now he has a lot of code and no tests. He has a long way to go; focusing on code coverage at this time would be depressing and quite useless. He can worry about coverage later.  
>   The second programmer, on the other hand, is quite experience both at programming and testing. When I replied by asking how many grains of rice I should put in a pot, I helped to realize that the amount of testing necessary depends on a number of factors, and the programmer knows those factors better than I do – it’s her code after all. There is no single, simple, answer, and she’s smart enough.
> - I see, but if there is no single simple answer, then why did you answer the third programmer ‘80%’?
> - The third programmer wants only simple answers, even when there are no simple answers, and then does not follow them anyway.


Goodhart's law
==============

https://en.wikipedia.org/wiki/Goodhart's_law

Original:

> Any observed statistical regularity will tend to collapse once pressure is placed upon it for control purposes.
Goodhart's law

Simplified:

> When a measure becomes a target, it ceases to be a good measure

In French:

> Dès qu’un métrique devient un objectif, la mesure perd de son utilité.

Exemples

Quand un manager exige 90% de couverture de code,
alors le développeur est incité à laisser des lignes de code testées
mais sans aucune utilité (ou même, à en rajouter).


Continuous Testing
==================

The Pragmatic Programmer by Andrew Hunt and David Thomas

Tip 62

> * **Test early**
> * **Test often**
> * **Test automatically**


Tester les invariants et propriétés
===================================

What is more than *Code coverage*? *Value coverage!*

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

    TODO Fournir quelques exemples


Unit-Test Frameworks C++14 features
===================================

* [Catch](https://github.com/philsquared/Catch)
* [Mettle](https://github.com/jimporter/mettle)

See also https://en.wikipedia.org/wiki/List_of_unit_testing_frameworks#C.2B.2B

    TODO Fournir quelques exemples


Test-Driven Development
=======================

Développement **piloté** par les tests.

Écrire les tests unitaires au départ puis écrire le code de façon à faire fonctionner ces tests unitaires revient à écrire son code sous contrat. : changer le code c'est se confronter au contrat défini dans les tests unitaires. Et c'est plus rassurant que le cassage de code soit détecté au plus tôt car un développeur ne peut pas tout savoir sur le code qu'il modifie.

    TODO compléter Avantages:

* Quand on écrit les tests après on est moins motivé, on a envie de passer à autre chose.
* La fonctionnalité est écrite pour être testable


    TODO fournir images



TDD #1 Write the GUTs
=====================

```cpp
TEST(A_year_is_not_a_leap_year, if_it_is_not_divisible_by_4)
{
    ASSERT_FALSE(is_leap_year(2015));
}

TEST(A_year_is_a_leap_year, if_it_is_divisible_by_4_but_not_by_100)
{
    ASSERT_TRUE(is_leap_year(2016));
}

TEST(A_year_is_not_a_leap_year, if_it_is_divisible_by_100_but_not_by_400)
{
    ASSERT_FALSE(is_leap_year(1900));
}

TEST(A_year_is_a_leap_year, if_it_is_divisible_by_400)
{
    ASSERT_TRUE(is_leap_year(2000));
}
```


TDD #2 Write a buildable feature
================================

```cpp
bool is_leap_year (int year)
{
  return false;
}
```

Test                      | Case                                     | Result
--------------------------|------------------------------------------|-------
A_year_is_not_a_leap_year | if_it_is_not_divisible_by_4              |   ok
A_year_is_a_leap_year     | if_it_is_divisible_by_4_but_not_by_100   | **KO**
A_year_is_not_a_leap_year | if_it_is_divisible_by_100_but_not_by_400 |   ok
A_year_is_a_leap_year     | if_it_is_divisible_by_400                | **KO**


TDD #2 Fix the feature
======================


```cpp
bool is_leap_year (int year)
{
  bool leap; // value to return

  if (year % 4) leap = false;
  else leap = year % 100 ? true : year % 400;

  return leap;
}
```

Test                      | Case                                     | Result
--------------------------|------------------------------------------|-------
A_year_is_not_a_leap_year | if_it_is_not_divisible_by_4              |   ok
A_year_is_a_leap_year     | if_it_is_divisible_by_4_but_not_by_100   |   ok
A_year_is_not_a_leap_year | if_it_is_divisible_by_100_but_not_by_400 |   ok
A_year_is_a_leap_year     | if_it_is_divisible_by_400                | **KO**


TDD #3 All test must pass
=========================


```cpp
bool is_leap_year (int year)
{
  bool leap; // value to return

  if (year % 4) leap = false;
  else leap = year % 100 ? true : !(year % 400);

  return leap;
}
```

Test                      | Case                                     | Result
--------------------------|------------------------------------------|-------
A_year_is_not_a_leap_year | if_it_is_not_divisible_by_4              |   ok
A_year_is_a_leap_year     | if_it_is_divisible_by_4_but_not_by_100   |   ok
A_year_is_not_a_leap_year | if_it_is_divisible_by_100_but_not_by_400 |   ok
A_year_is_a_leap_year     | if_it_is_divisible_by_400                |   ok


TDD #4 Final implementation
===========================

```cpp
bool is_leap_year (int year)
{
  // common year = 365 days
  bool common_year = year % 4;
  if  (common_year) return false;

  // leap year = 366 days
  bool leap_year = year % 100;
  if  (leap_year) return true;

  common_year = year % 400;
  if (common_year) return false;

  return true;
}
```

Test                      | Case                                     | Result
--------------------------|------------------------------------------|-------
A_year_is_not_a_leap_year | if_it_is_not_divisible_by_4              |   ok
A_year_is_a_leap_year     | if_it_is_divisible_by_4_but_not_by_100   |   ok
A_year_is_not_a_leap_year | if_it_is_divisible_by_100_but_not_by_400 |   ok
A_year_is_a_leap_year     | if_it_is_divisible_by_400                |   ok


TDD #5 Final implementation can be optimized
============================================

L'implémentation n'a pas besoin d'exprimer la spécification,
c'est le rôle du test unitaire.

```cpp
bool is_leap_year_optimized (int year)
{
  return !(year % 4) - !(year % 100) + !(year % 400);
}
```

Test                      | Case                                     | Result
--------------------------|------------------------------------------|-------
A_year_is_not_a_leap_year | if_it_is_not_divisible_by_4              |   ok
A_year_is_a_leap_year     | if_it_is_divisible_by_4_but_not_by_100   |   ok
A_year_is_not_a_leap_year | if_it_is_divisible_by_100_but_not_by_400 |   ok
A_year_is_a_leap_year     | if_it_is_divisible_by_400                |   ok


TODO
====

https://www.reddit.com/r/programming/comments/2vzf3a/kevlin_henney_seven_ineffective_coding_habits_of/

* ISBN with more than 13 digits are malformed
* Anatomy of a test case (Given – When – Then)
* slide 91
* slide 101


https://www.softwarestrategy.co.uk/training/programming/tddcpp/
