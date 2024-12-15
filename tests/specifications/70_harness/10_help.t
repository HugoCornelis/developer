#!/usr/bin/perl -w
#

use strict;


my $test = {
	    command_definitions => [
				    {
				     arguments => [
						   '--help',
						  ],
				     command => 'bin/neurospaces_harness',
				     command_tests => [
						       {
							description => "Is a help message given ?",
							read => "
bin/neurospaces_harness: test definition executor

synopsis:

bin/neurospaces_harness <command> <options>

The default command is 'run-tests'.

commands:
    help            Show the help page.
    run-tests       Run the tests, possibly with an executor that converts the tests rather than running them.

options:
    --check-test-names           Check the pathnames of the specification files against the names of the tests.
    --config-filename            The name of the file with the configuration (default is: ./tests.config).
    --console-type               The type of the console output (one of linear, status).
    --debugging                  Enable specific debugging options.
    --dump-json                  Dump test specifications to json files in /tmp/.
    --dump-perl                  Dump test specifications to perl files in /tmp/.
    --dump-yaml                  Dump test specifications to yaml files in /tmp/.
    --dump-yaml-structured       Dump test specifications to well structured yaml files and directories in /tmp/.
    --email                      Allow to send emails, the default is taken from \$ENV{NEUROSPACES_HARNESS_OPTION_EMAIL}.
    --flattenout                 Flattenout the test definitions before testing,
                                 this experimental feature might increase test performance,
                                 by recycling test definitions.
    --help                       Print usage information.
    --input-command-tests        Merge the given file or directory as command tests to be executed (can be given several times).
    --input-commands             Merge the given file or directory as commands to be tested (can be given several times).
    --input-modules              Merge the given file or directory as modules to be tested (can given several times).
    --numerical-compare          Attempt to compare numbers numerically when string differences are found (default enabled).
    --output                     The class that should generate the output (default is 'Heterarch::Test::Executor').
    --output-content-line-limit  Maximum number of lines when generating content output (latex, html, pdf).
    --output-figures             Generate figures for test output with a figure clause.
    --output-html                Generate HTML output.
    --output-latex               Generate Latex output.
    --output-levels              Generate output for these levels (default is 'meta, module, command_definition, command_test'.
    --output-pdf                 Generate PDF output.
    --randomize-order            Randomize the order of the tests before executing them (require List::Util to be installed).
    --regex-selector             Defines a regex to run specific tests.
    --report-disabled            Include information of disabled tests in the test report.
    --show                       Show tests that would be run using the current configuration.
    --show-command-tests         Show all the command definitions that would be run during test execution, including the input to those commands.
    --tags                       Only test test modules that have been tagged with these tags (default: all tags).
    --timeout-multiplier         Multiply all timeout values with this constant.
    --timings                    Add timing information about the tests to the report.
    --trace                      Enable tracing using the strace unix shell command.
    --verbose                    Set verbosity level.
",
						       },
						      ],
				     description => "help message",
				    },
				   ],
	    description => "neurospaces_harness tester help and usage information",
	    documentation => {
			      explanation => "

The Neurospaces Harness automates unit, regression, integration and
smoke testing.  Declarative test specifications define application
behaviour and can be executed to validate application behaviour
against its specifications.

Command line options support extraction of documentation at various
levels of detail or for specific application functions.  Test
specifications can be converted either to a list of commands with test
input or to HTML or Latex to create a comprehensive series of manuals.

Used this way test specifications are an application knowledge base
that guarantee correct application behaviour.

",
			      purpose => "Help page.",
			     },
	    name => '70_harness/10_help.t',
	   };

return $test;


