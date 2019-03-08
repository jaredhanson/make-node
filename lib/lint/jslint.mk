JSLINT ?= jslint

# Detect stylistic errors and potential problems.
#
# This target is included for projects using [JSLint](https://www.jslint.com/)
# as a linter.
#
# Note that JSLint is available on the web, and distributed by Douglas Crockford
# as a [file](https://github.com/douglascrockford/JSLint).  For command line
# usage, it is recommended to install [jslint](https://github.com/reid/node-jslint)
# from npm.
.PHONY: lint
lint: $(SOURCES) $(TESTS)
	$(JSLINT) $(JSLINTFLAGS) $^

.PHONY: lint-src
lint-src: $(SOURCES)
	$(JSLINT) $(JSLINTFLAGS) $^

.PHONY: lint-test
lint-test: $(TESTS)
	$(JSLINT) $(JSLINTFLAGS) $^
