# Discussion
In the following section I review my results and compare them to the current state of the art, as well as my prediction and research question.

## Summary
### Data Selection and Preparation
During the data preparation step, I reduced the data sets by a large amount.
The original paper from \kobus ran their model for 10 days, which was not an option for me.
I tried to find a way to restore the document structure from the source corpora and only take in a few of them, to keep the domain characteristics.
However I did not find a fitting index for my data sets, so I searched for logical units manually and used the references to split the corpora.
Since I do not speak Czech, I copied the positions from the EN-DE data and applied the splits.
I choose the number of words and word length as two simple metrics to evaluate the new distribution.
As seen in \figure{corpus_stats} the characteristics are not perfectly aligned with the source corpora, but are unique enough, so that no reduced sets are to alike.
In the EMEA corpus, the word length distribution differs visible.
Since this corpus contains a lot of brand names, I assumed that the variation in splits will be always quite high.

### Model Training and Selection
#### Training
The performance of the models were broadly distributed.
During the training I observed 3 distinct curve shapes for the trainings and validation accuracy.
As show and described in the \reference{broken train run} some models had issues with the tested parameter combinations and did not produced any useful results at all.
The second group of curves like \reference{bad train run} produced some results, but did not performed very well.
I assume that the trainings corpus was too small or the trainings period to short.
The last group achieved reasonable results. The validation accuracy indicates no over fitting, but the difference to the trainings accuracy shows additional potential with a larger data set.
Because my reduced data sets varied slightly from the original corpora metrics, I can not generalize any behavior for the whole corpus, however the general similarity indicates at least a tendency.

### Hyper Parameter Selection
I used a simple network model with a stable and well tested implementation and tested subset of the available hyper parameter.
The model and attention system were taken from the \reference{sennrich} and \reference{kobus}.
The hyper parameter were chosen from differences between the runs and the comparison of common values \referece{opennmt suggested values}.
Since I created the corpus from scratch, I could not use any existing baseline to compare my scores with.
After the training I used ROUGE_L, BLEU  and METEOR to rank the models.
ROUGE_L rewards longer subequences so I used it to test the performance on technical terms.
BLEU works on a corpus base so I interpreted it as the similarity score for the whole document.
METEOR scores single sentences and is known to perform similar to human judgement.

I picked the model that had ranked best over all three metrics on the validation set and used it to test my hypothesis.

### Scoring and Comparison
#### Translation Performance Review
In the \reference{result section} I described how the models performed according to METEOR.
The performance is very different on the domains and the medical domain seems to be the easiest to learn.
Since the law and finance domain have similar word and sentence length, it is not unexpected to see that they performed similar.

The overall performance shows a slight decrease when prefix constraints were provided.
However since the test set with 1000 examples was quite small, the distribution may not be generalizable.

#### Language Pair Comparison
The scores of the different language models can not be compared directly \reference{bleu critique}.
However the performance difference between the runs with and without prefix constraints show a certain pattern.

As described in the \reference{result section} the performance differences within the domains were comparable.
However the CS-EN pair showed a higher decrease on all domains in all scores, when prefix constrained where available compared to DE-EN.


#### Short Summary
The comparison of the performance change on different languages indicates that prefix constraints have a larger impact on distant languages.  As previously shown, prefix constraints seem to be beneficial especially on domain specific terms.

## Related Challanges
Projects like the OPUS and OpenNMT help in stardatization and reproducuabilty of experiments in neural machine translations.
However the current research is not focused on the distance between languages.
Most experiment and procedures are either only tested on similar langauges or in far distant pairs.

Especially domain control mechanism and other content related additions should be tested with different sets of language pairs.
The FSI \todo{reference website or introdction} can be used as a ranking.
However since we have a lot of corpora, in particular european datasets that are already transaled and accesible like EMEA or Europarl we can verify those rankings.

Another big issue is the obstacle of uniformal data preparation.
I suggest adding additional preparation frameworks to tools like OpenNMT.
This would allow for easier peer reviewing.

## Future Work
In the longer run, all domain control mechanism should be measured on multiple language pairs.
This would not only give more insights into the understanding of neural machine translation but also verify baselines for other reasearch.

As shown by Google \todo{refrence} domain control needs a lot of data to work properly.
However not all big corpora are translated in multiple language.
This can be easily done by crowdsourcing and would help everyone.

## Followup
The followup for this thesis should include iterations on more and larger domains.
Also the hyper parameter optimizaion was restricted due to ressourcen and a larger selection could find even better models.
Currently only domain tags were used as prefix constraints. However  \refernce von dem nicht kobus dude} suggests to use more tags.


