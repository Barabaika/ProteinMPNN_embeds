import argparse
import subprocess
import os
import re
import pickle
import pandas as pd
import numpy as np
from tqdm import tqdm


if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument("exp_path")
    parser.add_argument("output_csv")
    parser.add_argument("exp_name")
    args = parser.parse_args()

    scores=[]
    for s_file in os.listdir(os.path.join(args.exp_path, 'seqs')):
        with open(os.path.join(args.exp_path, 'seqs', s_file)) as f_in:
            first_line = f_in.readline()
        result = re.search(r"score=([^,]*),", first_line)
        scores.append(float(result.group(1)))
          
    print('exp:', args.exp_name, round(np.mean(scores), 3), '+-', round(np.std(scores), 3))

    res_df = pd.DataFrame({'scperp': scores})

    res_df.to_csv(args.output_csv, index = False)




    


        