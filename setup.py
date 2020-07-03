#!/usr/bin/python3

import os

####

dir_path = os.path.dirname(os.path.realpath(__file__))

def run(cmd):
    print(f'SETUP : {cmd}')
    os.system(cmd)

####

print("Symlinking Config Files...")
print()

rootdir = "files"
for subdir, dirs, files in os.walk(rootdir):
    for file in files:
        filepath = subdir + os.sep + file

        cmd_mkdir = f'mkdir -p ~{subdir[5:]}'
        cmd_rm = f'rm ~{filepath[5:]}'
        cmd_ln = f'ln -s {dir_path}{os.sep}{filepath} ~{filepath[5:]}'

        run(cmd_mkdir)
        run(cmd_rm)
        run(cmd_ln)

print()
print("Done. Logout+login to trigger the goodness.")