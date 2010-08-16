#!/bin/bash

rm -rf /var/www/crossref/*

rm -rf /home/g3tester/neurospaces_project_xref
cp -rf /home/g3tester/neurospaces_project /home/g3tester/neurospaces_project_xref

rm -rf /home/g3tester/neurospaces_project_xref/model-container/source/snapshots/0/convertors
rm -rf /home/g3tester/neurospaces_project_xref/model-container/source/snapshots/0/tests

/home/g3tester/xref/xref -xrefactory-II -o /home/g3tester/modelcontainerHTML.log -encoding=european -html -htmlgxlist -htmllxlist -htmlfunseparate -htmllinenums -errors -xrefrc /home/g3tester/.xrefrc -p model-container -user 1


rm -rf /home/g3tester/neurospaces_project_xref/ns-sli/source/snapshots/0/tests

/home/g3tester/xref/xref -xrefactory-II -o /home/g3tester/ns-sliHTML.log -encoding=european -html -htmlgxlist -htmllxlist -htmlfunseparate -htmllinenums -errors -xrefrc /home/g3tester/.xrefrc -p ns-sli -user 1


rm -rf /home/g3tester/neurospaces_project_xref/heccer/source/snapshots/0/tests

/home/g3tester/xref/xref -xrefactory-II -o /home/g3tester/heccerHTML.log -encoding=european -html -htmlgxlist -htmllxlist -htmlfunseparate -htmllinenums -errors -xrefrc /home/g3tester/.xrefrc -p heccer -user 1

rm -rf /home/g3tester/neurospaces_project_xref


echo "xref docs have been built" | mail -s "xref docs" sysadminspam@gmail.com

