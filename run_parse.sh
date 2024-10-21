#!/bin/bash
input_path=$1
output_path=$2

python parse_multiple_chains.py --input_file=$input_path --output_path=$output_path

#  --ca_only