#! /usr/bin/bash
mkdir -p surfaces_structures/6ngu_surfaces
mv surfaces_structures/minor_structures/6ngu_bio-h_single_HEM.pdb .
python create_lig_file.py -f 6ngu_bio-h_single_HEM.pdb -lig HEM &> 6ngu_lig_create.log
python ligand_atomtypes.py -pdb HEM.pdb -def AMINO_FlexAID.def &> 6ngu_lig_atomttypes.log
python clean_structure.py -f 6ngu_bio-h_single_HEM.pdb -def custom_AMINO_FlexAID.def &> 6ngu_clean_struct.log
python surface_cont_lig.py -f clean_6ngu_bio-h_single_HEM.pdb -c A -lig HEM -o 6ngu_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 6ngu_surfaces.log
mv HEM.pdb surfaces_structures/6ngu_surfaces/
mv 6ngu_bio-h_single_HEM.pdb surfaces_structures/minor_structures/
mv 6ngu_output.csv surfaces_structures/6ngu_surfaces/
mv List_6ngu_output.txt surfaces_structures/6ngu_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/6ngu_surfaces/
mv clean_6ngu_bio-h_single_HEM.pdb surfaces_structures/6ngu_surfaces/

