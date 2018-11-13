# kipoi/examples

This repository contains different use-cases higlighting Kipoi. Accompanying presentation can be found [here](https://docs.google.com/presentation/d/1v92enk7UOVA4VpazYQ3Y3ZxyRJ5IKNqGJmJJOF_TQsE/edit#slide=id.g450d261db4_0_0). Check out the readme in each sub-folder for more information. Please follow the steps bellow to setup your environemnt:

## Setup

- Install [miniconda](https://conda.io/miniconda.html) or [anaconda](https://conda.io/miniconda.html).
- Make sure you have the following packages installed:
  - conda:
    - `conda install -y -c conda-forge jupyterlab`
    - `conda install -y nb_conda datrie`
  - pip:
    - `pip install numpy pandas matplotlib seaborn snakemake kipoi>=0.6.0`
- Clone this repository: `git clone https://github.com/kipoi/examples.git && cd examples`

### Verify Kipoi

Run:

- `kipoi ls`

This will list all the models and checkout the model source to `~/.kipoi/models`.

### Install the common environment

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
- [Workshop: MIA Workshop Broad institute 2018](https://docs.google.com/presentation/d/1v92enk7UOVA4VpazYQ3Y3ZxyRJ5IKNqGJmJJOF_TQsE/edit#slide=id.g450d261db4_0_0) - Accompanying slides for this tutorial.
- [Gitter chat](https://gitter.im/kipoi/MIA-workshop-2018)