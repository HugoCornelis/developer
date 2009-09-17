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
AC_INIT(installer, a599718d1a785a98621afb049aa70b206151590c-0, hugo.cornelis@gmail.com)

AC_CONFIG_SRCDIR([Makefile.am])

dnl dnl all subdirs

dnl AC_CONFIG_SUBDIRS()

# $Format: "AM_INIT_AUTOMAKE(${package}, ${label})"$
AM_INIT_AUTOMAKE(installer, a599718d1a785a98621afb049aa70b206151590c-0)

# Checks for programs.

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

# determine the test library to install

TEST_SPECIFICATION_FILES=`/bin/echo -n "tests/introduction.html " && find tests/specifications -name "*.t" | perl -pe 's/\n/ /g' && find tests/specifications/strings -name "*.txt" | perl -pe 's/\n/ /g' && find tests/data -name "*.yml" | perl -pe 's/\n/ /g'`
AC_SUBST(TEST_SPECIFICATION_FILES)


AC_CONFIG_FILES([Makefile])
AC_OUTPUT

