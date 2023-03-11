#!/usr/bin/perl -w
#

use strict;


my $test
    = {
       command_definitions => [
			       {
				arguments => [
					      'builtin',
					      'start_project',
					      'workflow-tests',
					     ],
				command => '../bin/workflow',
				command_tests => [
						  {
						   description => "Can we start a new project ?",
						   read => 'Using \'workflow-tests\' as name for your project.
Created a template configuration file for project \'workflow-tests\'
Created a template workflow-project in \'workflow-project-template.pl\' with contents:
---
#!/usr/bin/perl -w

use strict;

use warnings;

my $configuration
    = {
       field_project_name => \'workflow-tests\',
      };

return $configuration;

---
If this looks good, please rename it to \'workflow-project.pl\' using the command:

  mv \'workflow-project-template.pl\' \'workflow-project.pl\'

And test it with the command:

  workflow --help-field-project-name

Afterwards install the scripts on your system using the command:

  workflow builtin install_scripts -- --engine --commands

Then check if they work by inspecting the examples they provide (with various options):

  workflow-tests-workflow examples array_of_commands_remote_execution --interactions

  workflow-tests-workflow examples sequencing_and_composition --interactions-module

  workflow-tests-workflow examples single_command --dry-run

  workflow-tests-workflow examples array_of_commands --help
',
						  },
						 ],
				description => "start of a new project",
			       },
			       {
				arguments => [
					      '-1',
					     ],
				command => 'ls',
				command_tests => [
						  {
						   description => "Have the project files been created ?",
						   read => 'conf.workflow-tests-configuration
conf.workflow-tests-workflow
workflow-project-template.pl
workflow-tests-bash-completion.sh
workflow-tests-commands
workflow-tests-commands-data
workflow-tests-configuration
workflow-tests-configuration-data
',
						  },
						 ],
				description => "correct creation of the field project file",
			       },
			       {
				arguments => [
					      '--verbose',
					      'workflow-project-template.pl',
					      'workflow-project.pl',
					     ],
				command => 'mv',
				command_tests => [
						  {
						   description => "Have the project files been created ?",
						   read => 'renamed \'workflow-project-template.pl\' -> \'workflow-project.pl\'
',
						  },
						 ],
				description => "rename the field project file to its final name",
			       },
			       {
				arguments => [
					      '--help-field-project-name',
					     ],
				command => '../bin/workflow',
				command_tests => [
						  {
						   description => "Has the project been correctly initialized ?",
						   disabled => ($ENV{PWD} eq '/home/hugo/projects/developer/source/snapshots/master'
								? ''
								: "the currenct directory must be '/home/hugo/projects/developer/source/snapshots/master' to enable this test"),
						   read => '
global_field_project_configuration:
  field_project_configuration_filename: workflow-project.pl
  field_project_name: workflow-tests
  from_directory: .
  from_executable: workflow on the command line
  technical_project_configuration_directory: .
  true_technical_project_configuration_directory: /home/hugo/projects/developer/source/snapshots/master/tmp
  true_technical_project_configuration_filename: /home/hugo/projects/developer/source/snapshots/master/tmp/workflow-project.pl
  true_technical_project_data_commands_directory: /home/hugo/projects/developer/source/snapshots/master/tmp/workflow-tests-commands-data
  true_technical_project_data_configuration_directory: /home/hugo/projects/developer/source/snapshots/master/tmp/workflow-tests-configuration-data
',
						  },
						 ],
				description => "correct creation of the field project file",
			       },
			      ],
       description => "testing of the workflow automation engine",
       documentation => {
			 explanation => "

The workflow script enables the automation of customizable modular
project-specific workflows that use shell commands.

",
			 purpose => "This module tests the workflow automation engine.",
			},
       harnessing => {
		      preparation => {
				      description => "create and enter the directory for running the tests",
				      preparer =>
				      sub
				      {
					  system "rm -fr tmp";
					  system "mkdir tmp";
					  chdir "tmp";

					  # return no errors

					  return '';
				      },
				     },
		      reparation => {
				     description => "leave and remove the directory for running the tests",
				     reparer =>
				     sub
				     {
					 chdir "..";
					 # system "rm -fr tmp";

					 # return no errors

					 return '';
				     },
				    },
		     },
       name => '40_workflow-automator.t',
      };


return $test;


