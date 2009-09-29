#!/usr/bin/perl -w
#

use strict;


my $test
    = {
       command_definitions => [
			       {
				arguments => [
					      '--help',
					     ],
				command => 'bin/neurospaces_build',
				command_tests => [
						  {
						   description => "Is a help message given ?",
						   read => "
neurospaces_build: configure, compile, check, install, tag and build
releases of packages selected from a set of packages.

neurospaces_build can operate in two modes: the default one is for a
client machine, assuming a user who tries to install the packages.
The second mode is for a developer who follows the Neurospaces
conventions where to put the src code of the packages.  The main
difference between the two modes is where this script finds the source
code.

neurospaces_build creates a matrix of packages (rows) and build operations
(columns).  neurospaces_build goes through the matrix, packages first, and
performs one build operation after the other for the selected package.
The options select or deselect cells in the matrix.

To find out what packages are in the database, use the '--packages'
option.  Disabled packages are not put in the matrix, enabled packages
are.  To disable packages, use the '--disable' option with a regex
argument.  To enable packages, use the '--enable' option with a regex
argument.  After building the matrix, rows are selected using
'--regex-selector' option, which by default selects all rows.

To find out about the known build operations, use '--help'.  To
disable a build operation, prefix the corresponding option with
'--no-', eg. to disable configure, use '--no-configure'.

options related to operation mode selection:
    client                 execute in client mode (for regular users, default).
    developer              execute in developer mode.

options related to operation execution profile:
    certification-report   annotate the (monotone) repository with the build_report.
    check                  check packages.
    clean                  clean before compiling.
    configure              configure before compiling.
    compile                compile packages.
    disable                explicitly disable these regex of packages in the configuration.
    dist                   build distribution tarballs.
    distcheck              check created tarballs.
    distclean              distclean before compiling.
    dry-run                do not execute any command, just report what would be done.
    enable                 explicitly enable these regex of packages in the configuration.
    help                   print usage information.
    help-all               print usage, all packages and all operations.
    install                install packages.
    packages               print known packages, in order of build.
    regex-selector         defines a regex to select specific packages.
    tag                    set this tag on all packages.
    uninstall              uninstall packages, cannot be combined with installation options.
    upload-server          enable uploading packages to this server (e.g. ftp://upload.sourceforge.net/incoming).
    v|verbose              tell what is being done, specify multiple times to get
                           more feedback.

options related to installation on a client machine:
    download-server        enable downloading packages from this server (e.g. downloads.sourceforge.net).
    src-tag                use this tag for finding src directories on a client machine.
    src-dir                use this dir as the base for directories on a client machine.

So on a client machine, for package xxx, the src are found in the
directory <src-dir>/xxx-<src-tag>.  From there the build starts as
usual.


options related to behavior of external applications:
    environment            fills in the environment, can be given multiple times.
                           e.g. environment NEUROSPACES_HARNESS_OPTION_EMAIL=1 generates emails for checks that fail.

---
certification-report!: 0
check!: 0
clean!: 0
client!: 1
compile!: 1
configure!: 1
developer!: 0
disable=s: ~
dist!: 0
distcheck!: 0
distclean!: 0
distkeywords!: 0
download-server=s: ~
dry-run!: 0
enable=s: ~
environment=s: []
help!: 1
help-all!: 0
install!: 1
packages: 0
regex-selector=s: .*
src-dir=s: ~
src-tag=s: ~
tag=s: 0
uninstall!: 0
upload-server=s: ~
verbose+: 0
",
						  },
						 ],
				description => "help message",
			       },
			       {
				arguments => [
					     ],
				command => 'bin/neurospaces_build',
				command_tests => [
						  {
						   description => "Is an error message given when invoking the build script without options ?",
						   read => "you must set option_src_dir and option_src_tag when working in client mode",
						  },
						 ],
				description => "no options",
			       },
			       {
				arguments => [
					      '--environment',
					      'NEUROSPACES_HARNESS_OPTION_EMAIL=1',
					      '--environment',
					      'a=b',
					      '--help',
					     ],
				command => 'bin/neurospaces_build',
				command_tests => [
						  {
						   description => "Can we set environment variables ?",
						   read => "
environment=s:
  - NEUROSPACES_HARNESS_OPTION_EMAIL=1
  - a=b
",
						  },
						 ],
				description => "help message",
			       },
			       {
				arguments => [
					      '--tag',
					      'build-10',
					      '--verbose',
					      '--verbose',
					      '--verbose',
					      '--no-compile',
					      '--no-configure',
					      '--no-install',
					      '--regex',
					      'developer',
					      '--enable',
					      'developer',
					      '--dry-run',
					     ],
				command => 'bin/neurospaces_build',
				command_tests => [
						  {
						   description => "Is an error message given when invoking the build script with wrong options ?",
						   read => "bin/neurospaces_build: examining package developer
bin/neurospaces_build: package developer [make distclean] skipped, condition_value is 0
bin/neurospaces_build: package developer [make dist-keywords && make clean && make clean] skipped, condition_value is 0
bin/neurospaces_build: package developer [test ! \"`mtn ls unknown && mtn ls missing && mtn ls changed`\" && release-expand '%package' '%release_major' '%release_minor' '%release_micro' '%release_major-%release_minor' hugo.cornelis\@gmail.com --verbose && make clean && make clean && mtn ci -m '1. Keywords only: build-10
' && test ! \"`mtn ls unknown && mtn ls missing && mtn ls changed`\"] preparing to execute 
bin/neurospaces_build: *** Error: you must set option_src_dir and option_src_tag when working in client mode",
						  },
						 ],
				description => "wrong options",
			       },
			      ],
       description => "build testing logic, and operations not specific to client or developer mode",
       name => 'global.t',
      };


return $test;


