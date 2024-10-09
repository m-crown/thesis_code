#! /usr/bin/bash
mkdir -p surfaces_structures/1v2p_surfaces
mv surfaces_structures/med_structures/1v2p_bio-h_single_ANH.pdb .
python create_lig_file.py -f 1v2p_bio-h_single_ANH.pdb -lig ANH &> 1v2p_lig_create.log
python ligand_atomtypes.py -pdb ANH.pdb -def AMINO_FlexAID.def &> 1v2p_lig_atomttypes.log
python clean_structure.py -f 1v2p_bio-h_single_ANH.pdb -def custom_AMINO_FlexAID.def &> 1v2p_clean_struct.log
python surface_cont_lig.py -f clean_1v2p_bio-h_single_ANH.pdb -c T -lig ANH -o 1v2p_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 1v2p_surfaces.log
mv ANH.pdb surfaces_structures/1v2p_surfaces/
mv 1v2p_bio-h_single_ANH.pdb surfaces_structures/med_structures/
mv 1v2p_output.csv surfaces_structures/1v2p_surfaces/
mv List_1v2p_output.txt surfaces_structures/1v2p_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/1v2p_surfaces/
mv clean_1v2p_bio-h_single_ANH.pdb surfaces_structures/1v2p_surfaces/

