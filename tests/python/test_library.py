"""
A test library of functions and classes
for running developer tests from python.

"""

import os
import sys
import pdb

# This is borrowed from django's setup tools
def fullsplit(path, result=None):
    """
    Split a pathname into components (the opposite of os.path.join) in a
    platform-neutral way.
    """
    if result is None:
        result = []
    head, tail = os.path.split(path)
    if head == '':
        return [tail] + result
    if head == path:
        return result
    return fullsplit(head, [tail] + result)


def add_developer_path(package='developer', subdir=''):
    """
    Adds an import path to a python module in a project directory.
    """

    path = os.path.join(os.environ['HOME'],
                        'neurospaces_project',
                        package,
                        'source',
                        'snapshots',
                        '0',
                        'python',
                        subdir)


    build_dir = os.path.join(path, 'build')

    python_build = ""
    parts = []

    if os.path.exists(build_dir):

        for curr_dir, directories, files in os.walk( build_dir ):

            if os.path.isfile( os.path.join( curr_dir, '__cbi__.py' )):

                parts = list(fullsplit(curr_dir))

                parts.pop() # remove the neurospaces path

                python_build = os.path.join(os.sep, os.path.join(*parts))
                sys.path.append(python_build)


    # Add paths
    sys.path.append(path)

