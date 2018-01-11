all: paper.pdf 

dia/_build/%.tex: dia/%.dia dia/Makefile
	cd dia; make

paper.pdf: dia/_build/algo.tex paper.tex
	pdflatex paper.tex
	bibtex paper	
	pdflatex paper.tex
	pdflatex paper.tex

clean:
	rm paper.pdf paper.bbl paper.blg paper.log paper.aux paper.out
	cd dia; make clean
