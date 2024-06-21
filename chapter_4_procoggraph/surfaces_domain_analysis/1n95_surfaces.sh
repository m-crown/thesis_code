#! /usr/bin/bash
mkdir -p surfaces_structures/1n95_surfaces
mv surfaces_structures/med_structures/1n95_bio-h_single_HFP.pdb .
python create_lig_file.py -f 1n95_bio-h_single_HFP.pdb -lig HFP &> 1n95_lig_create.log
python ligand_atomtypes.py -pdb HFP.pdb -def AMINO_FlexAID.def &> 1n95_lig_atomttypes.log
python clean_structure.py -f 1n95_bio-h_single_HFP.pdb -def custom_AMINO_FlexAID.def &> 1n95_clean_struct.log
python surface_cont_lig.py -f clean_1n95_bio-h_single_HFP.pdb -c AB -lig HFP -o 1n95_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 1n95_surfaces.log
mv HFP.pdb surfaces_structures/1n95_surfaces/
mv 1n95_bio-h_single_HFP.pdb surfaces_structures/med_structures/
mv 1n95_output.csv surfaces_structures/1n95_surfaces/
mv List_1n95_output.txt surfaces_structures/1n95_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/1n95_surfaces/
mv clean_1n95_bio-h_single_HFP.pdb surfaces_structures/1n95_surfaces/

