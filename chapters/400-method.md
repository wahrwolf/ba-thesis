# Method
In the following section, I introduce and present the methods used to evaluate the performance impact of the domain control mechanism "prefix constraint" in NMT across different language pairs.
I introduce the used data sets and describe my training setup for the neural networks.

The used domain control mechanism was adapted from \cite{kobus:16}, but the testing setup was changed to investigate the impact of prefix constraints in related and unrelated languages.

## Data Selection and Preparation
To compare the performance impact of the domain control mechanism, I built a multi-domain corpus with two language pairs of different relatedness.

### Language Pair Selection
The selected language pairs were Czech-English as a distant language pair and German-English as a related language pair.
For both pairs, I used English as the source language.

### Domain and Corpus Selection
I used the three domains FINANCE, LAW, and MEDICAL for my experiments.
These domains share certain semantic qualities like a formal and precise language and a domain-specific jargon.

For the FINANCE domain, I used version 1 of the website and documentation of the European Central Bank \shortcite{tiedemann:12. This corpus will be referred to as ECB.
For the LAW domain, I used version 7 of a parallel corpus extracted from the European Parliament website \shortcite{tiedemann:12}. This corpus will be referred to as Europarl.
For the last domain (MEDICAL) I used version 3 of a corpus made of PDF documents from the European Medicines Agency \shortcite{tiedemann:12}, which will be referred to as EMEA.

All of the used corpora are accessible through the OPUS project \cite{tiedemann:12}.

## Data Preparation
A new corpus was created by reducing the domain corpora and combining them into one multi domain corpus.
The newly generated corpus was then prepared for neural network training. During the preprocessing, the words were split into tokens of high occurrence using BPE. Afterward, the domain control mechanism was applied to the data set.

### Data Slicing
Since no document separation was available, I analyzed the corpora manually and split all corpora in smaller documents of logical units.
Those units were than combined into a training set with roughly 70,000 example sentences and a validation set of 15,000 sentences.
This new corpora were aligned in German-English and Czech-English.
I calculated the distribution of word and sentence length for the original corpora, the validation and the training set.

### BPE
Byte Pair Encoding was used to reduce the number of tokens to 32,000 as suggested by \cite{kobus:16}, by running the implementation of \cite{Sennrich15}.
The unique sequence (@@) was used to mark word endings and pairs.

### Prefix Constraints
Then the domain control mechanism 'prefix constraint' was applied as described by \cite{kobus:16}
For each domain, all English sentences were prefixed with a unique domain token.
Since the BPE algorithm produced token with a specific format, the domain tokens needed only a different pre- and suffix to became unique.

The resulting corpora were: Not modified data in Czech-English (CZ-EN) and German-English (DE-EN), and Modified data in DE-EN and CS-EN.
In the following, I will refer to them as Clean-de-en, Clean-cs-en, Tagged-de-en, and Tagged-cs-en.

## Training and Optimization
To evaluate the performance impact of prefix constraints, I trained a neural network \cite{bahdanau:14} and performed one hyperparameter optimization round. The used parameter was adapted from multiple sources \shortcite{kobus:16} \shortcite{Sennrich:16} \shortcite{luong:15} and will be explained subsequently.

### Model
I used an Encode-Decoder Recurrent Neuronal Network with "Long Short-Term Memory" \shortcite{zaremba:14} gates, with a dropout probability of 0.3, two layers, and 1000 hidden states.
On the source and target side I used 500 word embeddings \cite{bahdanau:14}.
For the attention \cite{vaswani:17} behavior I used the "general" \cite{long:15} attention type and the "softmax" \cite{liu:16} function for the attention and the generator.

### Hyper Parameter
For the optimizer, I run multiple configurations.
In all runs, a mini-batch size of 32 sentences for the training and 16 sentences for the validation was used.
For the optimizer, I used stochastic gradient descents \shortcite{bottou:10}, "Adam \shortcite{kingma:14}", and "ADADELTA \shortcite{zeiler:12}".
I ran all of them with learning rates 1, 0.1 and 0.001 and started to decay the learning rate by 0.3 per epoch after 5 or 10 epochs and once per optimizer and learning rate without any decay.
The gradient was set to be renormalized if the norm over the gradient vector exceeded 5.

### Training
I used the \cite{opennmt} framework for the implementation of the model and the training procedure.
I built an MQTT \shortcite{light:17} scheduler to coordinate the runs on a mixture of NVIDIA GTX 980, 1080 and 1080Ti GPUs.
Each model was trained for 18 epochs, which took between 2 and 3,5 hours depending on the GPU.
English was used in all models as the source locale and Czech and German as the target locale.
All models were trained multiple times to ensure the proper distribution of start vectors.
During the training, I logged the training accuracy and calculated the validation accuracy after every epoch.
However, the validation score was not used for early stopping.

## Comparison
To compare the score impact and evaluate a possible connection with the relatedness of the languages, I picked the best models from the training and measured its performance with three metrics (BLEU\shortcite{Papineni:02}, METEOR\shortcite{banerjee:05}, ROUGE-L\shortcite{lin:04}).

### Metrics
I used three different metrics to measure the translation quality of the trained neural networks (BLEU, METEOR, and Rouge-L).
An overall score was calculated by adding the rank of all scores.
All data preprocessing steps were removed before calculating the scores.
Since the corpus was aligned, all scores were calculated in comparison to a conventional translation.

### Model Selection
For each language pair, the best model was chosen according to overall score with and without prefix constraint resulting in four models: Clean-de-en, Clean-cs-en, Tagged-de-en, and Tagged-cs-en
The validation data sets were translated using these models and metrics (BLEU\shortcite{Papineni:02}, METEOR\shortcite{banerjee:05}, ROUGE-L\shortcite{lin:04}) were calculated for each resulting translation.

### Prefix Constraint
Per domain, a data set of 1,200 randomly picked example sentences was prepared in the same way as the training data, except that the BPE merges were not relearned but reused to generate the same tokens.
The data sets were then distributed into four sets, each containing 900 sentences either originating from the same domain (three sets) or combining all three domains into one set.

All sets were translated by the best models from the previous selection and scored with all three metrics.

### Language Pairs
To compare the performance impact of the prefix constraints across the language pairs, I calculated the relative score change per metric and domain test set for both language pairs over the runs with and without prefix constraints.
