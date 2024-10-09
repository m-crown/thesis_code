#! /usr/bin/bash
mkdir -p surfaces_structures/3hu2_surfaces
mv surfaces_structures/med_structures/3hu2_bio-h_single_AGS.pdb .
python create_lig_file.py -f 3hu2_bio-h_single_AGS.pdb -lig AGS &> 3hu2_lig_create.log
python ligand_atomtypes.py -pdb AGS.pdb -def AMINO_FlexAID.def &> 3hu2_lig_atomttypes.log
python clean_structure.py -f 3hu2_bio-h_single_AGS.pdb -def custom_AMINO_FlexAID.def &> 3hu2_clean_struct.log
python surface_cont_lig.py -f clean_3hu2_bio-h_single_AGS.pdb -c D -lig AGS -o 3hu2_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 3hu2_surfaces.log
mv AGS.pdb surfaces_structures/3hu2_surfaces/
mv 3hu2_bio-h_single_AGS.pdb surfaces_structures/med_structures/
mv 3hu2_output.csv surfaces_structures/3hu2_surfaces/
mv List_3hu2_output.txt surfaces_structures/3hu2_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/3hu2_surfaces/
mv clean_3hu2_bio-h_single_AGS.pdb surfaces_structures/3hu2_surfaces/

