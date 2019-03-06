ISTANBUL ?= istanbul


__testimpl = mocha vows
__testbin = $(firstword $(filter $(__testimpl),$(WITH) $(notdir $(shell which $(__testimpl)))))

ifeq (mocha,$(__testbin))
#$(info Using Instanbul with Mocha for 'test-cov'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov/istanbul/mocha.mk
else ifeq (vows,$(__testbin))
#$(info Using Instanbul with Vows for 'test-cov'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov/istanbul/vows.mk
endif


view-cov: $(checkstatedir)/cov/index.html
	open $(checkstatedir)/cov/index.html

# Clean up code coverage.
#
# This target cleans up any reports written while collecting code coverage
# statistics.
clean-cov:
	-rm -r $(checkstatedir)/cov


.PHONY: view-cov clean-cov
