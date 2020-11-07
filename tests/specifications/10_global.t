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
---
certification-report!: 0
check!: 0
clean!: 0
client!: 1
compile!: 1
configure!: 1
configure-type=s: release
configure-with-prefix!: 0
countcode=s: ~
developer!: 0
directories-create!: 0
disable=s: ~
dist!: 0
dist-dir=s: []
distcheck!: 0
distclean!: 0
distkeywords!: 0
docs!: 0
download-server=s: 0
dry-run!: 0
enable=s: ~
environment=s: []
help!: 1
help-all!: 0
help-build-order!: 0
help-descriptions!: 0
help-operations!: 0
help-packages!: 0
help-repositories!: ~
install!: 1
installed-versions!: 1
keep-going!: ~
package-disabled-included!: 0
package-tags=s: []
pkg-deb!: 0
pkg-deb-dir=s: 0
pkg-rpm!: 0
pkg-rpm-dir=s: 0
pkg-tar!: 0
pkg-tar-dir=s: 0
regex-selector=s: .*
release-tag=s: 0
repo-ci=s: 0
repo-clone=s: 0
repo-co!: 0
repo-diff!: 0
repo-history!: 0
repo-history-last=i: 2
repo-init!: 0
repo-keys!: 0
repo-migrate!: 0
repo-pull=s: 0
repo-push=s: 0
repo-revert!: 0
repo-serve!: 0
repo-setup!: 0
repo-status!: 0
repo-sync=s: 0
src-dir=s: ~
src-tag=s: ~
tag=s: 0
uninstall!: 0
universal!: 0
unpack!: ~
upload-server=s: ~
upstream-version=s: ~
verbose+: 0
version: ~
version=s: 0
website-prepare!: ~
website-upload!: ~


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

To find out what packages are in the database, use the '--help-packages'
option.  Disabled packages are not put in the matrix, enabled packages
are.  To disable packages, use the '--disable' option with a regex
argument.  To enable packages, use the '--enable' option with a regex
argument.  After building the matrix, rows are selected using
'--regex-selector' option, which by default selects all rows.

To find out about the known build operations, use '--help'.  To
disable a build operation, prefix the corresponding option with
'--no-', eg. to disable configure, use '--no-configure'.

options related to operation mode selection:
    --client                 execute in client mode (for regular users, default).
    --developer              execute in developer mode.

options related to operation execution profile:
    --certification-report      annotate the (monotone) repository with the build_report.
    --check                     check packages.
    --clean                     clean before compiling.
    --compile                   compile packages.
    --configure                 configure before compiling.
    --configure-with-prefix     configure with a hardcoded prefix.
    --configure-type            type of configuration (default is 'release').
    --countcode                 countcode at different times during the build.
    --describe                  describe the function of packages.
    --directories-create        create package directory structure.
    --disable                   explicitly disable this regex of packages in the configuration.
    --dist                      build distribution tarballs.
    --dist-dir                  distribution directories to copy the tarballs to?
    --distcheck                 check created tarballs.
    --distclean                 distclean before compiling.
    --distkeywords              do keyword expansion (be careful with this one).
    --docs                      generate docs during compilation.
    --dry-run                   do not execute any command, just report what would be done.
    --enable                    explicitly enable these regex of packages in the configuration.
    --help                      print usage information.
    --help-all                  print usage, all packages and all operations.
    --help-build-order          print information on software package build order.
    --help-descriptions         print descriptions of the function of packages.
    --help-operations           print known operations.
    --help-packages             print known packages, in order of build.
    --help-repositories         print known source code repositories.
    --install                   install packages.
    --installed-versions        print the installed version of each software package.
    --keep-going                keep going in case of non-fatal errors (ala make -k).
    --package-disabled-included also select disabled packages.
    --package-tags              select packages based on the given tag(s).
    --pkg-deb                   build debian packages for each software component.
    --pkg-deb-dir               Directory to place debian packages after a debian build.
    --pkg-rpm                   build RPM packages for each software component.
    --pkg-rpm-dir               Directory to place RPM packages after an RPM build.
    --pkg-tar                   build source tarballs for each software package.
    --pkg-tar-dir               Directory to place source tarballs into after creating a dist.
    --regex-selector            defines a regex to select specific packages.
    --release-tag               Sets a release tag for source code distribution.
    --repo-ci                   commit all modifications with the given changelog description.
    --repo-clone                checkout or update the workspace source code from a remote repository.
    --repo-co                   checkout or update the workspace source code from a local repository.
    --repo-diff                 show workspace differences against the local repository.
    --repo-init                 initialize those local repositories that do not exist yet.
    --repo-keys                 show public keys stored by version control systems.
    --repo-history              show locally stored history information of enabled software components.
    --repo-history-last         number of history records to show.
    --repo-pull                 pull the repositories from this server (e.g. repo-genesis3.cbi.utsa.edu).
    --repo-push                 push the repositories to this server (e.g. repo-genesis3.cbi.utsa.edu).
    --repo-serve                start the version control program in server mode to give others access to your code.
                                this will automatically fork processes as needed and return control to the terminal.
    --repo-setup                create a workspace interface to the version control repository if it does not exist yet.
    --repo-status               compare workspace with source code repository branch head.
    --repo-sync                 sync the repositories with this server (e.g. repo-genesis3.cbi.utsa.edu).
    --tag                       set this tag on all packages.
    --uninstall                 uninstall packages, cannot be combined with installation options.
    --universal                 sets flags for building universal binaries on Mac OS X.
    --upload-server             enable uploading packages to this server (e.g. https://frs.sourceforge.net/uploads).
    --version                   print version information.
    --version-tag               The software version for a source code distribution release.
    --v|verbose                 tell what is being done, specify multiple times to get more feedback.
    --website-prepare           prepare the website on your developer machine.
    --website-upload            upload the website to the webserver.

options related to installation on a client machine:
    --download-server           enable downloading packages from this server (e.g. downloads.sourceforge.net).
    --src-tag                   use this tag for finding src directories on a client machine.
    --src-dir                   use this dir as the base for directories on a client machine.

So on a client machine, for package xxx, the src are found in the
directory <src-dir>/xxx-<src-tag>.  From there the build starts as
usual.


options related to behavior of external applications:
    --environment               fills in the environment, can be given multiple times.
                                e.g. environment NEUROSPACES_HARNESS_OPTION_EMAIL=1 generates emails for tests that fail.

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
						   read => "bin/neurospaces_build: *** Error: you must set option_src_dir and option_src_tag when working in client mode",
						  },
						 ],
				description => "wrong options",
			       },
			      ],
       description => "build testing logic, and operations not specific to client or developer mode",
       documentation => {
                         explanation => "

The scripts to build a Neurospaces based simulator fetch specific
software packages from the Internet, compile them and integrate them
into a comprehensive simulator.  They are used to configure a computer
for simulator development, for running simulations and to configure a
simulation server.",

                         purpose => "This test module defines general tests that are not specific to
simulator users (client mode) or simulator developers (developer
mode).

    ",
                         },
       name => '10_global.t',
      };


return $test;


