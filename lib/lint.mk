__lintimpl = jshint
__lintbin = $(firstword $(filter $(__lintimpl),$(WITH) $(notdir $(shell which $(__lintimpl)))))

ifeq (jshint,$(__lintbin))
#$(info Using JSHint for 'lint'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/lint/jshint.mk
endif

$(checkstatedir)/lint:
	mkdir -p $@
