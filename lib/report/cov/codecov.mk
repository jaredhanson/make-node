CODECOV ?= codecov

# ./node_modules/.bin/codecov -f var/cov/lcov.info -X gcov --dump

report-cov-codecov: $(checkstatedir)/cov/lcov.info
	$(CODECOV) -f $<


.PHONY: report-cov-codecov
