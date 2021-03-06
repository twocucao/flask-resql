.PHONY:  help test
.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-30s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)



start: ## start dev
	flask run

flake8: ## flake8 
	flake8 app

test: ## test
	pytest 

test-verbose: ## test
	pytest -vv

format: ## format
	black ./flask_resql
	black ./tests
