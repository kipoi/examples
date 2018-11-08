rule download_extract_filter_gtf:
    # TODO - remove
    output:
        gtf = GTF_FILE
    shell:
        """wget -O - ftp://ftp.ensembl.org/pub/release-75/gtf/homo_sapiens/Homo_sapiens.GRCh37.75.gtf.gz | \
          zcat | \
          grep -v ^H | \
          grep -v ^GL  > {output.gtf}
        """
        #  awk '{{ if($1 !~ /^#/){{print "chr"$0}} else{{print $0}} }}' > {output.gtf}
        # """


rule download_extract_fasta:
    """This will replace the headers in the ensembl fasta file from:
    >1 dna:chromosome chromosome:GRC ...
    to
    >chr1
    """
    # TODO - remove?
    output:
        fa = FASTA_FILE
    shell:
        "wget -O - ftp://ftp.ensembl.org/pub/release-75/fasta/homo_sapiens/dna/Homo_sapiens.GRCh37.75.dna.primary_assembly.fa.gz |"
        "zcat | sed 's/\s.*$//' > {output.fa}"
        # sed  -e 's/^>/>chr/' |


rule download_clinvar:
    output:
        vcf = "data/raw/splicing/clinvar/{clinvar_file}.vcf.gz",
        vcf_tbi = "data/raw/splicing/clinvar/{clinvar_file}.vcf.gz.tbi",
    shell:
        """
        wget ftp://ftp.ncbi.nlm.nih.gov/pub/clinvar/vcf_GRCh37/archive_2.0/2018/clinvar_{wildcards.clinvar_file}.vcf.gz -O {output.vcf}
        wget ftp://ftp.ncbi.nlm.nih.gov/pub/clinvar/vcf_GRCh37/archive_2.0/2018/clinvar_{wildcards.clinvar_file}.vcf.gz.tbi -O {output.vcf_tbi}
        """

rule clinvar_donor_acceptor:
    """Generate the annotation bed files"""
    output:
        acceptors = "data/processed/splicing/clinvar/acceptors.bed",
        acceptors_num = "data/processed/splicing/clinvar/acceptors.numchr.bed",
        donors = "data/processed/splicing/clinvar/donors.bed",
        donors_num = "data/processed/splicing/clinvar/donors.numchr.bed"
    script:
        ROOT + "/src/splicing/generate_regions.R"


rule filter_vcf:
    """Restrict the variants only to the donor or acceptor sites
    """
    input:
        vcf = "data/raw/splicing/clinvar/{clinvar_file}.vcf.gz",
        acceptors_num = "data/processed/splicing/clinvar/acceptors.numchr.bed",
        donors_num = "data/processed/splicing/clinvar/donors.numchr.bed",
    output:
        vcf = "data/processed/splicing/clinvar/{clinvar_file}.filtered.vcf.gz",
        vcf_tbi = "data/processed/splicing/clinvar/{clinvar_file}.filtered.vcf.gz.tbi"
    shell:
        """
        vcftools --gzvcf {input.vcf} --remove-indels --recode --recode-INFO-all -c | \
            awk '$5 != "."' | \
            bedtools intersect -a stdin -b {input.acceptors_num} {input.donors_num} -wa -u -header | \
            bgzip -c > {output.vcf}
        tabix -f -p vcf {output.vcf}
        #awk '$1 ~ /^#/ {{print $0;next}} {{print $0 | "LC_ALL=C sort -k1,1 -k2,2n"}}' | \
        """
