#! /usr/bin/bash
mkdir -p surfaces_structures/5g6k_surfaces
mv surfaces_structures/minor_structures/5g6k_bio-h_single_HEM.pdb .
python create_lig_file.py -f 5g6k_bio-h_single_HEM.pdb -lig HEM &> 5g6k_lig_create.log
python ligand_atomtypes.py -pdb HEM.pdb -def AMINO_FlexAID.def &> 5g6k_lig_atomttypes.log
python clean_structure.py -f 5g6k_bio-h_single_HEM.pdb -def custom_AMINO_FlexAID.def &> 5g6k_clean_struct.log
python surface_cont_lig.py -f clean_5g6k_bio-h_single_HEM.pdb -c A -lig HEM -o 5g6k_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 5g6k_surfaces.log
mv HEM.pdb surfaces_structures/5g6k_surfaces/
mv 5g6k_bio-h_single_HEM.pdb surfaces_structures/minor_structures/
mv 5g6k_output.csv surfaces_structures/5g6k_surfaces/
mv List_5g6k_output.txt surfaces_structures/5g6k_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/5g6k_surfaces/
mv clean_5g6k_bio-h_single_HEM.pdb surfaces_structures/5g6k_surfaces/

