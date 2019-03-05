ISTANBUL ?= istanbul

view-cov:
	open $(localstatedir)/cov/lcov-report/index.html

# Clean up code coverage.
#
# This target cleans up any reports written while collecting code coverage
# statistics.
clean-cov:
	-rm -r $(localstatedir)/cov


.PHONY: view-cov clean-cov
