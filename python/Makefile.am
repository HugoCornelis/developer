
#pythondir = $(prefix)/glue/swig/python

# nobase_python_HEADERS = \
# 	neurospaces/__cbi__.py \
# 	neurospaces/__init__.py 

#nobase_dist_python_DATA = 


EXTRA_DIST = \
	neurospaces/__cbi__.py \
	neurospaces/__init__.py \
	neurospaces/launcher.py \
	neurospaces/packages.py \
	neurospaces/shell.py \
	clean.py \
	setup.py \
	uninstall.py \
	INFO.txt

setup: setup.py
	$(PYTHON) setup.py build
	$(PYTHON) setup.py build_py
	$(PYTHON) setup.py bdist
	$(PYTHON) egg_build.py


install-exec-hook:
	echo "No install"
#	$(PYTHON) setup.py install

uninstall-hook:
	$(PYTHON) uninstall.py

all: setup

clean-local:
	$(RM) `find . -name "*.pyc"`
	$(PYTHON) clean.py
