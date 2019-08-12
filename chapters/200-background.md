# Background
I will compare the impact of a domain control mechnanism in neural machine translation.
The following background knowlegde is needed to follow my thesis:

## Translation
Neural Machine Translation (NMT) is a subset of the machine translation.
To act in the global market, localization is needed in all modern industries.
The translations need to be delivered fast and cheap.
Since human translation is quite slow and expensive, machine translation is used everywhere.

### Languages that are related
Languages are grouped by certain language families depending on their history.
Most languages share some vocabulary or certain structural similarities.

### Content Domains
Each industry has its own lingo.
Those might be special vocabularies like technical terms common shared definitions.
However in some areas a certain structure and tone is also very distinct.
A set of rules, such as tone, vocabulary or any other strong similarity define a domain.

### Corpora
Text collections from a common source are often refereed to as one corpus.
A corpus may share the same domain or is related to a certain event.
The corpus is aligned, if it is available in multiple languages or locales.

In machine translations aligned corpora are often used to evaluate the performance of a model.
For that the machine translation system is used to translate the corpus from one language into another available language.
The generated text is than compared the reference translation from the corpus.

## Neural Networks
Neural networks are the foundation of neural machine translation.

### Neural Networks (NN) and Recurrent Neural Networks (RNN)
The term "Neural Networks" describes a class of machine learning algorithm, that are general function approximations.
These algorithms (or networks) will learn a specific mapping between an input and an output.
This learning process works by calculating the prediction error and apply a corresponding change to the matrix.
This process is know as back propagation. The algorithm that is used to apply a change to reduce the error is called the optimizer.
The most common known algorithms are stoachstic gradient descent, adam adadelta.
The amount of reduction that is applied to reduce the error is called the learning rate.
The learning rate is set between 0 and 1 and describes how much the network should be changed in each step.
A learning rate of 1 means to take in the full error, where as a rate of 0 no fix at all is.


So called Recurrent Neural Networks are a subclass of NN that use an internal state which allows them to access their previous output in the next iteration.
This allows RNNs to parse a sequence of inputs and produce output sequences, e.g. text.

### Attention
Plain RNNs have only limited memory to store their past output. This make it hard to work with large or complex text \cite{bahdanau:14}.
In comparison to "simple" NN, the attention based networks address this issue by providing the NN with access to the input on top of the last output and implement a filter matrix to "blend in" certain features. 


## Neural Machine Translation
Neural machine translation describes a branch of machine translations where NN are used to translate text.
These are trained on an input texts and its corresponding translations and allow the network to translate similar texts.
NMTs are commonly used for example in Google Translate and can produce good results on short passages.
With enough training data they can even translate articles or larger texts \cite{Wu:Schuster:16}.

### Byte-Pair-Encoding (BPE)
One of the main challenges in current NMTs is the choice on the available vocabulary.
If too many words are included, the networks tend to forget rarely used words or become to general.
On the other hand if the vocabulary is too small, the networks cannot learn complex grammar forms.
An approach to solve this by splitting up long words into multiple symbols is Byte Pair Encoding.
Instead of using a list of actual words, the dictionary consist of frequent used character pairs or subwords.
This allows the network to learn common base words as well as pre- and suffixes.
\shortcite{Sennrich:15} have shown, that this results in an overall improvement and allows the model to learn more complex grammar forms.

## Domain Control
In the neural machine translation multiple mechanism are known and used to translate across multiple domains.

### Prefix/Side Constraints
Prefix or Side Constraints describe a class of domain control mechanisms, where additional tokens are provided for the neural network.
This can be direct modifications in the text, like the decoration of certain important words or more general tags that are added in front of a sentence, word or even corpus.
The concept of side constraint was introduced by \ref{sennrich} and adapted for domain control by \ref{korbus}

