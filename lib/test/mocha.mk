MOCHA ?= mocha

# Run test suite.
#
# This target is included for projects using [Mocha](https://mochajs.org/) as
# a test framework.
.PHONY: test
test: $(TESTS)
	$(MOCHA) $(MOCHAFLAGS) $^
