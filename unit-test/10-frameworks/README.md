Unit-Test Frameworks
====================
<!--.slide: data-background="#343" data-background-transition="zoom"-->


xUnit
-----

Historiquement, les noms des frameworks de tests unitaires avaient souvent la même racine :

* [J**Unit**][j]
* [Cpp**Unit**][cpp]
* [N**Unit**][n]
* [PHP**Unit**][php]
* [Http**Unit**][http]
* [Html**Unit**][http]

Le terme [x**Unit**][x] désigne les frameworks qui partagent les mêmes caractéristiques (tout comme pour [GTest][gt]).

[x]:    http://fr.wikipedia.org/wiki/XUnit
[j]:    http://en.wikipedia.org/wiki/JUnit
[cpp]:  http://en.wikipedia.org/wiki/CppUnit
[n]:    http://en.wikipedia.org/wiki/NUnit
[php]:  http://en.wikipedia.org/wiki/PHPUnit
[http]: http://en.wikipedia.org/wiki/HttpUnit
[html]: http://en.wikipedia.org/wiki/HtmlUnit


Points communs
--------------

* **assert()** pour comparer résultat et valeur attendue
* **test case** = un seul test (souvent implémenté comme une classe)
* [**fixture**][f] = ensemble des preconditions avant de lancer les tests.
* **test suite** = ensemble de **test cases** avec la même [**fixture**][f]
* Même shéma XML de sortie pour compatibilité avec les outils comme Jenkins

[x]:    http://fr.wikipedia.org/wiki/XUnit
[f]:    http://fr.wikipedia.org/wiki/Test_fixture


Fixture
-------

Certains tests nécessitent un environnement avec **stubs**/**mocks**.  

La [**fixture**][f] donne un cadre pour préparer  
cet environement plus ou moins complexe.  

[f]:    http://fr.wikipedia.org/wiki/Test_fixture


Fonctions communes aux fixtures
-------------------------------

* **`SetUp()`** initialise tout cet environnement
* **`TearDown()`** le libère proprement

  (évite de perturber le test suivant,  
  ou de faux-positifs de fuite de mémoire)
