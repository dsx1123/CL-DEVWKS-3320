import os
from pyats.easypy import run


def main():
    # Find the location of the script in relation to the job file
    testscript = 'test_vni.py'
    run(testscript=testscript)
