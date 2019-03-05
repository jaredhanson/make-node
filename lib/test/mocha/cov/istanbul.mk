ISTANBUL ?= istanbul

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
# [^1]: https://mochajs.org/
# [^2]: https://github.com/gotwarlost/istanbul
#
# NOTE: The `_mocha` executable is used here, rather than `mocha`.  This is due
#       to the fact that `mocha` is a wrapper which spawns `_mocha` as a new
#       process.  This prevents `istanbul` from instrumenting the code, and so
#       `_mocha` is used directly as a workaround.
test-cov:
	$(ISTANBUL) cover $(ISTANBULFLAGS) --dir $(localstatedir)/cov _mocha -- $(MOCHAFLAGS) $(TESTS)

view-cov:
	open $(localstatedir)/cov/lcov-report/index.html

# Clean up code coverage.
#
# This target cleans up any reports written while collecting code coverage
# statistics.
clean-cov:
	-rm -r $(localstatedir)/cov


.PHONY: test-cov clean-cov
