# Results
In the following section I present the results of the previous described procedures.
First I will show some statistic on my generated corpus and compare its characteristics to the source material.
The next part contains some visualizations of the model training and some detailed metrics on examples..
I will then rank the models and compare the performance change for
Lastly I will compare the impact of side constraint between two German-English and Czech-English.

## Data Selection and Preparation
To ensure, that the reduction of the data set did not change the defining characteristics I compared the number of words and sentence length on the reduced and original data set.
The distributions are shown in \ref{fig:corpus_stats-sentence} and \ref{fig:corpus_stats-word}.

The figures \ref{fig:corpus_stats-sentence} and \ref{fig:corpus_stats-word} both show a 3x4 matrix with 3 boxplots each.
The first two plots per row show the distribution over the language pair DE-EN, and the 3th and 4th over CS-EN.
Each row shows the distribution over one domain.

All plots labeled with Q show the distribution over the original corpus.
Plots labeled with T show the distribution over the trainings data and V marks the validation data.

Outlier are not shown in the plots, instead the whiskers are extended.

### Number of words
The interquartile range box for all corpora lies within 0 and 50 words.
For the EMEA corpus row the range box lies withing 0 and 25
The median in this domain is between 5 and 10 words.
For all other domains it stays between 20 and 25.

In the ECB row, the whiskers extend up to 70 words in DE and EN columns.
The EMEA row had the whiskers around 40 and Europarl around 60.
For all three rows, the CS column showed whiskers 10 points below.

### Word Length
The interquartile range box for all corpora lies within 0 and 10.
The median in this domain is around is between 5 and 10 characters.
For all other domains it stays between 20 and 25.

The median for all plots stays within 5 and 7 characters per word, but are higher in the CS column.

The whiskers for the DE column reach up to 20.
The EN column has the lowest whiskers around 15 characters per word.
The CS columns ranks between those two.

## Training and Optimization
During the Training of the models the trainings accuracy and the validation accuracy was recorded.
For a selection of models the BLEU score was calculated afterwards to visualize the learning process.
All models were used to translate the validation data sets after 6, 12, and 18 epochs.

### Hyper Parameter
The table in \ref{hyperparam-ranking-table} shows the ranking for all trainings configurations for the corpus without prefix constraints in the DE-EN language pair.
It shows the optimizing method, the learning rate, the start of the decay and the meteor score.

(https://tex.stackexchange.com/questions/214461/highlight-row-in-latex on how to highlith a row)
The figures \ref{optim_clean-de-en} \ref{optim_tagged-de-en} \ref{optim_clean-cs-en} \ref{optim_tagged-cs-en} show the top 3 models per corpus ranked by BLEU, METEOR, and ROUGE-L.

#### Table with Validation Accuracy
### Training
The figures \ref{train-bad_train} and \ref{train-good_train} show to plots from the validation accuracy and the trainings accuracy over the trainings steps.
In the \ref{train-bad_train} two curves with a logaritmic shape are shown. The trainings accuracy meets the 20 % mark after 10,000 trainings steps and growth to 30% in the next 25,000 training steps.
The validation accuracy hits the 15% mark after 5,000 training steps and growth over the next 30,000 trainings steps to a value of 20 %.

The graph in \ref{train-good_train} shows the same two metrics. The curves are logarithmic shaped.
The trainings accuracy reads around 60 % mark after 10,000 trainings steps and gain another 20% mark over the remaining 25,000 training steps.
After 15,000 steps, the curve begins to scatter in a growing sinus shape.

The validation accuracy reaches the 30 % mark after 5,000 trainings steps and gains another 10% points over the next 10,000 training steps.
Between step 15,000 and 35,000 the graph is constant around the 40 % mark. 

The figure \ref{optim-top_comparison} shows the BLEU score and the validation accurccay in two graphs.
For each metric 5 different models are plotted and the highest score is highlighted.
In the first part of the graph, the plot scatters up to 10% points, but stabilizes after  10,000 steps.
The validation accuracy curve is logarithmic shaped and reaches the 30% mark after 5,000 trainings steps.
It continues to growth, until it reaches the 40% mark after 10,000 steps.

The second graph shows the BLEU score over the same training.
The first non zero point appears after ca 3,000 trainings steps. The plots scatter until for another 7,000 steps between the 10% and 20% mark with a linear growing tendency.
Between the 10,000th and the 20,000th trainings step the points fluctuate between the 15% and 20% mark.
During the last 15,000 steps the points are stable at the 20% mark.

!["Training with Overfitting"\label{train-bad_train}]: https://wolfpit.net/share/archive/images/trainings_curve-bad.png
!["Training without Overfitting"\label{train-good_train}]: https://wolfpit.net/share/archive/images/trainings_curve-bad.png
!["Performance of Top 5 models"\label{optim-top_comparison}]: https://wolfpit.net/share/archive/images/optim_comparison-Top_10-fancy.png

## Comparison and Evaluation

### Candidate Selection
For the evaluation I picked the following four combinations, which are highlighted in \ref{}
The configurations were:

### Prefix Constraints
The figures \cite{1..4] show the absolute performance per domain for the three scores BLEU, ROUGE-L and METEOR.
All figures show two graphs with four groups of two bar diagrams each.
The top graph shows the absolute score for the language pair German-English and the bottom graph for Czech-English.
The first bar in each group represents the performance without prefix constraints and the second bar with prefix constraints.

#### BLEU 
(Fig \cite{})
In both diagrams the domain data sets show similar performance scores within the groups, but the performance per domain varied between 8% and 31% points for then German-English pair and between 15% and 41% for the Czech-English pair.
The median scores for the German-English pair were 31% for ECB, 20% for EMEA, 8% for Europarl and 18.5% for the mixed data set.
In the Czech-English pair the model scored a median 40% over ECB, 20.5% for EMEA, 15% for 23.5% the mixed set.

#### Rouge 
(Fig \cite{})
The scores are similar for all domains except EMEA. They rank for German-English between 25% and 54%, and between 34% and 65% in Czech-English.
The median score for ECB in German-English is 53%, for Czech-English 63.5%, and Europarl 25% for German-English and 33.5% for Czech-English.
In the EMEA domain the German-English with prefix constrains scored 42.62% and without 45.25%.
In Czech-English the model with prefix-constraints scored 41.07% and the model without 43.69%.
The mixed data set  had a score of 38% in German-English and 45% in Czech-English

#### METEOR 
(Fig \cite{})
The scores are similar across all domains and language pairs, except ECB.
In Czech-English the scores range between 18.5% (EMEA) , 17% (Europarl), 20% (mixed) and 30% in ECB
The ECB in German-English achieved 25% where both EMEA and mixed scored 18%. The Europarl reached 14.5%

### Language Pairs
The figure \cite{} shows three graphs with each four groups of two bars.
Each graph represents the relative improvement of one metric measured over a model trained without prefix constraints to the model trained with prefix constraints.
The grouped bars represent the language pairs, where the first bar is German-English and the second pair represents Czech-English.

In the first row the score change for BLEU is displayed.
The score decreased for the domains ECB and EMEA and increased in the mixed data set.
For the German-Enlgish pair the score improved by 3.81% and decreased by 2.81% for the Czech-English pair.

The ROUGE-L metric shown in the second row decreased over all language pairs and domains. In the combined data set by less than 1%, in the ECB and Europarl between 1.6% and 2.8% and in the EMEA by nearly 6%.

The last row shows the performance change for the METEOR score. It looks similar to the BLEU score change.
For ECB and EMEA the performance decreased and on the mixed data set the score improved over both language pairs.
However, the improvement was smaller and in the Czech-English pair only at 0.19%.
In the Europarl test set the METEOR score improved by only 1.31% in German-English where the Czech-English pair's score decreased by 1.85%

All scores are relative differences and not actual score points.
