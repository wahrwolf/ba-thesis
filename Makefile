# Variablen
PANDOC_PAPER=--write latex
RUBBER_ARG=-d

# main targets
paper: thesis.pdf
	mv $< paper.pdf
	cp paper.pdf /srv/ftp/share/archive/ba-thesis.pdf
	rubber $(RUBBER_ARG) --clean thesis
	rm -f thesis.vrb

# Convert markdown to tex using pandoc
chapters.tex: $(wildcard chapters/*.md)
	pandoc $(PANDOC_PAPER) -o $@ chapters/*.md

# Build pdfs
thesis.tex: chapters.tex

%.pdf: %.tex
	rubber $(RUBBER_ARG) $<

# Generic
clean:
	rubber $(RUBBER_ARG) --clean thesis
	rm -f slides.tex presentation.vrb beamer.pdf
	rm -f chapters.tex thesis.vrb paper.pdf
