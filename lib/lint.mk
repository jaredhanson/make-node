# Inject lint-related targets.
#
# This include introspects the system and injects lint-related targets based on
# which program is available.
#
# The include locates the supported programs using `which`, and then extracts
# the name of the program, removing the directory-part of the file name.  The
# environment variable `WITH` can be specified to override the search order.
# Because the override can potentially specify unsupported programs, the
# result is filtered to only supported programs.  The preferred program is then
# selected and the appropriate targets are included.
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
