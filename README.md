Good and Great Practices for Coders
===================================

*Empowering practices for happy coders about Git, Unit tests, C++, Python, Java, Gradle, CMake, Agile, GNU/LInux installation, pandoc...*  
*Not the best or the greatest because any one can propose improvements :-)*

This documentation is shared in [Public Domain][#publicdomaindedication].

Documents
=========

* [GNU/Linux installation for coders](install)
* [Git](./git)
* [Java/Groovy/Gradle/Ant](./java)
* [C++](./cpp)
    * [Rules](cpp/rules.md)
    * [Metrics](cpp/lint.md)
    * [C++ Core Guidelines](cpp/cpp_core_guidelines.md)
* [CMake](./cmake)
* [Empoworing team members](team)
* [Great Unit Tests](./GUTs)
* [Logging](./log)


Convert Markdown to nice HTML/PDF/...
=====================================

All the documentation is written using [Markdown]. The **GreatPractices** project provides a [`Makefile`] to convert Markdown content to HTML and PDF files (using [`pandoc`]). Command `make help` describes the available actions.

Empowering `pandoc`
-------------------

Moreover the root [`Makefile`] enhances Markdown conversion:

1. Embeds local images in HTML but keep outside extrernal images (i.e. for `http://` URL)
2. Keep links between Markdown pages when converting to HTML/PDF
3. Convert ASCII diagrams into nice images

This third feature is [ditaa-markdown] which depends on `ditaa0_6b.jar`, `DitaaEps.jar`, `epstopdf`, `dot` and `rdfdot`.

Examples of diagrams
--------------------

Work in progress:

* [`ditaa`]
* [`dot`]
* [`rdfdot`]

[Markdown]:       https://en.wikipedia.org/wiki/Markdown "Simple and popular markup language"
[`pandoc`]:       https://en.wikipedia.org/wiki/Pandoc   "a universal document converter"
[ditaa-markdown]: https://github.com/nichtich/ditaa-markdown "Perl script: mddia"

[`Makefile`]: Makefile
[`ditaa`]:    dia/ditaa.md
[`dot`]:      dia/dot.md
[`rdfdot`]:   dia/rdfdot.md



Public Domain Dedication
========================
CC0 1.0 Universal
-----------------

[Creative Commons Zero] &emsp; *No Rights Reserved*  &emsp; ![(CC) ZERO] &nbsp; ![(0) PUBLIC DOMAIN]

[Creative Commons Zero]: https://creativecommons.org/publicdomain/zero/1.0/deed "CC0 summary for non-lawyers" 
[(CC) ZERO]:             https://licensebuttons.net/l/zero/1.0/80x15.png "Logo Creative Commons Zero (CC0) 1.0"
[(0) PUBLIC DOMAIN]:     https://licensebuttons.net/p/zero/1.0/80x15.png "Logo CC0 1.0 Public Domain"

To the extent possible under law, [olibre](mailto:olibre@Lmap.org) 
has waived all copyright and related or neighboring rights to [CodingGoodPractices]. 
This work is published from France since 2015.
Refer to [CC0 Legal Code] or a copy in file [`COPYING`].

[CC0 Legal Code]:      https://creativecommons.org/publicdomain/zero/1.0/legalcode "CC0 full legal text for lawyers"
[CodingGoodPractices]: https://github.com/olibre/CodingGoodPractices "CodingGoodPractices project hosted on GitHub" 
[`COPYING`]:           ./COPYING

