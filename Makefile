# This Makefile does not contain any build steps
# It only groups common scripts for usage in development
# TODO: take inspiration from cleardir makefile

MAKEFLAGS += --warn-undefined-variables

## Dependencies ##

.PHONY: bootstrap
bootstrap:
	pip install -r 'requirements-dev.txt'

## Tests ##

.PHONY: test
test: unit_test

.PHONY: all_test
all_test: unit_test integration_test docker_test install_test

.PHONY: unit_test
unit_test:
	python -m pytest 'tests'

.PHONY: integration_test
integration_test:
	bats 'shell_tests/python_tests.sh'

.PHONY: docker_test
docker_test:
	docker build '.' --tag 'stopwatch:dev'
	bats 'shell_tests/docker_tests.sh'
	docker image rm --force 'stopwatch:dev'

.PHONY: install_test
install_test:
	if [ -z "${VIRTUAL_ENV}" ]; then printf 'Run install test inside some virtualenv.' >&2; exit 1; fi
	python -m pip install '.'
	bats 'shell_tests/system_tests.sh'
