__lintimpl = jshint jslint
__lintbin = $(firstword $(filter $(__lintimpl),$(WITH) $(notdir $(shell which $(__lintimpl)))))

ifeq (jshint,$(__lintbin))
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/lint/jshint.mk
else ifeq (jslint,$(__lintbin))
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/lint/jslint.mk
endif

# Create directory where lint reports are saved.
$(checkstatedir)/lint:
	mkdir -p $@
