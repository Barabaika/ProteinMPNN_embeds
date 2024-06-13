#!/bin/bash


method_name="test_pdbs"
echo $method_name
folder_with_pdbs="../../data/${method_name}/"
# folder_with_pdbs="/mnt/nfs_protein/${method_name}/"

output_dir="../../data/proteinMPNN_embeds/${method_name}"
# output_dir="test_output"
if [ ! -d $output_dir ]
then
    mkdir -p $output_dir
fi

path_for_parsed_chains="${output_dir}/parsed_pdbs.jsonl"
if [ ! -d $path_for_parsed_chains ]
then
    echo Start parsing pdbs
    python ./helper_scripts/parse_multiple_chains.py --input_path=$folder_with_pdbs --output_path=$path_for_parsed_chains
fi


echo Start proteinMPNN
CUDA_VISIBLE_DEVICES=0 python ./protein_mpnn_run.py \
        --jsonl_path $path_for_parsed_chains \
        --out_folder $output_dir \
        --seed 37 \
        --batch_size 1 \
        --unconditional_probs_only 1

        # --pdb_path $folder_with_pdbs \
        # --jsonl_path $path_for_parsed_chains \
