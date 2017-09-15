FILE_ROOT = matlab_test
ORG_FILE = $(FILE_ROOT).org
TEX_FILE = $(FILE_ROOT).tex
PDF_FILE = $(FILE_ROOT).pdf

all:
	emacs -l ~/.emacs.d/org.el -q  $(ORG_FILE) --batch -f org-latex-export-to-latex --kill
	pdflatex -shell-escape -interaction nonstopmode $(TEX_FILE)
	pdflatex -shell-escape -interaction nonstopmode $(TEX_FILE)


clean:
	find ../ -name "*~" | xargs rm -rf 
	find ../ -name "*pdf" | xargs rm -rf
	find ../ -name "*tex" | xargs rm -rf
	find ../ -name "_minted*" | xargs rm -rf
	find ../ -name "auto" | xargs rm -rf
	rm -rf *lol *lot *bbl *log *out *aux *lof *toc
