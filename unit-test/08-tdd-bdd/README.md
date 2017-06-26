Methodologies
=============
<!--.slide: data-background="#300" data-background-transition="zoom"-->


Technical debt
--------------

* Technology debt (outdated underlying technologies)
* Documentation debt (too little or too much)
* **Test debt**

<!-- -->

* How is your project in debt?
* How to reduce your **test debt**?


Test before or after development
--------------------------------

                                  Process                           |Sigle| Description
--------------------------------------------------------------------|-----|-----------------------------
<!--.element: class="fragment"--> Plain Old Unit Test               | POUT| Write the test **AFTER the feature**
<!--.element: class="fragment"--> [Test-First Programming][TFD]     | TFD | Write the test **BEFORE the feature**
<!--.element: class="fragment"--> [Test-Driven Development][TDD]    | TDD | The test is **the design** of the implementation
<!--.element: class="fragment"--> [Behavior-Driven Development][BDD]| BDD | Same as TDD but **business oriented**
<!--.element: class="fragment"--> Defect-Driven Testing             | DDT | Write the test **BEFORE the fix**

[TFD]: https://stackoverflow.com/a/17707188/938111
[TDD]: https://fr.wikipedia.org/wiki/Test_driven_development
[BDD]: https://fr.wikipedia.org/wiki/Behavior_driven_development


Out of scope (1)
------------

Sigle  | Methodologie
-------|--------------------------------------------------------------
~~TDD~~| [Test-Driven Decoupling](http://reuzz.net/video/watch/vid01KF44GogeBrs)
  TDR  | Test-Driven Requirements
  DDD  | Defect-Driven Development
  D3   | Design-Driven Development
  ATDD | [Acceptance Test–Driven Development][ATDD]

[ATDD]: http://en.wikipedia.org/wiki/Acceptance_test%E2%80%93driven_development


Out of scope (2)
------------

Sigle  | Methodologie
-------|--------------------------------------------------------------
  EDD  | Example-Driven Development
  SBE  | [Specification By Example][SBE]
  SDD  | Story test–Driven Development
  FDD  | [Feature-Driven Development][FDD]

[SBE]:  http://en.wikipedia.org/wiki/Specification_by_example
[FDD]:  http://en.wikipedia.org/wiki/Feature-driven_development


Out of scope (3)
------------

Sigle  | Methodologie
-------|--------------------------------------------------------------
  DDD  | [Domain-Driven Design][DDD]
  MDE  | [Model-Driven Engineering][MDE]
  MDA  | [Model-Driven Architecture][MDA]
  MDSD | [Model-Driven Software Development][MDSD]
  OOAD | [Object-Oriented Analysis and Design][OOAD]

[DDD]:  http://en.wikipedia.org/wiki/Domain-driven_design
[MDE]:  http://en.wikipedia.org/wiki/Model-driven_engineering
[MDA]:  http://en.wikipedia.org/wiki/Model-driven_architecture
[MDSD]: http://en.wikipedia.org/wiki/Model-driven_engineering
[OOAD]: http://en.wikipedia.org/wiki/Object-oriented_analysis_and_design


Out of scope (4)
------------

Sigle  | Methodologie
-------|--------------------------------------------------------------
  MBD  | [Model-Based Design][MBD]
  MBT  | [Model-Based Testing][MBT]
  DDT  | [Data-Driven Testing][DDT]
  KDT  | [Keyword-Driven Testing][KDT]

[MBD]:  http://en.wikipedia.org/wiki/Model-based_design
[MBT]:  http://en.wikipedia.org/wiki/Model-based_testing
[DDT]:  http://en.wikipedia.org/wiki/Data-driven_testing
[KDT]:  http://en.wikipedia.org/wiki/Keyword-driven_testing


Where is the GUT?
-----------------

<!--.element: class="fragment"-->
**G**reat **U**nit **T**ests is **not** a methodology

* <!--.element: class="fragment"--> POUT **may** produce **GUT**s
* <!--.element: class="fragment"--> TFD **should** produce **GUT**s
* <!--.element: class="fragment"--> TDD **must** produce **GUT**s
* <!--.element: class="fragment"--> BDD **must** produce **GUT**s
* <!--.element: class="fragment"--> DDT **should** produce **GUT**s

**GUT**s are **the result** of different methodologies


Test-Driven Development
-----------------------

Développement **piloté** par les tests: de la conception à l'imlémentation.

Philippe Bourgeon (2016)

> 1. Écrire les tests unitaires
> 2. Puis l'implémentation de façon à faire fonctionner ces tests
>
> => Cela revient à écrire son implémentation sous contrat :  
> Changer le code, c'est se confronter au contrat défini dans les tests unitaires.  
> Et c'est plus rassurant que le cassage de code soit détecté au plus tôt  
> car un développeur ne peut pas tout savoir sur le code qu'il modifie.


Les 3 étapes du TDD
-------------------

1. Écrire les tests unitaires (rien ne compile)
2. Une implémentation rapidement codée pour passer les tests
3. Améliorer son implémentation (simplifier, factoriser, optimiser)

[![Cycle du TDD][tdd_img]][tdd_lnk]

[tdd_img]: http://upload.wikimedia.org/wikipedia/commons/0/0e/Cycle-global-tdd.png
[tdd_lnk]: http://commons.wikimedia.org/wiki/File:Cycle-global-tdd.png


Deming wheel PDCA
-----------------

Le TDD a quelques points communs avec la [roue de Deming](https://fr.wikipedia.org/wiki/Roue_de_Deming)

|         | [![Roue PDCA][r_img]][r_lnk]
|---------|------------------------------------------------
|**Plan** | Planifier les tests à écrire (la spécification)
|**Do**   | Développer les tests
|**Check**| Contrôler le résultat des tests
|**Act**  | Ajuster l'implémentation

[r_img]: http://upload.wikimedia.org/wikipedia/commons/6/6d/Deming_PDCA_cycle.PNG "Roue Plan-Do-Check-Act"
[r_lnk]: http://commons.wikimedia.org/wiki/File:Deming_PDCA_cycle.PNG


POUT versus TDD
---------------

### POUT

* L'implémentation n'est pas forcément codée pour être testable.
* Après avoir implémenté la fonctionnalité, on est pressé par le planning,
  on a envie de passer à autre chose, on bacle les tests.

### TDD

* On est motivé pour coder les tests car cela revient à réflechir à la spec et à la conception.
* Puis c'est un challenge de coder une implémentation qui réussi le défi que l'on s"est donné.
* On peut se permettre tous les refactoring inimaginables, de toute façon les tests sont là pour nous dire si c'est toujours OK.
* Au final, on a forcément une implémentation documentée par les tests (GUTs).

        TODO D'autres idées ?

* https://www.softwarestrategy.co.uk/training/programming/tddcpp/


TDD #1 Write the GUTs
---------------------

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

Exercice : Implémenter la fonction `is_leap_year()`


TDD #2 Write a buildable feature
--------------------------------

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
----------------------

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
-------------------------

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
---------------------------

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
--------------------------------------

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
---------------------------

* Given
* When
* Then


[Gerard Meszaros](http://programmer.97things.oreilly.com/wiki/index.php/Write_Tests_for_People) ([CC-BY-3.0-US](https://creativecommons.org/licenses/by/3.0/us/) 2009)

> Pour chaque cas de test :
>
> **Given** &nbsp; Décrire le context, le point de départ ou les préconditions  
> **When** &emsp; Expliquer comment l'exigence est satisfaite  
> **Then** &emsp; Décrire le résultat attendu ou les postconditions


BDD Python example
------------------

```python
class LeapYearSpec:

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


TDD versus BDD
--------------

### TDD

    years_not_divisible_by_4_are_not_leap_years
    years_divisible_by_4_but_not_by_100_are_leap_years
    years_divisible_by_100_but_not_by_400_are_not_leap_years
    years_divisible_by_400_are_leap_years

### BDD

    given_a_year_when_it_is_not_divisible_by_4_then_it_is_not_a_leap_year
    given_a_year_when_it_is_divisible_by_4_but_not_by_100_then_it_is_a_leap_year
    given_a_year_when_it_is_divisible_by_100_but_not_by_400_then_it_is_not_a_leap_year
    given_a_year_when_it_is_divisible_by_400_then_it_is_a_leap_year


Defect-Driven Testing
---------------------

    TODO


Not yet TDD/BDD/DDT
-------------------

Even if you do not use TDD, BDD, DDT...
or you do not apply them strictly
you can still obtain **GUT**.
