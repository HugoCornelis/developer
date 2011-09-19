#! /usr/bin/env python
"""

"""

import pdb
import os
import sys

#
# Since the current directory is part of sys.path
# uninstall.py must check for it and remove it, otherwise
# it will delete the neurospaces directory in the source
# directory.
#
_this_directory =  os.path.dirname(os.path.abspath(__file__))

try:

    sys.path.remove(_this_directory)

except ValueError, e:

    print "The current directory is not in the system path"


try:

    sys.path.remove('.')

except ValueError:

    pass



def remove_egg(module_name):
    """
    finds all easy path files, collects all paths to eggs that
    are installed and removes all of them.
    """
    from commands import getoutput
    import glob
    
    installs = []

    for path in sys.path:

        # Check for an easy-install.pth file and a module with the name

        easy_install_file = os.path.join(path, 'easy-install.pth')
                                         
        found_eggs = glob.glob("%s%s%s*.egg" % (path, os.sep, module_name))
        
        if os.path.isfile(easy_install_file) and  len(found_eggs) > 0:

            installs.append(dict(pth_file=easy_install_file,
                                 eggs=found_eggs))


    if len(installs) == 0:

        print "No python eggs found."

        return

    else:
        
        print "Found %d python eggs installed" % len(installs)

        for inst in installs:

            pth_file = inst['pth_file']
            eggs = inst['eggs']
            
            # First remove the egg

            for egg in eggs:
                
                print "Deleting egg: %s" % egg

                if os.access(egg, os.W_OK):

                    cmdout = getoutput("rm -rf %s" % egg)

                else:

                    cmdout = getoutput("sudo rm -rf %s" % egg)

        
        



try:
    
    from neurospaces.packages import PackageManager

except ImportError:

    print "Neurospaces packages are not installed."
    
    sys.exit(0)

package_manager = PackageManager(verbose=False)

try:
    
    package_manager.uninstall('neurospaces')

except Exception, e:

    print "Can't uninstall developer: %s" % e
