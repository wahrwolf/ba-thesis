## Training and Model Selection
### Training
I trained an bidirectional LSTM with the configuration shown \TODO{add config}.
I ran a hyperparameter optimization on the optimzier (sgd, adam, adadelta), the learning rate(1, 0.1, 0,001, 0001) and the beginning of the learning rate decay(off, 5 epochs, 10 epochs).
The OpenNMT framework was used to train the models and translate the scoring tests.
In the OpenNMT context one epoch of the corpus translates roughly to 2,000 train steps.
All models were trained for 18 epochs.
I used a small MQTT scheduler to coordinate the runs on a mixture of NVIDIA GTX 980, 1080 and 1080Ti.
One run takes between 2 and 3,5 hours depending on the GPU.
Most of the models showed a decent trainings curve \TODO{image good curve} as this example run caped after ~5epochs.
Some hyper parameter configuration learned comparable slow \TODO{image bad curve} and some configurations like \todo{show super mad config in table} produced unusable results.

All models were trained multiple times to ensure proper distribution of start vectors.

### Selection of Hyper Parameter
The resulting models were used to translate 1,000 examples from the validation data. 
The generated translation were stripped from the BPE and scored using BLEU \TODO{fancy optim}.
From the ranking \TODO{include table} the best model were choosen for each corpus.

## Scoring and Comparison
The figure \TODO{side constraint comparison} shows the performance of the best model for the domain test sets calculated with ROUGEL.
As expected the related language pair had archived better scores overall domains.

\TODO{write something about the different domains}

However depending on the scoring metric, there were huge differences in the actual performance change between the pairs.
The models that were trained with prefix constraints archieved a higher trainings and validation accuracy, however only in the CZ-EN pair.
In the DE-EN pair was not noticeable difference in the trainings statistic.

For more content focused scores like BLEU or ROUGE \TODO{add table with socres} the prefix constraints impacted the score slightly negative.

While the difference is pretty small for related languages, it is notable different for the distant language pair.
