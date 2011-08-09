#! /usr/bin/env python
"""

"""
import pdb
import os
import sys

from test_library import add_developer_path

add_developer_path()

from neurospaces.packages import PackageManager

pm = PackageManager(directory='tests/python/test_dir/neurospaces')


print "Done!"

