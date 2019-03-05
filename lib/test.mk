WITH_MOCHA ?= 1

__testimpl = mocha
__testbin = $(firstword $(filter $(__testimpl),$(WITH) $(notdir $(shell which $(__testimpl)))))

ifeq (mocha,$(__testbin))
$(info Using Mocha for 'test'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/test/mocha.mk
else ifeq (vows,$(__testbin))
$(info Using Vows for 'test'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/test/vows.mk
endif
