import pandas as pd
import argparse

def main():
    """
    Split manifest file into individual manifests for each protein
    e.g. python split_manifest.py alphafold_structures_manifest_full.csv individual_manifests 1000
    """
    parser = argparse.ArgumentParser(description = "Split manifest file into individual manifests for each protein")
    parser.add_argument("manifest", type = str, help = "The full manifest file")
    parser.add_argument("output_dir", type = str, help = "The directory to save the individual manifest files")
    parser.add_argument("num_samples", type = int, help = "The number of samples to take from the manifest file")
    args = parser.parse_args()


    manifest = pd.read_csv(args.manifest, header = None)

    random_sample = manifest.sample(args.num_samples, random_state = 42).reset_index(drop = True)

    for n, row in random_sample.iterrows():
        pd.DataFrame([row]).to_csv(f"{args.output_dir}/individual_manifest_{n}.csv", index = False, header = None)
        
if __name__ == "__main__":
    main()