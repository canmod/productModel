#!/bin/bash
grep -E -v "^\\\\(jd|df|ben|david|steve)" JOMB_formatted.tex >tmp0.tex
patch -o - tmp0.tex arxiv_diff.patch > productmodel_arxiv.tex
