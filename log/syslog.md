Motivation
==========

Ce document définit la structure en sortie des logs, l'API pour les développeurs et la façon de rassembler les différents éléments des logs (nom des paramètres, sévérité, texte du syslog et sa description pour le manuel).

Ce document ne traite pas de l'amélioration du contenu de chacun des logs (paramètres, texte, description, niveau de log).

1. Facile pour les développeurs : Écriture des logs, Maintenance du framework.
2. Facile pour le manuel de l'utilisateur : Maintenance de la liste des logs et de leur description (avec internationalisation).
3. Facile pour l'IT du client => Les logs sont structurés et nativement compréhensibles par les outils d'analyse de logs.


Analyse automatique des logs
============================

Les équipes IT de supervision des applications utilisent des outils d'aide au traitement des logs issus de leur parc applicatif. Afin de réduire la charge de travail, les logs doivent être le plus compatible possible avec ces outils.

Ces outils sont compatibles avec le format [Syslog](https://en.wikipedia.org/wiki/Syslog) dont la dernière norme est la [RFC 5424](https://tools.ietf.org/html/rfc5424) (la [RFC 3164](https://tools.ietf.org/html/rfc3164) était une recommandation préliminaire).

Ces outils sont aussi compatibles avec le format JSON.
Mais ce document ne traite pas de la possibilité JSON.

Quelques exemples d'outils d'analyse de logs :

Splunk Enterprise
-----------------

https://www.splunk.com

![](http://ak.c.ooyala.com/Uyc2VpbzrepKrXVuF4d0AmH_RD2Fuy-z/a6ordDA_nwxILuLn4xMDoxOjA4MTsiGN)

Logstash
--------

https://www.elastic.co/fr/products

Très utilisée avec avec ElasticSearch et Kibana.

![](https://static-www.elastic.co/assets/blt8aa92986a59a6458/kibana-basics.jpg?q=444)

GrayLog
-------

https://www.graylog.org

![](https://www.graylog.org/assets/overview_dashboard-3817012f923d4a00e9bde1c0547796319cf0396149464f434cfc2ae83a9da826.png)

DataLog
-------

https://www.datadoghq.com

![](https://datadog-prod.imgix.net/img/homepage-screencaps-dashboards-v2.png)


Finalité des logs
=================

Les logs sont utilisés pour des besoins très variés.
Voici quelques exemples d'activités :

* Alarme
* Métriques
* Informations diverses
* Surveillance au fil de l'eau (par l'IT du client)
* Investigation d'une anomalie (par l'IT du client)
* Capacity planning (prévoir à l'avance quand augmenter ou réduire les ressources matérielles)
* Audit (ANSSI, procédure judiciaire...)
* Debug (pour les développeurs ou le support)

La liste finale des activités sera à établir en faisant une passe sur les logs existants.
(la liste sera certainement réduite à un plus petit nombre d'activités)
Afin d'obtenir une liste d'activités pertinentes, les pratiques les plus courantes pourraient être analysées.

Format syslog
=============

    <123>1 DateTimeTZ Hostname AppName ProcID MsgID [idA@1234 name="value"] [idB@1234 a="1" b="2"] BOMmessageUTF8
     ---  \  \                                      -----------------------
      |    \  2017-08-24T17:14:15.000003-07:00        |
      |     \                                         |
    Priority SyslogVersion                          Structure Data


Priority
--------

    <123>

* Priority = [Facility][F] * 8 + [Severity][S]
* Facility
   * 1 "user-level messages"
   * ou la plage [16 .. 23] réservée "for local use"
* Severity = [0 .. 7] (niveau de sévérité du log)

[F]: http://www.iana.org/assignments/syslog-parameters/syslog-parameters.xhtml#syslog-parameters-1
[S]: http://www.iana.org/assignments/syslog-parameters/syslog-parameters.xhtml#syslog-parameters-2

Version
-------

    <123>1
         ^

Toujours 1


DateTimeTZ
----------

Horodatage

* Précision = la milliseconde

        2017-08-24T17:14:15.000003-07:00

* Notation courte en UTC

        2017-08-24T10:14:15Z


Hostname
--------

FQDN, Hostname, IP...

TODO: Vérifier les pratiques courantes utilisées par d'autres applications similaires
Pour des logs transmis par des clients à un serveur, ce dernier pout indiquer l'identifiant unique du client.

AppName
-------

TODO: Vérifier les recommandation de la RFC 5424 et les conventions les plus courantes afin de ne pas suprendre les équipes IT de surveillance des logs.

ProcID
------

Process ID

MsgID
-----

Identifiant unique pour un type de message de log

TODO: Définir comment obtenir cet identifiant unique

Structure Data
--------------

    [sdId@1234 name1="value1" name2="value2" name3="value3"]

* `sdId` = Nom de la structure de donnée (SD)
* `1234` = Le [Private Enterprise Number](http://www.iana.org/assignments/enterprise-numbers/enterprise-numbers) (PEN) spécifique à une entreprise
* `name="value"` = Un paramètre représenté par une paire de clé-valeur

Si plusieurs SD utilisent un paramètre ayant la même signification, le `name` doit être le même.

Un même SD peut contenir plusieurs paramètres ayant le même `name`.
Exemple pour indiquer deux adresses IP :

    [sdId@1234 ip="10.22.22.22" ip="10.33.33.33"]

En absence de SD, mettre le signe tiret "`-`".

Si plusieurs SD, un même `sdId@1234` ne doit pas être présent plus de une fois.

Ces structures de données sont à destination des outils d'analyse automatique de log.
Donc, leur changement doit être bien pensé pour éviter toute régression.
Par conséquent, chaque nouvelle structure doit bien être réfléchie pour assurer sa pérennité.

BOMmessageUTF8
--------------

Optionnel, c'est une chaîne de caractères en UTF-8 commençant par un [BOM](https://fr.wikipedia.org/wiki/Indicateur_d%27ordre_des_octets).
Cette chaîne de caractères est à destination des humains, et peut changer entre deux versions.
Les paramètres variables doivent se trouver dans la partie SD (structure de données).
Néanmoins cette chaîne peut également répéter quelques paramètres si cela améliore
la compréhension du message à destination des humains.

Exemples valides

    <134>1 2017-10-11T22:14:15.003Z myapp.company.com MyModule1 1234 M42 - BOMCeci est un message de niveau information et sans structure de données
    <134>1 2017-10-11T22:14:15.003Z myapp.company.com MyModule1 1235 M43 [metric@1234 sd="2"] BOMCeci est un métrique
    <134>1 2017-10-11T22:14:15.003Z myapp.company.com MyModule2 1235 M43 [metric@1234 sd="2"] [debug@1234 file="a.c" line="111"]

Structuration des informations des logs
=======================================

Les informations nécessaires à produire une ligne de log proviennent de différents objets.

Cette section propose d'éviter la redondance de ces informations et structure ces informations en les regroupant par affinité :

* Les coordonnées locales (Timestamp, ThreadID, File/Function/Line) sont obtenues directement à l'appel de la fonction de log ;
* Les informations génériques du log (MsgID, Severity, textes...) sont stockées dans la liste générale des logs ;
  * Short message = le texte qui s'affiche dans la ligne Syslog juste après le BOM (et qui est également réutilisé dans le manuel de l'utilisateur) ;
  * Long description = le texte prévue pour le manuel de l'utilisateur.
* Chaque "Structured Data" peut être réutilisée par plusieurs logs. La liste générale des logs doit alors indiquer les "Structured Data" utilisées par chaque log ;
* Les valeur des paramètres de chaque "Structured Data" sont à passer à la fonction de log ;
* Les informations du module produisant ce log (ModuleName, Facility) sont centralisées par le Module ;
* Les informations générales de l'application (AppName, ProcessID, Hostname) sont centralisée par l'Application.

![Schéma qui présente la répartition des informations nécessaires à la construction du log](./logger-RFC5424.svg)

Quelques exemples de Structured Data
====================================

`id@1234`  Structure générique pour tous les logs
-------------------------------------------------

    [id@1234 activity="event" threadId="12345" threadName="main" moduleName="MyModule" transactionId="123"]

* activity (event, alarm, metrique, trace, audit...)
* threadId
* threadName
* moduleName (mandatory)
* transactionId (multiple events are about the same chaining transaction)

Le threadName est le nom du thread (fil d'exécution).
Le nom du thread est bien souvent complémentaire (et plus explicite) que son threadId.

Les systèmes Windows et GNU permettent de nommer les threads.

Pour la glibc (pthread), cette fonctionnalité est arrivée avec la version 2.12 sortie en 2010 :

    #include <pthread.h>
    int pthread_setname_np (pthread_t thread, const char *name);
    int pthread_getname_np (pthread_t thread, char *name, size_t len);

`debug@1234`  Uniquement en mode debug
--------------------------------------

    [debug@1234 file="a.c" line="111" function="foo()"]

* file : source code filename (le compilateur fournit cette information selon le filename est passé en argument de la commande du compilateur)
* line : line number in filename
* function : function name (if relevant)


Consignes d'implémentation
==========================

Ne pas compliquer inutilement le code
-------------------------------------

* Éviter les *switch* de compilation (`#ifdef`), les abstractions, l'abus de design patterns ou de templates si cela ne se justifie pas.

* Si c'est pour des questions de performance, des benchmark reproductibles sont nécessaires.

* Il est tentant de cacher la complexité sous-jacente, mais cela peut devenir couteux à long terme car ce code sous-jacent aura du mal à être maintenu. L'expérience sur de longs projets démontre qu'un code complexe et peu compréhensif bloquera certaines évolutions du produit ou sera tout jeté pour être réécrit plus simplement. Donc, écrire du code simple avec moins de fonctionnalité dès le début.

Compatibilités
--------------

* La solution doit aussi être facilement intégrable dans les différents langages utilisées (actuels et futurs) ;
* La solution doit fonctionner sur toutes les plateformes prises en charge par l'équipe.

Interface intuitive
-------------------

* L'API doit être claire est facile à comprendre ;
* Pour des cas simple, l'API ne doit pas obliger la création de class ou fonction.

Manuel de l'utilisateur
-----------------------

* Afin de faciliter l'édition du manuel de l'utilisateur, **identifier les fichiers contenant les messages des logs, quitte à les centraliser**.
* Trouver un moyen facilement maintenable pour **lier les logs et leur description détaillée** (par exemple en les mettant dans les mêmes fichiers).
* Ces deux premier point vont faciliter d'autant plus l'internationalisation. Le top est de les formaliser en dehors du code source pour faciliter les traductions et relectures.
* Uniformiser la représentation des différents logs quel que soit le langage de programmation.
* Penser à scripter la génération la partie du manuel de l'utilisateur qui correspond à la documentation des logs (ce qui est fastidieux et répétitif doit être automatisé).
* La formalisation des messages et descriptions doit également faciliter l’internationalisation (leur traduction et sa maintenance sur le long terme).


Compatibilité des bibliothèques de Log avec Syslog
==================================================

Syslog(3) POSIX
---------------

* [man-page](http://man7.org/linux/man-pages/man3/syslog.3.html)
* [GNU C library support](https://www.gnu.org/software/libc/manual/html_node/Syslog.html)

```c
#include <syslog.h>

void openlog(const char *ident, int option, int facility);
int setlogmask(int maskpri); // active/désactive les différents niveaux de log
void syslog  (int priority, const char *format, ...);
void vsyslog (int priority, const char *format, va_list ap); // identical but using 
void closelog(void);

const char* ident = "the AppName"; //
int option = LOG_PID;  // include PID with each message
int  facility = LOG_USER;
int level = LOG_DEBUG; // LOG_INFO LOG_NOTICE LOG_WARNING LOG_ERR LOG_CRIT LOG_ALERT LOG_EMERG
int priority = LOG_MAKEPRI(facility, level);
int maskpri = LOG_MASK(LOG_ERR) | LOG_MASK(LOG_CRIT) | LOG_MASK(LOG_ALERT) | LOG_MASK(LOG_EMERG);
maskpri = LOG_UPTO(LOG_ERR); // revient au même
```

Inconvénients

* Pas de prise en charge de la structure de donnée (SD) avant le [BOM](https://fr.wikipedia.org/wiki/Indicateur_d%27ordre_des_octets).
* Semble utiliser UDP uniquement.

Implémentations pour Windows
----------------------------

http://syslog-win32.sourceforge.net

Dernier changement en 2005 pour le code du client, et en 2014 pour le code du du démon qui dépend des bibliothèques Glib, libiconv and libintl.

Forks avec des améliorations :

* http://github.com/fbzhong/syslog-win32
* http://github.com/asankah/syslog-win32

Spdlog
------

*Very fast, header only, C++ logging library.*

http://github.com/gabime/spdlog

spdlog permet de wrapper les appels vers l'API Syslog POSIX.

```cpp
#define SPDLOG_ENABLE_SYSLOG
#include "spdlog/spdlog.h"

int main(int, char*[])
{
  std::string name   = "le nom du logger";
  std::string ident  = "l'AppName";
  int         option = LOG_PID;
  auto logger = spdlog::syslog_logger(name, ident, option);

  logger->warn("This is warning that will end up in syslog.");
}
```

Google glog
-----------

http://github.com/google/glog

Les macros `SYSLOG`, `SYSLOG_IF` et `SYSLOG_EVERY_N` utilisent l'API Syslog POSIX doit voici le wrapping :

```cpp
void LogMessage::SendToSyslogAndLog() {
#ifdef HAVE_SYSLOG_H
  // Before any calls to syslog(), make a single call to openlog()
  static bool openlog_already_called = false;
  if (!openlog_already_called) {
    openlog(glog_internal_namespace_::ProgramInvocationShortName(),
            LOG_CONS | LOG_NDELAY | LOG_PID,
            LOG_USER);
    openlog_already_called = true;
  }

  // This array maps Google severity levels to syslog levels
  const int SEVERITY_TO_LEVEL[] = { LOG_INFO, LOG_WARNING, LOG_ERR, LOG_EMERG };
  syslog(LOG_USER | SEVERITY_TO_LEVEL[static_cast<int>(data_->severity_)], "%.*s",
         int(data_->num_chars_to_syslog_),
         data_->message_text_ + data_->num_prefix_chars_);
  SendToLog();
#else
  LOG(ERROR) << "No syslog support: message=" << data_->message_text_;
#endif
}
```

La remarque dans la documentation de glog s'applique également à toutes les autres utilisation des implémentations standards de Syslog POSIX :

> These log to syslog as well as to the normal logs. If you use these at all, you need to be aware that syslog can drastically reduce performance, especially if it is configured for remote logging! Don't use these unless you fully understand this and have a concrete need to use them. Even then, try to minimize your use of them.

`Boost::log`
------------

http://www.boost.org/libs/log/doc/html/boost/log/sinks/syslog_backend.html

Implémente une alternative à l'implémentation Syslog POSIX standard.

Mais n'est pas conforme à la RFC 5424 et ne semble pas utiliser TCP (seulement UDP).

Par contre, la documentation conseille d'utiliser plutôt l'implémentation Syslog POSIX standard afin de ne pas contourner les éventuels dispositifs de sécurité :

> On systems with native syslog implementation it may be preferable to utilize the POSIX syslog API instead of direct socket management in order to bypass possible security limitations that may be in action. To do so one has to pass the use_impl = native to the backend constructor. [...] Using use_impl = native on platforms with no native support for POSIX syslog API will have no effect.

G3log
-----

Projet très actif, haute performance comme Spdlog.

TODO

Log4cpp
-------

*Log for C++*

http://log4cpp.sourceforge.net/

Son interface (API) est très similaire à celle de Log4j.
Log4cpp est un vieux projet, en phase de maintenance corrective,
avec du vieux C++98, compatible avec de très nombreuse versions de compilateurs,
mais pas très sexy, ni performant.

Log4cpp propose un backend Syslog qui utilise l'implémentation POSIX standard :

> SyslogAppender sends LoggingEvents to the local syslog system.

Autres...
---------

Autres bibliothèques C++ de logging :
https://cpp.libhunt.com/categories/779-logging

Aspects qui restent à définir
=============================

* Permettre de mieux distinguer les AppName des Modules → Revoir RFC pour recommandations
* Trancher entre `Facility=1` *(user-level messages)* et `Facility` dans la plage [16 .. 23] *(local use)* → Quellle est la best practice, la convention ?
* Quel `Hostname` pour les clients qui envoient leurs logs au serveur ? → Quelle est la pratique ?
