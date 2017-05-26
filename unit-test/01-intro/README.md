Résumé
======


Test Unitaire
-------------

* Définition = peut être lancé en parallèle sur la même machine
* Donc n'en est pas si accéde aux fichiers, à la mémoire partagée ou au réseau


Great Unit Test
---------------

* Écrire les tests avant de coder la fonctionnalité (préconisation TDD et BDD)
* Chaque fonction de test doit échouer pour une seule raison
* Le nom de la fonction de test doit exprimer un élément de la spécification
* Ces fonctions de tests (noms) sont la documentation de la fontionnalité


Méthodologie GUT ?
------------------

* **G**reat **U**nit **T**est ne dépend d'aucune méthodologie
* On peut obtenir des GUT même sans TDD/BDD
* TDD/BDD => plus efficace/naturel pour obtenir des GUT



Kevlin Henney
=============

This documents has been inspired from [**Kevlin**][HKi] [**Henney**][HKs]'s trainings   
(and also from many other Unit-Testing documents)

[HKi]: http://www.infoq.com/author/Kevlin-Henney#Presentations "Presentations of Kevlin Henney on infoq.com"
[HKs]: http://www.slideshare.net/Kevlin/what-we-talk-about-when-we-talk-about-unit-testing "One good presentation on slideshare.net"

| Kevlin is a trainer on language and development process
|--------------------------------------------
| [![book cover][97p]][97L] ![book cover][97j] [![Kevlin's face][KH]][KHw]

Kevlin has popularized the wording **GUTs** meaning **G**ood **U**nit **T**ests.  
This document aims to go further and proposes the **G**reat **U**nit **T**ests.

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
----------------------

Résumé du *[Error Cost Escalation Through the Project Life Cycle][nasa]* (NASA 2004).

[SDLC][SDLC] steps            | Cost |&nbsp;| [STLC][STLC] steps       | Cost
------------------------------|------|------|--------------------------|------
Customers' needs              |  0   |      | Production error         | 1000x
[Requirements analysis][ra]   |  1x  |      | [Acceptance testing][at] |  200x
[Functional specification][fs]|  5x  |      | [Integration testing][it]|  100x
[Design][sd]                  | 10x  |      | [Unit Testing][ut]       |   50x
Implentation                  | 25x  |      |                          |

Quels coefficients pour votre organisation ?

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

|   | &nbsp;
|---|--------
|Tip 49 <br><br> **Test your software <br> or your users will.**| [![Book cover][PImg]][PLink]

[PImg]: http://upload.wikimedia.org/wikipedia/en/8/8f/The_pragmatic_programmer.jpg "The Pragmatic Programmer by Andrew Hunt and David Thomas (1999)"
[PLink]: https://en.wikipedia.org/wiki/The_Pragmatic_Programmer

