#for making variants - move to a separate script
sc2_md = pd.read_csv(f"sars_cov2_genbank_2024-08-18_metadata.csv.gz")
#using collection date we see omicron in 2020 - this is a better proxy of sample date
sc2_md["Collection_Date_formatted"] = pd.to_datetime(sc2_md["Collection_Date"], format='mixed')# - pd.to_timedelta(7, unit='d')
sc2_md.loc[sc2_md.Pangolin.isna(), "Pangolin"] = "unclassified"
sc2_md_pangolin = sc2_md.loc[sc2_md.Pangolin != "unclassified", ["Accession", "Pangolin"]].rename(columns = {"Accession": "taxon", "Pangolin": "lineage"})
sc2_md_pangolin.to_csv("sars_cov2_genbank_2024-08-18_lineages.csv")
####