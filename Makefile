PY=python
PANDOC=pandoc

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/source
# shared directory
SHAREDDIR=$(BASEDIR)/source/shared
# chapters only in marissa's thesis
MARISSADIR=$(BASEDIR)/source/marissa
# chapters only in nook's thesis
NOOKDIR=$(BASEDIR)/source/nook

OUTPUTDIR=$(BASEDIR)/output
TEMPLATEDIR=$(INPUTDIR)/templates
STYLEDIR=$(BASEDIR)/style

BIBFILE=$(INPUTDIR)/references.bib

help:
	@echo ' 																	  '
	@echo 'Makefile for the Markdown thesis                                       '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make html                        generate a web version             '
	@echo '   make pdf                         generate a PDF file  			  '
	@echo '   make docx	                       generate a Docx file 			  '
	@echo '   make tex	                       generate a Latex file 			  '
	@echo '                                                                       '
	@echo ' 																	  '
	@echo ' 																	  '
	@echo 'get local templates with: pandoc -D latex/html/etc	  				  '
	@echo 'or generic ones from: https://github.com/jgm/pandoc-templates		  '

# pdf:
# 	pandoc $(INPUTDIR)/*.md \
# 	-o $(OUTPUTDIR)/thesis.pdf \
# 	-H $(STYLEDIR)/preamble.tex \
# 	--template $(STYLEDIR)/template.tex \
# 	--bibliography=$(BIBFILE) 2>pandoc.log \
# 	--csl=$(STYLEDIR)/ref_format.csl \
# 	-V fontsize=12pt \
# 	-V papersize=a4paper \
# 	-V documentclass:report \
# 	-N \
# 	--latex-engine=xelatex

npdf:
	$(shell cp $(NOOKDIR)/* $(OUTPUTDIR) && cp $(SHAREDDIR)/* $(OUTPUTDIR))
	pandoc $(OUTPUTDIR)/*.md  \
	-o $(OUTPUTDIR)/thesis.pdf \
	-H $(STYLEDIR)/preamble.tex \
	--template $(STYLEDIR)/template.tex \
	--bibliography=$(BIBFILE) 2>pandoc.log \
	--csl=$(STYLEDIR)/ref_format.csl \
	-V fontsize=12pt \
	-V papersize=a4paper \
	-V documentclass:report \
	-N \
	--latex-engine=xelatex
  $(shell find $(OUTPUTDIR) -type f ! -name '*.pdf' -delete)

mpdf:
	$(shell cp $(NOOKDIR)/* $(OUTPUTDIR) && cp $(SHAREDDIR)/* $(OUTPUTDIR))
	pandoc $(OUTPUTDIR)/*.md  \
	-o $(OUTPUTDIR)/thesis.pdf \
	-H $(STYLEDIR)/preamble.tex \
	--template $(STYLEDIR)/template.tex \
	--bibliography=$(BIBFILE) 2>pandoc.log \
	--csl=$(STYLEDIR)/ref_format.csl \
	-V fontsize=12pt \
	-V papersize=a4paper \
	-V documentclass:report \
	-N \
	--latex-engine=xelatex
  $(shell find $(OUTPUTDIR) -type f ! -name '*.pdf' -delete)


.PHONY: help pdf docx html tex
