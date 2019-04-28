Cryptologie
===========

*science du secret*

* Cryptographie, *écriture secrète* (chiffrer)
* Cryptanalyse, *analyse du secret* (décrypter)
* Stéganographie, *art de la dissimulation*


Crypter ou Chiffrer ?
=====================

https://chiffrer.info/


Chiffrer
========

✔️ Chiffrer, Chiffrement  
❌ Crypter, Cryptage (acceptés par l'OQLF)  
❌ Encrypter, Chiffrage  
✔️ Déchiffrer (décoder avec la clé secrète)  
✔️ Décrypter (décoder sans connaître la clé)  
❌ Message crypté  
✔️ Chaîne cryptée (télévision)



Cryptographie symétrique
========================

    Alice ---> Bob

Alice et Bob partagent la même clé secrète


Clé symétrique AES
------------------

* Facile à chiffrer/déchiffrer
* Difficile à décrypter

AES (2001), clé 128 bits (2^128 possibilités) ou plus

* En testant 10^12 clés par seconde, il faudrait un milliard de fois l'âge de l'univers pour tout tester
* On suppose que la NSA met 80 ans en utilisant de nombreuses machines... (2017)


Cryptographie symétrique
------------------------

* Astuce : changer fréquement sa clé
* Toujours aussi rapide à chiffrer/déchiffrer
* Beacoup trop de clés à décrypter !!!

    Alice ---> Bob
    clé1       clé1  (1 ms)
    clé2       clé2  (1 ms)
    ...        ...   (1 ms)


Inconvénient du symétrique
--------------------------

Le grand nombre de clés secrètes à se communiquer secrètement.

    Alice  ➡ Bob
      ⬆    ↗  ⬇
    Carole ⬅ Dave


Comment s'échanger secrètement les clés ?
-----------------------------------------

Eve intercèpe les messages entre Alice et Bob

            Eve
    Alice -------> Bob


Diffie-Hellman (1976)
=====================

                Eve

    Alice    ➡  g^a           Bob
                g^b    ⬅
    clé g^ab ➡ clé AES
               message ⬅ AES+g^ab

* Facile de calculer g^ab pour Alice et Bob
* Eve connait g^a et g^b mais...
* ... difficile d'inverser l'exponentiation



Man in the middle
=================

    Alice ➡  g^a ➡ Mallory ➡ g^m ➡ Bob
          ⬅  g^n ⬅         ⬅ g^b ⬅
     g^an ➡ clé  ➡    g^bm ➡ clé ➡
          ⬅  msg ⬅         ⬅ msg ⬅



Cryptographie asymétrique (1970)
================================

1. Clé pour chiffrer
2. Une autre pour déchiffrer


Confidentialité
---------------

* Clé publique = chiffrer
* Clé privée = déchiffrer

    Alice    ➡  publique A        Bob
                publique B ⬅
    privée A ➡  message1
                message2   ⬅ privée A


Signature électronique
----------------------

* Clé privée = signer (chiffrer)
* Clé publique = authentifier (déchiffrer)

    Alice    ➡  publique A        Bob
                publique B ⬅
    privée A ➡  msg1 signé
                msg2 signé ⬅ privée A


RSA (1977)
----------

* Brevet expiré en 2000
* Un PC de bureau casse un clé RSA de 256 bits en quelques minutes
* En 2009, des scientifiques cassent une clé RSA de 768 bits
* Et en 2049 ? (si secret pendant 30 ans)
* La recommandation est d'utiliser 2048 bits
* Pas de méthode connue de la communauté pour casser une clé de 1024 bits
* Utilisé par USA, Russie...


Problème des clés asymetriques
------------------------------

* Calculs complexes pour chiffer/déchiffrer
* Utilisé seulement pour échanger les clés symétriques, l'authentification...
* La suite du chiffrement utilise des clés symétriques


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

* Unité de calcul seule à connaître des secrets (clé privée)
* Auto-déstruction de ses données en cas de manipulation physique
* Plusieurs formats : Ordinateur, carte PCI, carte à puce...
* Il permet de signer, émettre un certificat fils, déchiffrer un message...


Fonction de hachage
-------------------

* MD5 (1991), SHA-1 (1995), SHA-256 (2001), SHA-3 (2012)
* Empreinte (condensat) de quelques dizaine d'octets
* Impossible de retrouver le message d'origine (sauf si peu d'octets)
* Extrement difficile de forger un message ayant la même empreinte
* Failles découvertes MD5 (1996) et SHA-1 (2005) => Fin d'utilisation


Intégrité
---------

             message et son
    Alice ➡  empreinte signée  ➡ Bob
             le tout chiffrée


Masquer les mots de passe
-------------------------

On ne conserve pas les mots de passe en clair.

    fonction_de_hashage(mot_de_passe + sel) -> empreinte salée

* L'utilisateur rentre son mot de passe sur l'interface web
* Celle-ci calcule l'empreinte salée qui est envoyé au serveur distant
* Le serveur distant compare l'empreinte salée avec la sienne
* Le sel est l'ajout d'octets au mot de passe d'origine
* Le sel des utilisateurs sont différents
* Ainsi, l'attaque par dictionnaire perd de son intérêt


Attaque force brute
-------------------

Pour les limiter, les algorithmes peuvent :

* nécessiter beaucoup de calculs séquentiels pour ralonger le temps
* nécessiter beaucoup de mémoire vive pour éviter le multi-threading
* ne pas bien se paraléliser sur GPU
* ne pas être adaptés aux ordinateurs quantiques


Résumons les bases
------------------

* Clés symétriques, rapide à chiffrer/déchiffrer
* Clés asymétriques, complexe à chiffrer/déchiffrer
* Fonctions de hachage, pour la signature, l'intégrité...
