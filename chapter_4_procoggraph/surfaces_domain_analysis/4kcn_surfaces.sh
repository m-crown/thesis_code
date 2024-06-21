#! /usr/bin/bash
mkdir -p surfaces_structures/4kcn_surfaces
mv surfaces_structures/minor_structures/4kcn_bio-h_single_HEM.pdb .
python create_lig_file.py -f 4kcn_bio-h_single_HEM.pdb -lig HEM &> 4kcn_lig_create.log
python ligand_atomtypes.py -pdb HEM.pdb -def AMINO_FlexAID.def &> 4kcn_lig_atomttypes.log
python clean_structure.py -f 4kcn_bio-h_single_HEM.pdb -def custom_AMINO_FlexAID.def &> 4kcn_clean_struct.log
python surface_cont_lig.py -f clean_4kcn_bio-h_single_HEM.pdb -c A -lig HEM -o 4kcn_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 4kcn_surfaces.log
mv HEM.pdb surfaces_structures/4kcn_surfaces/
mv 4kcn_bio-h_single_HEM.pdb surfaces_structures/minor_structures/
mv 4kcn_output.csv surfaces_structures/4kcn_surfaces/
mv List_4kcn_output.txt surfaces_structures/4kcn_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/4kcn_surfaces/
mv clean_4kcn_bio-h_single_HEM.pdb surfaces_structures/4kcn_surfaces/

