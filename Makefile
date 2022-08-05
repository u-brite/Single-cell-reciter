black: # Format code
	@black src
	@black tests/unit

clean: # Remove workspace files
	@find . -name "__pycache__" -exec rm -rf {} + 
	@rm -rf ./.pytest_cache
	@rm -rf ./htmlcov
	@python -c "print('Cleaning: 👌')"

cov: # Run test and coverage
	coverage run -m pytest tests/unit
	coverage xml -o temp/coverage.xml

flake: # Lint code
	@flake8 --ignore=E501,W503,E731,E722 --max-cognitive-complexity=30 src
	@python -c "print('Linting: 👌')"

report: # Launches the coverage report
	@coverage html
	@python -m http.server --directory htmlcov

sort: # Sort import
	@isort src

type: # Verify static types
	@mypy --install-types --non-interactive src
	@python -c "print('Types: 👌')"