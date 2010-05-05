dnl
dnl The neurospaces project : modeling tools for computational
dnl neuroscience.
dnl

dnl ##########################################################################
dnl 
dnl The neurospaces project
dnl 
dnl Copyright (C) 2007-2008 Hugo Cornelis
dnl 
dnl Hugo Cornelis, hugo.cornelis@gmail.com
dnl 
dnl ##########################################################################

# Process this file with autoconf to produce a configure script.

AC_PREREQ(2.59)

# $Format: "AC_INIT(${package}, ${label}, ${email})"$
AC_INIT(developer, 9c734da6d4dde7019fde86c5924215fa518a1d80-0, hugo.cornelis@gmail.com)

AC_CONFIG_SRCDIR([Makefile.am])

dnl dnl all subdirs

dnl AC_CONFIG_SUBDIRS()

# $Format: "AM_INIT_AUTOMAKE(${package}, ${label})"$
AM_INIT_AUTOMAKE(developer, 9c734da6d4dde7019fde86c5924215fa518a1d80-0)

# Checks for programs.

#   need to have this bail out when MTN = NULL
#   since it's required. 
AC_CHECK_PROGS([MTN],mtn monotone,[NULL])

#   check for packaging programs for debian and red hat.
#   no need to bail out if these are missing since they're optional. 
AC_CHECK_PROGS([DPKG_BUILDPACKAGE],dpkg-buildpackage,[NULL])
AC_CHECK_PROGS([DH],dh,[NULL])
AC_CHECK_PROGS([RPMBUILD],rpmbuild,[NULL])

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

# determine the test library to install

TEST_SPECIFICATION_FILES=`/bin/echo -n "tests/introduction.html " && find tests/specifications -name "*.t" | perl -pe 's/\n/ /g' && find tests/specifications/strings -name "*.txt" | perl -pe 's/\n/ /g' && find tests/data -name "*.yml" | perl -pe 's/\n/ /g'`
AC_SUBST(TEST_SPECIFICATION_FILES)


AC_CONFIG_FILES([Makefile])
AC_OUTPUT

