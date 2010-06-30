##
## The neurospaces project : modeling tools for computational
## neuroscience.
##

##############################################################################
##'
##' The neurospaces project
##'
##' Copyright (C) 2007-2008 Hugo Cornelis
##'
##' Hugo Cornelis, hugo.cornelis@gmail.com
##'
##############################################################################


SUBDIRS = perl

dist_bin_SCRIPTS = \
	bin/mcad2doxy \
	bin/mtn-ancestors \
	bin/neurospaces_build \
	bin/neurospaces_check \
	bin/neurospaces_clean \
	bin/neurospaces_clone \
	bin/neurospaces_configure \
	bin/neurospaces_countcode \
	bin/neurospaces_create_directories \
	bin/neurospaces_cron \
	bin/neurospaces_dist \
	bin/neurospaces_docs \
	bin/neurospaces_harness \
	bin/neurospaces_init \
	bin/neurospaces_install \
	bin/neurospaces_kill_servers \
	bin/neurospaces_revert \
	bin/neurospaces_packages \
	bin/neurospaces_pkgdeb \
	bin/neurospaces_pkgrpm \
	bin/neurospaces_pkgtar \
	bin/neurospaces_pull \
	bin/neurospaces_push \
	bin/neurospaces_tools_propagate \
	bin/neurospaces_serve \
	bin/neurospaces_status \
	bin/neurospaces_sync \
	bin/neurospaces_uninstall \
	bin/neurospaces_update \
	bin/neurospaces_upgrade \
	bin/neurospaces_versions \
	bin/neurospaces_website_prepare \
	bin/nstest_query \
	bin/nspkg-deb \
	bin/nspkg-rpm \
	bin/nspkg-osx \
	bin/numerical_compare \
	bin/td-labels \
	bin/td-majors \
	bin/release-expand \
	bin/release-extract

developertestdir=$(prefix)/neurospaces/developer
nobase_dist_developertest_DATA=@TEST_SPECIFICATION_FILES@

RELEASE_MAJOR=`release-extract --major`
RELEASE_MINOR=`release-extract --minor`
RELEASE_MICRO=`release-extract --micro`

show-release-labels:
	echo "Release information (major-minor-micro): $(RELEASE_MAJOR)-$(RELEASE_MINOR)-$(RELEASE_MICRO)"

dist-keywords:
	release-expand developer $(RELEASE_MAJOR) $(RELEASE_MINOR) $(RELEASE_MICRO) $(RELEASE_MAJOR).$(RELEASE_MINOR) hugo.cornelis@gmail.com --verbose
#	release-expand developer des 10 0 des-10 hugo.cornelis@gmail.com --verbose

# the tests are copied overhere.
#
# The variable EXTRA_DIST could also be used here.

EXTRA_DIST = \
	docs \
	tests \
	license.txt

am__tar = ${AMTAR} chf - --format=posix "$$tardir"


clean-local:
	rm -rf $(TMP_DIR)
	$(RM) -rf $(top_srcdir)/*.deb
	$(RM) -f $(top_srcdir)/*.changes
	$(RM) -f $(top_srcdir)/*.dsc
	$(RM) -f $(top_srcdir)/build_*.log
	$(RM) -rf $(top_srcdir)/*_BUILD/
	$(RM) -f $(top_srcdir)/build_rpm.log
	$(RM) $(top_srcdir)/developer-*.tar.gz

dist-hook: 
#	cd $(srcdir) && if test -n "`mtn ls changed `" ; then false ; else true ; fi
	find $(distdir) -name _Inline -exec chmod u+w -R \{\} \;
	$(RM) -fr `find $(distdir) -name _Inline`
#	cp $(srcdir)/license.txt $(distdir)
#	cp -R $(srcdir)/docs $(distdir)
	$(srcdir)/install-sh -d $(distdir)/tests
	$(srcdir)/install-sh -d $(distdir)/tests/html
#	cp -dp $(srcdir)/tests/neurospaces_harness  $(distdir)/tests
#	cp -dp $(srcdir)/tests/neurospaces_harness.ptkdb  $(distdir)/tests
#	cp -dp $(srcdir)/tests/command_extractor  $(distdir)/tests
#	cp -dp $(srcdir)/tests/command_extractor.ptkdb  $(distdir)/tests
#	cp -dp $(srcdir)/tests/tests_2_html  $(distdir)/tests
#	cp -dp $(srcdir)/tests/tests_2_html.ptkdb  $(distdir)/tests
#	cp -dp $(srcdir)/tests/tests.config $(distdir)/tests
#	cp -a $(srcdir)/tests.config $(distdir)
	( cd $(distdir)/tests && chmod -R u+w . && ./tests_2_html --introduction introduction.html )

html-upload-prepare:

#t perhaps also add a target to check the syntax of all the html ?

html-upload: html-upload-prepare

test: check

#TESTS = $(srcdir)/tests/neurospaces_harness

docs-level1:

docs-level2:

docs-level3: html-upload-prepare
	echo "Converted the regression tests to HTML"

docs-level4:

docs-level5:

docs-level6:

docs-level7:

docs: docs-level1 docs-level2 docs-level3 docs-level4 docs-level5 docs-level6 docs-level7

APP_NAME=neurospacesdeveloper

# the pkg-src target must create pkg/$(APP_NAME)-$(VERSION).tar.gz
pkg-src: dist
	mkdir -p pkg
	cp $(PACKAGE)-$(VERSION).tar.gz pkg/$(PACKAGE)-$(VERSION).tar.gz


# Create a deb package
pkg-deb: dist
	nspkg-deb $(PACKAGE) $(VERSION)

pkg-rpm: dist
	nspkg-rpm $(PACKAGE) $(VERSION)

pkg-osx: 
	nspkg-osx 
