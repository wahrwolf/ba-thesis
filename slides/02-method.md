# Method
## Corpus Data
- distinct domains as used by \cite{kobus:16}
  - Medical
  - Law
  - Finance
- language pairs with different relatedness
  - English-German
  - English-Czech
- 2 batches:
  - without modifications
  - with prefix constraints

## Corpus Data (Sentence Length)
\begin{figure}
    \includegraphics[scale=0.5]{img/corpus_stats-sentence.png}
    \caption{Distribution of number of words per sentence}
    \label{fig:corpus_stats-sentence}
\end{figure}

## Corpus Data (Word Length)
\begin{figure}
    \includegraphics[scale=0.5]{img/corpus_stats-word.png}
    \caption{Distribuion of word lengths}
    \label{fig:corpus_stats-word}
\end{figure}

## Model
- LSTM with general Attention
- trained for 18 epochs
- scored with 3 different metrics
  - BLEU (precision)
  - METEOR (comprehensibility)
  - ROUGE-L (domain specialization)

