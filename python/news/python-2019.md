Python pour la rentrée 2019
===========================

Cette dépêche fait le point sur les bonnes pratiques Python en cette rentrée 2019.

![Un barbu présente le logo de Python](./partie-1.png)


Licence
=======


Cette dépêche est publiée sous [[licence CC0]] (sous domaine publique dans les pays où cela et possible) car je souhaite te permettre de recopier/modifier/réutiliser/republier ce contenu sans t’obliger à citer ses auteurs (sauf que la loi de certains pays comme la France t’oblige quand même à citer les auteurs).



Popularité du langage Python
============================


StackOverflow
-------------


En 2017, David Robinson, un Data Scientist travaillant pour StackOverflow, a publié un article *The Incredible Growth of Python* dans lequel, en se basant sur les questions posées sur StackOverflow, il réalise une projection du trafic dans les prochaines années. Pour sa projection, David prend en compte les pays à forts revenus, car ce sont souvent les premiers à adopter les nouvelles technologies.


[![Projection du trafic sur StackOverflow concernant les principaux langages de programmation](https://1015711.v1.pressablecdn.com/wp-content/uploads/2017/09/projections-1-1024x878.png)](https://stackoverflow.blog/2017/09/06/incredible-growth-python/ « Le trafic web concernant Python devraient représenter plus de 13 % en 2020, devant JavaScript et Java qui devraient être dans les 10 %.")


L’année suivante (2018), le trafic web relatif aux questions Python représente une part de plus en plus importante.


![Trafic StackOverflow concernant les principaux langages de programmation entre 2012 et 2018](traffic-web-stack-overflow-2018.png)


Chaque année, StackOverflow réalise un sondage et publie les *Developer Survey Results*.
La question sur les langages informatiques utilisés confirme la tendance.
Je n’ai pas pris en compte HTML et CSS car non présent dans les anciens sondages.



### Le langage le plus utilisé ?
    
&emsp; &emsp;   2013       | 2014       | [2015][5]  | [2016][6]  | [2017][7]  | [2018][8]  | [2019][9]
---------------------------|------------|------------|------------|------------|------------|------------
&nbsp;1. &emsp; SQL        | JavaScript | JavaScript | JavaScript | JavaScript | JavaScript | JavaScript
&nbsp;2. &emsp; JavaScript | SQL        | SQL        | SQL        | SQL        | SQL        | SQL
&nbsp;3. &emsp; C#         | Java       | Java       | Java       | Java       | Java       | **Python**
&nbsp;4. &emsp; Java       | C#         | C#         | C#         | C#         | Shell      | Java
&nbsp;5. &emsp; PHP        | PHP        | PHP        | PHP        | **Python** | **Python** | Shell
&nbsp;6. &emsp; C++        | **Python** | **Python** | **Python** | PHP        | C#         | C#
&nbsp;7. &emsp; C          | C++        | C++        | C++        | C++        | PHP        | PHP
&nbsp;8. &emsp; **Python** | C          | C          | AngularJS  | C          | C++        | C++
&nbsp;9. &emsp; ObjectiveC | ObjectiveC | Node.js    | Node.js    | TypeScript | C          | TypeScript
10.      &emsp; Ruby       | Ruby       | AngularJS  | C          | Ruby       | TypeScript | C
11.      &emsp; Node.js    | Node.js    | Ruby       | Ruby       | Swift      | Ruby       | Ruby
    
[5]: https://insights.stackoverflow.com/survey/2015#tech-lang
[6]: https://insights.stackoverflow.com/survey/2016#technology-most-popular-technologies
[7]: https://insights.stackoverflow.com/survey/2017#technology-_-programming-languages
[8]: https://insights.stackoverflow.com/survey/2018#technology-_-programming-scripting-and-markup-languages
[9]: https://insights.stackoverflow.com/survey/2019#technology-_-programming-scripting-and-markup-languages

Et la question, certainement la plus intéressante pour sentir le désir des développeurs, concerne les langages (au sens large) les plus aimés, les plus redoutés et les plus désirés.



### Le plus aimé ?
    
&emsp; &emsp;   2015       | 2016       |  2017      |  2018      | 2019
---------------------------|------------|------------|------------|-----------
&nbsp;1. &emsp; Swift      | Rust       | Rust       | Rust       | Rust
&nbsp;2. &emsp; C++11      | Swift      | Smalltalk  | Kotlin     | **Python**
&nbsp;3. &emsp; Rust       | F#         | TypeScript | **Python** | TypeScript
&nbsp;4. &emsp; Go         | Scala      | Swift      | TypeScript | Kotlin
&nbsp;5. &emsp; Clojure    | Go         | Go         | Go         | WebAsembly
&nbsp;6. &emsp; Scala      | Clojure    | **Python** | Swift      | Swift
&nbsp;7. &emsp; F#         | React      | Elixir     | JavaScript | Clojure
&nbsp;8. &emsp; Haskell    | Haskell    | C#         | C#         | Elixir
&nbsp;9. &emsp; C#         | **Python** | Scala      | F#         | Go
10. &emsp;      **Python** | C#         | Clojure    | Clojure    | C#

D'après les résultats de l'étude StackOverflow, Python est le premier langage de programmation qui est à la fois très utilisé et très aimé. C'est aussi le langage le plus désiré.

### Le plus désiré ?
    
&emsp; &emsp;  2015         | 2016       |  2017      |  2018      | 2019
----------------------------|------------|------------|------------|-----------
&nbsp; 1. &emsp; Android    | Android    | **Python** | **Python** | **Python**
&nbsp; 2. &emsp; JavaScript | Node.js    | JavaScript | JavaScript | JavaScript
&nbsp; 3. &emsp; **Python** | AngularJS  | Go         | Go         | Go
&nbsp; 4. &emsp; Node.js    | **Python** | C++        | Kotlin     | TypeScript
&nbsp; 5. &emsp; AngularJS  | JavaScript | Java       | TypeScript | Kotlin
&nbsp; 6. &emsp; Java       | React      | TypeScript | Java       | Rust
&nbsp; 7. &emsp; iOS        | Swift      | C#         | C++        | C++
&nbsp; 8. &emsp; Arduino/R.Pi| MongoDB    | Swift      | Swift      | WebAssembly
&nbsp; 9. &emsp; Swift      |Arduino/R.Pi| Ruby       | HTML       | Java
10. &emsp;       C#         | C++        | Rust       | CSS        | SQL

GitHub
------



Chaque année, l’[Octoverse de GitHub](https://octoverse.github.com/projects) comptabilise, à partir des dépôts privés et publics, le nombre de contributeurs uniques par langage de programmation, dont voici la liste des dix premiers langages :



&emsp; &emsp;   2014       | 2015       | 2016       | 2017       | 2018
---------------------------|------------|------------|------------|-------
&nbsp;1. &emsp; JavaScript | JavaScript | JavaScript | JavaScript | JavaScript
&nbsp;2. &emsp; Java       | Java       | Java       | Java       | Java
&nbsp;3. &emsp; PHP        | **Python** | **Python** | **Python** | **Python**
&nbsp;4. &emsp; **Python** | PHP        | PHP        | PHP        | PHP
&nbsp;5. &emsp; Ruby       | Ruby       | C#         | C++        | C++
&nbsp;6. &emsp; C++        | C++        | C++        | C#         | C#
&nbsp;7. &emsp; C          | C#         | Ruby       | C          | TypeScript
&nbsp;8. &emsp; C#         | C          | C          | Shell      | Shell
&nbsp;9. &emsp; Shell      | Shell      | Shell      | Ruby       | C
10.      &emsp; ObjectiveC | ObjectiveC | ObjectiveC | TypeScript | Ruby

Un autre résultat intéressant pour faire des prévisions sont l’augmentation du nombre de contributeurs par langage informatique :



Augmentation | Langage
------------:|---------
+ 160 %      | [Kotlin](https://fr.wikipedia.org/wiki/Kotlin_(langage))
+ 120 %      | [HCL](https://github.com/hashicorp/hcl "HashiCorp Configuration Language")
+  90 %      | [TypeScript](https://fr.wikipedia.org/wiki/TypeScript)
+  70 %      | [PowerShell](https://fr.wikipedia.org/wiki/Windows_PowerShell)
+  70 %      | [Rust](https://fr.wikipedia.org/wiki/Rust_(langage))
+  60 %      | [CMake](https://fr.wikipedia.org/wiki/CMake)
+  50 %      | [Go](https://fr.wikipedia.org/wiki/Go_(langage))
+  50 %      | [**Python**](https://fr.wikipedia.org/wiki/Python_(langage))
+  40 %      | [Groovy](https://fr.wikipedia.org/wiki/Groovy_(langage))



D’après les résultats de l'étude GitHub, Python est à la fois le langage ayant une des communautés d'utilisateurs la plus importante (en troisième position) mais aussi ayant une des plus fortes progression du nombre de ses contributeurs sur la période 2017-2018 (+50%).

Tiobe
-----



Tiobe a une approche indépendante des données des entreprises, pas besoin d’avoir accès aux métriques réseaux du site StackOverflow ou d’analyser les codes source publics et privés de GitHub. Tout simplement, Tiobe utilise une vingtaine de moteur de recherche avec `+"Python programming"`, et prend le maximum du nombre de résultats (pour éviter de compter plusieurs fois les mêmes résultats). Les langages pouvant avoir des appellations différentes sont regroupés comme `JavaScript`, `JS` et `SSJS`. Les termes `"Python3 programming"`, `"Python-3 programming"` et `"Python 3 programming"` ne sont pas pris en compte.

![Indice Tiobe entre 2002 et 2019](tiobe-aout-2019.png)


Avant 2002, l’[indice Tiobe](https://www.tiobe.com/tiobe-index/) utilisait d’autres méthodes pour comptabiliser la popularité des langages de programmation. Son historique remonte à 1989, il y a 30 ans !

Tiobe, décerne aussi le prix de la célébrité au langage ayant la plus forte hausse chaque année. Python est le langage ayant été le plus souvent lauréat du prix de la célébrité : en 2007, 2010 et 2018. Nous pouvons aussi supposer de même dans les années 1990 quand on voit que Python obtient des scores de plus de 20 % pour les années 1999 et 1994.

Rendre un script exécutable
===========================


Pour lancer un script Python, de nombreuses personnes font :


```
python3 script.py
```




Avec deux petits changements, il est possible de le lancer juste comme ça :


```
./mon-script.py
```



Premier changement, dire que le script est un fichier e**X**écutable :


```
chmod +x mon-script.py
```



Second changement, on rajoute un [[shebang]] sur la **PREMIÈRE** ligne du fichier `mon-script.py` :


* Pas bien 😯
    
    ```sh
    #!/usr/bin/python
    ```


* Pas bien 🤔
    
    ```sh
    #!/usr/bin/python3
    ```
* Très bien 😛
    
    ```sh
    #!/usr/bin/env python3
    ```


Les deux premiers caractères du fichier "`#!`" sont appelés le [[shebang]] et même des langages dont le [croisillon](https://fr.wikipedia.org/wiki/Croisillon_(signe)) "`#`" n’est pas utilisé pour les commentaires, le prennent en charge, comme pour [PHP](https://www.php.net/manual/fr/features.commandline.usage.php#example-422).


Le `/usr/bin/env` 


j-100 avant la fin de Python 2
==============================


La durée de maintenance d’une version Python est [généralement](https://devguide.python.org/devcycle/#end-of-life-branches) de 5 ans.
Mais Python 2.7 (2010) bénéficie d’une durée de maintenance étendue, jusqu’au [1ᵉʳ janvier 2020](https://pythonclock.org/). C’est la version de Python ayant la plus grande durée de maintenance, ce qui explique aussi le fait que de nombreuses organisations se soient concentrées sur d’autres problématiques plus urgentes, et par [procrastination](https://fr.wikipedia.org/wiki/Procrastination), Python 2 est encore utilisé en 2019 !


Si tu dois maintenir du code compatible Python 2.6 (2008) ou 2.7 (2010),
ce chapitre est fait pour toi.
Si tu dois maintenir une compatibilité avec Python 2.4 (2004),
tu peux regarder comment le projet Ansible s’y prend.


Mort du projet utilisant Python 2
---------------------------------


Si le code compatible Python 2 est prévu pour être remplacé par autre chose dans un avenir proche, le conseil : soit fainéant, fait le strict minimum, et aide plutôt à faire avancer le projet qui doit remplacer le vieux code Python 2.


Tu peux quand même remplacer `python` par `python2` pour explicitement indiquer que c’est seulement compatible Python 2. Par exemple, en haut de tes scripts `*.py` remplace le [shebang](https://fr.wikipedia.org/wiki/Shebang).


* Pas bien 😯
    
    ```sh
    #!/usr/bin/python
    ```


* Pas bien 🤔
    
    ```sh
    #!/usr/bin/env python
    ```


* Très bien 😛
    
    ```sh
    #!/usr/bin/env python2
    ```


Les versions des grandes distributions GNU/Linux qui sortent pour cette fin d’année, devraient avoir la comande `python` qui correspond à Python 3. Que ce soit Debian, Arch, Ubuntu, Fedora, openSUSE… toutes auront (enfin) migré leurs scripts vers Python 3, les rares scripts qui nécessitent encore de Python 2 appelleront explicitement `python2` et non pas `python`.



Nouveau code compatible Python 2 et 3
-------------------------------------


Si tu écris du **nouveau** code qui doit être compatible à la fois Python 2 et 3, alors ajoute en haut de ton **nouveau** fichier `*.py` la ligne suivante:


```python
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
from __future__ import unicode_literals

from builtins import *

from future import standard_library
standard_library.install_aliases()
```



⚠ Attention. Ne pas le faire sur ta base de vieux code Python 2 ⚠ |
------------------------------------------------------------------|--


Le top est d’avoir cette ligne dans tous tes fichiers `*.py`.
En plus de devoir adapter le code source, de nouveaux bugs peuvent apparaître. Par exemple, la ligne `from __future__ import division` change le résultat de `x = 1 / 2`:


```python
$ python2
Python 2.7.16
>>> 1 / 2
0
>>> from __future__ import division
>>> 1 / 2
0.5
```



<kyb>[CTRL]</kyb> + <kyb>[D]</kyb>


```python
$ python3
Python 3.7.3
>>> 1 / 2
0.5
```



Si tu testes du code en mode interactif, comme dans l’exemple `python2` ci-dessus ou avec `ipython`, penses à taper tous ces `import` avant de tester ton code pour être sûr d’avoir le même comportement. Pour ne pas avoir à taper ces lignes à chaque fois, tu peux les mettre dans le script d’initialisation, comme sur cet exemple:


```
$ cat ~/.ipython/profile_default/startup/ipython_config.py

from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
from __future__ import unicode_literals

from builtins import *

from future import standard_library
standard_library.install_aliases()
```



Attention, à ne pas s’emmêler les pinceaux en voulant tester du code *Python 2 only* et du code compatible avec les deux versions !


Autre détail : le [shebang](https://fr.wikipedia.org/wiki/Shebang). Comme dit plus haut, la commande `python` devrait correspondre à Python 3 avec la sortie des nouvelles versions Debian, Arch (rolling), Ubuntu, Fedora, openSUSE.


Si ton script pourrait être exécuté sur une machine ayant seulement Python 2 :


```sh
#!/usr/bin/env python
# Ce script est compatible Python 2 et 3
# Ce script doit pouvoir être exécuté sur une machine ayant seulement Python 2
```



Sinon :


```sh
#!/usr/bin/env python3
# Ce script est compatible Python 2 et 3
# Ce script est toujours exécuté sur une machine ayant Python3
```






Migration vers Python 3
-----------------------



Il existe déjà beaucoup d’articles sur le sujet, voici quelques liens :



* [Article de janvier 2019](https://blog.invivoo.com/la-migration-de-python-2-x-a-python-3-x/) (en français)
* Migration assistée avec [`2to3`](https://docs.python.org/fr/3.9/library/2to3.html) (en français)
* [Documentation officielle](https://docs.python.org/3.9/howto/pyporting.html) (en anglais)



Migration vers Go
-----------------



Google utilisait pas mal d’applications Python 2.7 pour gérer la partie serveur de certains de leurs sites web (comme YouTube). Leur décision a été de migrer vers [Go](https://fr.wikipedia.org/wiki/Go_(langage)). Google a publié en 2017, leur script de ~~migration~~ [transpilation](https://fr.wiktionary.org/wiki/transpilation):
https://github.com/google/grumpy



Installer des modules Python
============================



Le gestionnaire de paquets Python de référence s’appelle `pip`.
Et nous voyons cette ligne de commande sur de très nombreux sites web :



> Pour installer ce module Python faire :
>
> ```
> pip install "nom-du-module-python"
> ```



Non, ce n’est pas une bonne idée, car on commence à contourner les problèmes avec :



```
sudo pip install "nom-du-module-python"    # en root
```



Ce qui rentre en conflit avec :


```
sudo apt install "autre-nom-du-meme-module-python"
sudo dnf install "autre-nom-du-meme-module-python"
sudo yum install "autre-nom-du-meme-module-python"
```



Et pire, on se met à mettre à jour `pip` avec lui-même, car il nous le réclame : `pip install --upgrade pip`… Installer des modules Python devient un bazar si on ne prend pas les bonnes pratiques dès le début.


[![Image Xkcd décrivant la complexité de l’installation des modules Python](https://imgs.xkcd.com/comics/python_environment_2x.png)](https://xkcd.com/1987/)



Bien utiliser `pip`
-------------------



Cette problématique est très fréquente comme nous pouvons le constater sur le [ticket #5599 du projet `pip`](https://github.com/pypa/pip/issues/5599).



Bonnes pratiques :



1. Ne jamais utiliser `sudo pip` car la gestion des paquets (et des modules Python) du système est gérée par `apt`, `yum`, `dnf`…
2. Utiliser `pip install --user` pour installer des modules pour son besoin personnel sans écraser les modules Python du système ;
3. Ne pas utiliser `pip install` (même avec `--user`)



Les pratiques n°2 et n°3 rentrant en conflit, bien réfléchir avant d’installer un module python avec `pip`. Est-ce que le module peut être installé avec `apt`, `yum`, `dnf` ? De quelle version ai-je besoin ? Et pourquoi pas un environnement Python virtualisé ? Et un conteneur ?…


Bon, revenons à `pip`, tu as décidé d’appliquer la pratique n°2 et de ne pas écouter la pratique n°3. Donc tu installes ton module en précisant **toujours** l’argument `--user` :


```sh
pip install "nom-du-module-python" --user
```



Attention, ton `pip` utilise peut-être Python 2, voici une meilleure ligne de commande :


```sh
pip3 install "nom-du-module-python" --user
```



Attention, tu pourrais avoir plusieurs versions Python 3 installées sur ta machine.
Voici une encore meilleure ligne de commande :


```sh
python3 -m pip install "nom-du-module-python" --user
```





Pour la différence entre `pip3` et `python3 -m pip` lire les détails sur [stackoverflow](https://stackoverflow.com/q/25749621/938111) (en anglais). En bref, on est sûr que `python3 -m pip` utilise la même arborescence d’installation que le script que tu exécutes avec `python3 « nom-du-script.py"` (ou `#!/usr/bin/env python3`). C’est d’autant plus recommandé si ton `$PATH` est tarabiscoté, si tu as plusieurs installations de Python ou que tu utilises Windows.


Et si tu veux préciser l’installation Python avec laquelle tu souhaites travailler :

```sh
/chemin/vers/bin/python3 -m pip install "nom-du-module-python" --user
```



Attention, si nous avions une ancienne version du module python déjà installée sur notre machine, les commandes `pip` ci-dessus ne nous permettent pas d’installer la dernière version du module Python :-/


Ajoute l’argument `--upgrade` :


```
python3 -m pip install "nom-du-module-python" --user --upgrade
```



Tu peux aussi changer la barre de progression :


```
python3 -m pip install "nom-du-module-python" --user --upgrade --progress-bar emoji
```



Et pour utiliser le module Python fraichement installé :


```sh
python3 -m "nom-du-module-python" [options du module]
```





Oui, cela devient compliqué ! Mais cette façon de faire, avec malheureusement de longues lignes de commande, va nous éviter bien des problèmes.


Mettre à jour les modules Python
================================


Alors que nos `apt`, `yum`, `dnf`… nous mettent à jours nos applications et leurs dépendances. Qui s’occupe de le faire pour les modules installés par `pip install --user` ?
Eh bien, c’est à faire à la main, comme pour `flatpak` et `snap` (pour ceux qui n’ont pas `dnf`).



Et quel est l’équivalent d’un `apt upgrade` avec `pip` ?
Eh bien, il n’y en a pas, `pip` propose seulement un argument `--outdated` pour lister les modules obsolètes. Utilisons donc cet argument dans une ligne de commande bien plus longue, accroche-toi :


```sh
python3 -m pip list --user --outdated --format freeze |
  cut -d= -f1 |
  xargs --no-run-if-empty python3 -m pip install --user --upgrade --progress-bar emoji
```





Si tu utilises macOS, retire l’argument `--no-run-if-empty` ci-dessus.



Notons que de nombreuses applications systèmes sont codées en Python. Mettre à jour les modules et leurs dépendances même avec l’argument `--user` peut changer le comportement des applications exécutées par l'utilisateur. Par exemple, si tu utilises [`meld`](https://doc.ubuntu-fr.org/meld) à la ligne de commande pour comparer deux fichiers, `meld` pourrait ne plus fonctionner correctement. C’est qu’il fallait respecter la bonne pratique n°3 ! (lire aussi le [commentaire de lolop](https://linuxfr.org/users/oliver_h/journaux/quelques-bonnes-pratiques-python-pour-2019#comment-1766432))


Pour l’anecdote, un jour, je décide de mettre à jour mes modules python dont un module `redis` qui avait été installé à partir d’un fichier `requirements.txt` avec une version précise. Sans m’en rendre compte ce module passait de la version 2 à la version 3 avec une [incompatibilité dans l’appel des fonctions](https://pypi.org/project/redis/#upgrading-from-redis-py-2-x-to-3-0). Benoît Sibaud a eu un souci similaire avec [pyOpenssl en conflit avec la version fournie par le gestionnaire de paquets de la distrib](https://linuxfr.org/users/oliver_h/journaux/quelques-bonnes-pratiques-python-pour-2019#comment-1766396). C’est à ce moment-là que l’on comprend pourquoi `pip` ne permet pas de mettre à jour tous les modules d’un coup !



Si tu t’amuses à mettre à jour tous tes modules avec `pip` prend quand même des précautions, enregistre préalablement les versions des modules avant la mise à jour :


```
python3 -m pip list --user --format freeze > ~/requirements_avant_pip_upgrade.txt

python3 -m pip list --user --outdated --format freeze |
  cut -d= -f1 |
  xargs --no-run-if-empty python3 -m pip install --user --upgrade --progress-bar emoji

python3 -m pip list --user --format freeze > ~/requirements_apres_pip_upgrade.txt
```



Pour visualiser les changements :


```
sudo apt install meld

meld ~/requirements_avant_pip_upgrade.txt ~/requirements_apres_pip_upgrade.txt
```



En cas de problème, revenir aux versions précédentes :


```
python3 -m pip install --user -r ~/requirements_avant_pip_upgrade.txt
```






Environnement Python virtualisé
==============================



Alors, on ne peut plus utiliser `pip` ?
Si, mais dans un environnement Python virtualisé. \o/


L’idée est d’avoir une installation des modules Python pour chacun de ses projets individuellement, avec une maîtrise des versions et des dépendances. Et le tout versionné avec le code source de son projet. Ainsi nous avons une installation équivalente pour les différents développeurs et la production.


Quelques outils pour créer un environnement virtualisé :



* [*`python -m venv`*](https://docs.python.org/fr/3.9/library/venv.html) fait partie des piles fournies avec Python ;
* [*`virtualenv`*](https://github.com/pypa/virtualenv) est l’ancêtre de `venv` mais il continue d’évoluer et il est bien plus utilisé que `venv` ([article en français](https://python-guide-pt-br.readthedocs.io/fr/latest/dev/virtualenvs.html)) ;
* [*`pipenv`*] est une surcouche agréable au-dessus de `virtualenv` et de `pip` ;
* [*`conda`*](https://en.wikipedia.org/wiki/Conda_(package_manager)) alternative à `pip`.


Le [Gestionnaire de paquets](https://fr.wikipedia.org/wiki/Gestionnaire_de_paquets) [`conda`](https://en.wikipedia.org/wiki/Conda_(package_manager)) est développé pour [Anaconda](https://fr.wikipedia.org/wiki/Anaconda_(Python_distribution)), une autre distribution Python. Celle-ci fonctionne plutôt bien sur Windows et macOS et elle est très utile pour travailler sur des calepins *(notebooks)* [Jupyter](https://fr.wikipedia.org/wiki/Jupyter) malgré l’absence de nombreux paquets.



Surcouche `pipenv`
==================


Goldy [nous recommande `pipenv`](https://linuxfr.org/users/oliver_h/journaux/quelques-bonnes-pratiques-python-pour-2019#comment-1766395).


L’installation de `pipenv` se fait avec `pip` :


```
python3 -m pip install pipenv --user --upgrade --progress-bar emoji
```



Se positionner à la base de son projet et installer deux modules avec `pipenv` :


```sh
$ cd /chemin/vers/mon/projet/chouette
```



```sh
$ pipenv install flask
Creating a virtualenv for this project…
Pipfile: /chemin/vers/mon/projet/chouette/Pipfile
Using /usr/bin/python3 (3.7.3) to create virtualenv…
⠸ Creating virtual environment...Already using interpreter /usr/bin/python3
Using base prefix '/usr'
New python executable in /home/tux/.local/share/virtualenvs/chouette-4m-Hw0ap/bin/python3
Also creating executable in /home/tux/.local/share/virtualenvs/chouette-4m-Hw0ap/bin/python
Installing setuptools, pip, wheel...
done.

✔ Successfully created virtual environment! 
Virtualenv location: /home/tux/.local/share/virtualenvs/chouette-4m-Hw0ap
Creating a Pipfile for this project…
Installing flask…
Adding flask to Pipfile's [packages]…
✔ Installation Succeeded 
Pipfile.lock not found, creating…
Locking [dev-packages] dependencies…
Locking [packages] dependencies…
✔ Success! 
Updated Pipfile.lock (662286)!
Installing dependencies from Pipfile.lock (662286)…
  🐍   ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 6/6 — 00:00:01
To activate this project's virtualenv, run pipenv shell.
Alternatively, run a command inside the virtualenv with pipenv run.
θ82° [b:~/chouette] 24s $ ll
total 12K
-rw-r--r-- 1 4,5K août  31 15:42 Pipfile.lock
-rw-r--r-- 1  150 août  31 15:42 Pipfile
```



```sh
$ pipenv install --dev autopep8
Installing autopep8…
Adding autopep8 to Pipfile's [dev-packages]…
✔ Installation Succeeded 
Pipfile.lock (b0a650) out of date, updating to (662286)…
Locking [dev-packages] dependencies…
✔ Success! 
Locking [packages] dependencies…
✔ Success! 
Updated Pipfile.lock (b0a650)!
Installing dependencies from Pipfile.lock (b0a650)…
  🐍   ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 8/8 — 00:00:01
To activate this project's virtualenv, run pipenv shell.
Alternatively, run a command inside the virtualenv with pipenv run.
```



Nous avons deux nouveaux fichiers `Pipfile` et `Pipfile.lock` :


```yaml
$ head -n 33 Pipfile*
==> Pipfile <==
[[source]]
name = "pypi"
url = "https://pypi.org/simple"
verify_ssl = true

[dev-packages]
autopep8 = "*"

[packages]
flask = "*"

[requires]
python_version = "3.7"

==> Pipfile.lock <==
{
    "_meta": {
        "hash": {
            "sha256": "be66bf67d2a9a5d1606be53501e0b029c8c465fc0660151ea0b5c780f7b0a650"
        },
        "pipfile-spec": 6,
        "requires": {
            "python_version": "3.7"
        },
        "sources": [
            {
                "name": "pypi",
                "url": "https://pypi.org/simple",
                "verify_ssl": true
            }
        ]
    },
    "default": {
        "click": {
            "hashes": [
                "sha256:2335065e6395b9e67ca716de5f7526736bfa6ceead690adf616d925bdc622b13",
                "sha256:5b94b49521f6456670fdb30cd82a4eca9412788a93fa6dd6df72c94d5a8ff2d7"
            ],
            "version": "==7.0"
        },
        "flask": {
            "hashes": [
                "sha256:13f9f196f330c7c2c5d7a5cf91af894110ca0215ac051b5844701f2bfd934d52",
                "sha256:45eb5a6fd193d6cf7e0cf5d8a5b31f83d5faae0293695626f539a823e93b13f6"
            ],
            "index": "pypi",
            "version": "==1.1.1"
        },
```



Ces deux fichiers `Pipfile` et `Pipfile.lock` peuvent remplacer les fichiers `requirements.txt` et `requirements-dev.txt` que nous rencontrons souvent à la base des projets Python. Et peuvent aussi remplacer les sections `install_requires` et `extras_require` du fichier `setup.py`.


Le fichier `Pipfile` au format [TOML](https://fr.wikipedia.org/wiki/TOML) spécifie les règles générales.
Le fichier `Pipfile.lock` au format [JSON](https://fr.wikipedia.org/wiki/JavaScript_Object_Notation) vérouille *(lock)* les versions utilisées des modules et de chacune des dépendances.


Il n’est pas nécessaire de versionner le fichier `Pipfile.lock` car `pipenv` le génère automatiquement à partir du fichier `Pipenv`. Néanmoins, je recommande de le versionner afin de suivre l’évolution des versions des dépendances et de s’assurer que tous utilisent les mêmes versions : développeurs, intégrateurs, production…


Visitons notre environnement virtualisé avec la commande `pipenv shell` :


```shell
$ pipenv shell
Launching subshell in virtual environment…
 . /home/tux/.local/share/virtualenvs/chouette-4m-Hw0ap/bin/activate
```



```shell
$ pip list
Package      Version
------------ -------
autopep8     1.4.4  
Click        7.0    
Flask        1.1.1  
itsdangerous 1.1.0  
Jinja2       2.10.1 
MarkupSafe   1.1.1  
pip          19.2.3 
pycodestyle  2.5.0  
setuptools   41.2.0 
Werkzeug     0.15.5 
wheel        0.33.6 
```





Utilise <kbd>[Ctrl]</kbd> + <kbd>[D]</kbd> ou `exit` pour sortir du `pipenv shell`.



La commande `pipenv run` est aussi bien pratique :


```shell
$ pipenv run pip list
Package      Version
------------ -------
autopep8     1.4.4  
Click        7.0    
Flask        1.1.1  
itsdangerous 1.1.0  
Jinja2       2.10.1 
MarkupSafe   1.1.1  
pip          19.2.3 
pycodestyle  2.5.0  
setuptools   41.2.0 
Werkzeug     0.15.5 
wheel        0.33.6 
```



Mais pour visualiser ses dépendances, il y a mieux que `pip list`, il y a `pipenv graph`:


```shell
$ pipenv graph
autopep8==1.4.4
  - pycodestyle [required: >=2.4.0, installed: 2.5.0]
Flask==1.1.1
  - click [required: >=5.1, installed: 7.0]
  - itsdangerous [required: >=0.24, installed: 1.1.0]
  - Jinja2 [required: >=2.10.1, installed: 2.10.1]
    - MarkupSafe [required: >=0.23, installed: 1.1.1]
  - Werkzeug [required: >=0.15, installed: 0.15.5]
```



Supprimer son environnement virtualisé avec `pipenv --rm` :


```shell
$ pipenv --rm
Removing virtualenv (/home/tux/.local/share/virtualenvs/chouette-4m-Hw0ap)…
```



Vérifions notre environnement virtualisé :


```shell
$ pipenv run pip list
Creating a virtualenv for this project…
Pipfile: /home/tux/chouette/Pipfile
Using /usr/bin/python3.7m (3.7.3) to create virtualenv…
⠼ Creating virtual environment...Already using interpreter /usr/bin/python3.7m
Using base prefix '/usr'
New python executable in /home/tux/.local/share/virtualenvs/chouette-4m-Hw0ap/bin/python3.7m
Also creating executable in /home/tux/.local/share/virtualenvs/chouette-4m-Hw0ap/bin/python
Installing setuptools, pip, wheel...
done.
Running virtualenv with interpreter /usr/bin/python3.7m

✔ Successfully created virtual environment! 
Virtualenv location: /home/tux/.local/share/virtualenvs/chouette-4m-Hw0ap
Package    Version
---------- -------
pip        19.2.3 
setuptools 41.2.0 
wheel      0.33.6 
```



Installons les modules nécessaires en prod avec `pipenv install` ou `pipenv sync` :


```shell
$ pipenv install
Installing dependencies from Pipfile.lock (b0a650)…
  🐍   ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 6/6 — 00:00:01
To activate this project's virtualenv, run pipenv shell.
Alternatively, run a command inside the virtualenv with pipenv run.
```



```shell
$ pipenv run pip list
Package      Version
------------ -------
Click        7.0    
Flask        1.1.1  
itsdangerous 1.1.0  
Jinja2       2.10.1 
MarkupSafe   1.1.1  
pip          19.2.3 
setuptools   41.2.0 
Werkzeug     0.15.5 
wheel        0.33.6 
```



Enfin, installons les modules nécessaires au développement avec l’option `--dev` :


```shell
$ pipenv install --dev
Installing dependencies from Pipfile.lock (b0a650)…
  🐍   ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 8/8 — 00:00:02
To activate this project's virtualenv, run pipenv shell.
Alternatively, run a command inside the virtualenv with pipenv run.
```



```shell
$ pipenv run pip list
Package      Version
------------ -------
autopep8     1.4.4  
Click        7.0    
Flask        1.1.1  
itsdangerous 1.1.0  
Jinja2       2.10.1 
MarkupSafe   1.1.1  
pip          19.2.3 
pycodestyle  2.5.0  
setuptools   41.2.0 
Werkzeug     0.15.5 
wheel        0.33.6 
```





L’installation de [`black`](https://github.com/psf/black) (formateur de code Python) nécessite d’autoriser les versions bêta :



```shell
$ pipenv install --dev --pre black
Installing black…
Adding black to Pipfile's [dev-packages]…
✔ Installation Succeeded 
Pipfile.lock (d00da7) out of date, updating to (b0a650)…
Locking [dev-packages] dependencies…
✔ Success! 
Locking [packages] dependencies…
✔ Success! 
Updated Pipfile.lock (d00da7)!
Installing dependencies from Pipfile.lock (d00da7)…
  🐍   ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 12/12 — 00:00:02
To activate this project's virtualenv, run pipenv shell.
Alternatively, run a command inside the virtualenv with pipenv run.
```

Sans l’option `--dev` nous obtenons l’erreur peu explicite `"ERROR : Could not find a version that matches black"` au milieu d’un tas de logs peu intuitifs. Maintenenant, notre fichier `Pipfile` contient une section `allow_prereleases = true` :

```toml
$ cat Pipfile
[[source]]
name = "pypi"
url = "https://pypi.org/simple"
verify_ssl = true

[dev-packages]
autopep8 = "*"
black = "*"

[packages]
flask = "*"

[requires]
python_version = "3.7"

[pipenv]
allow_prereleases = true
```



C’est une mauvaise idée d’installer `black` avec `pipenv` car cela nous force à activer `allow_prereleases = true` qui s’applique aussi aux versions utilisées pour l’exécution de l’application. Je recommande plutôt d’installer `black` avec `pip install --user`.


Nous avons `black`, alors désinstallons `autopep8` :


```shell
$ pipenv uninstall autopep8
Uninstalling autopep8…
Uninstalling autopep8-1.4.4:
  Successfully uninstalled autopep8-1.4.4

Removing autopep8 from Pipfile…
Locking [dev-packages] dependencies…
✔ Success! 
Locking [packages] dependencies…
✔ Success! 
Updated Pipfile.lock (a5c3f0)!
```



Faisons le ménage, désinstallons les dépendances qui ne sont plus nécessaires :


```shell
$ pipenv clean
Uninstalling pycodestyle…
```



Franchement, c’est un outil facile à utiliser et très pratique.
Personnellement, je me passe des commandes `pipenv install` et `pipenv uninstall`, tellement l’édition directe du fichier `Pipenv` est simple.
Par contre, la commande `pipenv install` est pratique lors de l’ajout d’une dépendance avec des paramètres compliqués : j’applique la ligne de commande de `pip install` à `pipenv install`.


Exemple, la documentation dit :


```sh
pip install git+ssh://git@gitlab.monordi:1234/mongroup/cool.git#egg=cool
```



Donc nous remplaçons `pip` par `pipenv` :


```sh
pipenv install git+ssh://git@gitlab.monordi:1234/mongroup/cool.git#egg=cool
```



Et nous obtenons une nouvelle ligne dans notre fichier `Pipfile` :


```toml
[packages]
cool = {git = "ssh://git@gitlab.monordi:1234/mongroup/cool.git"}
```





😘✨ Merci aux contributrices et contributeurs de `pipenv` (dont environ [300 personnes listées sur GitHub](https://github.com/pypa/pipenv/graphs/contributors)).


# Poetry
https://poetry.eustace.io/ https://github.com/sdispater/poetry sortie récemment en v1.0.0b1. Il utilise le format de fichier recommandé par le projet Python pour y stocker les dépendances et autres `pyproject.toml`. Il verrouille les dépendances dans le fichier `poetry.lock`.
Il permet l’usage d’un fichier centralisé pour la distribution sur PyPi. Plus besoin de `setup.{py,cfg}`. `poetry publish` permet de publier sur PyPi.

Formateurs de code source
==========================


Les formateurs de code source ne dépendent pas des modules utilisés par les projets. Donc nous pouvons les installer avec `pip` :


```shell
python3 -m pip install --progress-bar emoji --user --upgrade black
python3 -m pip install --progress-bar emoji --user --upgrade yapf
python3 -m pip install --progress-bar emoji --user --upgrade autopep8
python3 -m pip install --progress-bar emoji --user --upgrade docformatter
```





`black`
-------



Le projet [`black`](https://github.com/psf/black) est très récent, son premier commit date de mars 2018. Et pourtant ce formateur de code python bénéficie d’un succès énorme avec plus de 12 000 étoiles sur GitHub (et une centaine de contributeurs).


Son succès est lié à la quasi-absence de configuration et fonctionne dans le même esprit que `gofmt`, c’est-à-dire que les développeurs n’ont plus à discuter des règles de codage. C’est toujours `black` qui a raison et on ne perd plus de temps à négocier les règles, à les rediscuter en revue de code… On se concentre sur son travail : coder sans se prendre la tête à bien indenter. De toutes façons, `black` va changer l’indentation avec ses propres règles de codage non-négociables : *uncompromising Python code formater*.



Les deux seuls paramètres sur lesquels ont peut encore chipoter :


* `--line-length 88`
* `--skip-string-normalization`  
  (si présent ne remplace pas `'texte'` par `"texte"`)


Exemple :



```python
$ cat > bateau.py
capitaine = { 'age':   42,       # univers ?
              'nom':  'Grant',
              'pays': 'Royaume-Uni',
            }
navire    = { 'nom':       'Britannia',
              'longueur':   127,# metres
              'tonnage':    5860,
              'lancement': "16 mars 1953"
            }

mission  =  { "commandant" : capitaine , 'bateau' : navire , }
f  =  lambda x:   True if x%9 == 0   else False
```



```shell
$ black .
reformatted bateau.py
All done! ✨ 🍰 ✨
1 file reformatted.
```



```python
$ cat bateau.py
capitaine = {"age": 42, "nom": "Grant", "pays": "Royaume-Uni"}  # univers ?
navire = {
    "nom": "Britannia",
    "longueur": 127,  # metres
    "tonnage": 5860,
    "lancement": "16 mars 1953",
}

mission = {"commandant": capitaine, "bateau": navire}
f = lambda x: True if x % 9 == 0 else False
```





`yapf`
------



Le projet [Yet Another Python Formatter](https://github.com/google/yapf) est plus vieux que `black` (premier commit en mars 2015), a moins d’étoiles (9 700) et le même nombre de contributeurs.


L’innovation de `yapf` réside dans la réutilisation du puissant [`clang-format`](https://github.com/llvm-mirror/clang/tree/master/tools/clang-format). Les règles de sa configuration sont prises en compte pour calculer le score de tel ou tel reformatage et de boucler ainsi afin d’obtenir le meilleur score.


L’idée est superbe, mais en pratique, on passe trop de temps à essayer de peaufiner la configuration sans trop comprendre quel paramètre influe sur telle indentation.
Et comme c’est configurable, une personne va passer du temps pour tenter d’améliorer les choses. Et pire, dans de rares circonstances, `yapf` peut reformater un code source différemment deux fois de suite ! (avec la même configuration)



En fait, le seul paramètre que nous devrions tester c’est `--style` avec les valeurs actuelles : `pep8` (défaut), `google`, `chromium` et `facebook`.



Le résultat à partir du même fichier d’origine quel que soit le paramètre `--style` :



```python
$ yapf bateau.py
capitaine = {
    'age': 42,  # univers ?
    'nom': 'Grant',
    'pays': 'Royaume-Uni',
}
navire = {
    'nom': 'Britannia',
    'longueur': 127,  # metres
    'tonnage': 5860,
    'lancement': "16 mars 1953"
}

mission = {
    "commandant": capitaine,
    'bateau': navire,
}
```





`autopep8`
----------



Le projet [`autopep8`](https://github.com/hhatto/autopep8) est encore plus vieux (premier commit en décembre 2010), a encore moins d’étoiles (3 000) et encore moins de contributeurs (une trentaine).


Ce formateur de code est beaucoup moins agressif que les deux premiers
car il ne reformate pas ce qui est compatible avec les règles PEP8.
Cependant quelques corrections sont intéressantes comme le remplacement de `f = lamda x:` par `def f(x):`.


Le formateur `autopep8` semble avoir `--max-line-length` comme seule règle de formatage. En fait, sa configuration est différente des deux autres : l’option `--ignore` permet de désactiver des règles. Les options `--aggressive` et `--experimental` sont intéressantes.


Exemple :


```python
$ autopep8 --aggressive --aggressive --aggressive bateau.py
capitaine = {'age': 42,       # univers ?
             'nom': 'Grant',
             'pays': 'Royaume-Uni',
             }
navire = {'nom': 'Britannia',
          'longueur': 127,  # metres
          'tonnage': 5860,
          'lancement': "16 mars 1953"
          }

mission = {"commandant": capitaine, 'bateau': navire, }


def f(x):
    return True if x % 9 == 0 else False
```





Bilan
-----



Ces formateurs sont à tester sur sa base de code source.


Personnellement, je regrette que `black` mette sur une seule ligne un petit dictionnaire que je trouve plus lisible sur plusieurs lignes. Je suis déçu des quatre styles fournis par `yapf`, et je n’ai pas trouvé une superbe configuration magique. Finalement, sur notre projet c’est le bon vieux vénérable `autopep8` qui est utilisé, car il ne change que très peu le code source que nous écrivons.



`docformatter`
--------------


Oups, j’ai failli oublier de parler de [`docformatter`](https://github.com/myint/docformatter). Celui-ci permet de reformater la partie [docstring](https://en.wikipedia.org/wiki/Docstring#Python) du code source.


Nous l’utilisons avec ces paramètres :


```shell
docformatter --wrap-summaries 444 --pre-summary-newline --in-place --recursive .
```





Analyse statique de code
========================


TODO

```toml
[dev-packages]
# autopep8 = "*"
# black = "*"   # Use "pipenv --pre" to avoid "ERROR: Could not find a version that matches black"
coverage = "*"
# docformatter = "*"
# ddt = "*"         # TODO Oliver: check interest...
# flake8 = "*"
# flake8-bugbear = "*"
# ipykernel = "*"   # use conda
# ipython = "*"     # use conda
# matplotlib = "*"  # use conda
nose = "*"
# pbr = "*"
# pre-commit = "*"  # TODO Oliver: why?
prospector = {extras = ["with_everything"],version = "*"}
frosted = "*"
mypy = "*"
pep257 = "*"
pyroma = "*"
vulture = "*"
pylint = "*"
# scipy = "*"       # use conda
# yapf = "*"
# fbprophet = "*"   # use conda
#
# Pylint plugin to aid Pylint in recognizing and understanding errors caused when using Flask
pylint-flask = "*"
#
# Quote consistency checker for PyLint
pylint-quotes = "*"
#
# Check module topology in pylint
pylint-topology = "*"
#
# Plugin for PyLint that checks if we import only modules or packages. Direct imports of classes, functions and constants are forbidden
# A Pylint plugin to ensure only modules are imported
pylint_google_style_guide_imports_enforcing = "*"
pylint-import-modules = "*"
#
# detecting incorrect use of unittest assertions
pylint-unittest = "*"
#
# check for common issues with usage of requests
pylint-requests = "*"
#
# checking order of the passing keyword arguments to the function
pylint-args = "*"
#
# Additional string spaces checkers
pylint-string-spaces-checkers = "*"
#
# PyLint for your directories
DirPyLint = "*"
```


Arborescence d’un projet Python
===============================


Kenneth Reitz recommandait https://github.com/kennethreitz/samplemod


	docs\
	sample\
	tests\
	LICENSE
	MANIFEST.in
	Makefile
	README.rst
	requirements.txt
	setup.py


Plus récemment, l’équipe *Python Packaging Autority* recommande https://github.com/pypa/sampleproject


	data\
	sample\
	tests\
	LICENSE.txt
	MANIFEST.in
	README.md    # PyPi accepte Markdown depuis 2018
	setup.cfg    # Alternative à setup.py
	setup.py
	tox.ini      # Plus besoin de requirements-test.txt


Voir aussi l’exemple de `setup.cfg` sur le site de [`setuptools`](https://setuptools.readthedocs.io/en/latest/setuptools.html#configuring-setup-using-setup-cfg-files). Voir aussi le code source du module [`tox`](https://pypi.org/project/tox/) qui utilise [principalement `setup.cfg`](https://github.com/tox-dev/tox).


Si tu préfères [[Markdown]] à [[reStructuredText]], sache que [PyPi gère même les tableaux Markdown](https://blog.thea.codes/github-flavored-markdown-on-pypi/).


Mais une révolution est en cours avec les [PEP-517](https://www.python.org/dev/peps/pep-0517/) et [PEP-518](https://www.python.org/dev/peps/pep-0518/), avec l’adoption du fichier `pyproject.toml` en alternative du vénérable `setup.py` et son `setup.cfg` (même `pip` adopte `pyproject.toml`). Mais la vraie révolution est le découplage entre empaquetage et installation. Pour les anglophones je recommande la lecture de [Python packaging – Past, Present, Future](https://www.bernat.tech/pep-517-518/) par Bernát Gábor.


Donc bientôt nous pourrons avoir une arborescence plus simple :


	docs\
	sample\
	tests\
	LICENSE.txt
	README.md
	pyproject.toml
	tox.ini


Par exemple, les dépôts de code source de [`flit`](https://github.com/takluyver/flit), [`poetry`](https://github.com/sdispater/poetry) et de la [PEP-517](https://github.com/pypa/pep517/).



Règles du code source
=====================


Bien que de nombreux développeurs sont d’accords pour respecter la [PEP-8](https://www.python.org/dev/peps/pep-0008/), on a tous nos préférences pour telle ou telle nuance. Par exemple, personnellement j’apprécie lire des valeurs alignées comme ceci :


```py
capitaine = { 'age':    42,
              'nom':    'Grant',
              'bateau': 'Britannia' }
```





Mais ce n’est pas l’avis de tous et chacun a de bons arguments. Par conséquent, du temps précieux est consacré à convaincre/négocier sur tel ou tel aspect. Et puis, avec la rotation naturelle de l’équipe *(turn-over)*, les décisions du passé ne conviennent pas toujours à la nouvelle équipe ! La preuve que l’on y passe du temps, mon bout de code ci-dessus va être repris dans un commentaire plus bas.



Pour mettre tout le monde d’accord, économiser son temps et éviter les polémiques/frustrations, utilisons [**`black`**](https://github.com/ambv/black). C’est un [script python tout-en-un de 4 000 lignes](https://github.com/ambv/black/blob/master/black.py) qui décide/réécrit tout seul vos fichiers Python. L’absence de fichier de configuration évite tout marchandage. Son objectif est de réduire le `diff` entre deux *commits* (minimiser le nombre de lignes modifiés).


Mon code ci-dessus devrait être converti en : <sub>(pas testé)</sub>



```py
capitaine = {
    "age": 42,
    "nom": "Grant",
    "bateau": "Britannia",
}
```





Tests unitaires
===============



Historiquement, nous avons [**`unittest`**](https://docs.python.org/dev/library/unittest.html). D’autres alternatives intéressantes : [**`nose`**](https://nose.readthedocs.io/en/latest/) et [**`pytest`**](https://docs.pytest.org/). Ce dernier permet d’écrire très simplement ses tests unitaires sans avoir à implémenter de classe :


```py
def incremente(x):
    return x + 1

def test_incremente():
    assert incremente(3) == 4
```




Analyse statique de code
========================


Quelques outils intéressants :


* mypy
* pylint
* flake8



Annotation de type
==================


Comme Spack nous le [signalait en 2014](https://linuxfr.org/users/spack/journaux/indication-de-type-pour-python) et récemment amélioré par [Python 3.7](https://linuxfr.org/news/sortie-de-python-3-7#toc-pep560-et-pep563-améliorations-autour-des-annotations), nous pouvons aider l’analyse statique du code source Python en spécifiant les types attendus :


```py
import typing

def ajoute(valeur: int, lst: typing.Sequence[int]) -> typing.List[int]:
    ret = []
    for elem in lst:
        ret.append(elem + valeur)
    return ret
```






Python Build Reasonableness
===========================


Pour éviter de passer du temps à réaliser des tâches répétitives à chaque version, l’équipe de OpenStack les a automatisées dans un script qui est devenu en 2010, le module [`pbr`](https://pypi.org/project/pbr/) pour *__P__ython __B__uild __R__easonableness* (avec sagesse). Ce module a énormément évolué en s’adaptant aux évolutions de Python sur dix ans (150 contributeurs).



Installation
------------



```sh

sudo apt install python3-pbr        # v4.2.0 (Ubuntu 18.10)

# ou une version bien plus récente :

python3 -m pip install --user pbr   # v5.1.3

```



Fonctionnalités
---------------


* Récupère automatiquement la version à partir du tag Git et la passe à `setuptools` (`setup.py`) ;
* Réplique les dépendances du fichier `requirements.txt` vers `setuptools` (`install_requires`) ;
* Maintient la liste des `AUTHORS` à partir du `git log` ;
* Génère le `ChangeLog` en cherchant les mots `feature`, `api-break`, `deprecation` et `bugfix` dans le `git log` ;
* Délègue à [`reno`](https://pypi.org/project/reno/) la gestion des `Release Notes` ;
* Gère le fichier `MANIFEST.in` ;
* ~~Lance les tests via `tox`~~ (déprécié) ;
* Lance [`sphinx`](https://pypi.org/project/Sphinx/) pour produire la documentation.



Avant
-----


```sh
├── nom_du_module_python/
├── AUTHORS
├── CHANGES
├── LICENSE
├── MANIFEST.in
├── README.md
├── RELEASENOTES.txt
├── requirements.txt  # dependance_1 dependance_2...
└── setup.py
    ║
    ╚═╡ from setuptools import setup, find_packages
      │ from os import path
      │
      │ setup(
      │     name = "nom_du_module_python",
      │     version = "1.0.0",
      │     author = "Michel Martin",
      │     author_email = "m.martin@example.com",
      │     description = "Une courte description",
      │     long_description = open(path.join(path.dirname(__file__), 'README.md'), encoding='utf-8').read()
      │     long_description_content_type = "text/markdown",
      │     license = "AGPL",
      │     packages = find_packages(exclude=["test.*"]),
      │     install_requires = ["dependance_1", "dependance_2", "dependance_3", "dependance_4"],
      │ )
```




Après
-----


```sh
├── nom_du_module_python/
├── LICENSE
├── README.md
├── requirements.txt
├── setup.cfg
│   ║
│   ╚═╡ [metadata]
│     │ name = nom_du_module_python
│     │ description = Une courte description
│     │ description-file = README.md
│     │ author = Michel Martin
│     │ author-email = m.martin@example.com
│     │ license = AGPL
│
└── setup.py
    ║
    ╚═╡ from setuptools import setup
      │
      │ setup(
      │     setup_requires = ["pbr"],
      │     pbr = True,
      │ )
```



Bon, c’est vrai, depuis `setuptools-30.3.0` (déc. 2016) on peut [remplacer `setup.py` par `setup.cfg`](https://setuptools.readthedocs.io/en/latest/setuptools.html#configuring-setup-using-setup-cfg-files). Cependant, le *Python Packaging Authority* recommande d'[utiliser principalement le `setup.py`](https://github.com/pypa/sampleproject). Néanmoins, des projets comme [`tox`](https://pypi.org/project/tox/) utilisent [principalement `setup.cfg`](https://github.com/tox-dev/tox).



Distinction entre `install_requires` et `requirements.txt`
----------------------------------------------------------


Le module `pbr` permet d’éviter de gérer en double la liste des dépendances : `pbr` spécifie le paramètre `install_requires` à partir du fichier `requirements.txt`. Mais, sémantiquement, ces deux listes ont deux objectifs différents :


* Le paramètre `install_requires` du fichier `setup.py` (ou `setup.cfg`) est inséré dans le [livrable](https://www.python.org/dev/peps/pep-0427/) et ne précise pas toujours la version des dépendances, du moins l’intervalle des versions pour lequel le livrable est censé être compatible ;
* Le fichier `requirements.txt` est fourni à `pip` pour installer des versions précises pour lesquelles l’application a été validée.


De plus, `requirements.txt` peut contenir des arguments de la ligne de commande `pip` comme `--index-url https://pypi.python.org/simple/` afin d’indiquer explicitement à partir de quel dépôt télécharger les dépendances. Les développeurs utilisent souvent ce fichier pour avoir les mêmes dépendances et éviter de perdre du temps avec une incompatibilité absconse.


En résumé, `install_requires` définit les dépendances compatibles (pour la livraison) et `requirements.txt` spécifie les versions validées (pour le déploiement). Pour plus de détail sur cette sémantique, lire le [*coup de gueule* de Donald Stufft](https://caremad.io/posts/2013/07/setup-vs-requirement/) (2013, en anglais). Lire aussi la [documentation officielle](https://docs.openstack.org/pbr/latest/user/using.html#requirements) (en anglais).


Cependant, dans la pratique, ces deux listes sont souvent gérées de la même façon, donc autant mutualiser les efforts. &emsp; :-)



Futur
-----


Actuellement, `pbr` n’est pas encore compatible avec le fichier `pyproject.toml` ([PEP-517](https://www.python.org/dev/peps/pep-0517/) et [PEP-518](https://www.python.org/dev/peps/pep-0518/)) et ne prend pas en charge les alternatives à [`setuptools`](https://en.wikipedia.org/wiki/Setuptools) comme [`flit`](https://pypi.org/project/flit/) et [`poetry`](https://pypi.org/project/poetry/) (découplage entre empaquetage et installation). Mais les développements sont prévus d’après la [description du module](https://www.python.org/dev/peps/pep-0426/) :


> As [Metadata 2.0](https://www.python.org/dev/peps/pep-0426/) and other modern Python packaging PEPs come out, PBR aims to support them as quickly as possible.



Et tes astuces ?
================


Merci de partager tes recommandations, tes mésaventures, tes bonnes pratiques… :-D



Si ton code source



J’ai découvert/appris Python en le pratiquant au bureau à l’arche, et sans collègue à la fois expert et pédagogue. Du coup, j’ai accumulé plein de mauvaises pratiques que je tente désormais de corriger. Ce journal pour vous partager mes astuces et vous éviter les mêmes pièges :-)



Je ne suis pas encore un expert Python, alors merci de me corriger gentiment dans les commentaires ;-)
