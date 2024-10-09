#! /usr/bin/bash
mkdir -p surfaces_structures/1orw_surfaces
mv surfaces_structures/med_structures/1orw_bio-h_single_PHI.pdb .
python create_lig_file.py -f 1orw_bio-h_single_PHI.pdb -lig PHI &> 1orw_lig_create.log
python ligand_atomtypes.py -pdb PHI.pdb -def AMINO_FlexAID.def &> 1orw_lig_atomttypes.log
python clean_structure.py -f 1orw_bio-h_single_PHI.pdb -def custom_AMINO_FlexAID.def &> 1orw_clean_struct.log
python surface_cont_lig.py -f clean_1orw_bio-h_single_PHI.pdb -c D -lig PHI -o 1orw_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 1orw_surfaces.log
mv PHI.pdb surfaces_structures/1orw_surfaces/
mv 1orw_bio-h_single_PHI.pdb surfaces_structures/med_structures/
mv 1orw_output.csv surfaces_structures/1orw_surfaces/
mv List_1orw_output.txt surfaces_structures/1orw_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/1orw_surfaces/
mv clean_1orw_bio-h_single_PHI.pdb surfaces_structures/1orw_surfaces/

