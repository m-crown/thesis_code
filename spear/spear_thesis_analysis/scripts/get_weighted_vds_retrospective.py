#longitudinal analysis was performed with v2.0.1 but we introduced a weighted mean in 2.1.0
#this code retrospectively calculates sample level weighted mean vds for use in analysis code

import pandas as pd
import numpy as np

sc2_muts = pd.read_csv("/raid/MattC/repos/spear_thesis_analysis/combined_spear_annotation_summary.tsv.gz", sep = "\t")

sc2_muts_vds = sc2_muts.loc[sc2_muts.VDS.isna() == False]
sc2_muts_vds["respos"] = sc2_muts_vds["residues"].str.extract('[A-Z\*]-*([0-9]+)-*[a-zA-Z\*\?]+').astype("float64")
sc2_muts_vds["weighted_vds"] = sc2_muts_vds["VDS"] * sc2_muts_vds["VDS"].abs()

sc2_muts_vds_rbd = sc2_muts_vds.loc[(sc2_muts_vds.respos >= 331) & (sc2_muts_vds.respos <= 533)]

# Step 2: Group by 'Sample' and calculate the sum of weighted VDS and the sum of abs(VDS)
sc2_vds_rbd_grouped_weighted = sc2_muts_vds_rbd.groupby('sample_id').agg(
    weighted_sum=('weighted_vds', 'sum'),
    total_weight=('VDS', lambda x: x.abs().sum())
)

# Step 3: Calculate the weighted mean
sc2_vds_rbd_grouped_weighted['weighted_vds'] = sc2_vds_rbd_grouped_weighted['weighted_sum'] / sc2_vds_rbd_grouped_weighted['total_weight']

sc2_vds_rbd_grouped_weighted = sc2_vds_rbd_grouped_weighted.reset_index()
sc2_vds_rbd_grouped_weighted.to_csv("/raid/MattC/repos/spear_thesis_analysis/sars_cov2_genbank_2024-08-18_weighted_vds.csv.gz", compression = "gzip")
