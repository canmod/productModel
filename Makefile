## This is the productModel canmod github project
## https://github.com/canmod/productModel.git

######################################################################

current: target
-include target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt README.md"

######################################################################

Sources += README.md
Sources += $(wildcard *.tex *.sh)

## ms_submit.pdf: ms_submit.tex abstract.tex Appendices.tex body.tex
ms_submit.texdeps.mk: abstract.texdeps.mk body.texdeps.mk

Ignore += inkscape.check
ms_submit.tex.pdf: | inkscape.check
inkscape.check:
	inkscape --version || (echo inkscape is needed for this project && false)
	touch $@

Ignore += svg-inkscape

######################################################################

Ignore += main
main:
	$(MAKE) main.branchdir

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
latexEngine = pdflatex --shell-escape
-include makestuff/texj.mk

-include makestuff/git.mk
-include makestuff/gitbranch.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk

