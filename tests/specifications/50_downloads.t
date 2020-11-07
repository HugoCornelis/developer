#!/usr/bin/perl -w
#

use strict;


my $test
    = {
       command_definitions => [
			       {
				arguments => [
					      '--download-server',
					      'downloads.sourceforge.net',
					      '--verbose',
					      '--verbose',
					      '--verbose',
					      '--check',
					      '--no-install',
					      '--regex',
					      'studio',
					      '--src-tag',
					      'build-37',
					      '--src-dir',
					      '/tmp/downloads.t/packages',
					     ],
				command => 'bin/neurospaces_build',
				command_tests => [
						  {
						   description => "Can we download packages from downloads.sourceforge.net, part 1 ?",
						   read => (join '', `cat $::global_config->{core_directory}/tests/specifications/strings/neurospaces_build--download-server--downloads.sourceforge.net--verbose--verbose--verbose--check--no-install--regex--studio--src-tag--build-37--src-dir--_tmp_downloads.t_packages__part1`),
						   timeout => 100,
						  },
						  {
						   description => "Can we download packages from downloads.sourceforge.net, part 2 ?",
						   read => (join '', `cat $::global_config->{core_directory}/tests/specifications/strings/neurospaces_build--download-server--downloads.sourceforge.net--verbose--verbose--verbose--check--no-install--regex--studio--src-tag--build-37--src-dir--_tmp_downloads.t_packages__part2`),
						   timeout => 100,
						  },
						  {
						   description => "Can we download packages from downloads.sourceforge.net, part 3 ?",
						   read => (join '', `cat $::global_config->{core_directory}/tests/specifications/strings/neurospaces_build--download-server--downloads.sourceforge.net--verbose--verbose--verbose--check--no-install--regex--studio--src-tag--build-37--src-dir--_tmp_downloads.t_packages__part3`),
						   timeout => 100,
						  },
						 ],
				comment => 'this test is disabled if no "default" route to the internet can be found, the "route" command must output a line with the text "default"',
				description => "download from the downloads.sourceforge.net server.",
				disabled => "this test depends on the use of monotone which we don't use anymore " . (`/sbin/route` =~ /default/ ? '' : 'no default route to the internet found'),
				preparation => {
						description => "Creating a subdirectory for execution of the test",
						preparer =>
						sub
						{
						    mkdir "/tmp/downloads.t";
						    mkdir "/tmp/downloads.t/packages";
						},
					       },
			       },
			       {
				arguments => [
					      '--download-server',
					      'downloads.neurospaces.org',
					      '--verbose',
					      '--verbose',
					      '--verbose',
					      '--no-install',
					      '--regex',
					      'developer',
					      '--enable',
					      'developer',
					      '--src-tag',
					      'build-37',
					      '--src-dir',
					      '/tmp/downloads.t/packages',
					      '--dry-run',
					     ],
				command => 'bin/neurospaces_build',
				command_tests => [
						  {
						   comment => 'the test of this output is plit in two part to avoid the use of regexes in the expected output, part 1.',
						   description => "Do we get an appropriate error message when attempting to download from a non-existent download server, part 1 ?",
						   read => "bin/neurospaces_build: examining package developer
bin/neurospaces_build: package developer [make distclean] skipped, condition_value is 0
bin/neurospaces_build: package developer [make dist-keywords && make clean && make clean] skipped, condition_value is 0
bin/neurospaces_build: package developer [test ! \"`mtn ls unknown && mtn ls missing && mtn ls changed`\" && release-expand '%package' '%release_major' '%release_minor' '%release_micro' '%release_major-%release_minor' hugo.cornelis\@gmail.com --verbose && make clean && make clean && mtn ci -m '1. Keywords only: 0
' && test ! \"`mtn ls unknown && mtn ls missing && mtn ls changed`\"] skipped, condition_value is 0
bin/neurospaces_build: package developer [mtn tag '%version' '0'] skipped, condition_value is 0
bin/neurospaces_build: package developer [putting the tag in the tag database] skipped, condition_value is 0
bin/neurospaces_build: package developer [downloading] preparing to execute 
bin/neurospaces_build: package developer [\$VAR1 = sub {
            use strict 'refs';
            my \$package_information = shift \@_;
            my \$description = \$\$package_information{'description'};
            my \$directory = \$\$package_information{'directory'};
            my \$filename = \$\$package_information{'filename'};
            my \$package_name = \$\$package_information{'package_name'};
            my \$url = \$\$package_information{'url'};
            mkdir \$directory;
            if (\$option_verbose > 1) {
                print \"\$0: package \$package_name [\$description from \$url to \$filename] executing\\n\";
            }
            my \$http_response = getstore(\$url, \$directory . '/' . \$filename);
            if (not is_success \$http_response) {
                warn \"\$0: *** Warning: \$description from \${option_download_server}: \$http_response\";
            }
        };
] not executed, dry_run is 1
bin/neurospaces_build: package developer [unpacking] preparing to execute 
bin/neurospaces_build: package developer [\$VAR1 = sub {
            use strict 'refs';
            my \$package_information = shift \@_;
            my \$description = \$\$package_information{'description'};
            my \$directory = \$\$package_information{'directory'};
            my \$filename = \$\$package_information{'filename'};
            my \$operations = \$\$package_information{'operations'};
            my \$package_name = \$\$package_information{'package_name'};
            chdir \$directory;
            operation_execute(\$operations, {'description', \$description, 'keywords', 0, 'package_name', \$package_name}, ['tar', 'xfvz', \$filename]);
        };
] not executed, dry_run is 1
bin/neurospaces_build: package developer [./configure] preparing to execute 
bin/neurospaces_build: package developer skipped, [./configure], directory (/tmp/downloads.t/packages/developer-build-37) not found, assuming this package source is not installed
bin/neurospaces_build: package developer [make clean] skipped, condition_value is 0
bin/neurospaces_build: package developer [make] preparing to execute 
bin/neurospaces_build: package developer skipped, [make], directory (/tmp/downloads.t/packages/developer-build-37) not found, assuming this package source is not installed
bin/neurospaces_build: package developer [make check] skipped, condition_value is 0
bin/neurospaces_build: package developer [export NEUROSPACES_RELEASE=1 && make dist] skipped, condition_value is 0
bin/neurospaces_build: package developer [export NEUROSPACES_RELEASE=1 && make distcheck] skipped, condition_value is 0
bin/neurospaces_build: package developer [make && sudo make install] skipped, condition_value is 0
bin/neurospaces_build: package developer [make clean && sudo make uninstall] skipped, condition_value is 0
bin/neurospaces_build: package developer [uploading] skipped, condition_value is 
bin/neurospaces_build: package developer [mtn cert '%version' -- build_report '%report'] skipped, condition_value is 0
bin/neurospaces_build: examining package model-container
bin/neurospaces_build: package model-container skipped, not selected using --regex-selector
bin/neurospaces_build: examining package heccer
bin/neurospaces_build: package heccer skipped, not selected using --regex-selector
bin/neurospaces_build: examining package dash
bin/neurospaces_build: package dash skipped, disabled is 1
bin/neurospaces_build: examining package ssp
bin/neurospaces_build: package ssp skipped, not selected using --regex-selector
bin/neurospaces_build: examining package geometry
bin/neurospaces_build: package geometry skipped, disabled is 1
bin/neurospaces_build: examining package studio
bin/neurospaces_build: package studio skipped, not selected using --regex-selector
bin/neurospaces_build: examining package project-browser
bin/neurospaces_build: package project-browser skipped, disabled is 1
---
client:
  OS: linux
description:
  command: bin/neurospaces_build
  name: Build report
global:
  status: Finished
  test_count: 0
operations:
  - operations: !!perl/code '{ \"DUMMY\" }'
    package_name: developer
  - operations: !!perl/code '{ \"DUMMY\" }'
    package_name: developer
options:
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
  download-server=s: downloads.neurospaces.org
  dry-run!: 1
  enable=s: developer
  environment=s: []
  help!: 0
  help-all!: 0
  install!: 0
  packages: 0
  regex-selector=s: developer
  src-dir=s: /tmp/downloads.t/packages
  src-tag=s: build-37
  tag=s: 0
  uninstall!: 0
  upload-server=s: ~
  verbose+: 3
",
						  },
						 ],
				description => "download from a non-existent download server.",
				disabled => "this test depends on the use of monotone which we don't use anymore " . (`/sbin/route` =~ /default/ ? '' : 'no default route to the internet found'),
			       },
			      ],
       description => "testing of download and consequent build operations",
       documentation => {
			 explanation => "

The script to build a Neurospaces based simulator supports download,
compilation and installation of external software components.

",
			 purpose => "This module tests the automated download and installation of a software component.",
			},
       name => '50_downloads.t',
      };


return $test;


