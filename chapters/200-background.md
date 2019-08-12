In times of progressing globalization the need of fast and relieabe translation increases. Since human translations require skill and time to learn as well as to make, they are often time consuming and expensive. Thus lately machine translations are on the rise.
The most used technique in machine translations are Neural Machine Translation (NMT) with Recurrent Neural Networks (RNN), since they produce the most promising results once they have been trained accordingly __Refence__. __prüf mal ob der Satz sinn macht__

## Neural Machine Translation
Neural machine translation (NMT) describes a branch of machine translations where NN is used to translate text.
These are trained on input texts and their corresponding translations and allows the network to translate similar texts.
NMTs are commonly used; for example, in Google Translate \cite{} and can produce excellent results on short passages.
With enough training data, they can even translate articles or more elaborate texts \cite{Wu:Schuster:16}.

In NMT text collections from the same source are referred to as one corpus.
A corpus may share the same context (domain) or is related to a particular event.
Especially useful for NMT are corpora, which are available in multiple languages (aligned corpora), because they can be used to evaluate the performance of a model __Reference__,  by translating the corpus from one language into another language and then comparing the generated translation with the available reference translation, to check the translation quality.

### Neural Networks (NN) and Recurrent Neural Networks (RNN)
The term "Neural Networks" describes a class of machine learning algorithms, that are general function approximations.
These algorithms (or networks) will learn a specific mapping between an input and an output by calculating the prediction error and apply a corresponding change to the matrix (knwon as backpropagation) \cite{}. 
The algorithm that is used to apply a change to reduce the error is called the optimizer.
The prevalent algorithms are stochastic gradient descent \cite{}, adam\cite{}, and adadelta \cite{}. __evlt noch ein paar Worte dau was das beides ist, bzw kann__
The amount of reduction that is applied to reduce the error is called the learning rate, which is set between 0 and 1 and describes how much the network should be changed in each step.
A learning rate of 1 means, to take in the full error, whereas a rate of 0 means no fix the error at all __Reference__.

So-called Recurrent Neural Networks (RNN) are a subclass of NN, which use an internal state to allow them to access their previous output in the next iteration. Thus RNNs are able to parse a sequence of inputs and produce output sequences, e.g., text.

### Attention
Plain RNNs have only limited memory to store their past output. This makes it hard to work with large or complex texts \cite{bahdanau:14}.
In comparison to "simple" NN, the attention-based networks address this issue by providing the NN with access to the input on top of the last output and implement a filter matrix to "blend in" certain features __Reference__. 


### Byte-Pair-Encoding (BPE)
One of the main challenges in current NMTs is the choice of the available vocabulary.
If too many words are included, the networks tend to forget rarely used words or become too general.
On the other hand, if the vocabulary is too small, the networks cannot learn complex grammar forms.
An approach to solve this is to split up long words into multiple symbols (Byte Pair Encoding) __Reference__.
Instead of using a list of actual words, the dictionary consists of numerous used character pairs or subwords.
This allows the network to learn common base words as well as pre- and suffixes.
\shortcite{Sennrich:15} have shown that this results in an overall improvement and allows the model to learn more complex grammar forms.


### Content Domains
Another challenge in translations is context, because each industry has its own lingo.
Contexts might be specialized through vocabularies like technical terms and standard shared definitions or even textual structures and tone.
This often disting set of rules, such as tone, vocabulary, or any other substantial similarity are define as a domain __Reference__.

### Domain Control
In Neural Machine Translation, multiple mechanisms are known and used to translate across multiple domains.

### Prefix/Side Constraints
Prefix or Side Constraints describe a class of domain control mechanisms, where additional tokens are provided for the neural network.
This can be direct modifications in the text, like the decoration of certain essential words or more general tags that are added in front of a sentence, word, or even corpus.
The concept of side constraint was introduced by \cite{Sennrich:16} and adapted for domain control by \cite{kobus:16}.

