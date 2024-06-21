#! /usr/bin/bash
mkdir -p surfaces_structures/2y5l_surfaces
mv surfaces_structures/minor_structures/2y5l_bio-h_single_RO8.pdb .
python create_lig_file.py -f 2y5l_bio-h_single_RO8.pdb -lig RO8 &> 2y5l_lig_create.log
python ligand_atomtypes.py -pdb RO8.pdb -def AMINO_FlexAID.def &> 2y5l_lig_atomttypes.log
python clean_structure.py -f 2y5l_bio-h_single_RO8.pdb -def custom_AMINO_FlexAID.def &> 2y5l_clean_struct.log
python surface_cont_lig.py -f clean_2y5l_bio-h_single_RO8.pdb -c AC -lig RO8 -o 2y5l_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 2y5l_surfaces.log
mv RO8.pdb surfaces_structures/2y5l_surfaces/
mv 2y5l_bio-h_single_RO8.pdb surfaces_structures/minor_structures/
mv 2y5l_output.csv surfaces_structures/2y5l_surfaces/
mv List_2y5l_output.txt surfaces_structures/2y5l_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/2y5l_surfaces/
mv clean_2y5l_bio-h_single_RO8.pdb surfaces_structures/2y5l_surfaces/

