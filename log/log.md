syslog | Log4J | Description | Comment from syslog 
-------|-------|-------------|---------
emerg  | -     | Unusable system                  | A "panic" condition usually affecting multiple apps/servers/sites. At this level it would usually notify all tech staff on call.
alert  | FATAL | Action to be taken immediately   | Should be corrected immediately, therefore notify staff who can fix the problem. An example would be the loss of a primary ISP connection. Commons-logging: Severe errors that cause premature termination. Expect these to be immediately visible on a status console.
crit   | -     | Critical conditions              | Should be corrected immediately, but indicates failure in a secondary system, an example is a loss of a backup ISP connection.
error  | ERROR | Error conditions                 | Non-urgent failures, these should be relayed to developers or admins; each item must be resolved within a given time. Commons-logging: Other runtime errors or unexpected conditions. Expect these to be immediately visible on a status console.
warning| WARN  | Warning conditions               | Warning messages, not an error, but indication that an error will occur if action is not taken, e.g. file system 85% full - each item must be resolved within a given time. Commons-logging: Use of deprecated APIs, poor use of API, 'almost' errors, other runtime situations that are undesirable or unexpected, but not necessarily "wrong". Expect these to be immediately visible on a status console.
notice | -     | Normal but significant condition | Events that are unusual but not error conditions - might be summarized in an email to developers or admins to spot potential problems - no immediate action required.
info   | INFO  | Informational message            | Normal operational messages - may be harvested for reporting, measuring throughput, etc. - no action required. Commons-logging: Interesting runtime events (startup/shutdown). Expect these to be immediately visible on a console, so be conservative and keep to a minimum.
debug  | DEBUG | Debug-level message              | Info useful to developers for debugging the application, not useful during operations. Commons-logging: detailed information on the flow through the system. Expect these to be written to logs only.
|-     | TRACE | Most detailed information        | Info useful during development to trace execution and values of variables or parameters. Calls with this severity should be removed from the code once the development is finished.

Guidelines
----------

* Log what application is doing, think the application as a black box and explain:
    * the application phase (initializing, main part, end of the treatment), 
    * what are the input that the application get, 
    * and how application interact with others components,
* Message (Info and Notice) is human readable and should be understand by someone that do not know the application code,
* Message contains patterns that can be easily parsed,
* At each startup put all context information (pid of process, version of app and loaded config)
* For connection (TCP/IP) with external system (DB or other app) be clear about the connection status: Connecting/Connected/Disconnecting/Disconnected,
* Do not display sensitive data (password, public/private keys, sensitive functional data),
* Manage error with exception and log/throw the full exception stack, and always keep the root cause error exception,
* When there is an error, always explain the context on how this error happen,
* Log level modification can be done without restarting application, at least for notice and info,
* Debug and Trace information can be removed from executables for production and should be written in another log file,
* For investigation log level could be specified for each thread/process,
* Logging too much may affect performance. 


Initialization
--------------

* Print all information of configuration (all parameters, when a parameter is not set in config indicate the default value used),
* Indicate connection initialization state,
* One line of logs at the end should indicate that the global components is “running” (for example if there is several status for each actors).

Running
-------

* Printing every access cannot be envisaged if can affect performance,
* Give aggregated information every x minutes (x could be define in config),
* When a message broker like kafka is used, printing treated transaction in log file is not needed.

Shutdown
--------

* All started components listed at init phase, should have the equivalent line at shutdown,
* Indicate all closed connection,
* Indicate if there is where the context of the application is stored.

Service monitoring
------------------

From logs, these information must be retrieved:

* All inputs received by each application layer 
* Response send by each application layer with his associated response time (What are the “application layers” of each application should be clearly define and shared. Each linux process may be treated as a different “application layer”, and the input/output should be printed), 
* Thread or Core ID, Client ID, Session ID, Transaction ID, transaction status, transaction request, transaction response time…
