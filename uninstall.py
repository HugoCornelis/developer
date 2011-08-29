#! /usr/bin/env python
"""

"""

import pdb
import os
import sys

try:
    
    from neurospaces.packages import PackageManager

except ImportError:

    print "Developer package is not installed."

package_manager = PackageManager(verbose=False)

package_manager.Uninstall('developer')

