ISTANBUL ?= istanbul


__testimpl = mocha vows
__testbin = $(firstword $(filter $(__testimpl),$(WITH) $(notdir $(shell which $(__testimpl)))))

ifeq (mocha,$(__testbin))
$(info Using Mocha for 'cov'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov/istanbul/mocha.mk
else ifeq (vows,$(__testbin))
$(info Using Vows for 'cov'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov/istanbul/vows.mk
endif


view-cov: $(localstatedir)/cov/index.html
	open $(localstatedir)/cov/index.html

# Clean up code coverage.
#
# This target cleans up any reports written while collecting code coverage
# statistics.
clean-cov:
	-rm -r $(localstatedir)/cov


.PHONY: view-cov clean-cov
