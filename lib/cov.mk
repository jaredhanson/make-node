# Inject coverage-related targets.
#
# This include introspects the system and injects coverage-related targets based
# on which program is available.
#
# The include locates the supported programs using `which`, and then extracts
# the name of the program, removing the directory-part of the file name.  The
# environment variable `WITH` can be specified to override the search order.
# Because the override can potentially specify unsupported programs, the
# result is filtered to only supported programs.  The preferred program is then
# selected and the appropriate targets are included.
__covimpl = istanbul jscoverage
__covbin = $(firstword $(filter $(__covimpl),$(WITH) $(notdir $(shell which $(__covimpl)))))

ifeq (istanbul,$(__covbin))
#$(info Using Instanbul for 'cov'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov/istanbul.mk
else ifeq (jscoverage,$(__covbin))
#$(info Using JSCoverage for 'cov'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov/jscoverage.mk
endif


# Create directory where coverage reports are saved.
$(checkstatedir)/cov:
	mkdir -p $@
