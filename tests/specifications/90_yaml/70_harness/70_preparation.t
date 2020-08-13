---
command_definitions: []
comment: preparation and reparation tests
description: preparation module
harnessing:
  preparation:
    description: create a file that will be tested in the reparation clause and in the next test
    preparer: !!perl/code '{ "DUMMY" }'
  reparation:
    description: checks whether the preparation clause has run and has created a file that will be tested in the next test
    reparer: !!perl/code '{ "DUMMY" }'
name: 90_yaml/70_harness/70_preparation.t
