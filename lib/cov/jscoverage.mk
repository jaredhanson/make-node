JSCOVERAGE ?= /Users/jaredhanson/Temporary/jscoverage/node-jscoverage/jscoverage


__testimpl = vows
__testbin = $(firstword $(filter $(__testimpl),$(WITH) $(notdir $(shell which $(__testimpl)))))

ifeq (vows,$(__testbin))
#$(info Using Vows with JSCoverage for 'test-cov'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov/jscoverage/vows.mk
endif


$(srcdir)-cov: $(SOURCES)
	$(JSCOVERAGE) $(srcdir) $(srcdir)-cov

view-cov: $(checkstatedir)/cov/coverage.html
	open $(checkstatedir)/cov/coverage.html
