URL     | http://linuxfr.org/redaction/news/douzieme-rencontre-parisienne-c-jeudi-27-avril-2016
--------|---------
Title   |Douzième rencontre parisienne C++ jeudi 27 avril 2016
Authors |Oliver H
Date    |2016-04-21T22:57:19+02:00
License |CC by-sa
Tags    |
Score   |0


L'association C++FRUG organise la douzième rencontre parisienne **C++ Francophone** avec pour nom de code : `decltype(new event)`.
===============


* Mercredi 27 avril 2016 de 19:00 à 21:30&nbsp;;
* [43 Rue Beaubourg, Paris](http://www.openstreetmap.org/?mlat=48.86&amp;mlon=2.354#map=19/48.86/2.354), locaux de Mobiskill Partner&nbsp;;
* Stations **Rambuteau** (métro 11) et **Châtelet - Les Halles** (RER A, B, D et métro 4)&nbsp;;
* [Bus 29, 38, 47, 75, N12, N13, N14 et N23](http://www.vianavigo.com/fr/itineraire-plan-de-quartier/#id=&proximity=43+rue+Beaubourg%2C+Paris&proximityType=Address&proximityCity=Paris&proximityExternalCode=ADDRESS32611&proximityCityCode=75000&proximityCoordX=&proximityCoordY=&spcar=%C3%A2&hit=1&hat=1&L=0&submitSearchProximity=&ajid=/stif_web_carto/comp/proximity/search.html_)&nbsp;;
* [Station vélib n°3010](http://www.velib.paris/Plan/Trouver-une-station/%28id%29/3010).

Horaire | Programme
------|----------
19:00 | Accueil
19:30 | Présentations éclairs *(Lightning talks)*
20:00 | Pause dinatoire, pizzas et bières offertes par Mobiskill Partner
20:30 | Révolution des `<algorithme>` en C++17
21:15 | Informations générales et fin de la rencontre

----

* [Meetup C++ FRUG #12](http://www.meetup.com/User-Group-Cpp-Francophone/events/230392153/)
* [Dépêche C++ FRUG #11](http://linuxfr.org/news/onzieme-rencontre-c-francophone-jeudi-31-mars-2016-a-paris)
* [Dépêche C++ FRUG #10](http://linuxfr.org/news/dixieme-rencontre-c-francophone-jeudi-21-janvier-2016-paris-chatelet-les-halles)
* [Site officiel du Standard C++](https://isocpp.org/)
* [Dépôts Git du Standard C++](https://github.com/cplusplus)

----

Présentations éclairs *(Lightning talks)*
-----------------------------------------

* Loïc Joly présente deux outils autour du C++, 
    - Les [*Raw string litterals*](http://en.cppreference.com/w/cpp/language/string_literal) et comment les remanier (*refactoring*)
    ```
    const char* ma_chaine_de_caracteres = R"nesaffichepas(
    Salut
    LinuxFr.org
    )nesaffichepas";
    ```
    - Un visualiseur interactif d'arbre syntaxique basé sur Clang 

* Joël Falcou présente quelques bonnes pratiques en C++ moderne 
    - Trucs et astuces
    - Détourner les Variadiques à son profit


Révolution des `<algorithme>` en C++17
--------------------------------------


Thomas Petit présente les avancées du comité de normalisation C++17 (SG9) a propos des [`<algorithm>`](http://en.cppreference.com/w/cpp/header/algorithm) -- *Ranges TS : `view::transform<algorithm>`*.


Les `<algorithm>` de la STL sont mal aimés : Difficilement composables, encombrés d'une syntaxe pénible, ils n'ont jamais réussi à convaincre et vivotent dans l'ombre des conteneurs. Mais récemment le comité de normalisation C++ (SG9) sous l'impulsion d'Eric Niebler a annoncé une série de TS (*Technical Specification*) qui devrait les remettre sur le devant de la scène.


Le premier TS, pas encore publié, mais dont le brouillon (*draft*) est très avancé, va revisiter les algorithmes existant pour en simplifier massivement l'utilisation. En introduisant de nouvelles surcharges acceptant les *ranges* (https://github.com/ericniebler/range-v3/).

Les infâmes `begin()`/`end()` que vomissent les codes utilisant fortement les `<algorithm>` ne seront bientôt plus qu'un lointain souvenir. L'arrivé des [Concepts](http://en.cppreference.com/w/cpp/language/constraints), ainsi que de nouvelles fonctionnalités comme les [Callables](http://en.cppreference.com/w/cpp/concept/Callable) et les Projections, vont eux aussi participer à la cure de simplification qui attends `<algorithm>`.


Le deuxième TS, en préparation, s'annonce encore plus révolutionnaire. En introduisant les *View*, la STL devrait se doter d'une nouvelle classe d'algorithme [paresseux (*lazy*)](https://fr.wikipedia.org/wiki/%C3%89valuation_paresseuse), non-mutable et composable permettant une écriture fonctionnelle merveilleusement concise et malléable.  



Historique des rencontres *C++ Francophone*
-------------------------------------------


En 2011, les développeurs C++ se sont pris une claque. Du moins, ceux qui ont découvert le tout nouveau C++11 qui tranche avec l’encéphalogramme plat auquel nous étions habitués depuis les années 90 !


C'est ainsi que de partout dans le monde les passionnés du C++ se sont mis à avoir de plus en plus envie de se rencontrer pour partager leur enthousiasme et parfois leurs incompréhensions...


La communauté C++ francophone n'a pas échappé à ce phénomène et de nombreuses rencontres C++ se produisent depuis :   



Date      | Lieu      | Sujet
----------|-----------|------
2013-06-05|Paris      | [Qt on mobile](http://www.meetup.com/User-Group-Cpp-Francophone/events/120838202/)
2014-03-11|Lyon       |[C++ et Web: la croisée des chemins](http://humantalks.com/talks/363-c-et-web-la-croisee-des-chemins)
2014-03-13|Lyon       |[Le C++ évolue, et vous ?](http://www.meetup.com/fr-FR/LyonCPP/events/168296962/)
2014-04-22|Lyon       |[Rencontre C++](http://www.meetup.com/fr-FR/LyonCPP/events/175920152/)
2014-05-23|Paris      |[C++ FRUG #3 - En faire ++ avec C++](http://www.meetup.com/User-Group-Cpp-Francophone/events/177106822/)
2014-10-02|Paris      |[C++ FRUG #4 - C++ & Python](http://www.meetup.com/User-Group-Cpp-Francophone/events/181945092/)
2014-10-21|Montpellier|[Rencontre C++](http://www.meetup.com/fr-FR/Montpellier-CPP/events/207878182/)
2014-11-25|Montpellier|[Meetup C++ novembre](http://www.meetup.com/fr-FR/Montpellier-CPP/events/215049692/)
2014-12-16|Montpellier|[Rencontre C++ décembre](http://www.meetup.com/fr-FR/Montpellier-CPP/events/219024139/)
2014-12-18|Paris      |[C++ FRUG #5 - L'asynchronisme en deux talks](http://www.meetup.com/User-Group-Cpp-Francophone/events/218740271/)
2015-03-05|Paris      |[C++ FRUG #6 - La métaprogrammation, non non ca sert en vrai](http://www.meetup.com/User-Group-Cpp-Francophone/events/220602373/)
2015-03-17|Montpellier|[Rencontre C++ mars](http://www.meetup.com/fr-FR/Montpellier-CPP/events/220718755/)
2015-04-28|Paris      |[C++ FRUG #7 - Nuts & Bolt](http://www.meetup.com/User-Group-Cpp-Francophone/events/221811241/)
2015-06-18|Paris      |[C++ FRUG #8 - Nuts & Bolts II - Le retour](http://www.meetup.com/User-Group-Cpp-Francophone/events/223101208/)
2015-11-24|Montpellier|[Rencontre C++](http://www.meetup.com/fr-FR/Montpellier-CPP/events/226573490/)
2015-12-10|Paris      |[C++ FRUG #9 - Not Dead Yet !](http://www.meetup.com/User-Group-Cpp-Francophone/events/226963782/)
2016-01-21|Paris      |[C++ FRUG #10 - `import <new_blood>`](http://www.meetup.com/User-Group-Cpp-Francophone/events/227761739/)
2016-03-18|Marseille  |[Première rencontre: lancement du groupe](http://www.meetup.com/fr-FR/Marseille-Marseille-C-User-Group/events/229405969/)
2016-03-31|Paris      |[C++ FRUG #11 - `std::move(meetup)`](http://www.meetup.com/User-Group-Cpp-Francophone/events/229508095/)
2016-04-19|Montpellier|[Rencontre C++](http://www.meetup.com/fr-FR/Montpellier-CPP/events/230050042/)


Genèse de l'association C++FRUG
-------------------------------


Ce besoin de partager les nouveautés du C++ a pour conséquence la création d'associations C++ dans plusieurs pays. Et c'est aussi le cas de la communauté francophone dont les plus motivés ont [proposé](https://groups.google.com/forum/#!msg/cpp-frug/A61eq1wPsZ8/lNxR4lMIbFEJ) une association C++FRUG.

Le site web officiel est encore en cours de rédaction et avance selon les disponibilités des plus motivés...
