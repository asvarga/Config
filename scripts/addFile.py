#!/usr/bin/python3

import os
import sys

####

dir_path = os.path.dirname(os.path.realpath(__file__))

def run(cmd):
    print(f'ADDFILE : {cmd}')
    os.system(cmd)

####

for arg in sys.argv[1:]:
    cmd_cp = f'cp ~/{arg} ./files/{arg}'
    run(cmd_cp)