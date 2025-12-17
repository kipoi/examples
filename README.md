# kipoi/examples


> [!WARNING]
> ### **Kipoi Project - Sunset Announcement**
> 
> After several impactful years, we have made the decision to **archive the Kipoi repositories and end active maintenance** of the project.
> 
> This is a bittersweet moment. While it’s always a little sad to sunset a project, the field of machine learning in genomics has evolved rapidly, with new technologies and platforms emerging that better meet current needs. Kipoi played an important role in its time, helping researchers **share, reuse, and benchmark trained models** in regulatory genomics. We’re proud of what it accomplished and grateful for the strong community support that made it possible.
> 
> Kipoi’s impact continues, however:
> 
> *   [The Kipoi webinar series](seminar.html) will carry on, supporting discussions around model reuse and interpretability.
> *   [Kipoiseq](https://github.com/kipoi/kipoiseq), our standard set of data-loaders for sequence-based modeling, also remains active and relevant.
> 
> Thanks to everyone who contributed, used, or supported Kipoi. It’s been a fantastic journey, and we're glad the project helped shape how models are shared in the field.
> 
> \- The Kipoi Team

This repository contains different use-cases higlighting Kipoi. Accompanying presentation can be found [here](https://docs.google.com/presentation/d/1v92enk7UOVA4VpazYQ3Y3ZxyRJ5IKNqGJmJJOF_TQsE/edit#slide=id.g450d261db4_0_0). Check out the readme in each sub-folder for more information. Please follow the steps bellow to setup your environment:

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
