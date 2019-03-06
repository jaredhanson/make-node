test-cov: $(localstatedir)/cov/coverage.html
	NODE_PATH=$(srcdir)-cov:$(NODE_PATH) $(VOWS) $(VOWSFLAGS) $(TESTS)

$(localstatedir)/cov/coverage.html: $(TESTS) $(srcdir)-cov $(localstatedir)/cov
	NODE_PATH=$(srcdir)-cov:$(NODE_PATH) $(VOWS) $(VOWSFLAGS) --cover-html $(TESTS)
	mv coverage.html $(localstatedir)/cov

$(localstatedir)/cov/coverage.json: $(TESTS) $(srcdir)-cov $(localstatedir)/cov
	NODE_PATH=$(srcdir)-cov:$(NODE_PATH) $(VOWS) $(VOWSFLAGS) --cover-json $(TESTS)
	mv coverage.json $(localstatedir)/cov

$(localstatedir)/cov/coverage.xml: $(TESTS) $(srcdir)-cov $(localstatedir)/cov
	NODE_PATH=$(srcdir)-cov:$(NODE_PATH) $(VOWS) $(VOWSFLAGS) --cover-xml $(TESTS)
	mv coverage.xml $(localstatedir)/cov
