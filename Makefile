# Some simple testing tasks (sorry, UNIX only).

FLAGS=

flake: checkrst bandit pyroma
	flake8 l2x tests examples setup.py demos

test: flake
	py.test -s -v $(FLAGS) ./tests/

vtest:
	py.test -s -v $(FLAGS) ./tests/

checkrst:
	python setup.py check --restructuredtext

bandit:
	bandit -r ./l2x

pyroma:
	pyroma -d .

mypy:
	mypy l2x --ignore-missing-imports --disallow-untyped-calls --no-site-packages --strict

testloop:
	while true ; do \
        py.test -s -v $(FLAGS) ./tests/ ; \
    done

cov cover coverage: flake checkrst
	py.test -s -v --cov-report term --cov-report html --cov l2x ./tests
	@echo "open file://`pwd`/htmlcov/index.html"

cov_only: flake
	py.test -s -v --cov-report term --cov-report html --cov l2x ./tests
	@echo "open file://`pwd`/htmlcov/index.html"

ci: flake mypy
	py.test -s -v --cov-report term --cov-report html --cov l2x ./tests
	@echo "open file://`pwd`/htmlcov/index.html"

clean:
	rm -rf `find . -name __pycache__`
	rm -f `find . -type f -name '*.py[co]' `
	rm -f `find . -type f -name '*~' `
	rm -f `find . -type f -name '.*~' `
	rm -f `find . -type f -name '@*' `
	rm -f `find . -type f -name '#*#' `
	rm -f `find . -type f -name '*.orig' `
	rm -f `find . -type f -name '*.rej' `
	rm -f .coverage
	rm -rf coverage
	rm -rf build
	rm -rf htmlcov
	rm -rf dist

doc:
	make -C docs html
	@echo "open file://`pwd`/docs/_build/html/index.html"

.PHONY: all flake test vtest cov clean doc ci
