MOCHA ?= mocha

# Run test suite.
#
# This target verifies the software's behavior by running the test suite.  The
# test suite is expected to utilize Mocha[^1] as a test framework.
#
# [^1]: https://mochajs.org/
test: $(TESTS)
	$(MOCHA) $(MOCHAFLAGS) $^


.PHONY: test
