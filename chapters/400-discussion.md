\chapter{Discussion}
In the following section, I review my results and compare them to the current state of the art and discuss a possible connection between the relatedness of language pairs and the performance impact of the addition of prefix constraints.

# Data Selection
The distributions of the number of words and the word length show that the domains had some structural differences.
The EMEA corpus consisted in general of shorter sentences with longer words.
However, while the median word and sentence length differed a little, the ECB and Europarl corpus seemed to be similarly structured, especially compared to the EMEA corpus.
Since both ECB and Europarl are transcripts of meetings while EMEA consists mostly of patients' information, the similarities seem to be reasonable.

# Data Preparation
During the data preparation step, I reduced the data sets by a large amount.
I separated the corpus into smaller logical units by analyzing the text manually, since no index was available for my data.
I choose the number of words and word length as two simple metrics to evaluate the original and reduced corpora.
As seen in \ref{data-selection-and-preparation}, the characteristics of the source corpora seem to be preserved in the reduced data sets.
In the EMEA corpus, the word length distribution differs obviously from the original corpus.
Since this corpus contains many brand names, I assumed that the variation in the small logical units was rather high.

# Training and Optimization
## Training
The overall performance of the best models, according to BLEU, indicates successful training.
According to LAvie \citeyear{lavie:10} the achieved score of 20 % points in BLEU can be interpreted roughly as an understandable but bad translation as seen in table \ref{tab:help_bleu}
The top 5 models from each corpus reached that mark after 10,000 training steps, which is equivalent to 5 epochs.

The plots \ref{fig:train_bad} and \ref{fig:train_good} show typical training curves as described by Lipton et al.\citeyear{lipton:15}

The validation accuracy in figure \ref{fig:train_good} indicates no overfitting, but the difference to the training accuracy shows additional potential with a larger data set.

\input{"tables/bleu_interpretation.tex"}

# Evaluation
## Metric Interpretation
I used three different metrics to measure the quality of the translations of the trained neural networks in comparison to a conventional translation.

### BLEU
The BLEU score is computed by measuring the difference between word groups and is calculated over the whole text.
The metric was developed by Papineni et al. \citeyear{Papineni:02} to measure translation quality.
In this thesis, the BLEU score is used to measure the overall translation precision.
The score can be interpreted according to Lavie \citeyear{lavie:10}.
As shown in figure \ref{fig:comparison_bleu}, the best model achieved a score of 24 %, which indicates an understandable translation.

### METEOR
The METEOR metric was developed to improve the correlation of human judgment with the translation score.
It is calculated on sentence levels \cite{banerjee:05}.
I used this score to represent the comprehensibility of the translation.
The best model scored 20 % in the mixed data set.
However, the METEOR score can only be used for comparisons and not as scale.

### ROUGE-L
The ROGUE-L score is calculated by measuring the similarity of longer subsequences.
This score was developed to compare summaries \shortcite{lin:04}.
Since the score benefits from structural and long word matches, I used this score to measure the domain specialization.
The interpretation of the ROUGE score is only evaluated on summaries, so the absolute score can not be interpreted here.
However, its change is often used in model comparison \shortcite{sharma:17}


### Overall
The overall score summarizes all three scores and is calculated through the addition of the ranks minus the total number of models times the number of metrics for the models.
It represents the fit of the model in comparison to all models, that were trained on the same data.

## Model Selection
During the model selection, the ranking using the overall score was similar to the ranking by individual scores.
Since all scores rate the similarities to a reference text, an overall correlation is expected.
This tendency is already known and described by other authors, for example Pryzbocki et al. \citeyear{przybocki:09}.

## Prefix constraints
In \ref{training-1} I described how the models performed according to METEOR in the different domains and how the performance changed in relation to the absolute score.
All selected models performed best on the ECB and benefits most from prefix constraints in the Europarl corpus.
The performance impact in the mixed test set was similar to the described impact by Kobus et al.\citeyear{kobus:16}

The overall performance showed a slight improvement when prefix constraints were provided but decreased in most corpora containing only one domain.

BLEU and METEOR both show that the general translation precision and comprehensibility of the mixed data set increased.
The prefix constraint aimed to improve translations of mixed data sets by highlighting one essential meta information.
Therefore, if prefix constraints are available, the network can focus more on the similarities between domains instead of learning specific features from it.

The difference between improvement in the BLEU (indicating precision) and METEOR (indicating comprehensibility) score, indicates that the prefix constraints helped more with the structural features than the content features of the corpora.

The ROUGE-L indicates that the addition of prefix constraints decrease the domain specialization in all domains, but its effects on the mixed dataset are rather small.
Since the ECB and Europarl corpus are similar, the generalization does not impact the performance as much as on the EMEA test set. 

Overall, generalizability seems to improve at the expense of specialized knowledge.
The translation precision improves more than the comprehensibility.

## Language Comparison
The comparison of the score change between the language pairs in figure \ref{fig:language-comparison} shows two major differences.  

The first difference is the change in translation quality (measured by BLEU and METEOR) in the Europarl test set.
In the English-German pair, the translation quality improved with the addition of prefix constraints.
In contrast, in English-Czech, translation quality decreased.
This indicates that the addition of prefix constraints improved the domain-specific translation in German-English.  

The second difference is the quantity of the performance change
The performance loss in the precision (BLEU score) and comprehensibility (METEOR score) on the domain sets in the Czech-English pair are higher, and the improvement in the mixed data set smaller.  

Zoph & Knight \citeyear{Zoph:16} used multiple input languages for a neural machine translation and showed that combining languages can improve translation quality.
They found that the improvement is greater when distant languages are used.
This indicates that domains or at least ambiguities are encoded differently in languages.
While the classification of domain membership might be of similar difficulty over all domains, the pairwise differentiation may be different.  

This can also be seen in figure \ref{fig:comparison_bleu}, which indicates that the domain differences between FINANCE (ECB) and LAW (Euroarl) are in the selected data more obvious in Czech-English than in German-English.  

Overall the comparison shows that prefix constraints improve the translation comprehensibility and precision whenever the domain membership is not expressed clearly through structural differences.  
  
Since the difficulty of domain differentiation and domain classification may differ distinctly in languages, the impact of prefix constraints impact is not always beneficial.
My results indicate that the domain classes are more clearly defined in Czech-English than in German-English.
However, additional research is needed to prove this for other language pairs and in general.

# Limitations
During my training, I ran into issues, that might have had an impact on my results and interpretation.

## The relatedness of English-Czech and English-German and the generalization for the distance between languages
In my testing, I used Czech and German as languages that originated from different language families.
However, they are still related and are closer to English as for example, Japanese or Chinese.
The results need to be verified with more data from these language pairs.
Also, only two language pairs were tested, and the indication described in \ref{language-comparison} needs to be evaluated on more language pairs in the future.

## The domain Selection and the Corpus Metrics
I used only three domains and compared very simple metrics on the corpora, and my indication (\ref{language-comparison}) and observation (\ref{prefix-constraints}) based upon these differences between the domains.
To increase the confidence in my results, I suggest evaluating the same metrics on more domains.
More complex metrics could be used to review my data and prove the described relationship.

## Hyper Parameter Selection and Optimization
I ran only one round of hyper parameter optimization and compared only a few parameters and values.
My training curves showed typical aspects of successful training, but better configurations may exist.
This can be examined by rerunning the optimization with more configurations.

## Better Performance of the distant Language Pair
In my results, the absolute score in all metrics was higher for Czech-English.
This does not affect my comparison since my discussion interpreted only the relative change in the scores.
On top of that, as Pryzbocki et al. \citeyear{przybocki:09} explained, the scores do not represent the overall translation capabilities and are only comparable within the same language and the same corpus.
In my training, the Czech-English models ran for 10 % more steps, since the corpora splits were slightly different then in the German-English corpora.
However, as presented in \ref{data-selection-and-preparation}, the overall key metrics were similar, and the models were trained on the same number of epochs.
As mentioned in the limitations (\ref{hyper-parameter-selection-and-optimization}), the parameter selection may not have included the best model. 
I suggest using an exact alignment for all three languages and the training with additional parameter configurations to evaluate the absolute score differences.


# Perspective
Based on my results it would be interesting to evaluate the following aspects:

## More Domain and Language Comparison
The indication, that the performance impact of prefix constraints is connected or even correlates with the domain distinction between the language pairs should be evaluated with more data.
The evaluation with more and more diverse domains may reveal additional insights on the impact of prefix constraints and the connection with the domain distinction differences.
Additional languages for the training with English source texts, as well as new and different language pairs should be tested.

## Evaluation with full Corpora
I ran my models on a reduced data set.
The training without the reduction can improve the general ability of my findings.

## Training with additional Attention Types
In the thesis, I used only a very simple attention type for the models.
However, since the prefix constraints add additional meta information, a more complex attention type might benefit immensely from this mechanism.

# Future work
Based on my findings, I suggest the following future projects:

## Reviewing of Domain Control Mechanism on different Language Pairs
Most domain control and adaption mechanism are only tested for one or two language pairs.
However, my findings indicate that language selection can have a huge impact on the performance of the domain control mechanism.
Therefore, I suggest reevaluating the findings for the domain control mechanism for additional language pairs.
Especially since Tkeno et al. \citeyear{takeno:17}rely on the work of Kobus et al. \citeyear{kobus:16} but use largely unrelated languages.  

## Creation of a relatedness Score
To measure the relatedness of language pairs and calculate a possible correlation with the performance on translation systems, I suggest the creation of a new and simple score.
The Foreign Service Institute  uses the necessary study time to rank the training difficulty of language pairs.
I suggest the creation and evaluation of a score based on the median training time.
This information can be easily collected for humans and tested for neural machine translation and can then be to represent a translation disadvantage.


## Extend the OPUS Project
The OPUS project hosts a variety of corpus data.
However, the data is only available in an unstructured format.
I invite all researchers to submit their training data and preparation scripts to generate a structured data bank.
Projects like OpenNMT can benefit hugely from a shared collection of preparation scripts because unity on the data sets is key to further research in the whole field.

\chapter{Conclusion}
In conclusion, the problem of domain control in neural machine translation is very challenging and not solved in any translation-related area.
The impact of the domain control mechanism prefix constraints can not always be predicted and depends on the similarity of domain distinction in the languages.
The domain and language selection should always be considered when choosing any domain adaption mechanism.
The connection between the impact of prefix constraints and the relatedness needs to be researched further.
