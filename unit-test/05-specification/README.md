Tests Unitaire, support de la Spécification
===========================================
<!--.slide: data-background="#502" data-background-transition="zoom"-->


Où écrire la documentation ?
----------------------------

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


Write tests for people
----------------------

[Gerard Meszaros](http://programmer.97things.oreilly.com/wiki/index.php/Write_Tests_for_People) ([CC-BY-3.0-US](https://creativecommons.org/licenses/by/3.0/us/) 2009)

> Pour qui écrire les tests ?  
> Pour ceux qui essayeront de comprendre l'implémentation.
>
> Les tests documentent l'implémentation :  
> Ils décrivent le fonctionnement du code testé.
>
> Pour chaque cas de test :
>
> * Décrire le context, le point de départ ou les préconditions
> * Expliquer comment l'exigence est satisfaite
> * Décrire le résultat attendu ou les postconditions


Le test unitaire décrit la fonctionnalité testée
------------------------------------------------

[Nat Pryce et Steve Freeman](https://books.google.fr/books?id=QJA3dM8Uix0C) à la  
[conférence XP Day 2006 "Are Your Tests Really Driving Your Development?"](http://www.theregister.co.uk/2007/03/09/test_driven_development/), in French:

> Le test unitaire doit aller plus loin
> que la simple vérification de la fonctionalité :
> le test doit clairement exprimer
> ce que fait cette fonctionnalité au lecteur.
>
> => **Le test unitaire doit formaliser la spécification.**
>
> Le test unitaire n'ayant pas été écrit
> avec à l'esprit son rôle de specification
> peut être très confus à comprendre.
>
> Plus il est difficile de comprendre de ce qui est testé,
> plus il peut être difficile de faire évoluer une base de code.


Le test unitaire est la specification
-------------------------------------

### **G**reat **U**nit **T**ests

* Unit Test conveys knowledge.
* Unit Test tells a story.
* Function names reflect requirements.
* Function names are phrases (with underscores).


*Should* and *Must*
-------------------

* Attention *should* dans les spec veut dire *optional*  
  Donc non testé => Éviter *should*
* Exprimer le résultat et non le souhait  
  "X should give Y" -> "X gives Y"
* Préférer *must* à *shall* car plus explicite
* Omettre *must*  
  "X must give Y" -> "X gives Y"


Coding rules for Unit Test
--------------------------

> *function names are phrases*

Les règles de codage sont différentes
pour le code à destination de la prod
et pour celui des tests unitaires.


Exercise: Rewrite unit test from scratch
----------------------------------------

[Algorithm from wikipedia](http://en.wikipedia.org/wiki/Leap_year#Algorithm):

> * **if** (year is not divisible by 4) **then** (it is a common year)
> * **else** if (year is not divisible by 100) **then** (it is a leap year)
> * **else** if (year is not divisible by 400) **then** (it is a common year)
> * **else** (it is a leap year)

Provide GUTs using [*Google Test*][gt] syntax:

    TEST(case_name, test_name)

[gt]:   http://en.wikipedia.org/wiki/Google_Test


Comment this result
-------------------

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
---------------------------

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


Real value of tests
-------------------

[Charles Antony Richard Hoare](https://en.wikiquote.org/wiki/C._A._R._Hoare#Sourced) (1996)

> The real value of tests is not that they detect bugs in the code,
> but that they detect inadequacies in the methods, concentration,
> and skills of those who design and produce the code.
