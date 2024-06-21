#! /usr/bin/bash
mkdir -p surfaces_structures/6q94_surfaces
mv surfaces_structures/med_structures/6q94_bio-h_single_NAP.pdb .
python create_lig_file.py -f 6q94_bio-h_single_NAP.pdb -lig NAP &> 6q94_lig_create.log
python ligand_atomtypes.py -pdb NAP.pdb -def AMINO_FlexAID.def &> 6q94_lig_atomttypes.log
python clean_structure.py -f 6q94_bio-h_single_NAP.pdb -def custom_AMINO_FlexAID.def &> 6q94_clean_struct.log
python surface_cont_lig.py -f clean_6q94_bio-h_single_NAP.pdb -c DF -lig NAP -o 6q94_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 6q94_surfaces.log
mv NAP.pdb surfaces_structures/6q94_surfaces/
mv 6q94_bio-h_single_NAP.pdb surfaces_structures/med_structures/
mv 6q94_output.csv surfaces_structures/6q94_surfaces/
mv List_6q94_output.txt surfaces_structures/6q94_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/6q94_surfaces/
mv clean_6q94_bio-h_single_NAP.pdb surfaces_structures/6q94_surfaces/

