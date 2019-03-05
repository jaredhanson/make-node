ISTANBUL ?= istanbul

test-cov:
	$(ISTANBUL) cover $(ISTANBULFLAGS) --dir var/cov _mocha -- $(MOCHAFLAGS) $(TESTS)
