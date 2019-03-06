__covimpl = istanbul jscoverage
__covbin = $(firstword $(filter $(__covimpl),$(WITH) $(notdir $(shell which $(__covimpl)))))

ifeq (istanbul,$(__covbin))
#$(info Using Instanbul for 'cov'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov/istanbul.mk
else ifeq (jscoverage,$(__covbin))
#$(info Using JSCoverage for 'cov'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov/jscoverage.mk
endif

$(checkstatedir)/cov:
	mkdir -p $@
