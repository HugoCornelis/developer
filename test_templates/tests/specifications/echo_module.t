#!/usr/bin/perl -w
#

use strict;


my $test
    = {
       command_definitions => [
			       {
				arguments => [
				    	      'abc',
					     ],
				command => 'echo',
				command_tests => [
						  {
						   comment => 'a free format comment for developers',
						   description => "For testers: is 'abc' echoed to the terminal ?",
						   read => 'abc
',
						  },
						 ],
				comment => "a free format comment for developers",
				description => "echo command testing",
			       },
			       {
				arguments => [
				    	      'def ghi',
					     ],
				command => 'echo',
				command_tests => [
						  {
						   description => "For testers: is 'def' echoed to the terminal ?",
						   read => 'def',
						  },
						  {
						   description => "For testers: is 'ghi' echoed to the terminal ?",
						   read => 'ghi',
						  },
						 ],
				comment => "a single output can be read with consecutive statements",
				description => "echo command testing",
			       },
			      ],
       comment => "this module provides example tests of the echo command",
       description => "echo module",
       name => 'echo_module.t',
      };


return $test;


