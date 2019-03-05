__testcovimpl = istanbul
__testcovbin = $(firstword $(filter $(__testcovimpl),$(WITH) $(notdir $(shell which $(__testcovimpl)))))

ifeq (istanbul,$(__testcovbin))
#$(info Using Istanbul for 'test-cov'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/test/vows/cov/istanbul.mk
endif
