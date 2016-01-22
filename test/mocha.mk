MOCHA ?= $(BIN)/mocha

test:
	$(MOCHA) $(MOCHAFLAGS) $(TESTS)


.PHONY: test
