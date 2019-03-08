CODECOV ?= codecov

# Report code coverage to Codecov.
#
# This target reports code coverage to [Codecov](https://codecov.io).
.PHONY: report-cov-codecov
report-cov-codecov: $(checkstatedir)/cov/lcov.info
	$(CODECOV) -f $<
