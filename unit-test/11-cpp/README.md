C++
===
<!--.slide: data-background="#325" data-background-transition="zoom"-->


Unit-Test Frameworks
====================


Google Test
-----------

    TODO


C++14 features
--------------

* [Catch](https://github.com/philsquared/Catch) (**C**++ **A**utomated **T**est **C**ases in **H**eaders)
* [Mettle](https://github.com/jimporter/mettle)
* [73 C++ UT frameworks][UTwiki] listed on Wikipedia

[UTwiki]: http://en.wikipedia.org/wiki/List_of_unit_testing_frameworks#C++


Catch
-----

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
------

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


Tester les invariants
---------------------

*Couverture de données*


QuickCheck
----------

    TODO Fournir quelques exemples


autocheck
---------

    TODO Fournir quelques exemples


rapidcheck
----------

    TODO Fournir quelques exemples


Mock
====


Google Mock
-----------

    TODO Fournir exemples


Trompeloeil
-----------

![trompeloeil logo](https://raw.githubusercontent.com/rollbear/trompeloeil/master/trompeloeil-logo.png)

* Header only C++14 mocking framework
* [GitHub](https://github.com/TankerApp/mockaron)


Mockaron
--------

* [GitHub](https://github.com/TankerApp/mockaron)
* [Présentation](cpp-frug.github.io/paris/events/2017-05-18_n17/mockaron/mock.html)


C++ Great Practices
===================


Prévoire un build-type "Coverage"
---------------------------------

|                 | Release                     | Debug            | Coverage
|-----------------|-----------------------------|------------------|-----------------
|`assert()`       | `-D NDEBUG`                 |                  | `-D NDEBUG`
|[Optimisation][o]| `-Ofast` <br> (or any other)| `-O0 -fno-inline`| `-O0 -fno-inline`

[o]: https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html


Autres options de compilation
-----------------------------

### Les mêmes pour les trois *build types*

* Toujours les [symboles de debug][d] => `-g3 -fno-eliminate-unused-debug-types`  
  (les binaires peuvent être [strippés][s] avant livraison au client)
* C'est fini les `i386` => `-march=sandybridge`  
  (à adapter selon le contexte)

[d]: https://gcc.gnu.org/onlinedocs/libstdc++/manual/debug.html
[s]: http://www.thegeekstuff.com/2012/09/strip-command-examples/


Pousser les bugs à se révéler
-----------------------------

### Utiliser différents compilateurs

* MSVC sous Windows (et un autre ?)
* GCC et Clang sous Linux


### Multiplier les combinaisons

* GCC, Clang
* Release, Debug, Coverage
* Valgrind ou pas (tester différentes options)


Definition of Done (DoD)
------------------------

* Source code respects Coding Rules
* No remaining FIXME
* No compiler warnings
* Unit-Tests passed
* Code coverage depending on context
* Valgrind
* CppCheck
* [AddressSanitizer](https://en.wikipedia.org/wiki/AddressSanitizer) using `-fsanitize=*` ([clang](http://clang.llvm.org/docs/AddressSanitizer.html) and [gcc](https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html#index-fsanitize_003daddress-945))
* [clang-check](http://clang.llvm.org/docs/ClangCheck.html)  
  (static code analyzer of control flow graph to detect bug-prone patterns)
* [clang-tidy](http://clang.llvm.org/extra/clang-tidy/)  
  (linter: coding style, readability and fix your C++ code)
* No dead code
