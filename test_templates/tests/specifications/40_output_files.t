#!/usr/bin/perl -w
#

use strict;


my $test
    = {
       command_definitions => [
			       {
				arguments => [
					      '-c',
				    	      'echo >/tmp/output_file.txt This text is put in an output file',
					     ],
				command => 'bash',
				command_tests => [
						  {
						   description => "For testers: is the text found in the output file ?",
						   read => {
							    application_output_file => '/tmp/output_file.txt',
							    expected_output_file => "./tests/specifications/strings/output_file.txt",
							   },
						  },
						 ],
				description => "output file testing",
			       },
			      ],
       comment => "This module provides example tests with output files.
For more elaborate examples, such as web site interaction and numerical comparisons,
please take a look at the test suite of the Neurospaces Development project tools.",
       description => "output_files module",
       name => '40_output_files.t',
      };


return $test;


