Découpler les Tests Unitaires
=============================


[Test double][td]| Definition
-----------------|-------------------------------------------
 Dummy           | Empty shell, no implementation
[Stub][ts]       | Minimal implementations, provide always the same response, no assert
[Fake][fo]       | Act like the real object, but in a simpler way
[Mock][mo]       | Contain assert
 Spy             | Record events

[td]: http://en.wikipedia.org/wiki/Test_double
[ts]: http://en.wikipedia.org/wiki/Test_stubs
[fo]: http://en.wikipedia.org/wiki/Fake_object
[mo]: http://en.wikipedia.org/wiki/Mock_object


Dummy
-----

A **dummy** object is an empty shell without implementation.

    TODO Fournir exemples


Stub
----

A test [**Stub**][ts] is a minimal implementations providing always the same response (hard-coded) and does not contain assert.

    TODO Fournir exemples

[ts]: http://en.wikipedia.org/wiki/Test_stubs


Fake
----

A [**fake**][fo] object acts like the real object, but in a simpler way.

    TODO Fournir exemples

[fo]: http://en.wikipedia.org/wiki/Fake_object


Mock
----

A [**Mock**][mo] object is a fake object containning asserts.

### One unit test = One assert

[Roy Osherove](http://programmers.stackexchange.com/questions/7823) (2010)

> **Unit tests should fail for exactly one reason.**  
> That’s why you should use one assert per unit test.

### One unit test = One expectation

[Kevlin Henney](https://twitter.com/kevlinhenney/status/438707024067825664) (2014)

> Using a **mock**, any test with more than one expectation
> is a test with more than one assertion.

    TODO Fournir exemples de mock

[mo]: http://en.wikipedia.org/wiki/Mock_object


Spy
---

A test **spy** is any fack object having the capability to record events for further analysis.

    TODO Fournir exemples


Dependencies on hardware
------------------------

* Que faire si l'objet accède à un fichier, un port réseau... ?
* Essayer de découpler l'objet avec son environnement.
* Sinon, ce n'est plus un *Test Unitaire*, mais un *Test d'intégration*
