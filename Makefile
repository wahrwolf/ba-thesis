# Variablen
PANDOC_PRESENTATION=--write beamer --slide-level 2
PANDOC_PAPER=--write latex
RUBBER_ARG=-d

# main targets
paper: thesis.pdf
	mv $< paper.pdf
	rubber $(RUBBER_ARG) --clean thesis
	rm -f thesis.vrb

beamer: presentation.pdf
	mv $< beamer.pdf
	rubber $(RUBBER_ARG) --clean presentation
	rm -f presentation.vrb


# Convert markdown to tex using pandoc
slides.tex: $(wildcard slides/*.md)
	pandoc $(PANDOC_PRESENTATION) -o $@ slides/*.md

chapters.tex: $(wildcard chapters/*.md)
	pandoc $(PANDOC_PAPER) -o $@ chapters/*.md

# Build pdfs
presentation.tex: slides.tex
thesis.tex: chapters.tex

%.pdf: %.tex
	rubber $(RUBBER_ARG) $<

# Generic
clean:
	rubber $(RUBBER_ARG) --clean presentation
	rubber $(RUBBER_ARG) --clean thesis
	rm -f slides.tex presentation.vrb beamer.pdf
	rm -f chapters.tex thesis.vrb paper.pdf
