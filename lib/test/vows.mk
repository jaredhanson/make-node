VOWS ?= vows

# Run test suite.
#
# This target verifies the software's behavior by running the test suite.  The
# test suite is expected to utilize Vows[^1] as a test framework.
#
# [^1]: http://vowsjs.org/
test: $(TESTS)
	$(VOWS) $(VOWSFLAGS) $^




include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/test/vows/cov.mk

.PHONY: test
