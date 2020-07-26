---
command_definitions:

  - arguments:
      - .
    command: find

    command_tests:
      - comment: a free format comment for developers
        description: 'For testers: is the find_module in the output ?'
        read: "./tests/specifications/find_module.t\n"

    comment: a free format comment for developers
    description: echo command testing


  - arguments:
      - .
      - .
    command: find

    command_tests:

      - description: 'For testers: is the find_module in the output ?'
        read: "./tests/specifications/find_module.t\n"

      - description: 'For testers: is the echo_module in the output ?'
        read: "./tests/specifications/echo_module.t\n"

    comment: a single output can be read with consecutive statements
    description: echo command testing


comment: this module provides example tests of the find command in yaml format
description: find module, yaml formatted
name: find_module_yaml.t
