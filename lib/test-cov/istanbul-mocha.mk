_MOCHA ?= $(BIN)/_mocha

test-cov:
	$(ISTANBUL) cover $(ISTANBULFLAGS) $(_MOCHA) -- $(MOCHAFLAGS) $(TESTS)


.PHONY: test-cov