# This Makefile does not contain any build steps
# It only groups scripts to use in project

MAKEFLAGS += --warn-undefined-variables
FORCE:

bootstrap: FORCE
	pip install -r 'requirements-dev.txt'

update: FORCE
	pip install --upgrade -r 'requirements-dev.txt'

test: FORCE
	python -m pytest 'tests'

install: FORCE
	pip install '.'
