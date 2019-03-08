COVERALLS ?= coveralls

# Report code coverage to Coveralls.
#
# This target reports code coverage to [Coveralls](https://coveralls.io).
.PHONY: report-cov-coveralls
report-cov-coveralls: $(checkstatedir)/cov/lcov.info
	$(CAT) $< | $(COVERALLS)
