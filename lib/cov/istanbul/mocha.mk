# Generate coverage report in JSON format.
#
# This target uses [Istanbul](https://github.com/gotwarlost/istanbul) to
# transparently instrument a [Mocha](https://mochajs.org/) test suite and
# collect code coverage statistics.
#
# This target generates a coverage report in a JSON format that is proprietary
# to Istanbul.
#
# NOTE: The `_mocha` executable is used here, rather than `mocha`.  This is due
#       to the fact that `mocha` is a wrapper which spawns `_mocha` as a new
#       process.  This spawning prevents `istanbul` from instrumenting the code,
#       and so `_mocha` is used directly as a workaround.
$(checkstatedir)/cov/coverage.json: $(SOURCES) $(TESTS)
	$(ISTANBUL) cover $(ISTANBULFLAGS) --report=none --dir $(checkstatedir)/cov $(shell which _mocha) -- $(MOCHAFLAGS) $(TESTS)
