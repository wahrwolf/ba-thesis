# Results
## Dirty Training
\begin{figure}[h!]
    \includegraphics[scale=0.5]{img/train_bad.png}
    \caption{Example of a training curve of an unsuccsessful training}
    \label{fig:train_bad}
\end{figure}

## Successful Training
\begin{figure}[h!]
    \includegraphics[scale=0.5]{img/train_good.png}
    \caption{Example of a training curve of a succsessful training}
    \label{fig:train_good}
\end{figure}

## Trainings Overview
\begin{figure}[h!]
    \includegraphics[scale=0.5]{img/optim_top_5.png}
    \caption{BLEU score and the validation accuracy for the best five models}
    \label{fig:optim_top_5}
\end{figure}

## Translation Precision
\begin{figure}
    \includegraphics[scale=0.5]{img/comparison_bleu.png}
    \caption{Comparison of BLEU score for each domain for with and without prefix constraints}
    \label{fig:comparison_bleu}
\end{figure}

## Translation Precision
- Very different performance on the domains
- Only slight differences with "Prefix Constraints"
- Multi domain set improved

## Translation Comprehensibility
\begin{figure}
    \includegraphics[scale=0.5]{img/comparison_meteor.png}
    \caption{Comparison of METEOR score for each domain with and without prefix constraints}
    \label{fig:comparison_meteor}
\end{figure}

## Translation Comprehensibility
- All domains performed similar
- Some improvements even in the domain only set
- Multi domain set improved

## Domain Specialization
\begin{figure}
    \includegraphics[scale=0.5]{img/comparison_rouge.png}
    \caption{Comparison of ROUGE-L score for each domain for with and without prefix constraints}
    \label{fig:comparison_rouge}
\end{figure}

## Domain Specialization
- "Prefix Constraints" decreased score on all sets
- Mixed data set without much improvement
- Big loose in EMEA

## Cross Language Pair Comparison
\begin{figure}
    \includegraphics[scale=0.5]{img/language-comparison.png}
    \caption{Score changes between language pairs for each domain}
    \label{fig:language-comparison}
\end{figure}

## Cross Language Pair Comparison
- Translation quality on "Europarl" improved in only one pair
- Higher impact on related language pair
- Negative impact on the domain only, but positive impact on the mixed set
