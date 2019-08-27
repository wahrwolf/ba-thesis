# Variablen
PANDOC_PAPER=--write latex
PANDOC_BEAMER=-t beamer --slide-level 2
RUBBER_ARG=-d

# main targets
paper: thesis.pdf
	mv $< paper.pdf
	cp paper.pdf /srv/ftp/share/archive/ba-thesis.pdf
	rubber $(RUBBER_ARG) --clean thesis
	rm -f thesis.vrb

# main targets
beamer: presentation.pdf
	mv $< beamer.pdf
	cp beamer.pdf /srv/ftp/share/archive/ba-defence.pdf
	rubber $(RUBBER_ARG) --clean presentation
	rm -f presentation.vrb

# Convert markdown to tex using pandoc
chapters.tex: $(wildcard chapters/*.md)
	pandoc $(PANDOC_PAPER) -o $@ chapters/*.md

# Convert markdown to tex using pandoc
slides.tex: $(wildcard slides/*.md)
	pandoc $(PANDOC_BEAMER) -o $@ slides/*.md

# Build pdfs
presentation.tex: slides.tex

thesis.tex: chapters.tex

%.pdf: %.tex
	rubber $(RUBBER_ARG) $<

# Generic
clean:
	rubber $(RUBBER_ARG) --clean thesis
	rm -f slides.tex presentation.vrb beamer.pdf
	rm -f chapters.tex thesis.vrb paper.pdf
