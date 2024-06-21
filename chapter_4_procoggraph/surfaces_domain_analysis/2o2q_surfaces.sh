#! /usr/bin/bash
mkdir -p surfaces_structures/2o2q_surfaces
mv surfaces_structures/med_structures/2o2q_bio-h_single_NAP.pdb .
python create_lig_file.py -f 2o2q_bio-h_single_NAP.pdb -lig NAP &> 2o2q_lig_create.log
python ligand_atomtypes.py -pdb NAP.pdb -def AMINO_FlexAID.def &> 2o2q_lig_atomttypes.log
python clean_structure.py -f 2o2q_bio-h_single_NAP.pdb -def custom_AMINO_FlexAID.def &> 2o2q_clean_struct.log
python surface_cont_lig.py -f clean_2o2q_bio-h_single_NAP.pdb -c C -lig NAP -o 2o2q_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 2o2q_surfaces.log
mv NAP.pdb surfaces_structures/2o2q_surfaces/
mv 2o2q_bio-h_single_NAP.pdb surfaces_structures/med_structures/
mv 2o2q_output.csv surfaces_structures/2o2q_surfaces/
mv List_2o2q_output.txt surfaces_structures/2o2q_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/2o2q_surfaces/
mv clean_2o2q_bio-h_single_NAP.pdb surfaces_structures/2o2q_surfaces/

