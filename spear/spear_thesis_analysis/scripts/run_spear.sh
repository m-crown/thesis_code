#!/usr/bin/env bash

directory="sars_cov2_genbank_replace_2024-08-18.fna.gz.split"
#run spear on batches of 10k seqs (will combine after)
for file in "$directory"/sars_cov2_genbank_replace_2024-08-18.part_*.fna.gz
do
    #set output directory
    output_dir="${file%.fna.gz}_out"
    # Check if the output directory exists
    echo "${output_dir}"
    if [ ! -d "$output_dir" ]; then
        #run if outdir doesnt exist
        spear consensus --debug --threads 70 --no-report --pangolin none "$file" "$output_dir"
    fi
    #run spear on batch
done

#run pangolin to update lineage classifications - doing this in retrospect otherwise could run fast on above commands
pangolin --analysis-mode fast sars_cov2_genbank_replace_2024-08-18.fna.gz
