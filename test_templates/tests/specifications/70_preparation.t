#!/usr/bin/perl -w
#

use strict;


my $test = {
	    command_definitions => [
				   ],
	    comment => "this module provides examples of preparation and reparation clauses for tests",
	    description => "preparation module",
	    harnessing => {
			   preparation => {
					   description => "example of a preparation clause: it creates a file that will be tested in the reparation clause and in the next test",
					   preparer =>
					   sub
					   {
					       system "echo >/tmp/preparation.txt The preparation code has run";
					   },
					  },
			   reparation => {
					  description => "example of a reparation clause: it checks if the preparation clause has run and creates a file that will be tested in the next test",
					  reparer =>
					  sub
					  {
					      system "bash -c \"cat /tmp/preparation.txt | diff - <(echo 'The preparation code has run')\"";

					      system "echo >/tmp/reparation.txt The reparation code has run";
					  },
					 },
			  },
	    name => '70_preparation.t',
	   };

return $test;


