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

### 3. Adding multiple Keras models in a single batch

I used the following [colab notebook](https://colab.research.google.com/github/Avsecz/DL-genomics-exercise/blob/master/Simulated.ipynb) to train three models. 

I created a Kipoi model out of a single model (model1) and saved it to: [models/keras](models/keras).

Read [models/keras/model.yaml](models/keras/model.yaml) and run `kipoi test models/keras` to see if it works.

Your task is now to use model templating to simulteneusly add all there models to [models/multiple/](models/multiple/) by writing the following two files:

```
model-template.yaml
model.tsv
```

To get more information about these files, read the 'Contributing multiple very similar models with a template' paragraph in [Kipoi 0.6 release notes](https://medium.com/@zigaavsec/kipoi-0-6-release-notes-854a45bd6fdc).

Note: use `models/keras/model.yaml` as a starting point for `models/multiple/model-template.yaml`.

You can find all the links to the model under [models/multiple/README.md](models/multiple/README.md).

Test if you can successfully run the models using:

```bash
kipoi test models/multiple/model3
```

### 4. Testing if predictions match the expected ones

Generate the expected predictions

```bash
kipoi test models/keras -o models/keras/expect.h5
```

Test if they match:

```bash
kipoi test models/keras -e models/keras/expect.h5
```

Note: you can add the following entry to model.yaml in order to automatically check predictions for every `kipoi test <model>`:

```yaml
test:
  expect:
    url: <url to expect.h5>
    md5: <md5 hash of expect.h5>
  precision_decimal: 6
```

## Links

- <https://github.com/kipoi/models/> - explore the how existing models are implemented
- <https://github.com/kipoi/kipoi/tree/master/example/models> - example models used for testing the Kipoi API
- <http://kipoi.org/docs/contributing/01_Getting_started/> - getting started to contributing models
- [Kipoi 0.6 release notes](https://medium.com/@zigaavsec/kipoi-0-6-release-notes-854a45bd6fdc) - blog post explaining model templaes, Kipoiseq, hosting remote files on Zenodo and prediction testing
