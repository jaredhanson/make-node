ISTANBUL ?= istanbul

# Run test suite and record code coverage.
.PHONY: test-cov
test-cov: $(checkstatedir)/cov/coverage.json


__testimpl = mocha vows
__testbin = $(firstword $(filter $(__testimpl),$(WITH) $(notdir $(shell which $(__testimpl)))))

ifeq (mocha,$(__testbin))
#$(info Using Instanbul with Mocha for 'test-cov'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov/istanbul/mocha.mk
else ifeq (vows,$(__testbin))
#$(info Using Instanbul with Vows for 'test-cov'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov/istanbul/vows.mk
endif


$(checkstatedir)/cov/index.html: $(checkstatedir)/cov/coverage.json
	$(ISTANBUL) report $(ISTANBULFLAGS) --root=$(checkstatedir)/cov --include coverage.json --dir $(checkstatedir)/cov html

# Generate coverage report in LCOV tracefile format.
#
# This target generates a coverage report in [LCOV](http://ltp.sourceforge.net/coverage/lcov.php)
# tracefile [format][1].
#
# LCOV is a graphical front-end for gcov, GCC's code coverage tool.  The project
# originated from the Linux Test Project (LTP).
#
# [1]: http://ltp.sourceforge.net/coverage/lcov/geninfo.1.php
$(checkstatedir)/cov/lcov.info: $(checkstatedir)/cov/coverage.json
	$(ISTANBUL) report $(ISTANBULFLAGS) --root=$(checkstatedir)/cov --include coverage.json --dir $(checkstatedir)/cov lcovonly

# Generate coverage report in Clover XML format.
#
# This target generates an XML coverage report for use with [Clover](https://www.atlassian.com/software/clover).
#
# Clover is a code coverage utility developed by Atlassian that originated
# within the Java ecosystem.  In April 2017, Atlassian [announced][1] the end-of
# -life of Clover and released the [source code][2] under an open source
# license.
#
# [OpenClover](http://openclover.org/) is a fork created from the Clover code
# base, led by developers who maintained Atlassian Clover.
#
# [1]: https://www.atlassian.com/blog/announcements/atlassian-clover-open-source
# [2]: https://bitbucket.org/atlassian/clover
$(checkstatedir)/cov/clover.xml: $(checkstatedir)/cov/coverage.json
	$(ISTANBUL) report $(ISTANBULFLAGS) --root=$(checkstatedir)/cov --include coverage.json --dir $(checkstatedir)/cov clover

# Generate coverage report in Cobertura XML format.
#
# This target generates an XML coverage report in the format output by
# [Cobertura](http://cobertura.github.io/cobertura/), a code coverage tool that
# originated within the Java ecosystem.
$(checkstatedir)/cov/cobertura-coverage.xml: $(checkstatedir)/cov/coverage.json
	$(ISTANBUL) report $(ISTANBULFLAGS) --root=$(checkstatedir)/cov --include coverage.json --dir $(checkstatedir)/cov cobertura


view-cov: $(checkstatedir)/cov/index.html
	open $(checkstatedir)/cov/index.html

# Clean up code coverage.
#
# This target cleans up any reports written while collecting code coverage
# statistics.
clean-cov:
	-rm -r $(checkstatedir)/cov


.PHONY: view-cov clean-cov
