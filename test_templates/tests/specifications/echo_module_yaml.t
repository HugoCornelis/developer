---
command_definitions:

  - arguments:
      - abc
    command: echo

    command_tests:
      - comment: a free format comment for developers
        description: "For testers: is 'abc' echoed to the terminal ?"
        read: "abc\n"

    comment: a free format comment for developers
    description: echo command testing


  - arguments:
      - def ghi
    command: echo

    command_tests:

      - description: "For testers: is 'def' echoed to the terminal ?"
        read: def

      - description: 'For testers: this waits for 3 seconds'
        wait: 3

      - description: 'For testers: this would enforce an error, but the test is disabled'
        disabled: 'we disable this test and specify the reason here: we want the test suite to work'
        error: we know this to fail

      - comment: |-
          Due to the given timeout value, this test waits for a maximum of one second before it errors out.
          The default timeout value is two seconds.
        description: "For testers: is 'ghi' echoed to the terminal ?"
        read: ghi
        timeout: 1

    comment: a single output can be read with consecutive statements
    description: echo command testing


comment: |-
  This module provides example tests of the echo command, in yaml format.
  For more elaborate examples, such as web site interaction and numerical comparisons,
  please take a look at the test suite of the Neurospaces Development project tools.
description: echo module, yaml formatted
name: echo_module_yaml.t
