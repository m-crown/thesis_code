#!/usr/bin/env bash
zcat combined_spear_annotation_summary.tsv.gz | head -n 1 | cut -f2-28,30 > unique_spear_nt_mutations.tsv
zcat combined_spear_annotation_summary.tsv.gz | tail -n +2 | cut -f2-28,30 | sort | uniq >> unique_spear_nt_mutations.tsv
gzip unique_spear_nt_mutations.tsv
