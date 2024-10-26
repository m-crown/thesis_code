#!/usr/bin/env bash

seqkit replace -p "\s.+" sars_cov2_genbank_2024-08-18.fna.gz > sars_cov2_genbank_replace_2024-08-18.fna
pigz sars_cov2_genbank_replace_2024-08-18.fna
