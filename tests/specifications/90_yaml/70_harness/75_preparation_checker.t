---
command_definitions: []
comment: preparation and reparation tests
description: preparation checker module
harnessing:
  preparation:
    description: test the file that was created in the preparation clause of the previous test
    preparer: !!perl/code '{ "DUMMY" }'
  reparation:
    description: test the file that was created in the reparation clause of the previous test
    reparer: !!perl/code '{ "DUMMY" }'
name: 90_yaml/70_harness/75_preparation_checker.t
