# Inject documentation-related targets.
#
# This include introspects the system and injects documentation-related targets
# based on which program is available.
#
# The include locates the supported programs using `which`, and then extracts
# the name of the program, removing the directory-part of the file name.  The
# environment variable `WITH` can be specified to override the search order.
# Because the override can potentially specify unsupported programs, the
# result is filtered to only supported programs.  The preferred program is then
# selected and the appropriate targets are included.
__docimpl = jsdoc mr-doc
__docbin = $(firstword $(filter $(__docimpl),$(WITH) $(notdir $(shell which $(__docimpl)))))

ifeq (jsdoc,$(__docbin))
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/doc/jsdoc.mk
else ifeq (mr-doc,$(__docbin))
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/doc/mr-doc.mk
else
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/doc/notfound.mk
endif
