#!/bin/bash


files_folder="/mnt/10tb/home/shevtsov/ProteinMPNN_embeds/swiss_v2/found.txt"

exp="swiss_v2"
# mkdir -p ${exp}_tmp

# parallel \
#     -j 15 \
#     ./run_parse.sh {} ${exp}_tmp :::: $files_folder


# cat ./${exp}_tmp/* > ${exp}.jsonl
# # rm  -r ./${exp}_tmp
# wait
# echo "Done_${exp}"

touch ${exp}.jsonl
while read pdb_path; do
    pdb_id=$(basename ${pdb_path%.*})
    cat ./${exp}_tmp/${pdb_id}.jsonl >> ${exp}.jsonl
done < $files_folder