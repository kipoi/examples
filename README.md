# kipoi/examples

This repository contains different use-cases higlighting Kipoi. Check out the readme in each sub-folder for more information. Please follow the steps bellow to setup your environemnt:

## Setup

- Install [miniconda](https://conda.io/miniconda.html) or [anaconda](https://conda.io/miniconda.html).
- Make sure you have the following packages installed:
  - conda:
    - `conda install -y -c conda-forge jupyterlab`
    - `conda install -y nb_conda`
  - pip:
    - `pip install numpy pandas matplotlib seaborn snakemake kipoi>=0.6.0`

### Verify Kipoi

Run:

- `kipoi ls`

This will list all the models and checkout the model source to `~/.kipoi/models`.

### Install the commmon environment

- `kipoi env create shared/envs/kipoi-py3-keras2`

### Test the locally installed models

Activate the environment

```bash
source activate kipoi-shared__envs__kipoi-py3-keras2
```

Test all the used models in the tutorials:

```bash
kipoi test Basset --source=kipoi
```

```bash
kipoi test DeepSEA/predict --source=kipoi
```

```bash
kipoi test DeepBind/Homo_sapiens/TF/D00328.018_ChIP-seq_CTCF/ --source=kipoi
```

**Next step: [1-predict](1-predict)**


## Links

- <https://kipoi.org> - website with pointers to the docs, white-paper and models.
- [CSHL Biological Data Science 2018 presentation on Kipoi](http://bit.ly/18-11-kipoi-presentation)
