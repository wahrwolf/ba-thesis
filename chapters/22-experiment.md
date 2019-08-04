## Data Selection and Preparation
### Selection
#### Corpus
In the original paper, the combined corpus hold \TODO{CHECK THOSE NUMBERS} 5 domains from partly comercial or restriced corpora.
Since I had not the ressources or the time, I scaled the number of corpura and therfore domains down to 3.
I decided to use the same open available corpora and choose to combine the ECB, Europarl and EMEA corpus.

To reduce the trainings time I split the original corpora in logical units (e.g. a parlaments sitting).
The units were than combined into a trainings set (~70,000 example sentence) and a valdidation set (~15,000 example sentence).
To ensure that the resulting data sets were representive to the orginal domain corpora, I calculated the distribution of the word length and the number of words per sentence.

#### Languages
The choosen corpora are all from european sources, so I decided to use language pairs from the EU countries.
Since I can understand booth, English and German, I choose those as the first langauge pair.
In the European Langauge Area, Czech is one of the more distant lanauges from German since it is not a Roman langauge \TODO{Reference}.
All corpora where available in those pairs.

### Preparation
I applied Byte-Pair-Encoding to the reduced corpus and merged to 32000 symbols as done by \TODO{reference}.
An uninque sequence was used to mark word endings and pairs.
The reference implementation of \TODO{reference sennrich bpe} was used.
Other than the BPE and the reducing no data modification were applied.

### Domain Prefixes
In the next step I applied 3 domain tags (one for each domain) to the source sentences of the data sets.
The labels started where surronded my a sequenze marker that is different from the BPE marker.
I did this to ensure, that the label was clearly marked as a special token.
The token were prefixed to all sentences from the domain corpora. This is in line with the experiement from \TODO{paper finden} and in contrast to \TODO{sennrich paper}.
