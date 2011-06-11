"""
@file __cbi__.py

This file provides data for a packages integration
into the CBI architecture.
"""

__author__ = "Mando Rodriguez"
__copyright__ = "Copyright 2010, The GENESIS Project"
__credits__ = ["Hugo Cornelis", "Dave Beeman"]
__license__ = "GPL"
__version__ = "0.1"
__maintainer__ = "Mando Rodriguez"
__email__ = "rodrigueza14@uthscsa.edu"
__status__ = "Development"
__url__ = "http://genesis-sim.org"
__description__ = """
This is the root management module for GENESIS. GENESIS is composed of several
sub packages for reading and storing models, solvers, experimental protocols,
and GUI interfaces. The root 'g3' package helps to determine which versions of
packages are installed and performs updates, removal, and installation of needed
packages to run a simulation. 
"""
__download_url__ = "http://repo-genesis3.cbi.utsa.edu"

def GetRevisionInfo():
# $Format: "    return \"${monotone_id}\""$
    return "52c2061c7bbeb32dba95fbdf5400d251c80dd663"

def GetPackageName():
# $Format: "    return \"${package}\""$
    return "developer"

def GetVersion():
# $Format: "    return \"${major}.${minor}.${micro}-${label}\""$
    return "0.0.0-alpha"

def GetDependencies():
    """!
    @brief Provides a list of other CBI dependencies needed.
    """
    dependencies = []

    return dependencies
