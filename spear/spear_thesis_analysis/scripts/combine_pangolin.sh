#!/usr/bin/env bash

# Set the output file name
output_file="combined_pangolin_report.csv"

# Find the first file to extract the header
first_file=$(find sars_cov2_genbank_replace_2024-08-18.fna.gz.split -type f -name "lineage_report.csv" | head -n 1)

# If no file found, exit with a message
if [ -z "$first_file" ]; then
    echo "No lineage_report.csv files found."
    exit 1
fi

# Extract the header from the first file
head -n 1 "$first_file" > "$output_file"

# Find all spear_annotation_summary files and concatenate them, skipping the header line
find sars_cov2_genbank_replace_2024-08-18.fna.gz.split -type f -name "lineage_report.csv" | while read -r file; do
    tail -n +2 "$file" >> "$output_file"
done

gzip "combined_pangolin_report.csv"

echo "All files have been combined into $output_file.gz"
