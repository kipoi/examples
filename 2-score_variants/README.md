## Setup

Make sure have the environemnt setup ([../README.md](../README.md)) and that you have extracted the fasta file:

`zcat ../1-predict/input/hg19.chr22.fa.gz > ../1-predict/input/hg19.chr22.fa`.

## Tutorial

### 1. Run `kipoi veff score_variants` for a single model
Have a look at the `clinvar_20180429.pathogenic.chr22.vcf.gz`

```bash
zless -S input/clinvar_20180429.pathogenic.chr22.vcf.gz
```

This file contains genetic variants from the [ClinVar](https://www.ncbi.nlm.nih.gov/clinvar/) database. We filtered the original ClinVar VCF file to chromosome 22 and included only pathogenic variants.

Let's score the impact of these genetic variants to different molecular phenotypes (e.g. TF-factor binding affinity or DNA accessibility) using models in Kipoi. 

First, activate the right environment:

```bash
source activate `kipoi env get DeepBind`
mkdir -p output
```

Next, run model predictions for sequences containing the reference allele, the alternative allele and also write the difference between model predictions to a file:

```bash
kipoi veff score_variants DeepBind/Homo_sapiens/TF/D00328.018_ChIP-seq_CTCF \
   --dataloader_args='{"fasta_file": "input/hg19.chr22.fa"}' \
   -i input/clinvar_20180429.pathogenic.chr22.vcf.gz \
   -s ref alt diff \
   -o /tmp/annotated.vcf
```

Let's investigate the results

```
less -S /tmp/annotated.vcf
```

As you can see, new entries were added to the `INFO` field of the vcf:

```
##INFO=<ID=KV:kipoi:DeepBind/Homo_sapiens/TF/D00328.018_ChIP_seq_CTCF:REF,...
##INFO=<ID=KV:kipoi:DeepBind/Homo_sapiens/TF/D00328.018_ChIP_seq_CTCF:ALT,...
##INFO=<ID=KV:kipoi:DeepBind/Homo_sapiens/TF/D00328.018_ChIP_seq_CTCF:DIFF,...
##INFO=<ID=KV:kipoi:DeepBind/Homo_sapiens/TF/D00328.018_ChIP_seq_CTCF:rID,...
```

`REF`, `ALT` or `DIFF` correspond to different scoring functions specified with `-s ref alt diff`.

Let's write the scores to a tsv file instead of the vcf:

```bash
kipoi veff score_variants DeepBind/Homo_sapiens/TF/D00328.018_ChIP-seq_CTCF \
   --dataloader_args='{"fasta_file": "input/hg19.chr22.fa"}' \
   -i input/clinvar_20180429.pathogenic.chr22.vcf.gz \
   -s ref alt diff \
   -e /tmp/annotated.tsv
```

```bash
less -S /tmp/annotated.tsv
```

#### Your turn

- [ ] Use the `Basset` model to run model predictions.
- [ ] Write only the predictions for `A549` of the Basset model. Hint: use `kipoi veff score_variants --help` and `--model_outputs`.
- [ ] Run variant effect predictions from python:

```python
import kipoi_veff.snv_predict as sp
sp.score_variants(model='Basset',
                  dl_args={'fasta_file': 'input/hg19.chr22.fa'},
                  input_vcf='input/clinvar_20180429.pathogenic.chr22.vcf.gz',
                  output_vcf='/tmp/py-annotated.vcf')
```

### 2. Run `kipoi veff score_variants` for multiple models using Snakemake

Now, let's run model predictions in parallel. We'll use [Snakemake](snakemake.readthedocs.io) for this.

First, explore the [Snakefile](./Snakefile).

Next, run:

```bash
snakemake -j 5
```

This will run variant effect prediction for many different models. `-j 5` runs 5 jobs in parallel.


### 4. Load and analyze predictions in python

Now that we have the predictions scored under `output/`, let's load them into python, join them into a table and do a simple analysis. Go through the [load-visualize.ipynb](./load-visualize.ipynb) notebook.

## Links

- [kipoi-veff repository](https://github.com/kipoi/kipoi-veff)
- [kipoi-veff documentation](http://kipoi.org/veff-docs/)
- Notebooks:
  - [MutationMap tutorial](https://github.com/kipoi/kipoi-veff/blob/master/notebooks/mutation_map.ipynb)
  - [Variant effect prediction (simple) tutorial](https://github.com/kipoi/kipoi-veff/blob/master/notebooks/variant_effect_prediction_simple.ipynb)
  - [Variant effect prediction (advanced)](https://github.com/kipoi/kipoi-veff/blob/master/notebooks/variant_effect_prediction.ipynb)

**Next step: [3-interpret](../3-interpret)**
