"""
Module for 
"""

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
    Performs diagnostic management of installed GENESIS3 packages.
    """
    
    def __int__(self):


        self.installed_packages = []

#---------------------------------------------------------------------------

    def GetInstalledPackages(self):

        return self.installed_packages
    
#---------------------------------------------------------------------------

