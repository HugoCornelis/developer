#! /usr/bin/env python
"""

"""
import pdb
import os
import sys

from test_library import add_developer_path

add_developer_path()

from neurospaces.packages import PackageManager

package_manager = PackageManager(directory="tests/python/test_dir/neurospaces",
                                 verbose=False)


from neurospaces.shell import PackageShell
    
package_shell = PackageShell(package_manager=package_manager)

package_shell.cmdloop()
