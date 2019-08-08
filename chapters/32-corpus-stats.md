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


## Training and Model Selection
### Training
I trained an bidirectional LSTM with the configuration shown \TODO{add config}.
I ran a hyperparameter optimization on the optimzier (sgd, adam, adadelta), the learning rate(1, 0.1, 0,001, 0001) and the beginning of the learning rate decay(off, 5 epochs, 10 epochs).
The OpenNMT framework was used to train the models and translate the scoring tests.
In the OpenNMT context one epoch of the corpus translates roughly to 2,000 train steps.
All models were trained for 18 epochs.
I used a small MQTT scheduler to coordinate the runs on a mixture of NVIDIA GTX 980, 1080 and 1080Ti.
One run takes between 2 and 3,5 hours depending on the GPU.
Most of the models showed a decent trainings curve \TODO{image good curve} as this example run caped after ~5epochs.
Some hyper parameter configuration learned comparable slow \TODO{image bad curve} and some configurations like \todo{show super mad config in table} produced unusable results.

All models were trained multiple times to ensure proper distribution of start vectors.

### Selection of Hyper Parameter
The resulting models were used to translate 1,000 examples from the validation data. 
The generated translation were stripped from the BPE and scored using BLEU \TODO{fancy optim}.
From the ranking \TODO{include table} the best model were choosen for each corpus.

## Scoring and Comparison
The figure \TODO{side constraint comparison} shows the performance of the best model for the domain test sets calculated with bleu.
As expected the related language pair had archived better scores overall domains.

\TODO{write something about the different domains}

However depending on the scoring metric, there were huge differences in the actual performance change between the pairs.
The models that were trained with prefix constraints archieved a higher trainings and validation accuracy, however only in the CZ-EN pair.
In the DE-EN pair was not noticeable difference in the trainings statistic.

For more content focused scores like BLEU or ROUGE \TODO{add table with socres} the prefix constraints impacted the score slightly negative.

While the difference is pretty small for related languages, it is notable different for the distant language pair.
