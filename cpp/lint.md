Source Code Management
----------------------

*	Coding standards follows convention
*	Files and directories organisations follows convention
*	Dependencies are managed via Git submodules
*	No third party code included in sources

Build	
-----

*	Build procedure is described in markdown file within sources
*	Build prerequisites/dependencies are listed
*	CMake is used to build C/C++ code
*	Maven is used to build Java code
*	A .build job exists in Jenkins CI triggered automatically after every change in the code


Formating
---------

As too many rules cannot be remembered and cannot be learnt before writing code, some tools may be used to provide *Automatic Review*.

- clang_format
- astyle
- KWStyle
- vera++
- bcpp
- checksrc.pl (from libcurl)

[Static Analysers][SA]
----------------------

- [cppcheck][CC]
- [cpplint.py][CL] (Google)
- [PVS-Studio][PS] (See also [bugs found in LibreOffice][PS-LO])
- [sonarqube][SQ] (See also [list of C++ rules][SQ-RL])
- [Clang Static Analyzer][CA] (See also [Clang plugins/checkers used by LibreOffice][CA-LO])
- clang_check
- clang_tidy
- Flint : clint from Facebook for C++11
- Oclint
- cppdepend
- frama_c + plugins: (slicing and spare code)
-	SLOCCount analyzes sources
-	Compilation warnings are collected
-	Static code analysis is executed (CppCheck... for C++ ; FindBugs for Java)
-	Open Tasks in the code are gathered and use these tags: FIXME, TODO, TOREVIEW

  [SA]: https://en.wikipedia.org/wiki/List_of_tools_for_static_code_analysis#C.2C_C.2B.2B
  [CC]: https://en.wikipedia.org/wiki/Cppcheck
  [CL]: https://en.wikipedia.org/wiki/Cpplint
  [CA]: http://clang-analyzer.llvm.org/
  [SQ]: http://www.sonarsource.com/products/plugins/languages/cpp/
  [PS]: https://en.wikipedia.org/wiki/PVS-Studio
  [CA-LO]: https://people.gnome.org/~michael/blog/2015-08-05-under-the-hood-5-0.html#clang
  [SQ-RL]: http://nemo.sonarqube.org/coding_rules#languages=cpp
  [PS-LO]: http://www.viva64.com/en/b/0308/

	
Packaging
---------

*	A package is generated during the build job
*	Package is pushed to the artifact repository
*	Package provides debug, release and coverage binaries
*	Package naming follows the convention

Unit Tests
----------

*	Unit Tests exist and are based on GoogleTest
*	Code for unit tests is located outside of “business” code (do not mix code for production and code for test)
*	Compilation and execution of unit tests are documented in markdown file within sources
*	Unit tests are provided in three build types: Release, Debug and Coverage
*	Unit Tests are always executed locally ; they do not rely on db/files/middleware
*	Unit tests are systematically executed in the build job
*	Unit tests execution generates Junit XML file(s)
*	Each unit test is run without and with valgrind
*	Valgrind generates XML output file
*	Unit tests results (and Code coverage and valgrind results) are gathered by Jenkins

Deployment
----------

*	Deployment, “Start/Stop” and configuration procedures are described in markdown file within sources
*	A .deploy job exists in Jenkins CI
*	Jinja configuration template is provided within the Package
*	Package is deployed automatically after each build in “CI” environment
*	“Start/stop” scripts are delivered with the binaries
*	Ansible is used for deployments

Ops Tests
---------

*	Ops tests (for ops procedures) exist and can be executed automatically
*	Ops tests generate TAP or Junit XML files

Functional Tests
----------------

*	Tests execution procedure is described in markdown file within sources
*	A .test job exists in Jenkins CI
*	Functional tests can be executed after deployment
*	Tests execution generates Junit XML files
*	XML file(s) are collected by Jenkins as artefacts

Sonarqube
---------

*	Build metrics, all tests executions and code coverage are consolidated (per release) in Sonarqube. Allowing teams to visualize and control *technical debt*
