URL    | http://linuxfr.org/news/onzieme-rencontre-c-francophone-jeudi-31-mars-2016-a-paris
-------|-----------------------------------------------------------------------------------
Title  | Onzième rencontre C++ francophone jeudi 31 mars 2016 à Paris  
Authors| Oliver H, Nils Ratusznik, Xavier Teyssier, eggman, Benoît Sibaud et palm123  
Date   | 2016-03-12T01:04:50+01:00  
License| CC by-sa  
Tags   | c++, infos_locales et c++17  
Score  | 13

Le C++ FRUG vous convie à leur onzième rencontre francophone. Cette édition a pour nom `std::move(meetup)` car elle se tient à l'école 42.

Informations pratiques :
------------

* jeudi 31 mars 2016 de 19h à 22h&nbsp;;
* [96 Boulevard Bessières, Paris](http://www.openstreetmap.org/relation/3957506)&nbsp;;
* station [Porte de Clichy](http://www.vianavigo.com/fr/itineraire-plan-de-quartier/#id=14&proximity=Porte+de+Clichy%2C+Paris&proximityType=StopArea&proximityCity=Paris&proximityExternalCode=8711127&proximityCityCode=75000&proximityCoordX=&proximityCoordY=&spcar=%C3%A2&hit=1&hat=1&L=0&submitSearchProximity=&ajid=/stif_web_carto/comp/proximity/search.html_) (métro 13, RER C, bus 54 74 138 173 N15 N51 PC3).

Le programme :
------------


* de 19:00 à 19:30 : accueil&nbsp;;
* de 19:30 à 20:15 : fonction passée en argument template, par Martin Morterol (LRI)&nbsp;;
* de 20:15 à 21:00 : pause dinatoire, pizzas et bières gratos&nbsp;;
* de 21:00 à 21:45 : système de fichiers dans les nuages, par Quentin Hocquet (Infinit).

----

* [Meetup C++ FRUG #11](http://www.meetup.com/User-Group-Cpp-Francophone/events/229508095/)
* [école 42](https://fr.wikipedia.org/wiki/42_%28%C3%A9cole%29)
* [Laboratoire de Recherche en Informatique (LRI)](https://fr.wikipedia.org/wiki/Laboratoire_de_recherche_en_informatique)
* [Système de fichier décentralisé](http://blog.infinit.one/introducing-infinit-file-system/)
* [Site officiel du Standard C++](https://isocpp.org/)
* [Dépôts Git du Standard C++](https://github.com/cplusplus)
* [La dépêche précédente: C++ FRUG #10](http://linuxfr.org/news/dixieme-rencontre-c-francophone-jeudi-21-janvier-2016-paris-chatelet-les-halles)

----

Le renouveau du C++ 
-------------------


Durant les années 90 et 2000, le standard C++ n'a quasiment pas évolué ! De très nombreux développeurs pensaient que le C++ s'était stabilisé. Et puis, en 2011, la terre a tremblé ! Les nouveautés du C++11 sont tellement nombreuses que les nouvelles façons de coder en C++ n'étaient plus reconnues par ceux qui avaient raté le coche.

Tous les enthousiastes du nouveau C++ avaient envie de se retrouver, de discuter des nouveaux paradigmes de programmation, de mieux comprendre la nouvelle orientation du C++, et comment utiliser un sous-ensemble plus intuitif et moins enclin à l'erreur. Et le prochain C++17 nous promet une révolution similaire à C++11 !

Joël, le joyeux organisateur
----------------------------

[Joël Falcou](https://www.lri.fr/membre.php?mb=1146) organise depuis 2013 les rencontres du *Groupe des Utilisateurs C++ Francophone* (abrégé en anglais *C++ FRUG* en clin d'œil à nous les [Frogs](https://fr.wiktionary.org/wiki/Frog)).



Dans la vie, [Joël](https://fr.linkedin.com/in/jfalcou) est maître de conférences [LRI](https://fr.wikipedia.org/wiki/Laboratoire_de_recherche_en_informatique) et [Polytech Paris-Sud](https://fr.wikipedia.org/wiki/%C3%89cole_polytechnique_de_l'universit%C3%A9_Paris-Sud), [mainteneur Boost](http://www.boost.org/doc/libs/1_60_0/libs/predef/doc/html/index.html) et [membre du comité de standardisation ISO C++](https://isocpp.org/blog/2014/05/n4035).



![Joël anime Questions pour un Champion++](https://upload.wikimedia.org/wikipedia/commons/0/01/20160121_CppFRUG_Joel_Falcou_CppQuiz_1.jpg)


Fonction passée en argument template :
------------------------------------

* déduction de son type retour&nbsp;;
* déduction du type de chacun de ses arguments&nbsp;; 
* stockage de l'ensemble.

Un exemple vaut mieux qu'un obscur discours


```cpp
template <typename MonTypeDeFonction>
void stocke (MonTypeDeFonction ma_fonction);
                // Ah... et les types des arguments ?

template <typename TypeRetour, typename TypeArg1, typename TypeArg2>
void stocke( TypeRetour (*ma_fonction)(TypeArg1,TypeArg2) );
                // Et si plus de deux arguments?

template <typename TypeRetour, typename ...TypeArg>
void stocke (TypeRetour (*ma_fonction)(TypeArg...) )  {
    auto mon_stockage_local = ma_fonction;                
                // Et pour stocker en dehors de la fonction? 
}

template <typename T>
std::vector<std::function<T>> mon_stockage_global;

template <typename TypeRetour, typename ...TypeArg>
void stocke (TypeRetour (*ma_fonction)(TypeArg...) )  {
    mon_stockage_global<decltype(ma_fonction)>.push_back(ma_fonction);
               // Au secours !!!
}
```


Finalement, si l'exemple vous semble obscur, alors mieux vaut un discours !


[Martin Morterol](https://www.lri.fr/membre.php?mb=1806) du Laboratoire de Recherche en Informatique (LRI, Université Paris Saclay) nous démystifiera cette problématique :  
*Comment une classe template peut stocker une instance de `std::function` sur une fonction passée en paramètre ?*  
Cette classe doit connaître le type de retour de la fonction mais également le type des paramètres. Martin présentera une méthode permettant de répondre à cette problématique de façon simple pour l'utilisateur.

Voir aussi la [solution proposée par duckie](https://gist.github.com/duckie/24d7ea892299335f1916).


Infinit
-------



Quentin Hocquet présentera une solution innovante de [système de fichier décentralisé dans les nuages](http://blog.infinit.one/introducing-infinit-file-system/) afin par exemple de partager des fichiers entre mobiles/ordinateurs en utilisant les transferts pair à pair (P2P). Puis une [démo](https://infinit.sh/get-started) pour déployer une infrastructure de stockage publique, privé ou hybride. Ce logiciel sera [libéré](https://infinit.sh/open-source) dès que la qualité du code sera correcte.



Quentin Hocquet travaille pour la société [Infinit](http://infinit.one/), start-up créée à Paris en 2012 avec déjà des équipes à New-York et Buenos Aires. Les technos utilisées sont le C++, Boost, Objective-C, Qt, Debian/Ubuntu, OS X Cocoa, Windows, Réseau TCP/IP/P2P/..., Tolérance aux pannes Byzantine, Système de fichiers, Fonctions système bas-niveau. Et la bière y coule à flot !


![Fahima Djelil présente PrOgO, une animation 3D pour l’apprentissage de la Programmation Orientée-Objet en C++](https://upload.wikimedia.org/wikipedia/commons/a/af/20160121_CppFRUG_Fahima_Djelil_PrOgO_1.jpeg)

Participer à la vie du C++
--------------------------

Pour aller plus loin, chacun peut participer à l'élaboration de la norme en proposant ses contributions sur [le dépôt Git de la prochaine version du C++](https://github.com/cplusplus/draft).

Il est aussi possible de rejoindre le comité de normalisation du C++. L'AFNOR gère la [commission pour la France](http://www2.afnor.org/espace_normalisation/structure.aspx?commid=119670). Nous pouvons vous expliquer les conditions...


Une association est en cours de constitution. Nous pouvons imaginer un stand C++ aux prochains salon de logiciels libres aux côtés des habituels stands Ada, PHP, Python, Perl...

![Stand des mongueurs de Perl au village associatif du Paris Open Summit]( https://upload.wikimedia.org/wikipedia/commons/0/06/ParisOpenSourceSummit_VillageAssociatif_LesMongueursDePerl_2015.jpeg) 
