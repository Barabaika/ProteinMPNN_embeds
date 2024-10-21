#!/bin/bash

exp_name=$1
pdbs_folder=$2
n_procs=$3

find ${pdbs_folder}/* > ${exp_name}_pdbs.txt

mkdir -p ${exp_name}_tmp

parallel \
    -j $n_procs \
    ./run_parse.sh {} ${exp_name}_tmp :::: ${exp_name}_pdbs.txt
wait

touch ${exp_name}.jsonl
while read pdb_path; do
    pdb_id=$(basename ${pdb_path%.*})
    cat ./${exp_name}_tmp/${pdb_id}.jsonl >> ${exp_name}.jsonl
done < ${exp_name}_pdbs.txt
# cat ./${exp_name}_tmp/* > ${exp_name}.jsonl

rm  -r ./${exp_name}_tmp ${exp_name}_pdbs.txt
echo "parsed ${exp_name}"