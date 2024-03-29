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


SUBDIRS = perl python

dist_bin_SCRIPTS = \
	bin/data_2_figure \
	bin/mcad2doxy \
	bin/mtn-ancestors \
	bin/neurospaces-commands \
	bin/neurospaces-manager-gui \
	bin/neurospaces_build \
	bin/neurospaces_check \
	bin/neurospaces_clean \
	bin/neurospaces_clone \
	bin/neurospaces_configure \
	bin/neurospaces_countcode \
	bin/neurospaces_create_directories \
	bin/neurospaces_cron \
	bin/neurospaces_describe \
	bin/neurospaces_dev_uninstall \
	bin/neurospaces_diff \
	bin/neurospaces_dist \
	bin/neurospaces_docs \
	bin/neurospaces_docs-level7 \
	bin/neurospaces_harness \
	bin/neurospaces_harness_2_html \
	bin/neurospaces_history \
	bin/neurospaces_init \
	bin/neurospaces_install \
	bin/neurospaces_kill_servers \
	bin/neurospaces_migrate \
	bin/neurospaces_mtn_2_git \
	bin/neurospaces_new_component \
	bin/neurospaces_packages \
	bin/neurospaces_pkgdeb \
	bin/neurospaces_pkgrpm \
	bin/neurospaces_pkgtar \
	bin/neurospaces_profile_set \
	bin/neurospaces_pull \
	bin/neurospaces_push \
	bin/neurospaces_repo_keys \
	bin/neurospaces_repositories \
	bin/neurospaces_revert \
	bin/neurospaces_serve \
	bin/neurospaces_setup \
	bin/neurospaces_status \
	bin/neurospaces_sync \
	bin/neurospaces_tags \
	bin/neurospaces_tools_propagate \
	bin/neurospaces_uninstall \
	bin/neurospaces_update \
	bin/neurospaces_upgrade \
	bin/neurospaces_versions \
	bin/neurospaces_website_prepare \
	bin/nspkg-deb \
	bin/nspkg-osx \
	bin/nspkg-rpm \
	bin/nstest_query \
	bin/numerical_compare \
	bin/release-expand \
	bin/release-extract \
	bin/signal_voltage_characteristics \
	bin/td-labels \
	bin/td-majors

developertestdir=$(prefix)/neurospaces/developer
nobase_dist_developertest_DATA=@TEST_SPECIFICATION_FILES@

developerimagesdir=$(prefix)/neurospaces/images
nobase_dist_developerimages_DATA = images/ns-main-logo-dark2.jpg

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
	bin/workflow-files/conf.neurospaces-configuration \
	bin/workflow-files/conf.neurospaces-workflow \
	bin/workflow-files/conf.workflow \
	bin/workflow-files/neurospaces-configuration \
	cpan \
	docs \
	tests \
	test_templates \
	license.txt

am__tar = ${AMTAR} chf - --format=posix "$$tardir"


clean-local:
	rm -rf $(top_srcdir)/neurospaces_cpan_modules
	rm -rf $(TMP_DIR)
	$(RM) -rf $(top_srcdir)/*.deb
	$(RM) -f $(top_srcdir)/*.changes
	$(RM) -f $(top_srcdir)/*.dsc
	$(RM) -f $(top_srcdir)/build_*.log
	$(RM) -rf $(top_srcdir)/*_BUILD/
	$(RM) $(top_srcdir)/developer-*.tar.gz
	$(RM) -rf $(top_srcdir)/developer-*

dist-hook:
	$(srcdir)/install-sh -d $(distdir)/tests
	$(srcdir)/install-sh -d $(distdir)/tests/html
	( cd $(distdir)/tests && chmod -R u+w . && ../bin/neurospaces_harness_2_html --introduction introduction.html )

install-data-local: neurospaces_cpan_modules

install-data-hook:
	@echo "Developer package installation finished"

neurospaces_cpan_modules:
	@echo "======================== Installing CPAN modules"
	( cd cpan ; ./cpan_install *.gz )
	touch $(top_srcdir)/neurospaces_cpan_modules

test: check

TESTS = bin/neurospaces_harness

html-upload-prepare:
	rm -fr html/htdocs/neurospaces_project/$(PACKAGE)
	mkdir -p html/htdocs/neurospaces_project/$(PACKAGE)
# $Format: "	( cd tests && neurospaces_harness_2_html --header '<img src=\"ns-main-logo-dark2-notext-32x32.jpg\" alt=\"Main Neurospaces logo\"> ${package}, ${label}, ${email} <hr>' --introduction introduction.html )" $
	( cd tests && neurospaces_harness_2_html --header '<img src="ns-main-logo-dark2-notext-32x32.jpg" alt="Main Neurospaces logo"> neurospaces 0.1675 Thu, 27 Dec 2007 15:58:18 -0600 hugo<hr>' --introduction introduction.html )

#t perhaps also add a target to check the syntax of all the html ?

html-upload: html-upload-prepare

website-clean:

website-prepare:

website-prepare-local:

website-upload: website-clean website-prepare html-upload

webcheck:

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
