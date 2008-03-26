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
						   read => (join '', `cat $::config->{core_directory}/tests/specifications/strings/neurospaces_build--tag-build-10--no-compile--no-configure--no-install--regex-developer--dry-run--developer--verbose--verbose--verbose.txt`),
						  },
						 ],
				description => "tag on the developer package, without any compiling and related, verbose dry run mode",
				disabled => 'because the mtn version always changes, this test needs regexes to get it to work',
			       },
			       {
				arguments => [
					      '--no-compile',
					      '--no-configure',
					      '--no-install',
					      '--regex',
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
						   read => (join '', `cat $::config->{core_directory}/tests/specifications/strings/neurospaces_build--no-compile--no-configure--no-install--regex-developer--dry-run--developer--verbose--verbose--verbose.txt`),
						  },
						 ],
				description => "operate on the developer package, without any compiling and related, verbose dry run mode",
			       },
			      ],
       description => "build testing in developer mode",
       name => 'developer.t',
      };


return $test;


