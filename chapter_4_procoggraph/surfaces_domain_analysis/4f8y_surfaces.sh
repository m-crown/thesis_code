#! /usr/bin/bash
mkdir -p surfaces_structures/4f8y_surfaces
mv surfaces_structures/minor_structures/4f8y_bio-h_single_FAD.pdb .
python create_lig_file.py -f 4f8y_bio-h_single_FAD.pdb -lig FAD &> 4f8y_lig_create.log
python ligand_atomtypes.py -pdb FAD.pdb -def AMINO_FlexAID.def &> 4f8y_lig_atomttypes.log
python clean_structure.py -f 4f8y_bio-h_single_FAD.pdb -def custom_AMINO_FlexAID.def &> 4f8y_clean_struct.log
python surface_cont_lig.py -f clean_4f8y_bio-h_single_FAD.pdb -c AB -lig FAD -o 4f8y_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 4f8y_surfaces.log
mv FAD.pdb surfaces_structures/4f8y_surfaces/
mv 4f8y_bio-h_single_FAD.pdb surfaces_structures/minor_structures/
mv 4f8y_output.csv surfaces_structures/4f8y_surfaces/
mv List_4f8y_output.txt surfaces_structures/4f8y_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/4f8y_surfaces/
mv clean_4f8y_bio-h_single_FAD.pdb surfaces_structures/4f8y_surfaces/

