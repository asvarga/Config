#!/usr/bin/python3

import os
import sys

####

dirname = os.path.dirname
dir_path = dirname(dirname(os.path.realpath(__file__)))

def run(cmd):
    print(f'SETUP : {cmd}')
    os.system(cmd)    # comment out to experiment

####

root = sys.argv[1]
L = len(root)

print()
os.system(f'tree -a {root}')

print("Symlinking Config Files...")
print()

for subdir, dirs, files in os.walk(root):
    for file in files:
        filepath = subdir + os.sep + file

        cmd_mkdir = f'mkdir -p ~{subdir[L:]}'
        cmd_rm = f'rm ~{filepath[L:]}'
        cmd_ln = f'ln -s {dir_path}{os.sep}{filepath} ~{filepath[L:]}'

        run(cmd_mkdir)
        run(cmd_rm)
        run(cmd_ln)

print()
print("Done. Logout+login to trigger the goodness.")
