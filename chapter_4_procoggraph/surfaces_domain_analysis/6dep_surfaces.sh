#! /usr/bin/bash
mkdir -p surfaces_structures/6dep_surfaces
mv surfaces_structures/med_structures/6dep_bio-h_single_FAD.pdb .
python create_lig_file.py -f 6dep_bio-h_single_FAD.pdb -lig FAD &> 6dep_lig_create.log
python ligand_atomtypes.py -pdb FAD.pdb -def AMINO_FlexAID.def &> 6dep_lig_atomttypes.log
python clean_structure.py -f 6dep_bio-h_single_FAD.pdb -def custom_AMINO_FlexAID.def &> 6dep_clean_struct.log
python surface_cont_lig.py -f clean_6dep_bio-h_single_FAD.pdb -c A -lig FAD -o 6dep_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 6dep_surfaces.log
mv FAD.pdb surfaces_structures/6dep_surfaces/
mv 6dep_bio-h_single_FAD.pdb surfaces_structures/med_structures/
mv 6dep_output.csv surfaces_structures/6dep_surfaces/
mv List_6dep_output.txt surfaces_structures/6dep_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/6dep_surfaces/
mv clean_6dep_bio-h_single_FAD.pdb surfaces_structures/6dep_surfaces/

