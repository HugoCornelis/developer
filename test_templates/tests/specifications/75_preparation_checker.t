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
					   description => "example of a preparation clause: it tests the file that was created in the preparation clause of the previous test",
					   preparer =>
					   sub
					   {
					       use IO::File;

					       my $file = IO::File->new("/tmp/preparation.txt");

					       if (not $file)
					       {
						   die "$0: Cannot open file /tmp/preparation.txt";
					       }

					       my $text = <$file>;

					       if (
						   $text ne 'The preparation code has run
'
						  )
					       {
						   die "$0: The text in /tmp/preparation.txt is not what was expected.";
					       }
					   },
					  },
			   reparation => {
					  description => "example of a reparation clause: it tests the file that was created in the reparation clause of the previous test",
					  reparer =>
					  sub
					  {
					      system "echo >/tmp/reparation.txt The reparation code has run";

					      use IO::File;

					      my $file = IO::File->new("/tmp/reparation.txt");

					      if (not $file)
					      {
						  die "$0: Cannot open file /tmp/reparation.txt";
					      }

					      my $text = <$file>;

					      if (
						  $text ne 'The reparation code has run
'
						 )
					      {
						  die "$0: The text in /tmp/reparation.txt is not what was expected.";
					      }
					  },
					 },
			   },
	    name => '75_preparation_checker.t',
	   };

return $test;


