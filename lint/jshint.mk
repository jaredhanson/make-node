JSHINT ?= jshint

lint: lint-src lint-tests

lint-src:
	$(JSHINT) $(JSHINTFLAGS) $(SOURCES)

lint-tests:
	$(JSHINT) $(JSHINTFLAGS) $(TESTS)


.PHONY: lint lint-src lint-tests