# CppCoding
C++ Coding Rules

## CC0 1.0 Universal - Public Domain Dedication

Creative Commons Zero: *No Rights Reserved* &emsp;
![Logo says "(0)PUBLICDOMAIN"](https://licensebuttons.net/p/zero/1.0/80x15.png "Logo CC0 1.0 Public Domain")

To the extent possible under law, [olibre](mailto:olibre@Lmap.org) 
has waived all copyright and related or neighboring rights to CppCoding. 
This work is published from France since 2015.

This work is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

You should have received a copy of the CC0
along with CppCoding (maybe in file [`COPYING`]).
If not, see <https://creativecommons.org/publicdomain/zero/1.0/legalcode>.

[`COPYING`]: COPYING

## C++ Coding

Work in progress:

* [Rules]
* [Sanity Checkers]
* [See also]

[Rules]:           cpp/rules.md
[Sanity Checkers]: cpp/lint.md
[See also]:        cpp/links.md

## Generate HTML/PDF/... from Markdown

The text is written using [Markdown]. The CppCoding project provides a [`Makefile`] to convert the content Markdown to HTML and PDF files (using [`pandoc`]). Command `make help` describes the available actions.

### Empowering `pandoc`

Moreover the [`Makefile`] empowers the Markdown conversion:

1. Embeds local images in HTML but keep outside extrernal images (i.e. for `http://` URL)
2. Keep links between Markdown pages when converting to HTML/PDF
3. Convert ASCII diagrams into nice images

This third point use [ditaa-markdown] which depends on `ditaa0_6b.jar`, `DitaaEps.jar`, `epstopdf`, `dot` and `rdfdot`.

### Examples of diagrams

* [ditaa]
* [dot]
* [rdfdot]

[`Makefile`]:     Makefile
[Markdown]:       https://en.wikipedia.org/wiki/Markdown "Simple and popular markup language"
[`pandoc`]:       https://en.wikipedia.org/wiki/Pandoc   "a universal document converter"
[ditaa-markdown]: https://github.com/nichtich/ditaa-markdown "Perl script: mddia"
