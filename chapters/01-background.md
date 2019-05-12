# Background
## Neural Networks (NN) and Recurrent Neural Networks (RNN)
The term "Neural Networks" describes a class of machine learning algorithm, that are general function approximations.
These algorithms (or networks) will learn a specific mapping between an input and an output.
So called Recurrent Neural Networks are a subclass of NN that use an internal state which allows them to access their previous output in the next iteration.
This allows RNNs to parse a sequence of inputs and produce output sequences, e.g. text.

## Attention
Plain RNNs have only limited memory to store their past output. This make it hard to work with large or complex text \cite{bahdanau:14}.
In comparison to "simple" NN, the attention based networks address this issue by providing the NN with access to the input on top of the last output and implement a filter matrix to "blend in" certain features. 


## Transformer Networks (TN)
Transformer Networks are NN that generate a sequence while reading another sequence.
Compared to RNN that generate the sequence after they read their input.
The network get the full input and the full output and can select different features using attention mechanism.
These transformers do not need an internal state and can therefore handle larger and more complex input \cite{vaswani:17}.


## Neural Machine Translation (NMT)
Neural machine translation describes a branch of machine translations where NN are used to translate text.
These are trained on an input texts and its corresponding translations and allow the network to translate similar texts.
NMTs are commonly used for example in Google Translate and can produce good results on short passages.
With enough training data they can even translate articles or larger texts \cite{Wu:Schuster:16}.

## Domain Control Mechanism (DCM)
A given text always represents a certain perspective to a specific audience.
This means that the used language differs and words may have a different meaning depending on the context and the audience.
Since different jargon or terminology can actually be conflicting, all translation processes need to address the target domain \cite{Bertoldi:09}.
A domain control mechanism is a specification that provides these informations.
This can be addressed in several ways, e.g. by using domain-specific dictionaries or language models.
For human translators, this is often a simple document called style sheet or style guide that lists this information as shown in figure \ref{fig:styleguide} on page \pageref{fig:styleguide}.

### Side Constraints
A similar approach is used in NMT under the term side constraints.
This refers to a method where the known words are extended by a set of tags.
Each of those tags stand for a special trait. In case of translations systems this may refer to a domain or a feature of the text.
The underlying NN will learn to accept the token as part of the input and can be trained to express a certain behavior depending on the token.

For example politeness control uses the tokens `<V>` for formal and `<T>` for informal.
The naming is taken over from \cite{Brown:60} and refers to the Latin pronouns "Tu" for informal and "Vos" for formal address.

## Byte-Pair-Encoding (BPE)
One of the main challenges in current NMTs is the choice on the available vocabulary.
If too many words are included, the networks tend to forget rarely used words or become to general.
On the other hand if the vocabulary is too small, the networks cannot learn complex grammar forms.
An approach to solve this by splitting up long words into multiple symbols is Byte Pair Encoding.
Instead of using a list of actual words, the dictionary consist of frequent used character pairs or subwords.
This allows the network to learn common base words as well as pre- and suffixes.
\shortcite{Sennrich:15} have shown, that this results in an overall improvement and allows the model to learn more complex grammar forms.



