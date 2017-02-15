This directory provides a Gradle example.  
Corresponding Ant scripts are provided for information.


Dependency
==========

The library JLine has not been is not yet integrated within this Git repository.  
This dependency is required to build the project.

    cd your-github-directory
    git clone https://github.com/jline/jline3
    git -C jline3 tag jline-3.1.2
    cd CodingGoodPractices/Gradle/example
    ln -s your-github-directory/jline3 .


Start scripts
=============

The Gradle plugin "application" offers tasks to start the Java application:

    gradle :gui:run    # To start the GUI application
    gradle :cli:run    # To enter in interactive shell

Moreover, the corresponding command line scripts can also be produced:

    $ rm build/scripts -r
    $ gradle startScripts
    [...]
    :cli:startScripts
    == Start script build/scripts/cli
    :core:cmdLineAdminStartScript
    == Start script build/scripts/admin_station
    :core:cmdLineIgwStartScript
    == Start script build/scripts/igw
    :core:startScripts
    == Start script build/scripts/core
    BUILD SUCCESSFUL
    Total time: 0.863 secs

The scripts are all located together:

    build/scripts/cli
    build/scripts/cli.bat
    build/scripts/gui
    build/scripts/gui.bat

Limitations
-----------

The task "`:cli:run`" is not currently usable because of missing input/output streams from application process.
The issue has been [reported](https://github.com/jline/jline3/issues/77) on JLine project.

The workaround is to use the generated scripts.

However the generated scripts are buggy.

Instead of fixing the generated scripts or hacking the input Gradle script, a simple workaround is to create some symlinks:

    mkdir build/lib
    ( cd  build/lib && ln -s ../*/libs/* ../../lib/* . )

Usage
-----

The rest of this chapter focus only on script `build/scripts/cli`.

    cli
    cli -h|--help
    cli [-e|--expression "function arg1 arg2..."] [-i|--interactive]

Without argument, the application enters by default in interactive shell.

The option `--expression` is similar to interactive shell:
the provided "`function arg1 arg2...`" is processed as in interactive shell.

Available expressions
---------------------

An expression is based on a function name (keyword) and arguments in a similar way as Robot Framework scenario.

There is only two expressions currently implemented: `<set|get> myField`


IDE
===

In order to maintain only one single build process, the developer generates the project files from the Gradle script.

   cd Card/cardmgr
   gradle generateJava eclipse

The Gradle task "generateJava" produces the Version.java and JNI swig-generated files required by the task "eclipse" in order to provide a clean Eclipse project files.

The Gradle script also supports the [IntelliJ IDEA](https://en.wikipedia.org/wiki/IntelliJ_IDEA):

    cd Card/cardmgr
    gradle generateJava idea

The Gradle-based project can also be imported to [NetBeans](https://en.wikipedia.org/wiki/NetBeans).


Check
=====

The Gradle script offers coding-style checking, static code analysis and unit test:

    $ cd Card/cardmgr
    $ gradle check
    [...]
    :base:checkstyleMain
    == Checkstyle reports available in 'build/base/reports'
    :base:checkstyleTest
    :base:findbugsMain
    Scanning archives (42 / 42)
    2 analysis passes to perform
    Pass 1: Analyzing classes (465 / 465) - 100% complete
    Pass 2: Analyzing classes (41 / 41) - 100% complete
    Done with analysis
    FindBugs rule violations were found. See the report at: build/base/reports/findbugs/main.html
    :base:findbugsTest
    :base:jdependMain
    == JDepend reports available in 'build/base/reports'
    :base:jdependTest
    :base:pmdMain
    7 PMD rule violations were found. See the report at: build/core/reports/pmd/main.html
    :base:pmdTest
    :base:test
    [...]

The current Gradle script integrates the following checks:

* [Checkstyle][C] (coding rules)
* [FindBugs][F] (bytecode static analysis)
* [JDepend][D] ([circular dependency][d])
* [PMD][P] (detect inefficient Java source code)
* [JUnit][U] (Unit test)

[C]: https://en.wikipedia.org/wiki/Checkstyle
[F]: https://en.wikipedia.org/wiki/FindBugs
[D]: https://github.com/clarkware/jdepend
[d]: https://en.wikipedia.org/wiki/Circular_dependency
[P]: https://en.wikipedia.org/wiki/PMD_%28software%29
[U]: https://en.wikipedia.org/wiki/JUnit

The reports are produced in the following directories:

    build
    ├── base
    │   └── reports
    │       ├── checkstyle
    │       │   ├── main.html     # For humans
    │       │   └── main.xml      # For Jenkins
    │       ├── findbugs
    │       │   └── main.html     # FindBugs can produce only one output format at a time: HTML or XML
    │       ├── jdepend
    │       │   └── main.txt      # JDepends only produce TXT output
    │       └── pmd
    │           ├── main.html     # For humans
    [...]       └── main.xml      # For Jenkins
    │
    └── core
        ├── reports
        │   ├── checkstyle
        │   │   ├── main.html
        │   │   ├── main.xml
        │   │   ├── test.html    # Java code of the Unit-Tests are also checked but in a separated section
        │   │   └── test.xml
        │   ├── findbugs
        │   │   ├── main.html
        │   │   └── test.html
        │   ├── jdepend
        │   │   ├── main.txt
        │   │   └── test.txt
        │   ├── pmd
        │   │   ├── main.html
        │   │   ├── main.xml
        │   │   ├── test.html
        │   │   └── test.xml
        │   └── tests
        │       └── test
        │           └── index.html    # JUnit result for humans  in build/*/reports/tests/test
        └── test-results              # JUnit result for Jenkins in build/*/test-results/test
            └── test
                ├── TEST-com.company.appname.core.TrucTest.xml
                └── TEST-com.company.appname.core.MachinTest.xml




Tips
====

    gradle tasks --all	                          # List all available tasks
    gradle help --task test	                      # Basic information on the task "test"
    gradle :cli:build :cli:taskTree --no-repeat	  # Display dependency graph (ASCII) of task ":cli:build"
