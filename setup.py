#!/usr/bin/python3

import os

####

print("Symlinking Config Files...")
print()

def run(cmd):
    print(f'SETUP : {cmd}')
    os.system(cmd)

rootdir = "files"
for subdir, dirs, files in os.walk(rootdir):
    for file in files:
        filepath = subdir + os.sep + file

        cmd_mkdir = f'mkdir -p ~{subdir[5:]}'
        cmd_rm = f'rm ~{filepath[5:]}'
        cmd_ln = f'ln -s {filepath} ~{filepath[5:]}'

        run(cmd_mkdir)
        run(cmd_rm)
        run(cmd_ln)

print()
print("Done. Logout+login to trigger the goodness.")