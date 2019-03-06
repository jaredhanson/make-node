test-cov: $(checkstatedir)/cov/coverage.html
	NODE_PATH=$(srcdir)-cov:$(NODE_PATH) $(VOWS) $(VOWSFLAGS) $(TESTS)

$(checkstatedir)/cov/coverage.html: $(TESTS) $(srcdir)-cov $(checkstatedir)/cov
	NODE_PATH=$(srcdir)-cov:$(NODE_PATH) $(VOWS) $(VOWSFLAGS) --cover-html $(TESTS)
	mv coverage.html $@

$(checkstatedir)/cov/coverage.json: $(TESTS) $(srcdir)-cov $(checkstatedir)/cov
	NODE_PATH=$(srcdir)-cov:$(NODE_PATH) $(VOWS) $(VOWSFLAGS) --cover-json $(TESTS)
	mv coverage.json $@

$(checkstatedir)/cov/coverage.xml: $(TESTS) $(srcdir)-cov $(checkstatedir)/cov
	NODE_PATH=$(srcdir)-cov:$(NODE_PATH) $(VOWS) $(VOWSFLAGS) --cover-xml $(TESTS)
	mv coverage.xml $@
