## TODO
- [ ] give link to the presentation
- [ ] Add ipykernel to shared environments in kipoi/models

This repository contains different use-cases higlighting Kipoi. Check out the readme in each sub-folder for more information. Please follow the steps bellow to setup your environemnt:

## Setup

- Install miniconda or anaconda (TODO - links)
- required conda packages
  - `conda install -y -c conda-forge jupyterlab`
  - `conda install -y nb_conda`
- required pip packages
  - `pip install numpy pandas matplotlib seaborn snakemake kipoi>=0.6.0`

### Install Kipoi

- `pip install kipoi>=0.6.0 snakemake`
- `kipoi ls`  # list all the models

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
kipoi test DeepBind/.... --source=kipoi
```

**Next step: [1-getting-started](1-getting-started)**