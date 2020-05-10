Structure logs for human and computer
=====================================

Get pretty good readability for human, computer, `grep`, `logstash`...
Even if the raw data is not being optimal for either,
this can be improved by diplaying a reformatted colorized output (human)
or by exporting to JSON/[CBOR](https://en.wikipedia.org/wiki/CBOR)/...

* Logfmt Historical log format in this spirit https://brandur.org/logfmt
        
        time="2015-03-26T01:27:38-04:00"  level=info msg="Stopping all fetchers"          tag=stopping_fetchers  module=kafka.consumer.ConsumerFetcherManager  id=ConsumerFetcherManager-1382721708341
        time="2015-03-26T01:27:38-04:00" level=info msg="Performing log compaction"      tag=log_compaction     module=kafka.compacter.LogCompactionManager
        time="2015-03-26T01:27:38-04:00" level=info msg="Performing garbage collection"  tag=gc                 module=kafka.cleaner.GarbageCollectionManager
        time="2015-03-26T01:27:38-04:00" level=info msg="Starting all fetchers"          tag=starting_fetchers  module=kafka.consumer.ConsumerFetcherManager id=ConsumerFetcherManager-1382721708341

* Logrus Battle tested logger for Go :walrus: https://github.com/sirupsen/logrus
* Zerolog Better performance by reducing memory allocation for Go https://github.com/rs/zerolog
* Zap :zap: Also targeting a great performance for Go https://github.com/uber-go/zap
* Emodebug 🤩 Dart logger with emojis  https://github.com/synw/emodebug


Log level meaning
=================

Depending on the historical engineering culture,
systems share similar log levels, but with some differences.
Below is a great list of log levels that your application may use:

Level  | Short name | Description
-------|------------|------------
FATAL  | FAT        | La source de l'arrêt de l'application, utile pour trouver l'origine de l'arrêt dans tous les logs 
ERROR  | ERR        | Une erreur que le développeur ne sait pas comment la gérer => Quand on aura une bonne implémentation, cela deviendra une alerte (WARNING)
WARNING| WRN        | Une erreur que l'application sait gérer
NOTICE | NOT        | Un changement d'état de l'application (Init, Ready, Stopping...) ou des données (Open, Frozen...) 
INFO   | INF        | 
DEBUG  | DBG        | 
TRACE  | TRC        | Chaque fonction, avec optionnellement ses paramètres INPUT et sa sortie OUTPUT

See more about [syslog and Log4J log levels](./log.md)


🚀
===

The syslog protocol
===================

The syslog is defined by the [RFC 5424](https://tools.ietf.org/html/rfc5424).
The data is structured within each log line as the following: 

![Structured data in one log line](https://olibre.github.io/GreatPractices/log/logger-RFC5424.svg)

See how your application can [structure log data](./syslog.md) in order to be powerfully processed by log analysis tools.
