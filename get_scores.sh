#!/bin/bash


# in_folder="/mnt/nfs_protein/shevtsov/progen_parsed"
# for temp in 0.5 0.6 0.7 0.8 0.9 1 1.1
# do
#     for p in 0.5 0.6 0.7 0.8 0.9 1
#     do
#         exp="temp_${temp}_p_${p}"

#         echo "Start_$exp"
#         path_for_parsed_chains="${in_folder}/${exp}.jsonl"
#         output_dir="progen_samples/${exp}"

#         echo Start proteinMPNN
#         CUDA_VISIBLE_DEVICES=1 python ./protein_mpnn_run.py \
#                 --jsonl_path $path_for_parsed_chains \
#                 --out_folder $output_dir \
#                 --seed 37 \
#                 --batch_size 1 \
#                 --save_score 1
#     done
# done
#             # --pdb_path $folder_with_pdbs \
#             # --jsonl_path $path_for_parsed_chains \

# in_folder="/disk/10tb/home/shevtsov/ProteinMPNN/swissprot_60_512_80k_sample_PDBs/"
# for noise in 0
# do
#     exp="swiss60-512_noise${noise}_4096"

#     echo "Start_$exp"
#     path_for_parsed_chains="${in_folder}/${exp}.jsonl"
#     output_dir="${exp}"

#     echo Start proteinMPNN
#     CUDA_VISIBLE_DEVICES=1 python ./protein_mpnn_run.py \
#             --jsonl_path $path_for_parsed_chains \
#             --out_folder $output_dir \
#             --seed 37 \
#             --batch_size 1 \
#             --save_score 1

# done

# in_folder="/disk/10tb/home/shevtsov/ProteinMPNN/baselines_parsed"
# for exp_path in ${in_folder}/encoders-comp-150M* 
for exp_path in ./inputs_new_part/DIMA_* ./inputs_new_part/dplm-swissprot*
do
    # exp="swiss60-512_noise${noise}_4096"
    exp=$(basename ${exp_path%.*})

    echo "Start_$exp"
    # path_for_parsed_chains="${in_folder}/${exp}.jsonl"
    path_for_parsed_chains=${exp_path}
    output_dir="${exp}"

    echo Start proteinMPNN
    
    python ./protein_mpnn_run.py \
            --jsonl_path $path_for_parsed_chains \
            --out_folder $output_dir \
            --seed 37 \
            --batch_size 1 \
            --save_score 1

done
