# Run test suite and report code coverage.
#
# This target verifies the software's behavior by running the test suite, while
# simultaneously collecting code coverage statistics.  The test suite is
# expected to utilize Mocha[^1] as a test framework.  The code itself will be
# instrumented by Istanbul[^2] in order to check code coverage.
#
# Istanbul can be installed by executing the following command:
#     $ npm install -g istanbul
#
# Writes an LCOV tracefile
# http://ltp.sourceforge.net/coverage/lcov/geninfo.1.php
#
# [^1]: https://mochajs.org/
# [^2]: https://github.com/gotwarlost/istanbul
#
# NOTE: The `_mocha` executable is used here, rather than `mocha`.  This is due
#       to the fact that `mocha` is a wrapper which spawns `_mocha` as a new
#       process.  This prevents `istanbul` from instrumenting the code, and so
#       `_mocha` is used directly as a workaround.
test-cov: $(checkstatedir)/cov/index.html



$(checkstatedir)/cov/index.html: $(SOURCES) $(TESTS)
	$(ISTANBUL) cover $(ISTANBULFLAGS) --report=html --dir $(checkstatedir)/cov $(shell which _mocha) -- $(MOCHAFLAGS) $(TESTS)

$(checkstatedir)/cov/coverage.json: $(SOURCES) $(TESTS)
	$(ISTANBUL) cover $(ISTANBULFLAGS) --report=none --dir $(checkstatedir)/cov $(shell which _mocha) -- $(MOCHAFLAGS) $(TESTS)

$(checkstatedir)/cov/lcov.info: $(SOURCES) $(TESTS)
	$(ISTANBUL) cover $(ISTANBULFLAGS) --report=lcovonly --dir $(checkstatedir)/cov $(shell which _mocha) -- $(MOCHAFLAGS) $(TESTS)

.PHONY: test-cov
