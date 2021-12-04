#!/usr/bin/python3

import os
import sys

####

dir_path = os.path.dirname(os.path.realpath(__file__))

def run(cmd):
    print(f'ADDFILE : {cmd}')
    os.system(cmd)

####

root = sys.argv[1]

for arg in sys.argv[2:]:
    # FIXME: make directories as necessary, like in setup.py
    cmd_cp = f'cp ~/{arg} ./{root}/{arg}'
    run(cmd_cp)