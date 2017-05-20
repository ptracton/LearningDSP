

all:
	emacs -q -l ~/.emacs.d/org.el dspguide.org --batch -f org-latex-export-to-latex --kill
	pdflatex -shell-escape -interaction nonstopmode dspguide.tex
	pdflatex -shell-escape -interaction nonstopmode dspguide.tex	


clean:
	find ../ -name "*~" | xargs rm -rf 
	find ../ -name "*pdf" | xargs rm -rf
	find ../ -name "*tex" | xargs rm -rf
	find ../ -name "_minted*" | xargs rm -rf
	find ../ -name "auto" | xargs rm -rf
	rm -rf *lol *lot *bbl *log *out *aux *lof *toc
