# Run test suite with code coverage.
#
# This target uses [Vows](http://vowsjs.org/) to report code coverage.
# Reporting is available if instrumented code is detected.  Currently only
# [node-jscoverage](https://github.com/visionmedia/node-jscoverage) is
# supported.
.PHONY: test-cov
test-cov: $(checkstatedir)/cov/coverage.html

# Generate coverage report in HTML format.
$(checkstatedir)/cov/coverage.html: $(TESTS) $(srcdir)-cov $(checkstatedir)/cov
	NODE_PATH=$(srcdir)-cov:$(NODE_PATH) $(VOWS) $(VOWSFLAGS) --cover-html $(TESTS)
	mv coverage.html $@

# Generate coverage report in EMMA XML format.
#
# This target generates an XML coverage report in the format output by
# [EMMA](http://emma.sourceforge.net/), a code coverage tool that originated
# within the Java ecosystem.
$(checkstatedir)/cov/coverage.xml: $(TESTS) $(srcdir)-cov $(checkstatedir)/cov
	NODE_PATH=$(srcdir)-cov:$(NODE_PATH) $(VOWS) $(VOWSFLAGS) --cover-xml $(TESTS)
	mv coverage.xml $@

# Generate coverage report in JSON format.
#
# This target generates a coverage report in a JSON format that is proprietary
# to [Vows](http://vowsjs.org/).
$(checkstatedir)/cov/coverage.json: $(TESTS) $(srcdir)-cov $(checkstatedir)/cov
	NODE_PATH=$(srcdir)-cov:$(NODE_PATH) $(VOWS) $(VOWSFLAGS) --cover-json $(TESTS)
	mv coverage.json $@

# View coverage report in user's preferred application.
.PHONY: view-cov
view-cov: $(checkstatedir)/cov/coverage.html
	open $^
