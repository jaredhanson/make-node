# Generate coverage report in JSON format.
#
# This target uses [Istanbul](https://github.com/gotwarlost/istanbul) to
# transparently instrument a [Vows](http://vowsjs.org/) test suite and collect
# code coverage statistics.
#
# This target generates a coverage report in a JSON format that is proprietary
# to Istanbul.
$(checkstatedir)/cov/coverage.json: $(SOURCES) $(TESTS)
	$(ISTANBUL) cover $(ISTANBULFLAGS) --report=none --dir $(checkstatedir)/cov $(shell which vows) -- $(VOWSFLAGS) $(TESTS)
