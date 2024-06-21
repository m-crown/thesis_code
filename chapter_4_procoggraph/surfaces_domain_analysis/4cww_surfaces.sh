#! /usr/bin/bash
mkdir -p surfaces_structures/4cww_surfaces
mv surfaces_structures/minor_structures/4cww_bio-h_single_HEM.pdb .
python create_lig_file.py -f 4cww_bio-h_single_HEM.pdb -lig HEM &> 4cww_lig_create.log
python ligand_atomtypes.py -pdb HEM.pdb -def AMINO_FlexAID.def &> 4cww_lig_atomttypes.log
python clean_structure.py -f 4cww_bio-h_single_HEM.pdb -def custom_AMINO_FlexAID.def &> 4cww_clean_struct.log
python surface_cont_lig.py -f clean_4cww_bio-h_single_HEM.pdb -c A -lig HEM -o 4cww_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 4cww_surfaces.log
mv HEM.pdb surfaces_structures/4cww_surfaces/
mv 4cww_bio-h_single_HEM.pdb surfaces_structures/minor_structures/
mv 4cww_output.csv surfaces_structures/4cww_surfaces/
mv List_4cww_output.txt surfaces_structures/4cww_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/4cww_surfaces/
mv clean_4cww_bio-h_single_HEM.pdb surfaces_structures/4cww_surfaces/

