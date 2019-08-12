# Discussion
In the following section, I review my results and compare them to the current state of the art, as well as my prediction and research question.

## Data Selection
The distribution in the number of words and the words length, show that the domains had some structural differences.
The EMEA corpus in general shorter sentences with longer words.
However while the median word and sentence length differs a little, the ECB and Europarl corpus seem to be similar structured, especially compared to the EMEA corpus.
Since both ECB and Europarl consists of transcripts of sittings while EMEA consists mostly of patience information, the similarities seem reasonable.

## Data Preparation
During the data preparation step, I reduced the data sets by a large amount.
I sliced the corpus into smaller logical units, by analyzing the text manually, since the no index was available on my data.
I choose the number of words and word length as two simple metrics to evaluate the new distribution.
As seen in \figure{corpus_stats}, the characteristics are not perfectly aligned with the source corpora but are unique enough, so that no reduced sets are too alike.
In the EMEA corpus, the word length distribution differs visibly.
Since this corpus contains many brand names, I assumed that the variation in splits is always quite high.

## Training and Optimzation
### Training
The overall performance of the best models calcualted with BLEU indicates a succesful training.
According to \ref{google bleu} the archived score of 20% points in BLEU can be interpreted roughly as a understandable but bad translation.
The top 5 models from each corpus reached that mark after 10,000 trainings steps, which translates to 5 epochs.

The plots \ref{train-bad_tran} and \ref{train-good_train} show typically trainigs curves as described by \ref{https://arxiv.org/pdf/1511.03677.pdf}.

The model plotted in \ref{train-good_train} achieved reasonable results. The validation accuracy indicates no overfitting, but the difference to the training accuracy shows additional potential with a larger data set.

## Evaluation
### metrics interpreation
I used three different metrics to measure the translations quality of the trained neural networks calculated against a human translation.

#### BLEU
The BLEU score is computed by measuring the difference between word groups and is calculated over the whole text.
The metric was developed to measure translation quality.
In this thesis the BLEU score is used to measure the overall translation precision.

#### METEOR
The METEOR metric was developed to improve the correlation of human judgment with the translation score.
It is calculated on sentence levels.
I used this score to represent the comprehensibility of the translation.

#### ROUGE-L
The ROGUE-L score is calculated by measuring the similarity of longer subsequences.
This score was developed to compare summaries.
Since the score benefits from structural and long word matches I used this score to measure the domain specialization.

#### Overall
The overall score consists of the addition of the ranks minus the total number of models times the number of metrics for the model compared to all other models trained in the same hyper optimization round.

### Model Selection
During the model selection, the ranking using the overall score was similar to the individual ranking by the scores directly.
This tendency is already known and described by other.

### Prefix constraints
In the \reference{result section} I described how the models performed absolute according to METEOR in the different domains and how the performance changed in relation to the absolute score.
All selected models performed best on the ECB and benefits most from prefix constraints in the Europarl corpus.
The performance impact in the mixed test set is similar to the described impact by \ref{kobus}

The overall performance showed a slight improvement when prefix constraints were provided, but decreased on most of the domain only data.

BLEU and METEOR both show the general translation precision and comprehensibility of the mixed data set increased.
The prefix constraint aim to improve mixed data sets, by highlighting one key meta information.
Therefore, if prefix constraints are available, the network can focus more on the similarities between domains instead of learning specific features from it.

The difference between improvement in the BLEU(indicating precision) and METEOR score, indicates that the prefix constraints helped more with the structural features than the content features.

The ROUGE-L indicates that the addition of prefix constraints decrease the domain specialization in all domains, but its affects on the mixed dataset are rather small.
Since the ECB and Europarl corpus are similar, the generalization does not impact the performance as much as on the EMEA test set. 

Overall, the generalizability seems to improve at the expense of specialised knowledge.
The translation precision improves more than the comprehensibility.

### language comaparison
The comparison of the score change between the language pairs in figure \ref{} show two major differences.
In the German-English pair, the performance of in the Europarl test set improved, while the performance in Czech-English decreased.
This indicates that addition of prefix constraints actually helped the model in German-English to differentiate one more domain and build up special knowledge.

The performance loss in the precision and comprehensibility on the domain sets in the Czech-English pair are higher and the improvement in the mixed data set smaller.

\ref{} used multiple input languages to translate mixed domain content
They showed that domain boundaries are differently strict in different language.

The results in figure \ref{} indicate that the domain differences in the selected data are more obvious in Czech-English than in German-English.

Overall the comparison shows that prefix constraints improve the translation comprehensibility and precision whenever the domain membership is not expressed clearly through structural differences.
Since the structural key features can differ distinctly in languages the prefix constraint impact is not always predictable.
My results indicate that those domain feature appear more distinct in Czech-English and therefore in distant pairs than in English-German or related pairs.
However, additional research is needed to prove this for the pairs and in general.

## Limitations
During my training I ran into a few issues, that might have an impact of my interpretation and the gathered results.

### The relatedness of English-Czech and English-German and the generalization for the distance between languages
In my testing I used Czech and German as languages that origin from different language families.
However they are still related and closer to English as Japanese or Chinese.
My thesis is claim


### bad domain selection
### bad parameter selection
### de-en worse than cs-en?

## Followup
### more domains and langauges
### the whole data set
### better model

## Future work
### test everything on different language pairs
### evaluate fsi score
### extend opus with preparation steps for certain tasks

# Conclusion
- domain control is tricky
- dont just copy and paste
- gather metrics and pick the right domain control mechanism
