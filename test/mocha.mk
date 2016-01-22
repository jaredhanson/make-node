MOCHA ?= $(BIN)/mocha

test: node_modules
	$(MOCHA) $(MOCHAFLAGS) $(TESTS)


.PHONY: test
