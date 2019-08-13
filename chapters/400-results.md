\chapter{Results}
In the following section, I present the results of the previously described procedures.
First, I will show some statistics of my generated corpus and compare its characteristics to the source material.
The next part comprises exemplary visualizations of the model training and detailed metrics of these examples.
I will then rank the models and compare the impact of prefix constraints between the two language pairs, German-English and Czech-English.

# Data Selection and Preparation
To ensure that the reduction of the data set did not change the defining characteristics of the respective corpora, I compared the number of words and sentence length on the reduced and original data set.
The distributions are shown in figure \ref{fig:corpus_stats-sentence} and \ref{fig:corpus_stats-word}.

The figures \ref{fig:corpus_stats-sentence} and \ref{fig:corpus_stats-word} both show a 3x4 matrix with three boxplots each.
The first two plots per row show the distribution over the language pair DE-EN, and the 3rd and 4th over CS-EN.
Each row shows the distribution of one domain.

All plots labeled with Q show the distribution of the original corpus.
Plots labeled with T show the distribution of the training data, and V marks the validation data.
Outliers are not shown in the plots. Instead, the whiskers are extended.

None of the plots show major differences between the reduces corpus to the original corpus. Therefore, the reduced corpora were accepted for further steps. 

## Number of words per Sentence
\begin{figure}
    \includegraphics[scale=1]{img/corpus_stats-sentence.png}
    \caption{Distribution of number of words per sentence}
    \label{fig:corpus_stats-sentence}
\end{figure}
In most domains, sentences have between 0 and 50 words(interquartile range). In EMEA the sentence length was mostly between 0 and 25 words, and the median between 5 and 10 words. In all other domains the median was between 20 and 25 words per sentence. 

In ECB, the maximum number of words was 70 for German and English. EMEA was found to contain sentences up to 40 words and Europal up to 60, but the Czech sentences tend to be about 10 words shorter than English and German. 
Only in the English ECB data set, the interquartile range was slightly higher in the training set than in the original data.
All other data sets showed no distinct differences.

## Word Length
\begin{figure}
    \includegraphics[scale=1]{img/corpus_stats-word.png}
    \caption{Distribuion of word lengths}
    \label{fig:corpus_stats-word}
\end{figure}
Words mostly had a length between 0 and 10 characters. The median ranges from 4 to 6 in all domains. 
\TODO{Das hier morgen nochmal angucken!}

Median word lengths in all domains were between __X and X__ characters in English, but __X to X__ characters in Czech in all domains. 
The maximum word length in the german text was 20. The maximum word length for Englisch words was found to be 15, Czech lies in between.
\TODO{Das hier morgen nochmal angucken!}

However, no distinct difference between the original and reduced data sets was found.

# Training and Optimization
During the training of the models, the training accuracy and the validation accuracy were recorded.
For a selection of models, the BLEU score was calculated to visualize the learning process.
All models were used to translate the validation data sets after 6, 12, and 18 epochs.

## Hyper Parameter
Table \ref{tab:ranking_example} shows the ranking of all training configurations for the corpus without prefix constraints in the DE-EN language pair.
Models are characterized by the optimization method, learning rate, start of the decay, and METEOR score.
Tables \ref{tab:optim_clean-de-en} \ref{tab:optim_tagged-de-en} \ref{tab:optim_clean-cs-en} \ref{tab:optim_tagged-cs-en} show the best 3 models per corpus ranked by BLEU, METEOR, and ROUGE-L.

### Tables with Scores and rankings
\input{"tables/optim_ranking-clean-de-en.tex"}
\input{"tables/optim_ranking-tagged-de-en.tex"}
\input{"tables/optim_ranking-clean-cs-en.tex"}
\input{"tables/optim_ranking-tagged-cs-en.tex"}

\input{"tables/optim_table-clean-de-en.meteor.tex"}


## Training
Figures \ref{fig:train_bad} and \ref{fig:train_good} shows the validation accuracy and the training accuracy for each training step.
Both metrics increase in a logarithmic manner. The training accuracy meets the 20 % mark after 10,000 training steps and growth to 30% in the next 25,000 training steps.
The validation accuracy hits the 15% mark after 5,000 training steps and growths over the next 30,000 training steps to a value of 20 %.
\begin{figure}[h!]
    \includegraphics[scale=1]{img/train_bad.png}
    \caption{Example of a training curve of an unsuccsessfull training}
    \label{fig:train_bad}
\end{figure}

The graph in \ref{fig:train_good} shows the same two metrics, which increase again ina logarithmic manner.
The training accuracy reaches the 60 % mark after 10,000 training steps and gains another 20 % points over the remaining 25,000 training steps.
After 15,000 steps, the curve begins to scatter in a sinus shape.

The validation accuracy reaches the 30 % mark after 5,000 training steps and gains another 10 % points over the next 10,000 training steps.
Between step 15,000 and 35,000 the graph is constant around the 40 % mark. 
\begin{figure}[h!]
    \includegraphics[scale=1]{img/train_good.png}
    \caption{Example of a training curve of a succsessfull training}
    \label{fig:train_good}
\end{figure}

The figure \ref{fig:optim_top_5} shows the BLEU score and the validation accuracy in two graphs.
For each metric, 5 different models are plotted, and the highest score is highlighted.
In the first part of the graph, the plot scatters up to 10% points but stabilizes after  10,000 steps.
The validation accuracy curve is logarithmic shaped and reaches the 30% mark after 5,000 training steps.
It continues to grow until it reaches a plateau at the 40% mark after 10,000 steps.

The second graph shows the BLEU score for the same training.
The first non-zero point is found after ca 3,000 training steps. The plots scatter for another 7,000 steps between the 10 % and 20 % mark with a linear growing tendency.
Between the 10,000th and the 20,000th training step, the points fluctuate between the 15 % and 20 % mark.
During the last 15,000 steps curve reaches a plateau at the 20 % mark.
\TODO{caption fehlt}

\begin{figure}[h!]
    \includegraphics[scale=1]{img/optim_top_5.png}
    \caption{}
    \label{fig:optim_top_5}
\end{figure}

# Comparison and Evaluation

## Candidate Selection
For the evaluation I picked the following four combinations, which are highlighted in the tables \ref{tab:optim_clean-de-en} \ref{tab:optim_tagged-de-en} \ref{tab:optim_clean-cs-en} \ref{tab:optim_tagged-cs-en}.

The configurations were as follows:

## Prefix Constraints
\TODO{caption fehlt}
\begin{figure}
    \includegraphics[scale=1]{img/language-comparison.png}
    \caption{}
    \label{fig:language-comparison}
\end{figure}
The figures \ref{fig:comparison_bleu} \ref{fig:comparison_rouge} \ref{fig:comparison_meteor} show the absolute performance per domain for the three scores BLEU, ROUGE-L and METEOR.
All figures show two graphs with four groups of two bar diagrams each.
The top graph shows the absolute score for the language pair German-English and the bottom graph for Czech-English.
The first bar in each group represents the performance without prefix constraints, and the second bar with prefix constraints.

### BLEU 
\TODO{caption fehlt}
\begin{figure}
    \includegraphics[scale=1]{img/comparison_bleu.png}
    \caption{}
    \label{fig:comparison_bleu}
\end{figure}
In both diagrams (Fig \ref{fig:comparison_bleu}) the domain data sets show similar performance scores within the groups, but the performance per domain varied between 8% and 31% points for then German-English pair and between 15% and 41% for the Czech-English pair.
The median scores for the German-English pair were 31% for ECB, 20% for EMEA, 8% for Europarl, and 18.5% for the mixed data set.
In the Czech-English pair, the model scored a median 40% over ECB, 20.5% for EMEA, 15% for 23.5% the mixed set.

### Rouge 
\TODO{caption fehlt}
\begin{figure}
    \includegraphics[scale=1]{img/comparison_rouge.png}
    \caption{}
    \label{fig:comparison_rouge}
\end{figure}
The scores (Fig \ref{fig:comparison_rouge}) are similar for all domains except EMEA. They rank for German-English between 25% and 54%, and between 34% and 65% in Czech-English.
The median score for ECB in German-English is 53%, for Czech-English 63.5%, and Europarl 25% for German-English and 33.5% for Czech-English.
In the EMEA domain, the German-English with prefix constrains scored 42.62% and without 45.25%.
In Czech-English the model with prefix-constraints scored 41.07% and the model without 43.69%.
The mixed data set had a score of 38% in German-English and 45% in Czech-English.

### METEOR
\begin{figure}
    \includegraphics[scale=1]{img/comparison_meteor.png}
    \caption{}
    \label{fig:comparison_meteor}
\end{figure}
The scores (Fig \ref{fig:comparison_meteor}) are similar across all domains and language pairs, except ECB.
In Czech-English the scores ranged between 18.5% (EMEA), 17% (Europarl), 20% (mixed) and 30% in ECB
The ECB in German-English achieved 25%, where both EMEA and the mixed corpus scored 18%. The Europarl corpus reached 14.5%

## Language Pairs
\begin{figure}[h!]
    \includegraphics[scale=1]{img/language-comparison.png}
    \caption{}
    \label{fig:language-comparison}
\end{figure}
The figure \ref{fig:language-comparison} shows three graphs with four groups of two bars.
Each graph represents the relative improvement of one metric measured over a model trained without prefix constraints to the model trained with prefix constraints.
The grouped bars represent the language pairs, where the first bar is German-English and the second pair represents Czech-English.

In the first row, the score change for BLEU is displayed.
The score decreased for the domains ECB and EMEA and increased in the mixed data set.
For the German-English pair, the score improved by 3.81% and decreased by 2.81% for the Czech-English pair.

The ROUGE-L metric shown in the second row decreased in all language pairs and domains: In the mixed data set by less than 1%, in ECB and Europarl between 1.6% and 2.8% and in EMEA by nearly 6%.

The last row shows the performance change for the METEOR score. It looks similar to the BLEU score change.
For ECB and EMEA the performance decreased, and on the mixed data set the score improved over both language pairs.
However, the improvement was smaller and in the Czech-English pair only at 0.19%.
In the Europarl test set the METEOR score improved by only 1.31% in German-English where the Czech-English pair's score decreased by 1.85%

All scores are relative differences and not actual score points.
