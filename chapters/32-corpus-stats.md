## Data Selection and Preparation
### Selection
I choosed to include the three domains FINANCE, LAW and MEDICAL.
For the FINANCE domain I used version 1 of the website and documentation of the European Central Bank \TODO{reference j tiedemann). This corpus will be refereed as ECB.
For the LAW domain I used version 7 of a parrellel coprus extracted from the European Parliament web site \TODO{reference philipp koehn}. This corpus will be referred as Europarl.
For the last domain (MEDICAL) I used version 3 of a corpus made of PDF documents from the European Medicines Agency, which will be refereed as EMEA.

All corpora were made available through the OPUS project \TODO{reference} and were downloaded in pairs of English-Germand and English-Czech.

### Slicing
All corpora needed to be reduced and merged by equal parts.
For the preprocessing steps I used my own framework \TODO{link for framework} with this configuartion.

The corpora were splitted into smaller shards. Each shard represents one unit in the context of the document.
The boundaries of the units were found by analyzing the German-English text and aplying closest possible splits on both langauge pairs.

The shards were than merged together into a trainings- and a valdations set, so that each corpus had roughly the same amount of example sentences in the new corpus.

The figure \TODO{include corpus_stats image} shows the number of words and the word length in comparison for each data set.

### Preparation
#### BPE
I used Byte Pair Encoding to equalize the number of tokens per text.
For that I run the implementation of \TODO{sennrich bpe} and reduced the text into 32000 \TODO{double check} tokens as suggested by \TODO{Kobus reference}.

#### Prefix Constraints
After the processing with BPE I prefixed one copy of the data set with domain tags on a sentence level.
I used @EMEA@, @Europarl@ and @ECB@ as tokens.
Since the format of the token differs from the format produced by the BPE algorithm, all tokens can be considered unique.

After the generation I had the following for corpora: Not modified data in DE-EN and CS-EN and Modified data in DE-EN and CS-EN.
In the folllowing I will refer them as Clean-de-en, Clean-cs-en, Tagged-de-en and Tagged-cs-en.
