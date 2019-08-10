## Data Selection and Preparation
### Selection
#### Corpus
As \reference{kobus} did in their experiment, I build a trainings corpus with the content from multiple domains.
I used the three domains FINANCE, LAW and MEDICAL for my experiments.
These domain share certain semantic qualities like informality and a precise language.
All three contain domain specific jargon.

For the FINANCE domain I used version 1 of the website and documentation of the European Central Bank \TODO{reference j tiedemann). This corpus will be refereed as ECB.
For the LAW domain I used version 7 of a parrellel coprus extracted from the European Parliament web site \TODO{reference philipp koehn}. This corpus will be referred as Europarl.
For the last domain (MEDICAL) I used version 3 of a corpus made of PDF documents from the European Medicines Agency, which will be refereed as EMEA.

In the original paper, the trainings corpus consists of 5 domains from partly proprietary corpora.

In contrast, all of my used corpora are available for free to everyone through the OPUS project \TODO{reference}.

The corpora were splitted into smaller shards. Each shard represents one unit in the context of the document.
The boundaries of the units were found by analyzing the German-English text and aplying closest possible splits on both langauge pairs.

The shards were than merged together into a training- and a validation set, so that each corpus had roughly the same amount of example sentences in both sets.

To ensure that the resulting data sets were representive to the orginal domain corpora, I calculated the distribution of the word length and the number of words per sentence.

#### Languages
For the comparison I used Czech-English as a distant language pair and German-English as a related language pair.
According to the FSI (https://www.state.gov/key-topics-foreign-service-institute/foreign-language-training/) German classifies as a Category II (moderate) and Czech as a Category III (Hard) language for an English speaker.
For both pairs I used English as the source language.
All corpora where available in those pairs.

### Preparation
I used Byte Pair Encoding to equalize the number of tokens per text.
For that I run the implementation of \TODO{sennrich bpe} and reduced the text into 32000 \TODO{double check} tokens as suggested by \TODO{Kobus reference}.
A unique sequence was used to mark word endings and pairs.
The reference implementation of \TODO{reference sennrich bpe} was used.

### Prefix Constraints
I proceeded with the preprocessed data and applied the prefix constraints as described by \reference{kobus}
For that I created one unique token per domain and prefixed all English sentences with the corresponding domain token.
Since the format of the token differs from the format produced by the BPE algorithm, all prefix constraints can be considered unique.

I had the following four corpora: Not modified data in DE-EN and CS-EN and Modified data in DE-EN and CS-EN.
In the following I will refer to them as Clean-de-en, Clean-cs-en, Tagged-de-en and Tagged-cs-en.

## Model Selection and Optimization
### Model
The four corpora were than used to train a recurrent neural network with LSTM and 1000 neurons and two hidden layers.
Furthermore I used multiple values for the optimizer, the learning rate and the learning rate decay.
For the optimizer I used stochastic gradient descent, adam and adadelta. I ran all of them with learning rates 1, 0.1, 0.001 and 0.0001 and started to decay the learning rate by 0.3 per epoch after 5 or 10 epochs and once per optimizer and learning rate without any decay.
I used the \reference{openNMT} framework for the implementation of the model and the training procedure.
  \TODO{Add all default params}
I build a MQTT scheduler to coordinate the runs on a mixture of NVIDIA GTX 980, 1080 and 1080Ti.
Each model was trained for 18 epochs, which took between 2 and 3,5 hours depending on the GPU.
English was used in all models as the source locale and Czech and German as the target locale.
All models were trained multiple times to ensure proper distribution of start vectors.

### Optimization
On all models 1000 sentences from the valdiation set where translated.
The translations were stripped from the BPE and compared to the reference texts using BLEU, METEOR and ROUGE\_L.
The scores where than used to find the best model.
For the further comparison only, 

## Comparison and evaluation of the domain control mechanism
### evaluation of the domain control mechanism
The translations from the best models for all four corpora were than split into the three domains.
The three metrics were calculated on the domain texts and the combined text.

For the evaluation I calculated the differences between the training with and without prefix constraints for both language paris and all four texts.
