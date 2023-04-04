#! /usr/bin/env python3

import argparse
import glob
import os

class SlurmBIDS:
    
    def __init__(self, list=True, index1=1, bidsdir='BIDS_out',total=False):
        
        self.bidsdir = bidsdir
        sub_list = self.get_sub(self.bidsdir)
        
        if total:
            print(len(sub_list))
            exit(0)
    
        if list:
            print(sub_list)
            exit(0)
            
        print(sub_list[index1-1])
        pass
    
    def get_sub(self, dir, stub="sub-"):
        """
        Get the sub labels from the directory

        Args:
            dir (_type_): _description_
        """
        full_list = glob.glob(os.path.join(dir, f"{stub}*"))
        
        # just keep the basename
        sub_list = [ os.path.basename(path).split(stub)[1] for path in full_list]
        
        return sub_list
    
if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="""    
        Helper routines for running bids apps with slurm.

    """)

    """
    parser.add_argument("--start", type = int,
                        help="beginning file list index , default 0",
                        default = 0)
    parser.add_argument("--end", type = str,
                        help="end file list index, default None",
                        default=None)
    """
    parser.add_argument("--index", type = int,
                        help="index(1) into the subject list default 1",
                        default = 1)    
    parser.add_argument("--bids", type = str,
                     help="bids directory, default is BIDS_out",
                     default='BIDS_out') 
    parser.add_argument("--list", help="list the files to be processed",
                        action = "store_true",
                        default=False)
    parser.add_argument("--total", help="number of participant labels",
                        action = "store_true",
                        default=False)

    
    args = parser.parse_args()
    
    # setup default values
    """
    if args.end != None:
        args.end = int(args.end)
    """
    test = False
    if test:
        # test
        b = SlurmBIDS(list=args.list,
                      index1=args.index,
                      bidsdir = args.bids,
                      total = args.total
                      
                    )
        
    else:
        b = SlurmBIDS(list=args.list,
                      index1=args.index,
                      bidsdir = args.bids,
                      total = args.total
                  
                    )