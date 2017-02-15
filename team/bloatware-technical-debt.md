How to reduce bloatware technical debt?
=======================================

Old software project
====================

Software started in the early years 2000 share similar characteristics:

* Files organized in the Visual C++ way (directories `include` and `src` are separated)
* C++98 syntax (C++ has been stable for 20 years)
* Utilities reinvented (e.g. FileSystem, Mutex...) because there was no alternative in mature widely-used libraries when project has started
* Code refactoring is not regularly realized (Technical Debt is not cleaned)
* Migration from CVS/SVN to one single Git repository
    * Use GitLab or other easy-to-use alternative
    * Repo contains many binary files (as third party dependencies)
    * Almost all 3rd parties are grouped together
    * But other external source code is mixed within the company source code
    * Despite the huge repo size, the git clone still takes less than 10 minutes on Linux (clonning on Windows is a nigthmare)
    * One big repo is easier to split, than several repositories to fusion
    * One single version for the different products within the repository
    * Easier to follow one version than dozens versions and dependencies
* Growing over the years
    * [bloatware](https://en.wikipedia.org/wiki/Software_bloat)
    * Many refactoring have been attempted but not finalized
    * Some other finalized refactoring have been forgetten in old branches
    * Build hell
    * Code style is not anymore consistent
* Difficult to undersatnd all the parts, because of
    * various programming languages
    * various underlying technologies
    * various modules and sub-modules
    * usefull documentaion not easy to read
* Documentation reflects the mess
    * dispersed in different places
    * some documentation is obsolete
    * other is missing
    * other is redundant
    * but some components are well documented
* Test is often better than documentation
    * various test tools developed
    * many tests (unit tests, fonctionnal tests...)
    * continuous testing does not run all the tests
    * code coverage is not sure (should be very low)
* Multi-platform (Windows, Linux... Android...)
* Current implementation does not enable high performance


Team control
============

This document provides advices but should not be decided at big boss level.

The most important is to give the control to all the team members.
Not only to the team gurus and other technical leaders.
More the members have the hands within the source code, tests and documentation, more decision power they should get.
Members should not decide for parts of the project they do not know.
Team leader should just indicate their feeling but not ~~decide~~ vote.

When the whole team decides together what to do, each member appropriates herself the technical changes.

For each foolowing advice item, the team democratically decides:

* the relevance,
* the priority,
* when to evaluate the results,

The team members must also propose many more items over the months.

Target is to obtain **consensus** not **compromise**/**concession**.

Team leaders must agree with team decision and be responsible for the pratical application.
Other team mebers must also agree with team decision and be responsible for the pratical application.

Autonomy and democracy is the keys of involvement.


Retrospective meetings
======================

Adopt scrum retrospective meetings for continuous improvement.

* Bottom Up decision work-flow (people who does the job decide how to do it)
* Test different frequencies between "once a week" and "once a month"
* "Definition of Done"
* Collect member ideas and select best ones
    * Make process more fluid and predictable
    * Reduce technical debt

Examples:

* Respect the Google Code Style Guide only when it is justified
* Justify rule breaking (many rules are not respected, What is the reason?)
* Break the [File Names rule](https://google.github.io/styleguide/cppguide.html#File_Names) to get more readable filenames (using the CamelCase class name)


Team self-training
==================

Encourage trainings like [Lightning talks](https://en.wikipedia.org/wiki/Lightning_talk) and [Unconferences](https://en.wikipedia.org/wiki/Unconference) in order to share skills and knowledge across team members (and across other project teams). Every body is agree on that point. The question is more about how to **encourage this good practice over time**.

Some subject examples:

* Good Unit Tests
* SOLID principles
* Design Patterns
* Modern CMake and dependency configuration
* Gradle
* [C++ Core Guidelines](https://github.com/isocpp/CppCoreGuidelines)
* Generic programming paradigm
* Meta-programming
* C++17


Risk Management
===============

* Any change not impacting the delivery must be guaranteed by producing same binaries
* Any change not impacting the behaviour must be guaranteed by passing all non-regression tests
* Any change improving performance must be guaranteed by benchmark

Therefore, before any change, implement combined "safety belt and shoulder harness" *(ceinture et bretelles)*.

As these verifications have to be reproductible, script the building and comparison processes.


Artifact Repository
===================

* Reduce Git repo size
* Identify unneccessary binary files and rewrite history
* Use [git-annex](https://en.wikipedia.org/wiki/Git-annex) feature [available since GitLab 7.8](https://about.gitlab.com/2015/02/17/gitlab-annex-solves-the-problem-of-versioning-large-binaries-with-git/) Enterprise Edition (February 2015)
* Use artifact repository (see https://en.wikipedia.org/wiki/Software_repository)
    * Artifactory
    * Nexus


Provide recent tools
====================

* Package and deploy recent tools for all
* Prevent several persons doing the same work in parallel (searching, downloading, configuring, building...)
* Repository Git for the download/build script + Jenkins job (less effort, reusable)
* Share packages with other teams
* On Ubuntu Linux, the team may use *Ubuntu Make*

The team decide the list of tools. Example:

* git
* cmake
* gradle
* gcc
* clang
* vim


Rewrite outdated build scripts
==============================

* Portability (e.g. CMake file should be usable without any specific environment variable)
* Smaller files to maintain
* Smaller modularity - Visible dependency tree
* Generated files must be produced within the build sub-directories (do not mess the source code directories)


CMake
=====

* Separate Release and Debug builds (two different CMAKE_BUILD_TYPE values)
* Coverage build is another CMAKE_BUILD_TYPE value
* Allow building external library Boost from CMake


Source code Urbanisation
========================

* Reorganize source code tree with clarification in mind
* Rename files having same name
* For each sub-module: put in near sub-folders documentation, unit test and source code (`include` and `src`)
* Split too-big-modules in autonomous smaller ones
* Extract third parties from core source code (keep only the code with company ownership)
* Move all third party in artifact repositories (can be other Git  repositories)
* Produce exactly the same binaries from the same SHA1 (100% same content) => Do not embed timestamp in produced binaries
* Add in the produced delivery the version of each 3rd party, the version of each tool, the OS version and other build dependencies


Improve documentation
=====================

* Portal : One single entry point to access all project parts (Git repos, jenkins, redmine, any documentation)
* Group together and clean the dispatched documentations
* Encourage documentation across the source tree using README.md files (Markdown)


Test suite
==========

Create or complete:

* Unit tests
* Integration tests
* Functional tests
* Performance/Load tests
* Vulnerability tests

Decide the tests to add according to code-coverage and usage model.

* Use `ctest`
* Use static code analyzers (`cppcheck`, `clang-tidy`, `clang-check`...)
* Test all the build types (Release, Debug and Coverage)
* With and without valgrind
* Test using 
    * `#define ` [`_GLIBCXX_CONCEPT_CHECKS`](https://gcc.gnu.org/onlinedocs/libstdc++/manual/ext_compile_checks.html)
    * `#define `  `_GLIBCXX_ASSERTIONS` (array bounds and null pointer)
    * `#define ` [`_GLIBCXX_DEBUG`](https://gcc.gnu.org/onlinedocs/libstdc++/manual/debug_mode_using.html)
    * `#define `  `_GLIBCXX_DEBUG_PEDANTIC`
    * `#define ` [`_GLIBCXX_PROFILE`](https://gcc.gnu.org/onlinedocs/libstdc++/manual/profile_mode.html)
* Increase ` #define GLIBCXX_DEBUG_MESSAGE_LENGTH`


Continuous Testing
==================

Several Continuous Integration passes

* Fast pass checking the essentials (less than 10 minutes)
* Intermediate completenesses (e.g. one hour period)
* Paranoia night builds to perform deeper testing (also during the week-end)
* One complete even slow (less than one week)
* Endurance test for many weeks (e.g. one month)

Tricks

* Share the cache of `ccache` across workers (across developers?)
* Use distcc instead of several workers? (developers?)
* Improve reports (Jenkins, SonarQube, GitLab CI)
* Jenkins (or GitLab CI) builds and tests the pulled merge request on different platforms (integrator waits for green light)


Remove unnecessary code
=======================

* Reduce both coverage test effort and maintenance cost
* Localize dead code


More warnings
=============

* Use several compilers (GCC, Clang, MSVC)
* Use warning `clang -WDocument` to detect inconsistencies between code and  doxygen comments
* Use warning `clang -WEverything`
* Use warning `-Weffc++` based on Effective C++ series of books from Scott Meyers
* Use warning `-pedantic` to detect code not following ISO C++ (e.g. GNU extensions)
* See more at https://github.com/olibre/CodingGoodPractices/blob/gh-pages/cpp/rules.md#cwrn--activate-compilation-warnings


Performance
===========

* Do not change software if the performance issue has not been measured
* First implement benchmark automated regression tests
* Use free tricks
    * Use recent compilers
    * Replace `const std::string&` by `std::string_view`
    * Use [Link Time Optimization](https://gcc.gnu.org/wiki/LinkTimeOptimization)
    * Use [Profile-Guided Optimization](https://en.wikipedia.org/wiki/Profile-guided_optimization)
    * Use [Automatic Feedback-Directed Optimizer](https://clearlinux.org/features/autofdo)


Continuous code refactoring (and cleaning)
==========================================

* Replace *"[Not Invented Here](https://en.wikipedia.org/wiki/Not_invented_here)"* libraries by widely-used libraries
* Use modern C++ features
* Use same language for all the parts when possible
* Reduce the number of programming languages
    * When an issue in blocking (rewrite the piece of softaware using another programming language)
    * When implementing a major feature
* Delete old branches
* Use more recent third-parties versions
* Use `clang-modernize`


Continuous Delivery
===================

* Go further than Continuous Integration
* Not to be confused with Continuous Deployment


Copyright
=========

* Add tiny copyright notice on top of all company-owened files
* Check thrird party licenses


Libre software
==============

* Spend time to improve and supply improvements to upstream
* Remunerate (financial) valuable libre software
* Convince managers to reverse a small portion of the benefits *(mécénat)*
* The team members propose the candidates and vote
