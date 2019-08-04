# Methodik
## versuchsaufbau
### corpus
- auswahl der texte
	- domains (weil in paper)
	- anzahl (weil umfang)
	- warum diese (weil verfügbar in open corpus)
	- warum diese sprachen

- vorbearbeitung
	- bpe (weil paper/erfahrung, mit params aus paper)
	- reduzieren (random auswählen, weil umfang, metrik number of words, word_length)
	
### modell
- parameter auswahl (weil paper, und erfahrungswert)
- scoring: weil human text, paper
- auswahl der besten modelle anahand von bleu

### side constraint
- welche label
- notation der label (weil nur 3 domains)
- uniquness der label (garanitert durch bpe)
- positioon der label (paper)

### comaparison between langauge pairs
- vergleich durch berechnung der differenz
- en ist src

## tools
### hardware
- welche gpus

### software
- opennmt
- preparation implemenation
