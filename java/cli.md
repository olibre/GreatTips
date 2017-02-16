% Interactive Shell in Java
===========================


Interface Homme Machine
=======================

Les applications ont bien souvent une IHM, elle peut être de type GUI (Graphique) ou CLI (Texte).

En fait, CLI peut signifier trois niveau d'interface :

1.  L'interface de la ligne de commande, donc l'analyse des arguments passés à l'exécutable.
2.  L'interaction via une console *(shell)* intégrée dans l'application.
3.  L'affichage d'une interface utilisateur complète avec des bouton, menus, onglets, mais en mode texte (comme `ncurses`).


Arguments de la ligne de commande
=================================

Pour gérer les arguments de la ligne de commande, la [plate-forme Java](https://fr.wikipedia.org/wiki/Plate-forme_Java) ne fournit [aucune facilité](https://docs.oracle.com/javase/tutorial/essential/environment/cmdLineArgs.html) à part [un bricolage autour des classes `InputStreamReader` et `BufferedReader`](http://alvinalexander.com/blog/post/java/java-source-code-read-command-line-input).

Certaines applications utilisent l'astuce de l'option **`-Dproperty=value`** de la commande java pour récupérer des valeurs sans avoir à analyser les arguments de la ligne de commande.  
http://docs.oracle.com/javase/7/docs/technotes/tools/windows/java.html

Pour analyser les arguments de la ligne de commande, le développeur a deux possibilités. La première consiste à ne pas rajouter de dépendance à son projet et va se restreindre à une analyse basique des arguments de la ligne de commande en évitant de réinventer la roue. La seconde possibilité consiste à rajouter une des nombreuses bibliothèques disponibles :

*   **Commons CLI** [http://commons.apache.org/cli/](http://commons.apache.org/cli/)
*   **Java Gems** [http://code.google.com/p/javagems/](http://code.google.com/p/javagems/)
*   **JArgs** [http://jargs.sourceforge.net/](http://jargs.sourceforge.net/)
*   **GetOpt** [http://www.urbanophile.com/arenn/hacking/download.html](http://www.urbanophile.com/arenn/hacking/download.html)
*   **JOpt Simple** [http://jopt-simple.sourceforge.net/](http://jopt-simple.sourceforge.net/)
*   **Args4J** [https://args4j.dev.java.net/](https://args4j.dev.java.net/)
*   **ArgParser** [http://people.cs.ubc.ca/~lloyd/java/argparser.html](http://people.cs.ubc.ca/%7Elloyd/java/argparser.html)
*   **Natural CLI** [http://naturalcli.sourceforge.net/](http://naturalcli.sourceforge.net/)
*   **TE-Code** [http://te-code.sourceforge.net/](http://te-code.sourceforge.net/)
*   **JSAP** [http://www.martiansoftware.com/jsap/](http://www.martiansoftware.com/jsap/)
*   **CLAJR** [http://clajr.sourceforge.net/](http://clajr.sourceforge.net/)
*   **CmdLn** [http://ostermiller.org/utils/CmdLn.html](http://ostermiller.org/utils/CmdLn.html)
*   **JewelCli**[ ](http://jewelcli.sourceforge.net/)[http://jewelcli.lexicalscope.com/](http://jewelcli.lexicalscope.com/)
*   **JCommando** [http://jcommando.sourceforge.net/](http://jcommando.sourceforge.net/)
*   **Parse-cmd** [http://code.google.com/p/parse-cmd/](http://code.google.com/p/parse-cmd/)
*   [**Airline**](https://github.com/airlift/airline) (active Fork: [https://github.com/rvesse/airline](https://github.com/rvesse/airline))
*   [**argparse4j**](https://github.com/tatsuhiro-t/argparse4j)
*   [**cli-parser**](http://code.google.com/p/cli-parser/)
*   [**Commandline**](https://github.com/jankroken/commandline)
*   [**DocOpt.java**](https://github.com/docopt/docopt.java)
*   [**dolphin getopt**](http://dolphin.sourceforge.net/getopt/)
*   [**DPML CLI (Jakarta Commons CLI2 fork)**](http://www.dpml.net/util/cli/index.html)
*   [**Dr. Matthias Laux**](http://www.javaworld.com/javaworld/jw-08-2004/jw-0816-command.html)
*   [**Jakarta Commons CLI**](http://jakarta.apache.org/commons/cli/)
*   [**jargo**](https://github.com/Softhouse/jargo)
*   [**jargp**](http://jargp.sourceforge.net/)
*   [**JArgs**](http://jargs.sourceforge.net/)
*   [**java-getopt**](http://www.urbanophile.com/arenn/hacking/download.html)
*   [**JCLAP**](http://www.snaq.net/java/JCLAP/)
*   [**jcmdline**](http://jcmdline.sourceforge.net/)
*   [**jcommander**](http://jcommander.org/)
*   [**Object Mentor CLI article (more about refactoring and TDD)**](http://www.objectmentor.com/resources/articles/Clean_Code_Args.pdf)
*   [**ritopt**](http://ritopt.sourceforge.net/)
*   [**Rop**](http://ryenus.github.io/rop/)
*   **Google-options** [https://github.com/pcj/google-options](https://github.com/pcj/google-options) (d'après le projet Bazel)

Trois générations de bibliothèques :

1. Parmi ces différentes bibliothèques, les plus anciennes miment le fonctionnement des bibliothèques des autres langages (c'est le cas de JArgs).  
2. D'autres bibliothèque profitent de la réflexion disponible dans le langage Java (selon le nom des variables membres ou des fonction).  
3. Enfin, d'autres bibliothèque tirent parti des annotations et nécessitent souvent une version de Java récente (Java 8).


Console interactive
===================

La plate-forme Java fournit quelques classes de base comme
[`java.io.Console`](https://docs.oracle.com/javase/8/docs/api/java/io/Console.html)
([exemple](https://docs.oracle.com/javase/tutorial/essential/io/cl.html)) et
[`java.util.Scanner`](https://docs.oracle.com/javase/8/docs/api/java/util/Scanner.html)
([exemple 1](https://docs.oracle.com/javase/tutorial/essential/io/scanning.html) et
[2](http://alvinalexander.com/java/edu/pj/pj010005)).

Des bibliothèques permettent d'aller plus loin.


Cliche
------

En 2009, l'auteur Anton Grigoryev, a migré ce projet sur SourceForge. [http://cliche.sourceforge.net/](http://cliche.sourceforge.net/)

En 2011, le projet est [migré sur Google Code](https://code.google.com/archive/p/cliche/), site qui ferme en 2016.

Parmi les [dépôts Git du présumé auteur](https://github.com/ansgri?tab=repositories) sur GitHub, aucun projet nommé Cliche.

Par contre, de nombreuses personnes ont archivé ce projet sur GitHub avant la fermeture de [Google Code](https://fr.wikipedia.org/wiki/Google_Code), dont le projet le plus à jour et celui de <span class="vcard-fullname d-block">Budhaditya</span> :[  
https://github.com/budhash/cliche](https://github.com/budhash/cliche)

Un article de 2015 explique comment l'utiliser :  
[https://opensourceforu.com/2015/09/cliche-speeding-up-command-line-interface-development/](https://opensourceforu.com/2015/09/cliche-speeding-up-command-line-interface-development/)


JLine
-----

En 2002, ce vieux projet débute sur SourceForge : [http://jline.sourceforge.net/](http://jline.sourceforge.net/)  
dont sa dernière version était [JLine-1.0 (avril 2011)](https://sourceforge.net/projects/jline/files/jline/).

En 2009, le projet commence sa migration sur GitHub. : [http://jline.github.io/jline2/](http://jline.github.io/jline2/)  
et délivre la [série 2.x](https://github.com/jline/jline2/releases) depuis novembre 2009 (version 2.0).  
La dernière version de cette série est la 2.14.2 publiée en mai 2016.  

En octobre 2016, une nouvelle série 3.x est publiée : [https://github.com/jline/jline3/releases](https://github.com/jline/jline3/releases)

Groovy utilise JLine pour son shell `groovysh` : [http://groovy-lang.org/groovysh.html](http://groovy-lang.org/groovysh.html)
