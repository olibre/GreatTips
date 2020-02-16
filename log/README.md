Awesome log levels
==================

Depending on the historical engineering culture, systems do not share all log levels.
Below are the awesome log levels that your application may use:

Level  | Description
-------|------------
FATAL  | La source de l'arrêt catastrophique de l'application 
ERROR  | Une erreur que le développeur ne sait pas quoi en faire => on ignore mais ce n'est peut-être pas la bonne implémentation
WARN   | Une erreur que l'application sait gérer
NOTICE | Un changement d'état de l'application ou des données
INFO   |
DEBUG  |
TRACE  | Chaque fonction, avec optionnellement ses paramètres INPUT et son OUTPUT

See more about [syslog and Log4J log levels](./log.md)

See also this awesome Go logger: https://github.com/synw/emodebug


The syslog protocol
===================

The syslog is defined by the [RFC 5424](https://tools.ietf.org/html/rfc5424).
The data is structured within each log line as the following: 

![Structured data in one log line](https://olibre.github.io/GreatPractices/log/logger-RFC5424.svg)

See how your application can [structure log data](./syslog.md) in order to be powerfully processed by log analysis tools.
