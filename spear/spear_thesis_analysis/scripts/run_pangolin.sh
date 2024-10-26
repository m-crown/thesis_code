#!/usr/bin/env bash
#run pangolin to update lineage classifications - doing this in retrospect otherwise could run fast on above commands
directory="sars_cov2_genbank_replace_2024-08-18.fna.gz.split"
#run spear on batches of 10k seqs (will combine after)
for file in "$directory"/sars_cov2_genbank_replace_2024-08-18.part_*.fna.gz
do
    #set output directory
    output_dir="${file%.fna.gz}_out"
    # Check if the output directory exists
    echo "${output_dir}"
    pangolin "$file" --threads 70 -o "$output_dir"
done
