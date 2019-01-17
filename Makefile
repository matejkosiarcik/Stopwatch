# This Makefile does not contain any build steps
# It only groups scripts to use in project

MAKEFLAGS += --warn-undefined-variables
FORCE:

bootstrap: FORCE
	pip install pytest

update: FORCE
	pip install --upgrade pytest

test: FORCE
	which rake
	which ruby
	python -m pytest 'tests'

install: FORCE
	pip install '.'
