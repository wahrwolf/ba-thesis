# Discussion
In the following section, I review my results and compare them to the current state of the art, as well as my to prediction and research my question.

## Data Selection
The distributions of the number of words and the word's length, show that the domains had some structural differences.
The EMEA had corpus in general shorter sentences with longer words.
However, while the median word and sentence length differ a little, the ECB and Europarl corpus seemed to be similar structured, especially compared to the EMEA corpus.
Since both ECB and Europarl are transcripts of sittings while EMEA consists mostly of patience information, the similarities seem to be reasonable.

## Data Preparation
During the data preparation step, I reduced the data sets by a large amount.
I separated the corpus into smaller logical units by analyzing the text manually, since no index was available for my data.
I choose the number of words and word length as two simple metrics to evaluate the original and reduced corpora.
As seen in \ref{corpus_stats}, the characteristics of the source corpora seem to be preserved in the reduced data sets.
In the EMEA corpus, the word length distribution differs visibly from the original corpus.
Since this corpus contains many brand names, I assumed that the variation in the small logical units was rather high.

## Training and Optimization
### Training
The overall performance of the best models according to BLEU indicates a successful training.
According to \cite{google bleu} the achieved score of 20% points in BLEU can be interpreted roughly as an understandable but bad translation.
The top 5 models from each corpus reached that mark after 10,000 trainings steps, which translates to 5 epochs.

The plots \ref{train-bad_tran} and \ref{train-good_train} show typically trainigs curves as described by \cite{lipton:15}

The model plotted in \ref{train-good_train} achieved reasonable results. The validation accuracy indicates no overfitting, but the difference to the training accuracy shows additional potential with a larger data set.

## Evaluation
### Metrics Interpretation
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
In the \cite{result section} I described how the models performed absolute according to METEOR in the different domains and how the performance changed in relation to the absolute score.
All selected models performed best on the ECB and benefits most from prefix constraints in the Europarl corpus.
The performance impact in the mixed test set is similar to the described impact by \cite{kobus:16}

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
The results need to be verified with more data from the pairs.
The indication described in the \ref{langauge comparison} needs to be evaluated on more language pairs.

### The domain Selection and the Corpus Metrics
I used only three domains and compared very simple metrics on the corpora.
My indication \ref{langauge comparison} and observation in \ref{prefix constraint} based upon the differences between the domains.
To increase the confidence in my results I suggest evaluating the same metrics on more domains.
More complex metrics could be used to review my data and prove the described relationship.

### Hyper Parameter Selection and Optimization
I ran only one round of hyper parameter optimization and compared only a few parameters and values.
My trainings curves show typical aspects of a succesfull training, but better configuration may exists.
This can be examined by rerunning the optimization with more configurations.

### Better Performance of the distant Language Pair
In my results the absolute score in all metrics was higher for Czech-English.
This does not affect my comparison, since my discussion interpreted only the relative change on the scores.
On top of that, as \ref{} explained, the scores does not represent the overall translation capabilities and are only comparable between the same language and the same corpus.
In my training the Czech-English models ran for 10% more steps, since the corpora splits were slightly different than in the German-English corpora.
However, as discussed in \ref{} the overall key metrics were similar and the models were trained on the same number of epochs.
As mentioned in the limitations \ref{} the parameter selection may not included the best model.
I suggest to use an exact alignment for all three languages and the training with additional trainings configuration to prove this point beyond a doubt.

## Followup
Based on my results it would be interesting to evaluate the following aspects
### More Domain and Language Comparison
The indication should be evaluated with more data.
The evaluation with more and more diverse domains may reveal additional insights on the impact of prefix constraints.
Additional languages for the training with English sources text, as well as new and different language pairs should be tested.

### Evaluation with full Corpora
I ran my models on a reduced data set.
The training without the reduction can improve the generalizability of my findings.

### Training with additional Attention Types
In the thesis I used only a very simple attention type for the models.
However since the prefix constraints add additional meta information, a more complex attention type might benefit emensly from this mechanism.

## Future work
Based on my findings I suggests the following future projects:
### Reviewing of Domain Control Mechanism on different Language Pairs
Most domain control and adaption mechanism are only tested for one or two language pairs.
However my findings indicate that the language selection can have a huge impact of the performance of domain control mechanism.
Therefore, I suggest to reevaluate the findings for domain control mechanism over additional language pairs.
Especially \ref{japsen} rely on the work of \ref{kobus} but use largely unrelated languages.

### Creation of a relatedness Score
To measure the relatedness of language pairs and calculate a possible correlation with the performance on translation systems, I suggest the creation of a new and simple score.
The FSI uses the necessary study time to rank the training difficulty of language pairs.
I suggest the creation and evaluation of a score based on the median trainings time.
This information can be easily collected for humans and tested for neural machine translation.

### Extend the OPUS Project
The OPUS project host a variety of corpus data.
However the data is only available unstructured.
I invite all researchers to submit their trainings data and preparation scripts.
Projects like OpenNMT can benefit hugely from a shared collection of preparation scripts.

# Conclusion
In conclusion, the problem of domain control in neural machine translation is very challenging and not solved in any translation related area.
As my thesis and the current research shows, the impact of domain control mechanism can not always be predicted and depends on the a lot of different factors.
The domain and language selection should always be considered when choosing any domain adaption mechanism.
