JSHINT ?= jshint

# Detect stylistic errors and potential problems.
#
# This target is included for projects using [JSHint](https://jshint.com/) as a
# linter.
.PHONY: lint
lint: $(SOURCES) $(TESTS)
	$(JSHINT) $(JSHINTFLAGS) $^

.PHONY: lint-src
lint-src: $(SOURCES)
	$(JSHINT) $(JSHINTFLAGS) $^

.PHONY: lint-test
lint-test: $(TESTS)
	$(JSHINT) $(JSHINTFLAGS) $^

# Generate lint report in JSLint XML format.
$(checkstatedir)/lint/jslint.xml: $(checkstatedir)/lint
	$(JSHINT) $(JSHINTFLAGS) --reporter=jslint $(SOURCES) $(TESTS) > $@

# Generate lint report in Checkstyle XML format.
$(checkstatedir)/lint/checkstyle.xml: $(checkstatedir)/lint
	$(JSHINT) $(JSHINTFLAGS) --reporter=checkstyle $(SOURCES) $(TESTS) > $@

# Delete all files that are created by generating lint reports.
.PHONY: clean-lint
clean-lint:
	-rm -r $(checkstatedir)/lint
