#!/usr/bin/env python
"""
class for performing uninstallations of genesis 3 components.
Derived from the uninstall script from wxPython.
"""

import sys, os, glob
from fnmatch import fnmatchcase
import cPickle, urllib

#---------------------------------------------------------------------------


RCPTDIR = "/Library/Receipts"
RSRCDIR = "Contents/Resources"

# Only completly clean out dirs that have one of these as a prefix.
# We do this because the file list returned from lsbom will include /,
# /usr, /usr/local, etc.
MAC_PREFIXES = [ '/Library/Python/2.3/',
             '/Library/Python/2.4/',
             '/Library/Python/2.5/',
             '/Library/Frameworks/Python.framework/Versions/2.3/lib/python2.3/site-packages/',
             '/Library/Frameworks/Python.framework/Versions/2.4/lib/python2.4/site-packages/',
             '/Library/Frameworks/Python.framework/Versions/2.5/lib/python2.5/site-packages/',
             '/usr/local/lib/',
             ]

# The files that match one of the items in this list will only be
# removed if the last installation of wxPython on the system is being
# uninstalled.
COMMON_FILES = [ '/usr/local/bin/*',
                 'wx.pth',
                 'wxversion.py',
                 ]


#---------------------------------------------------------------------------


def findInstalled():
    installed = []
    for name in glob.glob(os.path.join(RCPTDIR, "wxPython*")):
        try:
            ir = InstalledReceipt(name)
            installed.append(ir)
        except ReceiptError:
            pass  # just skip it...

    return installed

#---------------------------------------------------------------------------

class PackageManager:
    """
    Performs diagnostic management of installed GENESIS3 packages. The PackageManager
    operates under the assumption that it is the root directory for for all neurospaces
    packages like so:

        neurospaces.heccer
        neurospaces.model_container
        neurospaces.experiment

    It searches for the __cbi__.py identifier file located in each independent package
    and compiles a list with the info and install location.
    """
    
    def __init__(self, directory=os.path.join( os.path.dirname(os.path.abspath(__file__))),
                 identifier="__cbi__.py",
                 verbose=False):

        self.root_directory = directory

        self.identifier = identifier
                
        self.installed_packages = []

#---------------------------------------------------------------------------

    def GetInstalledPackages(self):

        return self.installed_packages

#---------------------------------------------------------------------------

    def FindInstalled(self):
        """

        """
        
        for path, directories, files in os.walk( self._root_directory ):
            
            if os.path.isfile( os.path.join( path, self.identifier )):
                
                cbi_identifier = os.path.join(path, self.identifier)

                

    
#---------------------------------------------------------------------------

