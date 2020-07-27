#!/usr/bin/perl -w
#

use strict;


my $test
    = {
       command_definitions => [
			       {
				arguments => [
				    	      'a number that is almost one: 1.00001',
					     ],
				command => 'echo',
				command_tests => [
						  {
						   description => "Are the numbers numerically equivalent ?",
						   numerical_compare => 'the numerical_compare flag is what we are testing',
						   read => 'a number that is almost one: 1.000011',
						  },
						 ],
				description => "numerical_compare testing",
			       },
			      ],
       comment => "This module provides example tests of numerical comparisons.",
       description => "numerical comparisons",
       name => 'numerical_compare.t',
      };


return $test;


