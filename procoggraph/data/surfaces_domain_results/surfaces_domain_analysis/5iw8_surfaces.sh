#! /usr/bin/bash
mkdir -p surfaces_structures/5iw8_surfaces
mv surfaces_structures/med_structures/5iw8_bio-h_single_PLP.pdb .
python create_lig_file.py -f 5iw8_bio-h_single_PLP.pdb -lig PLP &> 5iw8_lig_create.log
python ligand_atomtypes.py -pdb PLP.pdb -def AMINO_FlexAID.def &> 5iw8_lig_atomttypes.log
python clean_structure.py -f 5iw8_bio-h_single_PLP.pdb -def custom_AMINO_FlexAID.def &> 5iw8_clean_struct.log
python surface_cont_lig.py -f clean_5iw8_bio-h_single_PLP.pdb -c A -lig PLP -o 5iw8_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 5iw8_surfaces.log
mv PLP.pdb surfaces_structures/5iw8_surfaces/
mv 5iw8_bio-h_single_PLP.pdb surfaces_structures/med_structures/
mv 5iw8_output.csv surfaces_structures/5iw8_surfaces/
mv List_5iw8_output.txt surfaces_structures/5iw8_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/5iw8_surfaces/
mv clean_5iw8_bio-h_single_PLP.pdb surfaces_structures/5iw8_surfaces/

