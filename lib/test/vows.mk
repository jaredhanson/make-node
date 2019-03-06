VOWS ?= vows

# Run test suite.
#
# This target is included for projects using [Vows](http://vowsjs.org/) as
# a test framework.
.PHONY: test
test: $(TESTS)
	$(VOWS) $(VOWSFLAGS) $^
