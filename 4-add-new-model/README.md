## Setup

Make sure have the environemnt setup ([../README.md](../README.md)).

## Tutorial

### 1. Wrapping the Iris classifier into Kipoi

Go through the [adding_new_models.ipynb](adding_new_models.ipynb) notebook.

This notebook provides an end-to-end example of adding a new model to the Kipoi format and explains how to share it to https://github.com/kipoi/models/.

### 2. Adding a custom model with a pre-defined dataloader from Kipoiseq

Next, try to write a model in `models/gc_bias` which will compute the fraction of GC nucleotides in the sequence. The model should expect a simple string as input and should return a float.

You can use `kipoiseq.dataloaders.StringSeqIntervalDl` for the dataloader.

Once you are done implementing the model in `models/gc_bias`, see if you can run the tests:

```bash
source activate kipoi-shared__envs__kipoi-py3-keras2
kipoi test models/gc_bias
```

### 3. Adding a Keras with a pre-defined dataloader from Kipoiseq

I used the following [colab notebook](https://colab.research.google.com/github/Avsecz/DL-genomics-exercise/blob/master/Simulated.ipynb) to train three models. 


Let's add a simple Keras model

### 4. Adding multiple Keras models in a single batch




## Links

- <https://github.com/kipoi/models/> - explore the how existing models are implemented
- <https://github.com/kipoi/kipoi/tree/master/example/models> - example models used for testing the Kipoi API
- <http://kipoi.org/docs/contributing/01_Getting_started/> - getting started to contributing models
- [Kipoi 0.6 release notes](https://medium.com/@zigaavsec/kipoi-0-6-release-notes-854a45bd6fdc) - blog post explaining model templaes, Kipoiseq, hosting remote files on Zenodo and prediction testing