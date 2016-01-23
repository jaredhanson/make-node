_MOCHA ?= $(BIN)/_mocha

test-cov:
	$(ISTANBUL) cover $(ISTANBULFLAGS) --dir $(COVERAGEDIR) $(_MOCHA) -- $(MOCHAFLAGS) $(TESTS)

clean-cov:
	rm -rf $(COVERAGEDIR)


.PHONY: test-cov clean-cov