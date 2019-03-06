# Run test suite and report code coverage.
#
# This target verifies the software's behavior by running the test suite, while
# simultaneously collecting code coverage statistics.  The test suite is
# expected to utilize Vows[^1] as a test framework.  The code itself will be
# instrumented by Istanbul[^2] in order to check code coverage.
#
# Istanbul can be installed by executing the following command:
#     $ npm install -g istanbul
#
# [^1]: http://vowsjs.org/
# [^2]: https://github.com/gotwarlost/istanbul
test-cov: $(checkstatedir)/cov/index.html



$(checkstatedir)/cov/index.html: $(SOURCES) $(TESTS)
	$(ISTANBUL) cover $(ISTANBULFLAGS) --report=html --dir $(checkstatedir)/cov $(shell which vows) -- $(VOWSFLAGS) $(TESTS)

$(checkstatedir)/cov/coverage.json: $(SOURCES) $(TESTS)
	$(ISTANBUL) cover $(ISTANBULFLAGS) --report=none --dir $(checkstatedir)/cov $(shell which vows) -- $(VOWSFLAGS) $(TESTS)

$(checkstatedir)/cov/lcov.info: $(SOURCES) $(TESTS)
	$(ISTANBUL) cover $(ISTANBULFLAGS) --report=lcovonly --dir $(checkstatedir)/cov $(shell which vows) -- $(VOWSFLAGS) $(TESTS)

.PHONY: test-cov
