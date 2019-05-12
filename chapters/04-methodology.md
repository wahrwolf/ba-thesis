# Methodology
## Framework
I will use the Open Source Neural Machine Translation ([OpenNMT-py](https://github.com/OpenNMT/OpenNMT-py)) framework.
It is well tested, documented and research friendly as show in \cite{opennmt}.

## Models
As a model for the network I will an encoder-decoder network.
For the baseline, I will use an RNN with an LSTM for both the encoder and the decoder.
This is the same setup used by \cite{kobus:16}.
I will train a second series with a TN as encoder and decoder for comparison and to test on my hypothesis on the relevance of the used attention architectures.
If one of the datasets does not perform sufficiently I will train a pointer generator network \cite{See:17} and compare instead of the additional dataset.


## Vocabulary
I will use Byte Pair Encoding (BPE)  as introduced by \cite{Sennrich:15} to generate a vocabulary based on common used symbols instead of words.
The source vocabulary will be extended by unique domain tags.
Instead of using the full text bodies I will reduce them and only use part of it.
This is done due to time limits during the training.

## Data sets
In this thesis I will work on 3 datasets.
All of them contain data from multiple domains and are available in at least 3 languages.

The first dataset (ONU)is created by joining the OpenSubtitles18 (for the domain "MOVIE"), the NC11 (for the domain "NEWS" and the Ubuntu (for the domain "IT").
All of those text corpora are available in English, German and Japanese.

The second dataset (LFM) consists of the domains "LAW" (Europarl), "FINANCE" (ECB) and "MEDICAL" (EMEA).
These are all available in English, Danish and Czech.

The last dataset is an industry corpus consisting of multiple domains and available in multiple languages.
This dataset will be used optionally, therefore the included domains will be chosen depending on the available time.

## Training
The datasets are available in 2 language pairs: a distant language pair (da-cz, en-ja) and a language family pair (en-de, en-da).
The aligned texts of each pair will be used as one trainings corpus.

Each corpus will be used to train 3 networks:
	1) An RNN without the domain annotations (as a baseline),
	2) An RNN with the domain annotations,
	3) A TN with the domain annotations.


## Evaluation
For the evaluation I will calculate the BLEU score on a validation text, which is taken out of the training dataset beforehand.
As mentioned in the training section, I will train one RNN per corpus as a baseline.
