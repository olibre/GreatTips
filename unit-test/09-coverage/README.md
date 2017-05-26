Couverture de code
==================


Couverture de code
------------------

La finalité des tests unitaires n'est pas de faire du coverage.
Toutefois l'écriture des tests unitaires cherche à couvrir l'ensemble de la fonctionnalité.
Du coup, les indicateurs de coverage permettent de vérifier si on a oublié quelque chose.


Test coverage
-------------

Coverage levels

* **File** / **Class** / **Function**
* **Line** / **Statement**
* **Branch** (exemple : toutes les combinaisons de `if(a && b && c)`)
* **Value** (couverture des plages de valeurs)
* **State machine** of a high-level usage model (Statistical testing, [MBT][MBT])


Coverage pourcentage
--------------------

* Do not specify a pourcentage.
* Just request a high coverage.
* And check what is not covered (i.e. not tested)
  * If the untested part is not relevant => OK (could this code be removed?)
  * Else => Something important is not tested => Add tests


Testivus and code coverage #1
-----------------------------

[Alberto Savoia](http://www.artima.com/weblogs/viewpost.jsp?thread=203994) ([forum](http://www.artima.com/forums/flat.jsp?forum=106&thread=204677)) (2007)

> A programmer asks:
>
> - I am ready to write some unit tests.  
>   What code coverage should I aim for?
>
> The great master replies:
>
> - Don’t worry about coverage,  
>   just write some good tests.


Testivus and code coverage #2
-----------------------------

> Later, a second programmer asks the same question.  
> The great master points at a pot of boiling water and says:
>
> - How many grains of rice should put in that pot?
> - How can I possibly tell you? It depends on how many people you need to feed, how hungry they are, what other food you are serving, how much rice you have available, and so on.
> - Exactly


Testivus and code coverage #3
-----------------------------

> A third programmer enters and asks the same question.  
> The master replies:
>
> - 80%


Testivus and code coverage #4
-----------------------------

> After, a young apprentice approached the great master:
>
> - Great master, today I overheard you answer the same question about code coverage with three different answers. Why?
> - The first programmer is new and just getting started with testing. Right now he has a lot of code and no tests. He has a long way to go; focusing on code coverage at this time would be depressing and quite useless. He can worry about coverage later.  
>   The second programmer, on the other hand, is quite experience both at programming and testing. When I replied by asking how many grains of rice I should put in a pot, I helped to realize that the amount of testing necessary depends on a number of factors, and the programmer knows those factors better than I do – it’s her code after all. There is no single, simple, answer, and she’s smart enough.
> - I see, but if there is no single simple answer, then why did you answer the third programmer ‘80%’?
> - The third programmer wants only simple answers, even when there are no simple answers, and then does not follow them anyway.


Goodhart's law
--------------

[Charles Goodhart](http://en.wikipedia.org/wiki/Goodhart's_law),
advisor to the Bank of England and Emeritus Professor at the London School of Economics (1975)

> Any observed statistical regularity will tend to collapse once pressure is placed upon it for control purposes.
Goodhart's law.

Popular formulation

> When a measure becomes a target, it ceases to be a good measure.

### In French

> Dès qu’une métrique devient un objectif, la mesure perd de son utilité.

### Exemples

Quand un manager exige 90% de couverture de code,
alors le développeur est incité à laisser des lignes de code testées
mais sans aucune utilité (ou même, à en rajouter).


Tester les invariants et propriétés
-----------------------------------

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
