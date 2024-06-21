#! /usr/bin/bash
mkdir -p surfaces_structures/3udm_surfaces
mv surfaces_structures/minor_structures/3udm_bio-h_single_09A.pdb .
python create_lig_file.py -f 3udm_bio-h_single_09A.pdb -lig 09A &> 3udm_lig_create.log
python ligand_atomtypes.py -pdb 09A.pdb -def AMINO_FlexAID.def &> 3udm_lig_atomttypes.log
python clean_structure.py -f 3udm_bio-h_single_09A.pdb -def custom_AMINO_FlexAID.def &> 3udm_clean_struct.log
python surface_cont_lig.py -f clean_3udm_bio-h_single_09A.pdb -c A -lig 09A -o 3udm_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 3udm_surfaces.log
mv 09A.pdb surfaces_structures/3udm_surfaces/
mv 3udm_bio-h_single_09A.pdb surfaces_structures/minor_structures/
mv 3udm_output.csv surfaces_structures/3udm_surfaces/
mv List_3udm_output.txt surfaces_structures/3udm_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/3udm_surfaces/
mv clean_3udm_bio-h_single_09A.pdb surfaces_structures/3udm_surfaces/

