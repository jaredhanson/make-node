JSCOVERAGE ?= /Users/jaredhanson/Temporary/jscoverage/node-jscoverage/jscoverage

lib-cov: $(SOURCES)
	$(JSCOVERAGE) $(srcdir) lib-cov
