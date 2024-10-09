#! /usr/bin/bash
mkdir -p surfaces_structures/4hfm_surfaces
mv surfaces_structures/med_structures/4hfm_bio-h_single_NAP.pdb .
python create_lig_file.py -f 4hfm_bio-h_single_NAP.pdb -lig NAP &> 4hfm_lig_create.log
python ligand_atomtypes.py -pdb NAP.pdb -def AMINO_FlexAID.def &> 4hfm_lig_atomttypes.log
python clean_structure.py -f 4hfm_bio-h_single_NAP.pdb -def custom_AMINO_FlexAID.def &> 4hfm_clean_struct.log
python surface_cont_lig.py -f clean_4hfm_bio-h_single_NAP.pdb -c B -lig NAP -o 4hfm_output.csv -def custom_AMINO_FlexAID.def -dat FlexAID.dat &> 4hfm_surfaces.log
mv NAP.pdb surfaces_structures/4hfm_surfaces/
mv 4hfm_bio-h_single_NAP.pdb surfaces_structures/med_structures/
mv 4hfm_output.csv surfaces_structures/4hfm_surfaces/
mv List_4hfm_output.txt surfaces_structures/4hfm_surfaces/
mv custom_AMINO_FlexAID.def surfaces_structures/4hfm_surfaces/
mv clean_4hfm_bio-h_single_NAP.pdb surfaces_structures/4hfm_surfaces/

