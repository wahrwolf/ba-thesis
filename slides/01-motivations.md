# Motivation and Question
## Motivation
- Domain control in Neural Machine Translation
  - neural networks getting pretty good in pure translation
  - often extra information is needed (e.g. domain, tone)
  - different approaches available

- Current NMTs use:
  - constraints \shortcite{kobus:16}
  - multi source translation systems \shortcite{Zoph:16}
  - complex attention models \shortcite{vaswanie:17}

## Example Sentence
Domain: Sport

- Der Boxer erhebt sich für Geld von der Bank und betritt den Ring
- The boxer rises up from the bench for money and enters the boxing ring.

Domain: Drama

- Der Boxer hebt Geld von der Bank und kauft den Ring.
- The boxer withdraws money from the bank and buys a ring.

## Language Relatedness
Languages share:

- certain concepts and domains
- a common history
- a culture

Languages differ in:

- common vocabulary
- important historical events
- domain representation

## Research Questions
1) How does prefix constraints impact the translation performance?
2) Has the relatedness of the language pairs an effect on the performance?
3) How important is the relatedness between language pairs in multi domain translation?
