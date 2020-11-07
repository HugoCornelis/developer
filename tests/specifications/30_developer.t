#!/usr/bin/perl -w
#

use strict;


my $test
    = {
       command_definitions => [
			       {
				arguments => [
					      '--tag',
					      'build-10',
					      '--no-compile',
					      '--no-configure',
					      '--no-install',
					      '--regex',
					      'developer',
					      '--enable',
					      'developer',
					      '--dry-run',
					      '--developer',
					      '--verbose',
					      '--verbose',
					      '--verbose',
					     ],
				command => 'bin/neurospaces_build',
				command_tests => [
						  {
						   description => "Can we set a tag on the developer package, without any compiling and related, verbose dry run mode ?",
						   read => (join '', `cat $::global_config->{core_directory}/tests/specifications/strings/neurospaces_build--tag-build-10--no-compile--no-configure--no-install--regex-developer--dry-run--developer--verbose--verbose--verbose.txt`),
						  },
						 ],
				description => "tag the developer package, without compilation nor installation, verbose dry run mode",
				disabled => 'because the mtn version always changes, this test needs regexes to get it to work',
			       },
			       {
				arguments => [
					      '--no-compile',
					      '--no-configure',
					      '--no-install',
					      '--regex',
					      'developer',
					      '--enable',
					      'developer',
					      '--dry-run',
					      '--developer',
					      '--verbose',
					      '--verbose',
					      '--verbose',
					     ],
				command => 'bin/neurospaces_build',
				command_tests => [
						  {
						   description => "Can we operate on the developer package, without any compiling and related, verbose dry run mode ?",
						   read => (join '', `cat $::global_config->{core_directory}/tests/specifications/strings/neurospaces_build--no-compile--no-configure--no-install--regex-developer--dry-run--developer--verbose--verbose--verbose.txt`),
						  },
						 ],
				description => "operate on the developer package, without any compiling and related, verbose dry run mode",
				disabled => 'this test can only work on PCs that have only neurospaces installed and nothing else',
			       },
			      ],
       description => "build testing in developer mode",
       documentation => {
			 explanation => "

The script to build a Neurospaces based simulator implements specific
operations that supports the development of single software
components.  After development it is also used to build new release
versions of these components.  Version control and tags are used to
reconstruct binary packages from source code.

",
			 purpose => "Tagging and releasing.",
			},
       name => '30_developer.t',
      };


return $test;


