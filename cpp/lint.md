As too many rules cannot be remembered and cannot be learnt before writing code, some tools may be used to provide *Automatic Review*.

Formating
---------

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


  [SA]: https://en.wikipedia.org/wiki/List_of_tools_for_static_code_analysis#C.2C_C.2B.2B
  [CC]: https://en.wikipedia.org/wiki/Cppcheck
  [CL]: https://en.wikipedia.org/wiki/Cpplint
  [CA]: http://clang-analyzer.llvm.org/
  [SQ]: http://www.sonarsource.com/products/plugins/languages/cpp/
  [PS]: https://en.wikipedia.org/wiki/PVS-Studio
  [CA-LO]: https://people.gnome.org/~michael/blog/2015-08-05-under-the-hood-5-0.html#clang
  [SQ-RL]: http://nemo.sonarqube.org/coding_rules#languages=cpp
  [PS-LO]: http://www.viva64.com/en/b/0308/


