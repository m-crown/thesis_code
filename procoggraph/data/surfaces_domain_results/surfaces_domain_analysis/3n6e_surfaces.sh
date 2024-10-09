#! /usr/bin/bash
mkdir -p surfaces_structures/3n6e_surfaces
mv surfaces_structures/minor_structures/3n6e_bio-h_single_HEM.pdb .
python create_lig_file.py -f 3n6e_bio-h_single_HEM.pdb -lig HEM &> 3n6e_lig_create.log
python ligand_atomtypes.py -pdb HEM.pdb -def AMINO_FlexAID.def &> 3n6e_lig_atomttypes.log
python clean_structure.py -f 3n6e_bio-h_single_HEM.pdb -def custom_AMINO_FlexAID.def &> 3n6e_clean_struct.log
python surface_cont_lig.py -f clean_3n6e_bio-h_single_HEM.pdb -c A -lig HEM -o 3n6e_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 3n6e_surfaces.log
mv HEM.pdb surfaces_structures/3n6e_surfaces/
mv 3n6e_bio-h_single_HEM.pdb surfaces_structures/minor_structures/
mv 3n6e_output.csv surfaces_structures/3n6e_surfaces/
mv List_3n6e_output.txt surfaces_structures/3n6e_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/3n6e_surfaces/
mv clean_3n6e_bio-h_single_HEM.pdb surfaces_structures/3n6e_surfaces/

