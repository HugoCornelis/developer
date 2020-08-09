---
command_definitions:

  - arguments:
      - abc
    command: echo
    command_tests:
      - comment: "This comment provides information about this specific test: The string 'abc' is echoed to the terminal by the echo command.  This test checks whether it indeed appeared in the terminal."
        description: Is 'abc' echoed to the terminal ?
        read: "abc\n"

    comment: This comment can be used by test developers to provide information about the echo command.
    description: echo command testing


  - arguments:
      - def ghi
    command: echo
    command_tests:
      - description: Is 'def' echoed to the terminal ?
        read: def
      - description: Waits for 3 seconds
        wait: 3
      - description: 'For testers: this would enforce an error, but the test is disabled'
        disabled: 'The disabled clause allows to disable a specific test, or to disable all the tests associated with a command, or to disable an entire test module.  Here we disable this test because we want the test suite to succeed as we know that this specific was flagged with an error clause.'
        error: 'The error clause allows to flag a specific test with the cause of the error.  The test itself, if present, would not be executed.'
      - comment: |-
          Due to the given timeout value, this test waits for a maximum of one second before it would error out.
          The default timeout value is two seconds.
        description: Is 'ghi' echoed to the terminal ?
        read: ghi
        timeout: 1

    comment: The echo command prints a single output consisting of two strings.  This test shows how this single output can be read with two consecutive tests.
    description: echo command testing


comment: |-
  This module provides examples of simple tests, how to disable specific tests and how to flag tests with a hard error.
  For more elaborate examples, such as web site interaction and numerical comparisons,
  please take a look at the test suite of the Neurospaces Development project tools.
description: simple examples
name: 11_simple_examples_module_yaml.t
