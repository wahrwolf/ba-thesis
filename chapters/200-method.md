# Method
In the following section I introduce and present the methods used to evaluate the performance impact of the domain control mechanism "prefix constraint" in neural machine translation across different language pairs.
I introduce the used data sets and describe my trainings setup for the neural machine translation.

The domain control mechanism here was introduced by \reference{kobus}.
I used a similar setup but because my focus is on the performance impact between language pairs and not the evaluation of the mechanism I changed some aspects.

## Data Selection and Preparation
To compare the performance impact of a domain control mechanism, I build a multi domain corpus with two language pairs of different relatedness.
### Domain and Corpus Selection
I used the three domains FINANCE, LAW and MEDICAL for my experiments.
These domain share certain semantic qualities like informality and a precise language.
All three contain domain specific jargon.

For the FINANCE domain I used version 1 of the website and documentation of the European Central Bank \TODO{reference j tiedemann). This corpus will be refereed as ECB.
For the LAW domain I used version 7 of a parrellel coprus extracted from the European Parliament web site \TODO{reference philipp koehn}. This corpus will be referred as Europarl.
For the last domain (MEDICAL) I used version 3 of a corpus made of PDF documents from the European Medicines Agency, which will be refereed as EMEA.

In the original paper, the trainings corpus consists of 5 domains from partly proprietary corpora.

In contrast, all of my used corpora are available for free to everyone through the OPUS project \TODO{reference}.

### Language Pair Selection
For the comparison, I used Czech-English as a distant language pair and German-English as a related language pair.
According to the FSI (https://www.state.gov/key-topics-foreign-service-institute/foreign-language-training/), German classifies as a Category II (moderate) and Czech as a Category III (Hard) language for an English speaker.
For both pairs, I used English as the source language.
All corpora where available in those pairs.

### Data Preparation
### BPE
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

## Training and Optimization
To evaluate the performance I trained a simple Recurrent Neural Network Model \reference{} and with one hyper parameter optimization round.

### Model
I used an Encode-Decoder Recurrent Neuronal Network with LSTM gates, with a dropout probability of 0.3 , 2 layers, and 1000 hidden states
I used 500 word embeddings \reference{} on the source and target side.
For the attention \reference{} behavior I used the "general" \reference{} attention type and the "softmax" \reference{} function for the attention and the generator.

### Hyper Parameter
For the optimizer I run multiple configurations.
In all runs was a mini batch size of 32 sentences used for the training and 16 sentences for the validation.
For the optimizer I used stochastic gradient descent, adam and adadelta.
I ran all of them with learning rates 1, 0.1, 0.001 and 0.0001 and started to decay the learning rate by 0.3 per epoch after 5 or 10 epochs and once per optimizer and learning rate without any decay.
The gradient was set to renormalized if the norm over the gradient vector exceeds 5.

### Training
I used the \reference{openNMT} framework for the implementation of the model and the training procedure.
I build a MQTT scheduler to coordinate the runs on a mixture of NVIDIA GTX 980, 1080 and 1080Ti.
Each model was trained for 18 epochs, which took between 2 and 3,5 hours depending on the GPU.
English was used in all models as the source locale and Czech and German as the target locale.
All models were trained multiple times to ensure proper distribution of start vectors.
During the training I logged the trainings accuracy and calculated the validation accuracy after every epoch.
However the validation score was not used for early stopping.

## Comparison
To compare the score impact and evaluate a correlation with the relatedness of the languages, I picked the best models from the training and measured its performance with multiple metrics.

### Metrics
I used three different metrics to measure the translations quality of the trained neural networks.
All data preprocessing steps were removed before calculating the metrics.
Since the corpus is aligned, all scores are calculated against a human translation.

#### BLEU
The BLEU score is computed by measuring the difference between word groups and is calculated over the whole text.
The metric was developed to measure translation quality.
In this thesis the BLEU score is used to measure the overall translation quality.

#### METEOR
The METEOR metric was developed to improve the correlation of human judgment with the translation score.
It is calculated on sentence levels.
I used this score to represent the comprehensibility of the translation.

#### ROUGE-L
The ROGUE-L score is calculated by measuring the similarity of longer subsequences.
This score was developed to compare summaries.
Since the score benefits from structural and long word matches I used this score to measure the domain specialization.

### Candidate Selection
For the comparison of the impact I had to choose one model from the trainings for both language pairs and with or without prefix constraints
I translated the validation sets and calculated all three scores on the translation.
All models were than ranked according to those three scores.

### Prefix Constraint
I picked a set of 1200 example sentences per domain randomly from the original source.
The test data set was then prepared in the same way as the trainings data, except that the BPE merges were not relearned but reused, generate the same tokens.
The examples were than distributed into sets of 900 sentences, so that only one set consits of examples from multiple domains.

All sets were translated by the best models from the previous selection and scored with all three metrics.

### Language Pairs
To compare the performance impact of the side constraints across the language pairs, I calculated the relative score change per metric and domain test set for both language pairs over the runs with and without prefix constraints.
