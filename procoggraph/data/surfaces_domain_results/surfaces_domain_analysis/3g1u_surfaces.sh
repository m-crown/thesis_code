#! /usr/bin/bash
mkdir -p surfaces_structures/3g1u_surfaces
mv surfaces_structures/med_structures/3g1u_bio-h_single_ADN.pdb .
python create_lig_file.py -f 3g1u_bio-h_single_ADN.pdb -lig ADN &> 3g1u_lig_create.log
python ligand_atomtypes.py -pdb ADN.pdb -def AMINO_FlexAID.def &> 3g1u_lig_atomttypes.log
python clean_structure.py -f 3g1u_bio-h_single_ADN.pdb -def custom_AMINO_FlexAID.def &> 3g1u_clean_struct.log
python surface_cont_lig.py -f clean_3g1u_bio-h_single_ADN.pdb -c D -lig ADN -o 3g1u_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 3g1u_surfaces.log
mv ADN.pdb surfaces_structures/3g1u_surfaces/
mv 3g1u_bio-h_single_ADN.pdb surfaces_structures/med_structures/
mv 3g1u_output.csv surfaces_structures/3g1u_surfaces/
mv List_3g1u_output.txt surfaces_structures/3g1u_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/3g1u_surfaces/
mv clean_3g1u_bio-h_single_ADN.pdb surfaces_structures/3g1u_surfaces/

