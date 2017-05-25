Convert Markdown to nice HTML/PDF/...
=====================================

The **GreatPractices** documentation is written using [Markdown].  
Moreover root [`Makefile`] of the project converts Markdown content to HTML and PDF files (using [`pandoc`]).  
Command `make help` describes the available possibilities.

Empowering `pandoc`
-------------------

The root [`Makefile`] enhances Markdown conversion:

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

[`Makefile`]: ../Makefile
[`ditaa`]:    ./ditaa.md
[`dot`]:      ./dot.md
[`rdfdot`]:   ./rdfdot.md
