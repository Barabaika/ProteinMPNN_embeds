#!/bin/bash

method_name="swiss_v2"
echo $method_name

# folder_with_pdbs="../../data/${method_name}/"

output_dir="./embeds/${method_name}"

mkdir -p $output_dir
path_for_parsed_chains="${method_name}.jsonl"
# if [ ! -d $path_for_parsed_chains ]
# then
#     echo Start parsing pdbs
#     python ./helper_scripts/parse_multiple_chains.py --input_path=$folder_with_pdbs --output_path=$path_for_parsed_chains
# fi


echo Start proteinMPNN
CUDA_VISIBLE_DEVICES=1 python ./protein_mpnn_run.py \
        --jsonl_path $path_for_parsed_chains \
        --out_folder $output_dir \
        --seed 37 \
        --batch_size 1 \
        --get_encoder_embeds 1

        # --pdb_path $folder_with_pdbs \
        # --jsonl_path $path_for_parsed_chains \
