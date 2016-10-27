Cheat sheet
===========
    
TDD et BDD préconisent d'écrire les tests :
    
* Avant de coder la fonctionnalité
* Avec les caractéristiques des GUTs :
    
  * **GUT**s = **G**ood **U**nit **T**ests
  * Chaque fonction de test doit écouer pour une unique raison ;
  * Le nom de la fonction de test doit exprimer un élément de la spécification ;
  * Les fonctions de tests sont la documentation de la fontionnalité ;
  * ...

On peut écrire des GUTs même si on ne respectent pas scrupuleusement les TDD/BDD.

Pour optimiser l'exécution des tests en parrallèle de manière reproductible,
distinguer ceux qui n'accèdent ni aux fichiers ni au réseau des autres tests.

    TODO Compléter/Résumer...


Kevlin Henney
=============
    
This documents has been inspired from [**Kevlin**][HKi] [**Henney**][HKs]'s trainings (and also from many other Unit-Testing documents).
    
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


Classic Development Cycle in V
==============================
    
[![Cycle en V][v_svg]][v_lnk]
    
[v_svg]: http://upload.wikimedia.org/wikipedia/commons/f/f9/V-model.svg
[v_lnk]: http://commons.wikimedia.org/wiki/File:V-model.svg


Cost of bug correction
======================
    
Le coût de correction dépend de l'organisation,
des process mais aussi des enjeux.
Le tableau suivant est une extrapolation déduite du
*[Error Cost Escalation Through the Project Life Cycle][nasa]* (NASA 2004).
    
[SDLC][SDLC] steps            | Cost |&nbsp;| [STLC][STLC] steps  | Cost
------------------------------|------|------|---------------------|------
Customers' needs              |  0   |      | Production error    | 1000x
[Requirements analysis][ra]   |  1x  |      | [Acceptance testing][at]  |  200x
[Functional specification][fs]|  5x  |      | [Integration testing][it] |  100x
[Design][sd]                  | 10x  |      | [Unit Testing][ut]        |   50x
Implentation                  | 25x  |      |                     | 
    
[nasa]: http://ntrs.nasa.gov/search.jsp?R=20100036670
[SDLC]: http://en.wikipedia.org/wiki/Software_development_process   "Software Development Life Cycle"
[STLC]: http://en.wikipedia.org/wiki/Software_testing_life_cycle    "Software Testing Life Cycle"
[ra]:   http://en.wikipedia.org/wiki/Requirements_analysis
[fs]:   http://en.wikipedia.org/wiki/Functional_specification
[sd]:   http://en.wikipedia.org/wiki/Software_design
[at]:   http://en.wikipedia.org/wiki/Acceptance_testing
[it]:   http://en.wikipedia.org/wiki/Integration_testing
[ut]:   http://en.wikipedia.org/wiki/Unit_testing


Qui teste ?
===========
    
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


Ariane 5
========
    
La théorie
----------
    
https://www.youtube.com/watch?v=_rNmszfIvAw
    
Vol d'inauguration
------------------
    
4 juin 1996, Ariane 501, Vol 88 (4 satellites)  
https://www.youtube.com/watch?v=fCnO-UYF3co


Chronologie
===========
    
* 1981 : Conception Ariane 4
* 1987 : Conception Ariane 5
* 1988 à 2003 : Ariane 4, 15 ans de service, 97% de succès (116 lancements)
* 199x : Décision de réutiliser le *Système de Référence Inertielle* (SRI) d'Ariane 4 (réputé fiable).
  Pour éviter de refaire des tests (800 kF), la calibration n'est pas désactivée (nécessaire pour Ariane 4).
* 1996 : Vol inaugural (v88) d'Ariane 5 (fusée 501)
* 1997 : Après 16 mois de vérifications, second vol, réussite.
* Ce bug de 1996 a longtemps été le bug le plus coûteux du monde !


Un petit bug, un grand boum !
=============================
    
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
    
[![Scan du code source Ada du SRI][AdaCode]][AdaRef]
    
[AdaCode]: http://olibre.github.io/CppCoding/GUTs/bug-Ariane-501_by-JeanJacquesLevy-INRIA-2010.jpg "La composante verticale (variable L_M_BV_32) est vérifiée avant conversion 16 bits, mais pas pour la composante horizontale"
[AdaRef]:  http://moscova.inria.fr/~levy/talks/10enslongo/enslongo.pdf


Le petit bug
============
    
Les bornes -32768..32767 de la composante **V**érticale `BV` sont vérifiées :
    
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
====================
    
* [Rapport][Ariane5rapport] rendu un mois après le désastre d'Ariane 501 (read also: [Arnold][arnold] and [Bielefeld][bielefeld])
* Deux aspects importants du rapport
    1. La trajectoire spécifique d'Ariane 5 a été volontairement exclue des considérations de conception de l'élément qui calcule la trajectoire
    2. La commision d'enquête (composée d'ingénieurs logiciel) conclut à un problème logiciel
* [Gérard Le Lann][Ariane5failure] (INRIA) conclut plutôt à un problème d'intégration système
* [Mark Dowson][Ariane5failure] rappelle les réalités du projet
    * Pressions budgétaire et planning
    * Arguments *If it's not broke don't fix it*
    * Politique des managers
    
[Ariane5rapport]: http://deschamp.free.fr/exinria/divers/ariane_501.html
[arnold]:         http://www.math.umn.edu/~arnold/disasters/ariane5rep.html        "TODO: version anglaise à confirmer..."
[bielefeld]:      http://www.rvs.uni-bielefeld.de/publications/Reports/ariane.html "TODO: à lire..."
[Ariane5failure]: http://cmpe.emu.edu.tr/chefranov/Cmps201-fall2011/Notes/Ariane5failure.pdf
    

Que retenir du cas Ariane 501 ?
===============================
    
1. Le **changement** justifie le test
2. Ne pas laisser tomber la **qualité** face
   * aux contraintes budget
   * aux contraintes planning
   * au conservatisme ([continuous refactoring][cr])
   * à la politique...
    
[cr]: http://programmer.97things.oreilly.com/wiki/index.php/Continuous_Refactoring


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
    
* What is important for you?
* Next section is opposite to last point *"Good tests fail"*.


Do not write tests to find bugs
===============================
    
Si la finalité était de trouver des bugs et que l'on n'en trouve pas,
alors on peut se dire qu'écrire des tests ne sert à rien.
    
La finalité est autre : Détecter les changements dans le code qui causent des régressions.
Et si le code ne change plus => Continuons à lancer les tests unitaires car cela pourrait changer.


Que veut dire "Test Unitaire" ?
===============================
    
De quoi parle t'on quand on parle de "Test Unitaire" ?


Une bonne définition du "Test Unitaire"
======================================
    
* Les tests unitaires ne doivent pas interférer entre eux (même un test avec lui-même).
    
    * Donc ils peuvent tous être exécutés en parallèle
    * Pas d'accés aux ressources file-system, réseau, affinité CPU, base de données, horloge...
    
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
    
[**Année bissextile**](http://fr.wikipedia.org/wiki/Année_bissextile#Règle_actuelle)
    
Depuis le calendrier grégorien, l'année est bissextile :
    
* si l'année est divisible par 4 et non divisible par 100, ou
* si l'année est divisible par 400.
    
```cpp
bool is_leap_year(int year);
```


Test the function `is_leap_year()`
==================================
    
Is this test a good idea?
    
```cpp
test()
{
  // Test all years until 10'000
  for (int y=1; y<10*1000; ++y)
  {
    bool leap;
    if (y % 4)
      leap = false;
    else
      leap = y % 100 ? true : y % 400;

    // Check if same result
    actual = is_leap_year(y);
    ASSERT_EQUAL(leap, actual);
  }
}
```


Implement `is_leap_year()`
==========================
    
```cpp
bool is_leap_year (int year)
{
  bool leap; // value to return

  if (year % 4) leap = false;
  else leap = year % 100 ? true : year % 400;

  return leap;
}
```
    
* The feature use the same implementation as the test!
* Finally, what is the added value of the test?


Just test some cases
====================
    
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
    
* Is this a godd way of testing?
* What can be improved?


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


One unit test = One expectation
===============================
    
[Roy Osherove](http://programmers.stackexchange.com/questions/7823) (2010)
    
> **Unit tests should fail for exactly one reason.**  
> That’s why you should use one assert per unit test.
    
[He has also added](http://www.owenpellegrin.com/blog/testing/how-do-you-solve-multiple-asserts/ "How do you solve multiple asserts?") (2010)
    
> Test one logical CONCEPT per test.  
> You can have multiple asserts on the same object.  
> They will usually be the same concept being tested.
    
&nbsp;    | Unit Test                             | Feature
----------|---------------------------------------|------------------
**Bad**   | `big_test()`                          |-> `is_leap_year()`
**Good**  | `test1()`<br> `test2()`<br> `test3()` |-> `is_leap_year()`


One feature = multiple test cases
=================================
    
Original idea
-------------
    
Unit Tests|    Code
----------|---------------
`test1()` | -> `feature1()`
`test2()` | -> `feature2()`
`test3()` | -> `feature3()`
    
Idea *One unit test = One expectation*
--------------------------------------
    
Unit Tests                                                 |   Code
-----------------------------------------------------------|---------------
`test11()`<br>`test12()`<br>`test13()`<br>`test14()`<br>...| -> `feature1()`
`test21()`<br>`test22()`<br>`test23()`<br>`test24()`<br>...| -> `feature2()`
`test31()`<br>`test32()`<br>`test33()`<br>`test34()`<br>...| -> `feature3()`


Split big test function
=======================
    
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


Où écrire la documentation ?
============================
    
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
> Pour ceux qui essayeront de comprendre l'implémentation.
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
    
> Le test unitaire doit aller plus loin
> que la simple vérification de la fonctionalité :
> le test doit clairement exprimer
> ce que fait cette fonctionnalité au lecteur.
>
> => **Le test unitaire doit formaliser la spécification.**
>
> Le test unitaire n'ayant pas été écrit
> avec à l'esprit son rôle de specification
> peut être très confu à comprendre.
>
> Plus il est difficile de comprendre de ce qui est testé,
> plus il peut être difficile de faire évoluer une base de code.


GUTs = Specification
====================

**GUT**s = **G**ood **U**nit **T**ests

Les tests unitaires représentnent la spécification du code.

* Unit Test conveys knowledge.
* Unit Test tells a story.
* Function names reflect requirements.
* Function names are phrases (with underscores).


*Should* and *Must*
===================
    
* Attention *should* dans les spec veut dire *optional*  
  Donc non testé => Éviter *should*
* Exprimer le résultat et non le souhait  
  "X should give Y" -> "X gives Y"
* Préférer *must* à *shall* car plus explicite
* Ommetre *must*  
  "X must give Y" -> "X gives Y"


Coding rules for Unit Test 
==========================
    
> *function names are phrases*
    
Les règles de codage sont différentes
pour le code à destination de la prod
et pour celui des tests unitaires.


Exercise: Rewrite unit test from scratch
========================================
    
[Algorithm from wikipedia](http://en.wikipedia.org/wiki/Leap_year#Algorithm):
    
> * **if** (year is not divisible by 4) **then** (it is a common year)
> * **else** if (year is not divisible by 100) **then** (it is a leap year)
> * **else** if (year is not divisible by 400) **then** (it is a common year)
> * **else** (it is a leap year)
    
Provide GUTs based on [*Google Test*][gt] syntax:
    
    TEST(case_name, test_name)



Comment this result
===================
    
Improve the following tests:
    
```cpp
TEST(is_leap_year, years_not_divisible_by_4_are_not_leap_years)
{
  ASSERT_FALSE( is_leap_year(   7) );
  ASSERT_FALSE( is_leap_year(  17) );
  ASSERT_FALSE( is_leap_year(2002) );
  ASSERT_FALSE( is_leap_year(2003) );
}

TEST(is_leap_year, years_divisible_by_4_but_not_by_100_are_leap_years)
{
  ASSERT_FALSE( is_leap_year(1700) );
  ASSERT_FALSE( is_leap_year(1800) );
  ASSERT_FALSE( is_leap_year(1900) );
  ASSERT_FALSE( is_leap_year(2100) );
}

TEST(is_leap_year, years_divisible_by_100_but_not_by_400_are_not_leap_years)
{
  ASSERT_TRUE(  is_leap_year(1704) );
  ASSERT_TRUE(  is_leap_year(1916) );
  ASSERT_TRUE(  is_leap_year(2012) );
  ASSERT_TRUE(  is_leap_year(2016) );
}
```


Solution from Kevlin Henney
===========================
    
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


Unit-Test Frameworks C++14 features
===================================

* [Catch](https://github.com/philsquared/Catch) (**C**++ **A**utomated **T**est **C**ases in **H**eaders)
* [Mettle](https://github.com/jimporter/mettle)
* [73 C++ UT frameworks][UTwiki] listed on Wikipedia
    
[UTwiki]: http://en.wikipedia.org/wiki/List_of_unit_testing_frameworks#C++


Catch
=====

```cpp
#define CATCH_CONFIG_MAIN
#include "catch.hpp"

TEST_CASE("A year is not a leap year if it is not divisible by 4", "[leap]") {
    REQUIRE( is_leap_year(2015) == false );
}

TEST_CASE("A year is a leap year if it is divisible by 4 but not by 100", "[leap]") {
    REQUIRE( is_leap_year(2016) == true );
}

TEST_CASE("A year is not a leap year if it is divisible by 100 but not by 400", "[leap]") {
    REQUIRE( is_leap_year(1900) == false );
}

TEST_CASE("A year is a leap year if it is divisible by 400", "[leap]") {
    REQUIRE( is_leap_year(2000) == true );
}
```

    TODO Fournir plus d'exemples sur la puissance de Catch


Mettle
======

```cpp
#include <mettle.hpp>

mettle::suite<> basic("Leap Year", [](auto &_) {

  _.test("A year is not a leap year if it is not divisible by 4", []() {
    mettle::expect(false, is_leap_year(2015));
  });

  _.test("A year is a leap year if it is divisible by 4 but not by 100", []() {
    mettle::expect(true, is_leap_year(2016));
  });

  _.test("A year is not a leap year if it is divisible by 100 but not by 400", []() {
    mettle::expect(false, is_leap_year(1900));
  });

  _.test("A year is a leap year if it is divisible by 400", []() {
    mettle::expect(true, is_leap_year(2000));
  })
}

```


Python Unit Test
================
    
Bibliothèque [unittest](https://docs.python.org/3/library/unittest.html)
(anciennement PyUnit) dont les fonctions de test sont prefixées par `test`.
    
```python
import unittest

class TestLeapYear(unittest.TestCase):

  def test_A_year_is_not_a_leap_year_if_it_is_not_divisible_by_4(self):
    self.assertFalse(is_leap_year(2015))

  def test_A_year_is_a_leap_year_if_it_is_divisible_by_4_but_not_by_100(self):
    self.assertTrue(is_leap_year(2016))

  def test_A_year_is_not_a_leap_year_if_it_is_divisible_by_100_but_not_by_400(self):
    self.assertFalse(is_leap_year(1900))

  def test_A_year_is_a_leap_year_if_it_is_divisible_by_400(self):
    self.assertTrue(is_leap_year(2000))

if __name__ == '__main__':
    unittest.main()
```


Run Python Unit Test
====================
    
```bash
> python test_leap_year.py
F...
======================================================================
FAIL: test_A_year_is_a_leap_year_if_it_is_divisible_by_400 (__main__.TestLeapYear)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "test_leap_year.py", line 28, in test_A_year_is_a_leap_year_if_it_is_divisible_by_400
    self.assertTrue(is_leap_year(2000))
AssertionError: False is not true

----------------------------------------------------------------------
Ran 4 tests in 0.000s

FAILED (failures=1)

> python test_leap_year.py
....
----------------------------------------------------------------------
Ran 4 tests in 0.000s

OK
```


oktest (python)
===============
    
Annotations `@test`.
    
```python
import unittest
from oktest import ok, test

class TestLeapYear(unittest.TestCase):

  @test("A year is not a leap year if it is not divisible by 4")
  def _(self):
    ok (is_leap_year(2015)) == False
    
  @test("A year is a leap year if it is divisible by 4 but not by 100")
  def _(self):
    ok (is_leap_year(2016)) == True
    
  @test("A year is not a leap year if it is divisible by 100 but not by 400")
  def _(self):
    ok (is_leap_year(1900)) == False
    
  @test("A year is a leap year if it is divisible by 400")
  def _(self):
    ok (is_leap_year(2000)) == True

if __name__ == '__main__':
    unittest.main()
```


Run oktest
==========
    
```bash
> sudo pip install oktest
Collecting oktest
Installing collected packages: oktest
Successfully installed oktest-0.15.2

> python test_leap_year.py
...F
======================================================================
FAIL: test_004: A year is a leap year if it is divisible by 400 (__main__.TestLeapYear)
A year is a leap year if it is divisible by 400
----------------------------------------------------------------------
Traceback (most recent call last):
  File "test_leap_year.py", line 30, in _
    ok (is_leap_year(2000)) == True
AssertionError: False == True : failed.

----------------------------------------------------------------------
Ran 4 tests in 0.001s

FAILED (failures=1)

> python test_leap_year.py
....
----------------------------------------------------------------------
Ran 4 tests in 0.000s

OK
```


picotest (python)
=================
    
Beautiful !
    
```python
import picotest
test = picotest.new()

with test("Leap Year"):

  @test("A year is not a leap year if it is not divisible by 4")
  def _():
    assert not is_leap_year(2015)
    
  @test("A year is a leap year if it is divisible by 4 but not by 100")
  def _():
    assert is_leap_year(2016)
    
  @test("A year is not a leap year if it is divisible by 100 but not by 400")
  def _():
    assert not is_leap_year(1900)
    
  @test("A year is a leap year if it is divisible by 400")
  def _():
    assert is_leap_year(2000)

if __name__ == '__main__':
    picotest.main()
```


Run picotest
============
    
```bash
> sudo pip install picotest
Collecting picotest
Installing collected packages: picotest
Successfully installed picotest-0.2.0

> python test_leap_year.py 
#### test_leap_year.py
* Leap Year
  - [passed] A year is not a leap year if it is not divisible by 4
  - [passed] A year is a leap year if it is divisible by 4 but not by 100
  - [passed] A year is not a leap year if it is divisible by 100 but not by 400
  - [Failed] A year is a leap year if it is divisible by 400
----------------------------------------------------------------------
[Failed] Leap Year > A year is a leap year if it is divisible by 400
  File "test_leap_year.py", line 34, in _
    assert is_leap_year(2000)
AssertionError
----------------------------------------------------------------------
## total:4, passed:3, failed:1, error:0, skipped:0, todo:0

> python test_leap_year.py                                                                      
Traceback (most recent call last):
  File "test_leap_year.py", line 37, in <module>
    unittest.main()
NameError: name 'unittest' is not defined
[u:/tmp] 1 $ vim test_leap_year.py                                                                          
[u:/tmp] 46s $ python test_leap_year.py 
#### test_leap_year.py
* Leap Year
  - [passed] A year is not a leap year if it is not divisible by 4
  - [passed] A year is a leap year if it is divisible by 4 but not by 100
  - [passed] A year is not a leap year if it is divisible by 100 but not by 400
  - [passed] A year is a leap year if it is divisible by 400
## total:4, passed:4, failed:0, error:0, skipped:0, todo:0
```


JUnit
=====
    
JUnit 4: Annotation `@Test` has remplaced prefix `test`.
    
```java
import org.junit.Test;

public class LeapYearTest {
  @Test
  public void A_year_is_not_a_leap_year_if_it_is_not_divisible_by_4() {
    assertFalse(is_leap_year(2015));
  }
  @Test
  public void A_year_is_a_leap_year_if_it_is_divisible_by_4_but_not_by_100() {
    assertTrue(is_leap_year(2016));
  }
  @Test
  public void A_year_is_not_a_leap_year_if_it_is_divisible_by_100_but_not_by_400() {
    assertFalse(is_leap_year(1900));
  @Test
  public void A_year_is_a_leap_year_if_it_is_divisible_by_400() {
    self.assertTrue(is_leap_year(2000))
  }
}
```


JUnit using a message in assert
===============================
    
Not really readable.
    
```java
import org.junit.Test;

public class LeapYearTests {

  public void test_leap_year() {
    assertFalse("A year is not a leap year if it is not divisible by 4",              is_leap_year(2015));
    assertTrue( "A year is a leap year if it is divisible by 4 but not by 100",       is_leap_year(2016));
    assertFalse("A year is not a leap year if it is divisible by 100 but not by 400", is_leap_year(1900));
    assertTrue( "A year is a leap year if it is divisible by 400",                    is_leap_year(2000));
  }
}
```


Go Unit Test
============
    
Test functions are prefixed by `Test`.
    
```go
import "testing"

func Test_a_year_is_not_a_leap_year_if_it_is_not_divisible_by_4(t *testing.T) {
  if is_leap_year(2015) { t.Error(""); }
}
  
func A_year_is_a_leap_year_if_it_is_divisible_by_4_but_not_by_100(t *testing.T) {
  if is_leap_year(2016) == false { t.Error(""); }
}

func Test_A_year_is_not_a_leap_year_if_it_is_divisible_by_100_but_not_by_400(t *testing.T) {
  if is_leap_year(1900) { t.Error(""); }
}

func Test_A_year_is_a_leap_year_if_it_is_divisible_by_400(t *testing.T) {
  if is_leap_year(2000) == false { t.Error(""); }
}

//FIXME: use CamelCase notation
```


xUnit
=====
    
La grande majorité des frameworks de tests unitaires partagent la même phylosophie,
regroupée sous le terme [x**Unit**][x] à l'instar de [J**Unit**][j],
[Cpp**Unit**][cpp], [N**Unit**][n], [PHP**Unit**][php], [Http**Unit**][http],
[Html**Unit**][http]... mais aussi [GTest][gt].
    
Quelques caractéristiques :
    
* Fonctions **assert** pour comparer le résultat d'un test par rapport à une valeur attendue.
* Le **test case** représente un seul test (souvent implémenté comme une classe).
* La **test suite** est l'ensemble des **test cases** partageant la même **fixture**.
* La [**fixture**][f] et l'ensemble des preconditions avant de lancer les tests.
* La sortie XML est la même et permet d'être importée par des outils comme Jenkins.
    
[f]:    http://fr.wikipedia.org/wiki/Test_fixture
[x]:    http://fr.wikipedia.org/wiki/XUnit
[j]:    http://en.wikipedia.org/wiki/JUnit
[cpp]:  http://en.wikipedia.org/wiki/CppUnit
[n]:    http://en.wikipedia.org/wiki/NUnit
[php]:  http://en.wikipedia.org/wiki/PHPUnit
[http]: http://en.wikipedia.org/wiki/HttpUnit
[html]: http://en.wikipedia.org/wiki/HtmlUnit
[gt]:   http://en.wikipedia.org/wiki/Google_Test


Fixture
=======
    
Pour tester des composants, un environnement a souvent besoin d'être préparé avec des **stubs**/**mocks**.
Cette initialisation plus ou moins complexe est facilitée par la [**fixture**][f] :

* `SetUp()` initialise tout cet environnement ;
* `TearDown()` libére proprement (afin de ne pas perturber les autres tests).
    
        TODO Fournir exemples


Test a class #1
===============
    
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
=====================
    
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


Test a class #2
===============
    
Amélioration en séparant les asserts dans différentes fonctions.
    
Test                                     |   | Code
-----------------------------------------|---|--------------
`test1()`                                | ->| `function1()`
`test2()`                                | ->| `function2()`
`test3()`                                | ->| `function3()`
`test4()`                                | ->| `function4()`
`test5()`                                | ->| `function5()`
`test6()`                                | ->| `function6()`
----------------                         |---|--------------
`test10()`<br> `test11()`                | ->| `function1()`
`test20()`<br> `test21()`<br> `test22()` | ->| `function2()`
`test30()`<br> `test31()`                | ->| `function3()`
`test40()`<br> `test41()`<br> `test42()` | ->| `function4()`
`test50()`<br> `test51()`<br> `test52()` | ->| `function5()`
`test60()`<br> `test61()`                | ->| `function6()`


Test `std::vector` #3
=====================
    
Est-ce que chacun de ces tests peuvent tester qu'une seule fonction de la classe ? 
    
```cpp
test_empty_1();
test_empty_2();
test_size_1();
test_size_2();
test_push_back_1();
test_push_back_2();
test_pop_back_1();
test_pop_back_2();
test_clear_1();
test_clear_2();
```


Test a class #3
===============
    
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
----------------                         |---|--------------
`test10()`<br> `test11()`                | ->| `function1()`
`test20()`<br> `test21()`<br> `test22()` | ->| `function2()`
`test30()`<br> `test31()`                | ->| `function3()`
`test40()`<br> `test41()`<br> `test42()` | ->| `function4()`
`test50()`<br> `test51()`<br> `test52()` | ->| `function5()`
`test60()`<br> `test61()`                | ->| `function6()`
----------------                         |---|--------------
`test10()`<br> `test11()`<br> `test20()`<br> `test21()`<br> `test22()`<br> `test30()`<br> `test31()`<br> `test40()`<br> `test41()`<br> `test42()`<br> `test50()`<br> `test51()`<br> `test52()`<br> `test60()`<br> `test61()` | ->  | `function1()`<br> `function2()`<br> `function3()`<br> `function4()`<br> `function5()`<br> `function6()`


Test `std::vector` #3
=====================
    
Écrire les **GUT**s de la classe std::vector en se limiter aux fonctions suivantes :

    empty();
    size();
    push_back();
    pop_back();
    clear();


Test a feature #1
=================
    
Une classe = un ensemble de tests.
    
Test                                                              |   | Code
------------------------------------------------------------------|---|------------
`test10()`<br> `test11()`<br> `test20()`<br> `test21()`<br> `...` | ->| `function1()`<br> `function2()`<br> `function3()`<br> `function4()`<br> `function5()`<br> `function6()`
----------------                                                  |---|------------
`test10()`<br> `test11()`<br> `test20()`<br> `test21()`<br> `...` | ->| `ClassA`
    
Des suggestions ?


Test a feature #2
=================
    
* Mais quand deux classes sont intiment liées ?
* Les séparer avec des *dummy* / *stub* / *fake* / *mock* ?
* Et pouquoi pas les considérer comme faisant partie de la même fonctionnalité ?
    
Test                                                   |   | Code
-------------------------------------------------------|---|------------
`test10()`<br> `test11()`<br> `test20()`<br> `test21()`| ->| `ClassA`
----------------                                       |---|------------
`test10()`<br> `test11()`<br> `test20()`<br> `test21()`| ->| `ClassA`<br> `ClassB`


Test a feature #3
=================
    
* Et que faire des dépendances ?
* Les découpler avec *dummy* / *stub* / *fake* / *mock* ?
* Et pouquoi pas les considérer comme faisant partie de la même fonctionnalité ?
* On va pas découpler les `std::`, non ?
    
Test                                                   |   | Code                 |   | Dependency
-------------------------------------------------------|---|----------------------|---|------------
`test10()`<br> `test11()`<br> `test20()`<br> `test21()`| ->| `ClassA`             |   |
----------------                                       |---|------------          |---|------------
`test10()`<br> `test11()`<br> `test20()`<br> `test21()`| ->| `ClassA`<br> `ClassB`|   |
----------------                                       |---|------------          |---|------------
`test10()`<br> `test11()`<br> `test20()`<br> `test21()`| ->| `ClassA`<br> `ClassB`| ->| `ClassC`<br> `ClassD`<br> `ClassE`


Granularity of Unit Test
========================
    
* Bien doser la granularité d'un test unitaire
* Suivre son instinct
* Penser à une fonctionnalité unitaire dans son ensemble
* Ne pas s'embêter à découpler quand cela n'apporte pas grand chose


One class = Multiple features
=============================
    
* Que faire si on se rend compte que la classe expose différentes fonctionnalités ?
* Cela est révélateur d'une conception bancale...
* Solutions
    1. Coder différents jeux de tests unitaires indépendants ;
    2. Mieux : Découper la classe en fonctionnalités distinctes ([continuous refactoring][cr]) ;
    3. Encore mieux: Écrire les tests avant la classe, cela permet de corriger de rectifier le tir avant de devoir réécrire la fonctionnalité.


Dependencies on hardware
========================
    
* Que faire si l'objet accède à un fichier, un port réseau... ?
* Essayer de découpler l'objet avec son envronnement.


Découpler les Tests Unitaires
=============================
    
[Test double][td]| Definition
-----------------|-------------------------------------------
Dummy            | Empty shell, no implementation
[Stub][ts]       | Minimal implementations, provide always the same response, no assert
[Fake][fo]       | Act like the real object, but in a simpler way
[Mock][mo]       | Contain assert
Spy              | Record events
    
[td]: http://en.wikipedia.org/wiki/Test_double
[ts]: http://en.wikipedia.org/wiki/Test_stubs
[fo]: http://en.wikipedia.org/wiki/Fake_object
[mo]: http://en.wikipedia.org/wiki/Mock_object


Dummy
=====
    
A **dummy** object is an empty shell withou implementation.

    TODO Fournir exemples


Stub
====
    
A test [**Stub**][ts] is a minimal implementations providing always the same response (hard-coded) and does not contain assert.

    TODO Fournir exemples


Fake
====
    
A [**fake**][fo] object acts like the real object, but in a simpler way.

    TODO Fournir exemples


Mock
====

A [**Mock**][mo] object is a fake object containning asserts.
    
One unit test = One assert
--------------------------
    
[Roy Osherove](http://programmers.stackexchange.com/questions/7823) (2010)
    
> **Unit tests should fail for exactly one reason.**  
> That’s why you should use one assert per unit test.

One unit test = One expectation
-------------------------------
    
[Kevlin Henney](https://twitter.com/kevlinhenney/status/438707024067825664) (2014)
    
> Using a **mock**, any test with more than one expectation
> is a test with more than one assertion.

    TODO Fournir exemples de mock


Google Mock
===========
       
    TODO Fournir exemples


Spy
===

A test **spy** is any fack object having the capability to record events for further analysis.

    TODO Fournir exemples


Test before or after development
================================
    
Process                           | Abbr.| Description
----------------------------------|------|-----------------------------
Plain Old Unit Test               | POUT | Write the test **AFTER the feature**
[Test-Driven Development][TDD]    | TDD  | Write the test **BEFORE the feature**
[Behavior-Driven Development][BDD]| BDD  | Same as TDD
Defect-Driven Testing             | DDT  | Write the test **BEFORE the fix**
    
[TDD]: https://fr.wikipedia.org/wiki/Test_driven_development
[BDD]:  http://fr.wikipedia.org/wiki/Behavior_driven_development


Out of scope 
============
    
* [Test-Driven Decoupling](http://reuzz.net/video/watch/vid01KF44GogeBrs)
* Test-Driven Requirements (TDR)
* Defect-Driven Development (DDD)
* Design-Driven Development (D3)
* [Acceptance Test–Driven Development][ATDD] (ATDD)
* Example-Driven Development (EDD)
* [Specification by example][SBE] (SBE)
* Story test–Driven Development (SDD)
* [Feature-Driven Development][FDD] (FDD)
* [Domain-Driven Design][DDD] (DDD)
* [Model-Driven Engineering][MDE] (MDE)
* [Model-Driven Architecture][MDA] (MDA)
* [Model-Driven Software Development][MDSD] (MDSD)
* [Model-Based Testing][MBT] (MBT)
* [Model-Based Design][MBD] (MBD)
* [Data-Driven Testing][DDT] (DDT)
* [Keyword-Driven Testing][KDT] (KDT)
* [Object-Oriented Analysis and Design][OOAD] (OOAD)
    
[ATDD]: http://en.wikipedia.org/wiki/Acceptance_test%E2%80%93driven_development
[SBE]:  http://en.wikipedia.org/wiki/Specification_by_example
[FDD]:  http://en.wikipedia.org/wiki/Feature-driven_development
[DDD]:  http://en.wikipedia.org/wiki/Domain-driven_design
[MDE]:  http://en.wikipedia.org/wiki/Model-driven_engineering
[MDA]:  http://en.wikipedia.org/wiki/Model-driven_architecture
[MDSD]: http://en.wikipedia.org/wiki/Model-driven_engineering
[MBT]:  http://en.wikipedia.org/wiki/Model-based_testing
[MBD]:  http://en.wikipedia.org/wiki/Model-based_design
[DDT]:  http://en.wikipedia.org/wiki/Data-driven_testing
[KDT]:  http://en.wikipedia.org/wiki/Keyword-driven_testing
[OOAD]: http://en.wikipedia.org/wiki/Object-oriented_analysis_and_design


Where are the GUTs?
===================
    
**GUT**s = **G**ood **U**nit **T**ests  
**GUT**s is not a methodology.
    
Methodology | Result
------------|-------------------
POUT        | may produce GUTs
DDT         | should produce GUTs
TDD <br> BDD| must produce GUTs
    
**GUT**s can be the result of different methodologies.
    
Even if your organisation does not use TDD/BDD
(or does not apply it strictly),
you can still obtain **GUT**s.


Test-Driven Development
=======================
    
Développement **piloté** par les tests.

Philippe Bourgeaon (2016)
    
> 1. Écrire les tests unitaires
> 2. Puis l'implémentation de façon à faire fonctionner ces tests
> 
> => Cela revient à écrire son implémentation sous contrat :  
> Changer le code c'est se confronter au contrat défini dans les tests unitaires.
> Et c'est plus rassurant que le cassage de code soit détecté au plus tôt
> car un développeur ne peut pas tout savoir sur le code qu'il modifie.


Les 3 étapes du TDD
===================

1. Écrire les tests unitaires (rien ne compile)
2. Une implémentation rapidement codée pour passer les tests
3. Améliorer son implémentation (simplifier, factoriser, optimizer)


Deming wheel PDCA
=================
   
   Le TDD à quelques points communs avec la [roue de Deming](https://fr.wikipedia.org/wiki/Roue_de_Deming)
   
1. **Plan**  Planifier les tests à écrire (la spécification)
2. **Do**    Développer les tests
3. **Check** Contrôler le résultat des tests
4. **Act**   Ajuster l'implémentation


POUT versus TDD
===============

POUT
----

* L'implémentation n'est pas forcément codée pour être testable.
* Après avoir implémenté la fonctionnalité, on est pressé par le planning,
  on a envie de passer à autre chose, on bacle les tests.

TDD
---

* On est motivé pour coder les tests car cela revient à réflechir à la spec et à la conception.
* Puis c'est un challenge de coder une implémentation qui réussi le défi que l'on s"est donné.
* On peut se permettre tous les refactoring inimaginables, de toute façon les tests sont là pour nous dire si c'est toujours OK.
* Au final, on a forcément une implémentation documentée par les tests (GUTs).
    
        TODO D'autres idées ? 

* https://www.softwarestrategy.co.uk/training/programming/tddcpp/


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
    
Test                      | Case                                     |Result
--------------------------|------------------------------------------|------
A_year_is_not_a_leap_year | if_it_is_not_divisible_by_4              |  ok
A_year_is_a_leap_year     | if_it_is_divisible_by_4_but_not_by_100   |**KO**
A_year_is_not_a_leap_year | if_it_is_divisible_by_100_but_not_by_400 |  ok
A_year_is_a_leap_year     | if_it_is_divisible_by_400                |**KO**


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
    
Test                      | Case                                     |Result
--------------------------|------------------------------------------|------
A_year_is_not_a_leap_year | if_it_is_not_divisible_by_4              |  ok
A_year_is_a_leap_year     | if_it_is_divisible_by_4_but_not_by_100   |  ok
A_year_is_not_a_leap_year | if_it_is_divisible_by_100_but_not_by_400 |  ok
A_year_is_a_leap_year     | if_it_is_divisible_by_400                |**KO**


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
    
Test                      | Case                                     |Result
--------------------------|------------------------------------------|------
A_year_is_not_a_leap_year | if_it_is_not_divisible_by_4              |  ok
A_year_is_a_leap_year     | if_it_is_divisible_by_4_but_not_by_100   |  ok
A_year_is_not_a_leap_year | if_it_is_divisible_by_100_but_not_by_400 |  ok
A_year_is_a_leap_year     | if_it_is_divisible_by_400                |  ok


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
    
Test                      | Case                                     |Result
--------------------------|------------------------------------------|------
A_year_is_not_a_leap_year | if_it_is_not_divisible_by_4              |  ok
A_year_is_a_leap_year     | if_it_is_divisible_by_4_but_not_by_100   |  ok
A_year_is_not_a_leap_year | if_it_is_divisible_by_100_but_not_by_400 |  ok
A_year_is_a_leap_year     | if_it_is_divisible_by_400                |  ok


TDD #5 Implementation can be optimized
======================================
    
L'implémentation n'a pas besoin d'exprimer la spécification,
c'est le rôle du test unitaire.
    
```cpp
bool is_leap_year_optimized (int year)
{
  return !(year % 4) - !(year % 100) + !(year % 400);
}
```
    
Test                      | Case                                     |Result
--------------------------|------------------------------------------|------
A_year_is_not_a_leap_year | if_it_is_not_divisible_by_4              |  ok
A_year_is_a_leap_year     | if_it_is_divisible_by_4_but_not_by_100   |  ok
A_year_is_not_a_leap_year | if_it_is_divisible_by_100_but_not_by_400 |  ok
A_year_is_a_leap_year     | if_it_is_divisible_by_400                |  ok


Behavior-Driven Development
===========================
    
* Given
* When
* Then

[Gerard Meszaros](http://programmer.97things.oreilly.com/wiki/index.php/Write_Tests_for_People) ([CC-BY-3.0-US](https://creativecommons.org/licenses/by/3.0/us/) 2009), in French:
    
> Pour chaque cas de test :
> 
> * Décrire le context, le point de départ ou les préconditions
> * Expliquer comment l'exigence est satisfaite
> * Décrire le résultat attendu ou les postconditions 

    
BDD Python example
==================

```python
class  LeapYearSpec:

  @test
  def given_a_year_when_it_is_not_divisible_by_4_then_it_is_not_a_leap_year(self):
    assert not is_leap_year (2015)

  @test
  def given_a_year_when_it_is_divisible_by_4_but_not_by_100_then_it_is_a_leap_year(self):
    assert is_leap_year (2016)

  @test
  def given_a_year_when_it_is_divisible_by_100_but_not_by_400_then_it_is_not_a_leap_year(self):
    assert not is_leap_year(1900)

  @test
  def given_a_year_when_it_is_divisible_by_400_then_it_is_a_leap_year(self):
    assert is_leap_year(2000)
```

        
BDD versus TDD
==============

BDD
---
    
    given_a_year_when_it_is_not_divisible_by_4_then_it_is_not_a_leap_year
    given_a_year_when_it_is_divisible_by_4_but_not_by_100_then_it_is_a_leap_year
    given_a_year_when_it_is_divisible_by_100_but_not_by_400_then_it_is_not_a_leap_year
    given_a_year_when_it_is_divisible_by_400_then_it_is_a_leap_year

TDD
---
    
    years_not_divisible_by_4_are_not_leap_years
    years_divisible_by_4_but_not_by_100_are_leap_years
    years_divisible_by_100_but_not_by_400_are_not_leap_years
    years_divisible_by_400_are_leap_years


Defect-Driven Testing
=====================
    
    TODO


Real value of tests
===================

[Charles Antony Richard Hoare](https://en.wikiquote.org/wiki/C._A._R._Hoare#Sourced) (1996)

> The real value of tests is not that they detect bugs in the code,
> but that they detect inadequacies in the methods, concentration,
> and skills of those who design and produce the code.


Compilation
===========

&nbsp;            | Release    | Debug | Coverage
------------------|------------|-------|---------
`assert()`        | `-D NDEBUG`|       | `-D NDEBUG`
Optimisation      | `-Ofast`   | `-Og` | `-Og`


Commun aux trois *build types*

* Toujours les symboles de debug => `-g3`
* C'est fini les `i386` => `-march=sandybridge`

Le plus de compilateurs possibles

* MSVC sous Windows
* GCC et Clang sous Linux


Execution
=========

Les tests unitaires sont exécutés avec toutes les combinaisons :

* GCC, Clang
* Release, Debug, Coverage
* Valgring avec différentes options


Definition of Done (DoD)
========================

* Source code respects Security Rules
* Source code respects Coding Rules (`clang-format`, `cpplint`, `kwstyle`)
* Source code respects C++ Core Guidelines
* Doxygen comments are used when relevant (except for setters/getters...)
* No remaining FIXME
* No compiler warnings
* Unit-Tests respect TDD/GUTS guidelines
* Unit-Tests passed (no code coverage threshold)
   * Valgrind
* CppCheck
* [AddressSanitizer](https://en.wikipedia.org/wiki/AddressSanitizer) using build options `-fsanitize=*` ([clang](http://clang.llvm.org/docs/AddressSanitizer.html) and [gcc](https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html#index-fsanitize_003daddress-945))
* [clang-check](http://clang.llvm.org/docs/ClangCheck.html) (static code analyzer, detects code patterns that most probably are bugs and inspects control flow graph and do path-based analysis)
* [clang-tidy](http://clang.llvm.org/extra/clang-tidy/) (linter, checks coding style and address readability, and can fix C++ source code)
* No dead code


Couverture de code
==================
    
La finalité des tests unitaires n'est pas de faire du coverage.
Toutefois l'écriture des tests unitaires cherche à couvrir l'ensemble de la fonctionnalitée.
Du coup les indicateurs de coverage permettent de vérifier si on a oublié quelque chose.


Test coverage
=============

Coverage levels

* **File** / **Class** / **Function**
* **Line** / **Statement**
* **Branch** (exemple : toutes les combinaisons de `if(a && b && c)`)
* **Value** (couverture des plages de valeurs)
* **State machine** of a high-level usage model (Statistical testing, [MBT][MBT])


Coverage pourcentage
====================

* Do not specify a pourcentage.
* Just request a high coverage.
* And check what is not covered (i.e. not tested)
  * If the untested part is not relevant => OK (could this code be removed?)
  * Else => Something important is not tested => Add tests


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
    
[Original](http://en.wikipedia.org/wiki/Goodhart's_law)
---------
    
> Any observed statistical regularity will tend to collapse once pressure is placed upon it for control purposes.
Goodhart's law
    
Simplified
----------
    
> When a measure becomes a target, it ceases to be a good measure
    
In French
---------
    
> Dès qu’un métrique devient un objectif, la mesure perd de son utilité.
    
Exemples
--------
    
Quand un manager exige 90% de couverture de code,
alors le développeur est incité à laisser des lignes de code testées
mais sans aucune utilité (ou même, à en rajouter).


Tester les invariants et propriétés
===================================
    
What is more than *Code coverage*? *Value coverage*!
    
1. Exemple de [QuickCheck][qc] [avec GTest][qc-gt].
    
2. [CppQuickCheck][cqc] va plus loin que QuickCheck++
   en ajoutant la sélection aléatoire des générateurs de valeurs
   et la minimisation (shrinking) des données en entrée pour reproduire le problème.
    
3. [autocheck][ac] va encore plus loin que CppQuickCheck en passant à C++11.
    
4. [rapidcheck][rc] est une autre alternative intéressante avec shrinking
   et compatibilité STL/CMake/GTest/GMock/BoostTest/…
   (voir l'[article de son créateur][rcs] sur le site de Spotify)

[qc]:    https://en.wikipedia.org/wiki/QuickCheck
[qc-gt]: https://github.com/xinhuang/qcp
[cqc]:   https://github.com/grogers0/CppQuickCheck
[ac]:    https://github.com/thejohnfreeman/autocheck/wiki
[rc]:    https://github.com/emil-e/rapidcheck
[rcs]:   https://labs.spotify.com/2015/06/25/rapid-check/


QuickCheck
==========

    TODO Fournir quelques exemples



autocheck
=========

    TODO Fournir quelques exemples



rapidcheck
==========

    TODO Fournir quelques exemples


Continuous Testing
==================

The Pragmatic Programmer by Andrew Hunt and David Thomas

Tip 62

> * **Test early**
> * **Test often**
> * **Test automatically**
    
Continuous Testing is spart of:
    
* Continuous Integration (intégration continue)
* Continuous delivery (livraison continue)
* Continuous deployement (déploiement continue)


Some Continuous Testing Tools
=============================
    
Projets libres            | Descriptions
--------------------------|-------------------    
[Jenkins][J]              | Outil d'intégration continue très complet (anciennement Hudson)
[SonarQube][SC]           | Mesure la qualité du code source en continu
[GitLab CI][GLCI]         | Intégration Continue par GitLab
[Travis CI][T]            | Intégration Continue externalisée pour GitHub
[CTest][CT] (CMake)       | Exécute les tests définis avec CMake
[Robot Framework][RF]     | Automatisation de test permettant de simplifier la maintenance des scripts
    
[J]:    http://fr.wikipedia.org/wiki/Jenkins_(logiciel)
[SC]:   http://fr.wikipedia.org/wiki/SonarQube
[GLCI]: https://about.gitlab.com/gitlab-ci/
[T]:    http://fr.wikipedia.org/wiki/Travis_CI
[CT]:   https://cmake.org/Wiki/CMake/Testing_With_CTest
[RF]:   http://en.wikipedia.org/wiki/Robot_Framework


Google Benchmark
================
    
https://github.com/google/benchmark
    
    TODO Fournir exemples

