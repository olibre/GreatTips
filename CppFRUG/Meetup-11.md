URL:     http://linuxfr.org/redaction/news/onzieme-rencontre-c-francophone-jeudi-31-mars-2016-paris-ecole-42-porte-de-clichy
Title:   Onzième rencontre C++ Francophone jeudi 31 mars 2016 (Paris, École 42, Porte de Clichy)
Authors: Oliver H
         
Date:    2016-03-12T01:04:50+01:00
License: CC by-sa
Tags:    
Score:   0


La **onzième édition** `std::move(meetup)` déménage à l'école 42
----------------------------------------------------------------

* Jeudi 31 mars 2016 de 19h à 22h
* [96 Boulevard Bessières, Paris](http://www.openstreetmap.org/relation/3957506)
* Station [Porte de Clichy](http://www.vianavigo.com/fr/itineraire-plan-de-quartier/#id=14&proximity=Porte+de+Clichy%2C+Paris&proximityType=StopArea&proximityCity=Paris&proximityExternalCode=8711127&proximityCityCode=75000&proximityCoordX=&proximityCoordY=&spcar=%C3%A2&hit=1&hat=1&L=0&submitSearchProximity=&ajid=/stif_web_carto/comp/proximity/search.html_) (métro 13, RER C, bus 54 74 138 173 N15 N51 PC3)



Le programme
------------


* 19:00 - 19:30 : Accueil
* 19:30 - 20:15 : **Fonction passée en argument template**, par Martin Morterl (LRI, Université Paris Saclay)
* 20h15 - 21h00 : **Pause dînatoire**, pizzas et bières gratos
* 21h00 - 21h45 : **Système de fichiers dans les nuages**, par Quentin Hocquet (Infinit.io)

----

[Meetup C++ FRUG #11](http://www.meetup.com/User-Group-Cpp-Francophone/events/229508095/)  
[école 42](https://fr.wikipedia.org/wiki/42_%28%C3%A9cole%29)  
[Laboratoire de Recherche en Informatique (LRI)](https://fr.wikipedia.org/wiki/Laboratoire_de_recherche_en_informatique)  
[Système de fichier décentralisé](http://blog.infinit.one/introducing-infinit-file-system/)  
[Site officiel du Standard C++](https://isocpp.org/)  
[Dépôts Git du Standard C++](https://github.com/cplusplus)

----

Joël, le joyeux organisateur
----------------------------

[Joël Falcou](https://www.lri.fr/membre.php?mb=1146) organise depuis 2013 les rencontres du *Groupe des Utilisateurs C++ Francophone* (abrégé en anglais *C++ FRUG* en clin d'œil à nous les [Frogs](https://fr.wiktionary.org/wiki/Frog)).


Dans la vie, [Joël](https://fr.linkedin.com/in/jfalcou) est maître de conférences [LRI](https://fr.wikipedia.org/wiki/Laboratoire_de_recherche_en_informatique) et [Polytech Paris-Sud](https://fr.wikipedia.org/wiki/%C3%89cole_polytechnique_de_l'universit%C3%A9_Paris-Sud), [mainteneur Boost](http://www.boost.org/doc/libs/1_60_0/libs/predef/doc/html/index.html) et [membre du comité de standardisation ISO C++](https://isocpp.org/blog/2014/05/n4035).


![Joël anime Questions pour un Champion++](https://upload.wikimedia.org/wikipedia/commons/0/01/20160121_CppFRUG_Joel_Falcou_CppQuiz_1.jpg)

Fonction passée en argument template
------------------------------------

* Déduction de son type retour
* Déduction du type de chacun de ses arguments 
* Stockage de l'ensemble

Un exemple vaut mieux qu'un obscure discours


```cpp
template <typename MonTypeDeFonction>
void stocke (MonTypeDeFonction ma_fonction);                   // Où sont les types des arguments

template <typename TypeRetour, typename TypeArg1, typename TypeArg2>
void stocke( TypeRetour (*ma_fonction)(TypeArg1,TypeArg2) );  // Et si plus de deux arguments?

template <typename TypeRetour, typename ...TypeArg>
void stocke (TypeRetour (*ma_fonction)(TypeArg...) )  {
    auto mon_stockage_local = ma_fonction;                // Et pour stocker en dehors de la fonction? 
}
     

template <typename T>
std::vector<std::function<T>> mon_stockage_global;

template <typename TypeRetour, typename ...TypeArg>
void stocke (TypeRetour (*ma_fonction)(TypeArg...) )  {
    mon_stockage_global<decltype(ma_fonction)>.push_back(ma_fonction);        // Au secours
}
```

Finalement, si l'exemple vous semble obscure, alors vaut mieux un discours !


Martin du Laboratoire de Recherche en Informatique (LRI, Université Paris Saclay) nous démystifiera cette problématique: Comment une classe template peut stocker une instance de `std::function` sur une fonction passée en paramètre? Cette classe doit connaître le type de retour de la fonction mais également le type des paramètres. Martin présentera une méthode permettant de répondre à cette problématique de façon simple pour l'utilisateur.


Voir aussi la [solution proposée par duckie](https://gist.github.com/duckie/24d7ea892299335f1916).

Infinit
-------


Quentin Hocquet présentera une solution innovante de [système de fichier décentralisé dans les nuages](http://blog.infinit.one/introducing-infinit-file-system/) afin par exemple de partager des fichiers entre mobiles/ordinateurs en utilisant les transferts pair à pair (P2P). Puis une [démo](https://infinit.sh/get-started) pour déployer une infrastructure de stockage publique, privé ou hybride. Ce logiciel sera [libéré](https://infinit.sh/open-source) dès que la qualité du code sera correcte.


Quentin Hocquet travaille pour la société [Infinit](http://infinit.one/), start-up créée à Paris en 2012 avec déjà des équipes à New-York et Buenos Aires. Les technos utilisées sont le C++, Boost, Objective-C, Qt, Debian/Ubuntu, OS X Cocoa, Windows, Réseau TCP/IP/P2P/..., Tolérance aux pannes Byzantine, Système de fichiers, Fonctions système bas-niveau. Et la bière y coule à flot !

![Fahima Djelil présente PrOgO, une animation 3D pour l’apprentissage de la Programmation Orientée-Objet en C++](https://upload.wikimedia.org/wikipedia/commons/a/af/20160121_CppFRUG_Fahima_Djelil_PrOgO_1.jpeg)
