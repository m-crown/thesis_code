#! /usr/bin/bash
mkdir -p surfaces_structures/2ag1_surfaces
mv surfaces_structures/minor_structures/2ag1_bio-h_single_TPP.pdb .
python create_lig_file.py -f 2ag1_bio-h_single_TPP.pdb -lig TPP &> 2ag1_lig_create.log
python ligand_atomtypes.py -pdb TPP.pdb -def AMINO_FlexAID.def &> 2ag1_lig_atomttypes.log
python clean_structure.py -f 2ag1_bio-h_single_TPP.pdb -def custom_AMINO_FlexAID.def &> 2ag1_clean_struct.log
python surface_cont_lig.py -f clean_2ag1_bio-h_single_TPP.pdb -c AB -lig TPP -o 2ag1_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 4l9z_surfaces.log
mv TPP.pdb surfaces_structures/2ag1_surfaces/
mv 2ag1_bio-h_single_TPP.pdb surfaces_structures/minor_structures/
mv 2ag1_output.csv surfaces_structures/2ag1_surfaces/
mv List_2ag1_output.txt surfaces_structures/2ag1_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/2ag1_surfaces/
mv clean_2ag1_bio-h_single_TPP.pdb surfaces_structures/2ag1_surfaces/

