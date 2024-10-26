#!/usr/bin/env bash

zcat combined_spear_annotation_summary.tsv.gz | head -n 1 | cut -f8-28,30 > unique_spear_aa_mutations.tsv
zcat combined_spear_annotation_summary.tsv.gz | tail -n +2 | cut -f8-28,30 | sort | uniq >> unique_spear_aa_mutations.tsv
gzip unique_spear_aa_mutations.tsv
