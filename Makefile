current: target
-include target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt README.md"

######################################################################

Sources += README.md
Sources += $(wildcard *.tex *.sh)

## ms_submit.pdf: ms_submit.tex body.tex abstract.tex Appendices.tex
ms_submit.pdf: ms_submit.tex.pdf

ms_submit.tex.pdf: ms_submit.tex body.tex abstract.tex Appendices.tex
	$(latexnonly)

Ignore += svg-inkscape

######################################################################

### Makestuff

## Sources += $(wildcard *.mk)
## include $(wildcard *.mk)

Sources += Makefile
Ignore += makestuff
msrepo = https://github.com/dushoff

Makefile: makestuff/00.stamp
makestuff/%.stamp:
	- $(RM) makestuff/*.stamp
	(cd makestuff && $(MAKE) pull) || git clone --depth 1 $(msrepo)/makestuff
	touch $@

-include makestuff/os.mk

## -include makestuff/pipeR.mk

bibtex = bibtex $*
latex = pdflatex --shell-escape
-include makestuff/texi.mk

-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk

