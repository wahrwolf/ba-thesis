# related work
Domain adaption and control is one of main challenges in the current research on neural machine translation.
The underlying issue is complex and a variety of approaches address different aspects.

## Corpus and Language Selection
The domain control research focusses partly on the ranking of common corpora, like the collection of Wikipedia articles.

### Languages
Another related research field is language adaption and control.
\cite{} has shown that certain languages can be translated without training on the actual trainigs data.
The latest research includes even a showcase where neural machine translation was able to translate an extinct language \cite{luo:19}.
However multi language models try to understand and produce the same content in different notations.
while prefix constrained have been shown to help on that topic too, I evaluated them only on domain control.

## Data Preparation
The data can be prepared in several ways to aid the neural network during the training
\cite{} suggests to reverse the sequence or put important information at the end of the input.
This adresses an issues with plain recurrent networks, which have to manage and remember certain features before they start producing any output.
I use an attention layer, that allows the network to choose which input to view at any step.
Reversing also modifies the structure of the text, and may hide implicit features that are encoded in the structure.

Othter \cite{} uses specialised vocabulary additions to remember more words.
In my thesis I will use BPE because the grouping of common sequences allow the network to create complex and even new words

\cite{} suggests to use multiple languages instead of only one input language.

## Model Changes
Some other resarch focusses on the neural network to implement domain control mechanism.
Current research includes different attention models as well as different encoder-decoder types.
