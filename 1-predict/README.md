## Setup

Make sure have the environemnt setup ([../README.md](../README.md)).

## Tutorial

### 1. Quick start 

#### Exploring kipoi.org/groups

In this step, we'll navigate to <https://kipoi.org>, select the model and run the example.

Task:
- [ ] choose a model of interest (Example: [Basset](http://kipoi.org/models/Basset/))
- [ ] Run the commands for the CLI (all except `kipoi env install`)

Notes:
- You can use the search bar at the top of <https://kipoi.org/groups/> to search by models. Try for example: 'DNA binding'

### 2. Running `kipoi predict` on new data

Let's try to run model prediction on new data. Try:

Unzip the fasta file
```bash
zcat input/hg19.chr22.fa.gz > input/hg19.chr22.fa
```

Activate the right environment
```bash
source activate `kipoi env get DeepBind`
```

Run prediction
```bash
source activate `kipoi env get DeepBind`
kipoi predict DeepBind/Homo_sapiens/TF/D00328.018_ChIP-seq_CTCF \
   --dataloader_args='{"intervals_file": "input/enhancer-regions.hg19.chr22.bed.gz",
                       "fasta_file": "input/hg19.chr22.fa"}' \
  -o preds.tsv
```

Investigate the output:

```bash
less preds.tsv
```

Skim through the help of kipoi predict: `kipoi predict --help`. Further things to try:
- [ ] try out differnet file formats:
  - output.h5
  - output.bed
- [ ] Use a different batch size
  - `--batch_size=256`
- [ ] Try using multiple workers in parallel
  - `-n 8`
- [ ] (Optional) Use a GPU
  - install a new GPU environment by adding `--gpu` to `kipoi env create`
  - Run `kipoi predict` as before

### 3. Running `kipoi predict` for multiple models using Snakemake

Now, let's run model predictions in parallel. We'll use [Snakemake](snakemake.readthedocs.io) for this.

First, explore the [Snakefile](./Snakefile).

Next, run:

```bash
snakemake
```

This will run model prediction for many different models.

### 4. Loading and analyzing predictions in python

Now that we have the predictions scored under `output/`, let's load them into python, join them into a table and to a very simple analysis. Run throught the [load-visualize.ipynb](./load-visualize.ipynb) notebook.

## Links

- [python-api](http://kipoi.org/docs/using/python/)
- [CLI-api](http://kipoi.org/docs/using/cli/)
- [R-api](http://kipoi.org/docs/using/R/)

**Next step: [2-score-variants](2-score-variants)**
