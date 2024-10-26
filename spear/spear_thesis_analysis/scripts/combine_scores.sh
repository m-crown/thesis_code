#!/usr/bin/env bash

# Set the output file name
output_file="combined_spear_score_summary.tsv"

# Find the first file to extract the header
first_file=$(find sars_cov2_genbank_replace_2024-08-18.fna.gz.split -type f -name "spear_score_summary.tsv" | head -n 1)

# If no file found, exit with a message
if [ -z "$first_file" ]; then
    echo "No spear_score_summary files found."
    exit 1
fi

# Extract the header from the first file
head -n 1 "$first_file" > "$output_file"

# Find all spear_annotation_summary files and concatenate them, skipping the header line
find sars_cov2_genbank_replace_2024-08-18.fna.gz.split -type f -name "spear_score_summary.tsv" | while read -r file; do
    tail -n +2 "$file" >> "$output_file"
done

gzip "combined_spear_score_summary.tsv"

echo "All files have been combined into $output_file"
