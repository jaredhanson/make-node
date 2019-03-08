JSCOVERAGE ?= jscoverage


# JSCoverage only instruments source files.  It depends on a test runner to
# collect code coverage statistcs, so this include introspects the system and
# injects test-related targets based on which program is available.
__testimpl = vows
__testbin = $(firstword $(filter $(__testimpl),$(WITH) $(notdir $(shell which $(__testimpl)))))

ifeq (vows,$(__testbin))
#$(info Using Vows with JSCoverage for 'test-cov'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov/jscoverage/vows.mk
endif


# Instrument the program with code coverage.
#
# This target is included for projects using [JSCoverage](http://siliconforks.com/jscoverage/)
# for code coverage.
#
# Note that JSCoverage support for Node.js was implemented by TJ Holowaychuk in
# a [fork](https://github.com/visionmedia/node-jscoverage).  Projects targetting
# Node.js should use that implementation.
#
# NOTE: The `lib-cov` directory is removed prior to executing `jscoverage` due
#       to the fact that jscoverage refuses to overwrite existing directories.
$(srcdir)-cov: $(SOURCES)
	-rm -r $(srcdir)-cov
	$(JSCOVERAGE) $(srcdir) $(srcdir)-cov

# Delete all files that are created by generating coverage reports.
.PHONY: clean-cov
clean-cov:
	-rm -r $(srcdir)-cov
	-rm -r $(checkstatedir)/cov
