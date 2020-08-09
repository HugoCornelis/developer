#!/usr/bin/perl -w
#

use strict;


my $test
    = {
       command_definitions => [
			       {
				arguments => [
				    	      '.',
					     ],
				command => 'find',
				command_tests => [
						  {
						   comment => 'a free format comment for developers',
						   description => "Is the find_module in the output ?",
						   read => './tests/specifications/20_find_module.t
',
						  },
						 ],
				comment => "a free format comment for developers",
				description => "find command testing",
			       },
			       {
				arguments => [
				    	      '.', '.',
					     ],
				command => 'find',
				command_tests => [
						  {
						   description => "For testers: is the find_module in the output ?",
						   read => './tests/specifications/20_find_module.t
',
						  },
						  {
						   description => "Is the simple_examples_module in the output ?",
						   read => './tests/specifications/10_simple_examples_module.t
',
						  },
						 ],
				comment => "a single output can be read with consecutive statements",
				description => "find command testing",
			       },
			      ],
       comment => "this module provides example tests of the find command",
       description => "find module",
       name => '20_find_module.t',
      };


return $test;


