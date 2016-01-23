COVERALLS ?= coveralls

report-cov:
	cat $(LCOVFILE) | $(COVERALLS)


.PHONY: report-cov
