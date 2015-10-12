# Makefile to generate PDF/HTML from Markdown using pandoc
# CC0 1.0 Universal - Public Domain Dedication - No Rights Reserved
# To the extent possible under law, olibre has waived all copyright and related or neighboring rights to CppCoding. This work is published from France since 2015. Refer to CC0 Legal Code or a copy in file COPYING.

SHELL      := /bin/bash # Avoid trouble when the SHELL variable is inherited from the environment
files_md   := $(wildcard *.md) $(wildcard */*.md) $(wildcard */*/*.md) $(wildcard */*/*/*.md)
files_pdf  := $(files_md:%.md=%.pdf)
files_html := $(files_md:%.md=%.html)
doc_vers   := $(shell git describe --all | sed 's|heads/||' )
doc_date   := $(shell git log -1 --format=%cd )                                                 #+shortcut_reference_links
from_md    := --from 'markdown+lists_without_preceding_blankline+autolink_bare_uris+ascii_identifiers+mmd_title_block+escaped_line_breaks+shortcut_reference_links'
pandoc_opt := $(from_md) --title-prefix='Version $(doc_vers)' --toc --smart --normalize
html_css   := $(abspath white-on-black.css)
html_opt   := --standalone --self-contained --highlight-style=zenburn --css=$(html_css) --html-q-tags --to=html5

.PHONY: all help pdf html clean install-depedencies


all: pdf html        ## Default target, same as 'make pdf html'
	$(info -------------------------------------)
	$(info Generated files)
	@ls -1sSh --color ${files_pdf} ${files_html}

pdf:  ${files_pdf}   ## Convert to PDF all discovered '*.md' files

html: ${files_html}  ## Convert to HTML all discovered '*.md' files

%.pdf: %.md
	$(info pandoc converting '$<' to '$@')
	@ cd $(<D)                                                      ; \
	{ type -t mddia >/dev/null && mddia -pdf $(<F) || cat $(<F) ; } | \
	$(call Fill_DateVersion)                                        | \
	$(call Convert_LocalLink_Markdown_to_Extension,pdf)             | \
	$(call ImgHttp_to_Anchor)                                       | \
	pandoc $(pandoc_opt) -o $(@F)

%.html: %.md
	$(info pandoc converting '$<' to '$@')
	@ cd $(<D)                                                      ; \
	{ type -t mddia >/dev/null && mddia -png $(<F) || cat $(<F) ; } | \
	$(call Fill_DateVersion)                                        | \
	$(call Convert_LocalLink_Markdown_to_Extension,html)            | \
	$(call ImgHttp_to_Anchor)                                       | \
	pandoc $(pandoc_opt) $(html_opt)                                | \
	$(call AnchorHttpImage_to_Img) > $(@F)

## Remove generated PDF/HTML files and temporary images (generated by mddia)
clean:
	@shopt -s globstar && \
	rm -vf ${files_pdf} ${files_html} **/image-*.{ditaa,eps,pdf,png,dot}

## Invoke 'yum' and 'cpanm' to install depedencies (to be used with sudo)
install-depedencies:
	# Command 'pandoc -o out.pdf' requires command 'pdflatex' which is installed by 'yum install texlive'
	# Script 'mddia' requires command 'epstopdf' (for PDF) => 'yum install texlive-epstopdf'
	# Script 'mddia' requires 'java' in order to run 'ditaa' => 'yum install java'
	# Script 'mddia' requires command 'dot' => 'yum install graphviz'
	# Script 'mddia' requires Perl module 'rdfdot' => 'yum install perl-App-cpanminus && cpanm rdfdot'
	# Optionally command 'pandoc -o out.pdf --latex-engine=xelatex' requires 'xelatex' installed by 'yum install texlive-xetec'
	yum install pandoc texlive texlive-epstopdf java graphviz perl-App-cpanminus
	yum install texlive-xetex #optional
	cpanm rdfdot

## Describe available targets
help:
	@awk '/^[a-zA-Z\-\_0-9]+:/ {              \
	  nb = sub( /^## /, "", helpMsg );        \
	  if(!nb) {                               \
	    helpMsg = $$0;                        \
	    nb = sub( /.*## /, "", helpMsg );     \
	  }                                       \
	  if (nb) print "make", $$1 "\t" helpMsg; \
	}                                         \
	{ helpMsg = $$0 }'                        \
	$(MAKEFILE_LIST) | column -ts $$'\t' |    \
	grep --color '^[^:]*'


# Fill MultiMarkdown Metadata fields: Date and Version
# Explanation of each sed lines:
# 1. Read the whole file as a single line
#    (usefull to replace the Nth occurence only, the first one in our case)
# 2. Replace case-insensitive line '% date' or '% xxx' by '%<doc_date>'
#    (usefull if Markdown format uses extension "pandoc_title_block")
# 3. Replace line 'Date: xxx' by 'Date:  <doc_date>'
#    (usefull if Markdown format uses extension "mmd_title_block"
# 4. Replace pattern 'Version: xxx$' by 'Version: <doc_vers>'
# Note: All these replacements: - are case-insensitive
#                               - replace only the first occurence found in the file
define Fill_DateVersion
sed -r ':a;N;$$!ba;                              \
     s^\n% *(date|xx*) *^\n% $(doc_date)^i;      \
     s^\nDate: xxx*\n^\nDate:  $(doc_date)\n^i;  \
     s^Version: xx*\n^Version: $(doc_vers)\n^i;  \
'
endef

# Replace images by links (in MarkDown)
# because 'pandoc --self-contained' try to download image
# from the web (bloat file or fails when no web connection)
define ImgHttp_to_Anchor
sed '/](http/s/^!\[/[/'
endef

# Detect patterns '<a href="http****.ext">..........</a>'
#                 '<a href="http********">image.....</a>'
# Replace by '<img src="http****.ext" alt="image.....">'
define AnchorHttpImage_to_Img
sed -r ' \
  s,<a([^>]*)href="(http[^"]*(png|jpeg|jpg|gif|svg))"([^>]*)>([^<]*)</a>,<img \1 src="\2" \3 alt="\4">,gi; \
  #s,<a([^>]*)href="(http[^"]*)"([^>]*)>(image [^<]*)</a>,<img \1 src="\2" \3 alt="\4">,gi'
endef

define Convert_LocalLink_Markdown_to_Extension
  sed -r 's,\[([^]]+)\]\(([^h][^)]+)\.md\),[\1](\2.$(1)),ig'
endef