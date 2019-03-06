# Inject test-related targets.
#
# This include introspects the system and injects test-related targets based on
# which program is available.
#
# The include locates the supported programs using `which`, and then extracts
# the name of the program, removing the directory-part of the file name.  The
# environment variable `WITH` can be specified to override the search order.
# Because the override can potentially specify unsupported programs, the
# result is filtered to only supported programs.  The preferred program is then
# selected and the appropriate targets are included.
__testimpl = mocha vows
__testbin = $(firstword $(filter $(__testimpl),$(WITH) $(notdir $(shell which $(__testimpl)))))

ifeq (mocha,$(__testbin))
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/test/mocha.mk
else ifeq (vows,$(__testbin))
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/test/vows.mk
else
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/test/notfound.mk
endif
