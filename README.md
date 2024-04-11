The recommended way to work on this project without interacting with overleaf is to clone the _overleaf_ (not github) git repo: https://git.overleaf.com/62c47733b38f39223ce3d7ec 

## JD 2023 Jun 09 (Fri)

I was able to compile this in a cloned directory by:

* using `--shell-escape` as an argument to `pdflatex`
* installing inkscape (using `apt install`)

My Makefile for this project is available at https://github.com/dushoff/research/blob/master/mkfiles/productModel.make. If anybody wants to use it, we can discuss advantages and disadvantages of moving it to the repo (and thus to overleaf).

## DE 2023 Jul 10 (Mon)

I was able to compile following JD's notes above, but with the macOS equivalent:

* `brew install inkscape`
* `pdflatex --shell-escape JOMB_formatted`

