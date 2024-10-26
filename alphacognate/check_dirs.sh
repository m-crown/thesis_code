find alphafold_structures_cognate/* -maxdepth 0 -type d | while read dir; do
    if [ ! -f "$dir/combined_transplants.tsv.gz" ]; then
        rm -r "$dir"
        echo "Removed directory: $dir"
    fi
done
