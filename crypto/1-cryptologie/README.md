Cryptologie
===========

*Science du secret*
-------------------

* **Cryptographie**, *écriture secrète* (chiffrer)
* **Cryptanalyse**, *analyse du secret* (décrypter)
* **Stéganographie**, *art de la dissimulation*


Crypter ou 
==========

Chiffrer ?
==========

https://chiffrer.info/


Chiffrer
========

✔ Chiffrer, Chiffrement  
❌ Crypter, Cryptage (acceptés par l'OQLF)  
❌ Encrypter, Chiffrage  
✔ Déchiffrer (décoder avec la clé secrète)  
✔ Décrypter (décoder sans connaître la clé)  
❌ Message crypté  
✔ Chaîne cryptée (télévision)



Cryptographie symétrique
========================

`Alice ---> Bob`

Alice et Bob partagent la même clé secrète


Cryptographie symétrique
========================

* Rapide à chiffrer/déchiffrer
* Difficile à décrypter


Clé symétrique AES
------------------

* 1998
* 8-bits processor
* low RAM
* 128, 192 et 256 bits
* 2²⁵⁶ possibilités = 10⁷⁷  
  ~= 10⁸⁰ (atomes dans l'univers)


Clé symétrique AES
------------------

* 128 bits: avec 10¹² clés par seconde  
  => Un million de milliard  
  &emsp; de fois l'age de l'univers


Clé symétrique AES
------------------

* NSA mettrait 80 ans  
  en utilisant de nombreuses  
  machines many-core... (2017)


Clé symétrique AES
------------------

* Aucune attaque connue et utilisable
* Accélération matérielle (processeur)
* Utilisé par USA, Russie...


Cryptographie symétrique
------------------------

* Astuce : changer fréquement sa clé
* Toujours aussi rapide à chiffrer/déchiffrer
* Beacoup trop de clés à décrypter !

`Alice ---> Bob` &emsp; &emsp; &emsp; &emsp;  
`clé1` &emsp; &emsp; `clé1  (1 ms)`  
`clé2` &emsp; &emsp; `clé2  (1 ms)`  
`....` &emsp; &emsp; `....  (1 ms)`  


Inconvénient du symétrique
--------------------------

Le grand nombre de clés secrètes  
à se communiquer secrètement.

    Alice  ➡ Bob
      ⬆    ↗  ⬇
    Carole ⬅ Dave


Comment s'échanger secrètement les clés ?
-----------------------------------------

            Eve
    Alice ➡ ➡ ➡ ➡ Bob

Eve intercèpe les messages entre Alice et Bob


Diffie-Hellman (1976)
---------------------

                Eve

    Alice    ➡  g^a           Bob
                g^b    ⬅
    clé g^ab ➡ clé AES
               message ⬅  clé AES

* Facile de calculer `g^ab` pour Alice et Bob
* Eve connait `g^a` et `g^b` mais...
* ... difficile d'inverser l'exponentiation



Man in the middle
-----------------

    Alice ➡  g^a ➡ Mallory ➡ g^m ➡ Bob
          ⬅  g^n ⬅         ⬅ g^b ⬅
     g^an ➡ clé  ➡    g^bm ➡ clé ➡
          ⬅  msg ⬅         ⬅ msg ⬅



Cryptographie asymétrique
-------------------------

* 1970
* une clé pour chiffrer
* une autre pour déchiffrer


Confidentialité
---------------

* Clé publique = chiffrer
* Clé privée = déchiffrer

[]()

    Alice    ➡  publique A        Bob
                publique B ⬅
    privée A ➡  message1
                message2   ⬅ privée B


Signature électronique
----------------------

* Clé privée = signer (chiffrer)
* Clé publique = authentifier (déchiffrer)

[]()

    Alice    ➡  publique A        Bob
                publique B ⬅
    privée A ➡  msg1 signé
                msg2 signé ⬅ privée B


RSA (1977)
----------

* 2000, brevet logiciel ➡ domaine public 
* Un PC de bureau casse RSA 256 bits  
  en quelques minutes
* 2009, attaque pour casser un clé 768 bits
* 2049 ? (si secret pendant 30 ans)


RSA
---

* Recommandation = 2048 bits
* Pas de méthode connue pour casser clé 1024 bits
* Utilisé par USA, Russie...


Problème des clés asymetriques
------------------------------

Calculs complexes  
(10 à 100 fois plus lent que symétrique)
  


Mix asymetriques et symétriques
-------------------------------
  
* Asymétrique utilisé pour échanger les symétriques  
  (authentification)
* La suite du chiffrement utilise les symétriques



Infrastructure à clés publiques (PKI)
-------------------------------------

    Autorité de certification
    Certificat racine
       ⬇              ↘
    Clé publique         ↘
    Clé privée              ↘
       ⬇                       ↘
    Alice      ➡ Clé publique    Bob
                 Msg aléatoire ⬅
    Clé privée ➡ Msg signé


Hardware Security Module (HSM)
------------------------------

* Unité de calcul seule à connaître la clé privée
* Auto-déstruction des clés si manipulation physique
* Plusieurs formats : PC, carte PCI, carte à puce...
* Permet de signer, émettre un certificat fils,  
  déchiffrer un message...



Fonction de hachage
-------------------

* Empreinte (condensat) de quelques dizaine d'octets
* Impossible de retrouver le message d'origine
* Difficile de forger un faux ayant la même empreinte


Fonction de hachage
-------------------

* 1991: **MD5**     (faille découverte en 1996)
* 1995: **SHA-1**   (2005)
* 2001: **SHA-256**
* 2012: **SHA-3**


Intégrité
---------

             message et son
    Alice ➡  empreinte signée  ➡ Bob
             le tout chiffrée


Masquer les mots de passe
-------------------------

On ne conserve pas les mots de passe en clair.

    fonction_de_hashage(mot_de_passe + sel) -> empreinte salée


Masquer les mots de passe
-------------------------

* L'utilisateur rentre son mot de passe
* L'empreinte salée est envoyé au serveur distant
* Le serveur distant la compare avec celle stockée en base


Masquer les mots de passe
-------------------------

* Le sel est l'ajout d'octets au mot de passe d'origine
* Le sel des utilisateurs sont différents
* Ainsi, l'attaque par dictionnaire perd de son intérêt


Limiter l'attaque force brute
-----------------------------

* beaucoup de calculs séquentiels => plus de temps
* beaucoup de mémoire vive => éviter multi-threading
* ne se paralélise pas bien sur GPU
* inadapté aux ordinateurs quantiques



Résumons les bases
------------------

* Clés symétriques, rapide à chiffrer/déchiffrer
* Clés asymétriques, complexe à chiffrer/déchiffrer
* Fonctions de hachage, pour la signature, l'intégrité...
