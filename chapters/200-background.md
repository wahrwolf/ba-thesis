\chapter{On the current State of Neural Machine Translation}
In times of progressing globalization the need for fast and reliable translation increases.
Since human translations require skill and time not only to learn but as well as to make, they are often time-consuming and expensive.
Thus lately, machine translations are on the rise, according to Castilho et al. \citeyear{castil:17}.
The most used technique in machine translations are Neural Machine Translation (NMT) with Recurrent Neural Networks (RNN) since they produce the most promising results once they have been trained accordingly Wu et al. \citeyear{Wu:Schuster:16}

# Neural Networks (NN)
The term "Neural Networks" describes a class of machine learning algorithms, that are general function approximations.
These algorithms (or networks) learn a specific mapping between an input and an output by calculating the prediction error and apply a corresponding change to the matrix (known as backpropagation) \cite{hecht:92}. 
The algorithm that is used to apply a change to reduce the error is called the optimizer.
The \cite{bottou:10} proposed to use the stochastic gradient descent to calculate and apply that change.
\cite{zeiler:12} presented ADADELTA as an alternative to the stochastic gradient descent.
The stochastic optimization method adam was introduced by \cite{kingma:14}, because of its ability to work on networks with large data sets due to its little memory requirements.
All three methods are represented in current research.
The amount of reduction that is applied to reduce the error is called the learning rate, which is set between 0 and 1 and describes how much the network should be changed in each step.
A learning rate of 1 means, to take in the full error, whereas a rate of 0 means no fix the error at all \cite{bottou:10}

##  Recurrent Neural Networks (RNN)
So-called Recurrent Neural Networks (RNN) are a subclass of NN, which use an internal state to allow them to access their previous output in the next iteration \shortcite{zaremba:14}. Thus RNNs can parse a sequence of inputs and produce output sequences, e.g. speech recognition \shortcite{mikolov:10} or image transcription \shortcite{vinyals:15}.

## Attention
Plain RNNs have only limited memory to store their past output, limiting their usability when working with large or complex texts \cite{bahdanau:14}.
In comparison to "simple" NN, the attention-based networks address this issue by providing the NN with access to the input on top of the last output and implement a filter matrix to "blend in" certain features \shortcite{vaswani:17}.

# Neural Machine Translation
Neural machine translation (NMT) describes a branch of machine translations where RNN are used to translate text \shortcite{bahdanau:14}.
These are trained on input texts and their corresponding translations and allows the network to translate similar texts.
NMTs are commonly used; for example, in Google Translate and can produce excellent results on short passages.
With enough training data, they can even translate articles or more elaborate texts \cite{Wu:Schuster:16}.

In NMT text collections from the same source are referred to as one corpus.
A corpus may share the same context (domain) or is related to a particular event.
Especially useful for NMT are corpora, which are available in multiple languages (aligned corpora) because they can be used to evaluate the performance of a model \shortcite{Papineni:02}.  For this evaluation, the corpus is translated from one language into another with NMT, and the resulting translation is then compared the generated translation with the available reference translation, to check the translation quality.


## Byte-Pair-Encoding (BPE)
One of the main challenges in current NMTs is the choice of the available vocabulary.
If too many words are included, the networks tend to forget rarely used words or become too general.
On the other hand, if the vocabulary is too small, the networks cannot learn complex grammar forms.
An approach to solve this is to split up long words into multiple symbols (Byte Pair Encoding)\shortcite{koehn:17}.
Instead of using a list of actual words, the dictionary consists of numerous used character pairs or subwords.
This allows the network to learn common base words as well as pre- and suffixes.
\shortcite{Sennrich:15} have shown that this results in an overall improvement and allows the model to learn more complex grammar forms.


## Content Domains
Another challenge in translations is context because each industry has its lingo.
Contexts might be specialized through vocabularies like technical terms and standard shared definitions or even textual structures and tone.
This often distinct set of rules, such as tone, vocabulary, or any other substantial similarity are defined as a domain \shortcite{koehn:17}.

In Neural Machine Translation, multiple mechanisms are known and used to translate across multiple domains; for example, prefix or side constraints \shortcite{chu:17}.

## Prefix/Side Constraints
Prefix or Side Constraints describe a class of domain control mechanisms, where additional tokens are provided for the neural network, to identify the domain of the text.
These tokens can be direct modifications in the text, like the decoration of certain essential words or more general tags that are added in front of a sentence, word, or even corpus.
The concept of side constraint was introduced by \cite{Sennrich:16} and adapted for domain control by \cite{kobus:16}.

## Languages
Another challenge in NMT is language adaption and control.
\cite{johnson:17} has shown that certain languages can be translated without ever training on the actual language data (Zero-Shot Translation) and \cite{luo:19} impressively demonstrated that an NMT was able to translate an extinct language.
\cite{hajic:00} shows that a close affinity between languages simplifies certain translation actions.
\cite{mikolov:13} found that morphological features can improve the translation performance in certain situations.
However, it is unknown to date which relationship languages and domain features have.

Since languages are grouped by language families and language branches, it can be suspected that similar languages may benefit from similar models.  
A language family is a group of languages that descend from a common ancestor such as the Indo-European languages or the "Sino-Tibetan languages".
A typical example for a language branch is the Germanic branch containing languages such as German, English, Dutch and Flemish in contrast to the Romance language branch with languages such as Latin, Italian, French and Spanish or the Slavonic language branch such as  Czech and Russian \shortcite{wichmann:10}. Languages within the same branch are closer related than outside of the branch and share some similarities in terms of vocabulary or certain structural similarities \shortcite{georgi:10}.

It was shown by \cite{kobus:16} that prefix constraints are beneficial in English-French.
\cite{takeno:17} adapted the method for English-Japanese translation.
To date, no comparisons of the performance impact between the prefix constraints have been made.
Thus the question arises if the use of prefix constrains mechanisms can be generalized and used with any language pair.
