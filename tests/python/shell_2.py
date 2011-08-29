#! /usr/bin/env python
"""

"""
import pdb
import os
import sys


from neurospaces.packages import PackageManager

package_manager = PackageManager(verbose=False)


from neurospaces.shell import PackageShell
    
package_shell = PackageShell(package_manager=package_manager)

package_shell.cmdloop()
