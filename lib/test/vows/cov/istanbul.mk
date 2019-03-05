ISTANBUL ?= istanbul

# NOTE: The `_mocha` executable is used here, rather than `mocha`.  This is due
#       to the fact that `mocha` is a wrapper which spawns `_mocha` as a new
#       process.  This prevents `istanbul` from instrumenting the code, and so
#       `_mocha` is used directly as a workaround.
test-cov:
	$(ISTANBUL) cover $(ISTANBULFLAGS) --dir $(localstatedir)/cov $(VOWS) -- $(VOWSFLAGS) $(TESTS)
