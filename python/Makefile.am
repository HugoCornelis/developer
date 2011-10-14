
#pythondir = $(prefix)/glue/swig/python

# nobase_python_HEADERS = \
# 	neurospaces/__cbi__.py \
# 	neurospaces/__init__.py 

# nobase_dist_python_DATA = \
# 	neurospaces/__cbi__.py \
# 	neurospaces/__init__.py 

setup: setup.py
	$(PYTHON) setup.py build
	$(PYTHON) setup.py build_py


install-exec-hook:
	$(PYTHON) setup.py install

uninstall-hook:
	$(PYTHON) uninstall.py

all: setup

clean-local:
	$(RM) `find . -name "*.pyc"`
	$(PYTHON) clean.py
