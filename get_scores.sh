#!/bin/bash

exp_name=$1
pdbs_folder=$2
outdir=$3
n_procs=$4

path_for_parsed_chains=${exp_name}.jsonl
res_folder="${outdir}/${exp_name}"

echo "Start_$exp_name"

# parse pdbs in parrallel
./run_parse_par.sh $exp_name $pdbs_folder $n_procs

echo Start proteinMPNN
python ./protein_mpnn_run.py \
        --jsonl_path $path_for_parsed_chains \
        --out_folder $res_folder \
        --seed 37 \
        --batch_size 1 \
        --save_score 1 \
        --suppress_print 1

python parse_scores.py \
    $res_folder \
    ${res_folder}/${exp_name}_scperp.csv \
    ${exp_name}

rm ${exp_name}.jsonl

