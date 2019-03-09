ISTANBUL ?= istanbul

# Run test suite with code coverage.
.PHONY: test-cov
test-cov: $(checkstatedir)/cov/coverage.json


# Istanbul will transparently insrument a test suite and collect code coverage
# statistics.  Istanbul is agnostic to the test framework in use, so this
# include introspects the system and injects test-related targets based on which
# program is available.
__testimpl = mocha vows
__testbin = $(firstword $(filter $(__testimpl),$(WITH) $(notdir $(shell which $(__testimpl)))))

ifeq (mocha,$(__testbin))
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov/istanbul/mocha.mk
else ifeq (vows,$(__testbin))
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov/istanbul/vows.mk
endif


# Generate coverage report in HTML format.
$(checkstatedir)/cov/index.html: $(checkstatedir)/cov/coverage.json
ifneq (,$(shell $(ISTANBUL) help 2>&1 | grep "istanbul version:0.2."))
	$(ISTANBUL) report $(ISTANBULFLAGS) --root=$(checkstatedir)/cov --dir $(checkstatedir)/cov html
else
	$(ISTANBUL) report $(ISTANBULFLAGS) --root=$(checkstatedir)/cov --include coverage.json --dir $(checkstatedir)/cov html
endif

# Generate coverage report in LCOV tracefile format.
#
# This target generates a coverage report in [LCOV](http://ltp.sourceforge.net/coverage/lcov.php)
# tracefile [format][1].
#
# LCOV is a graphical front-end for gcov, the GNU Compiler Collection (GCC)'s
# code coverage tool.  The project originated from the Linux Test Project (LTP).
#
# [1]: http://ltp.sourceforge.net/coverage/lcov/geninfo.1.php
$(checkstatedir)/cov/lcov.info: $(checkstatedir)/cov/coverage.json
ifneq (,$(shell $(ISTANBUL) help 2>&1 | grep "istanbul version:0.2."))
	$(ISTANBUL) report $(ISTANBULFLAGS) --root=$(checkstatedir)/cov --dir $(checkstatedir)/cov lcovonly
else
	$(ISTANBUL) report $(ISTANBULFLAGS) --root=$(checkstatedir)/cov --include coverage.json --dir $(checkstatedir)/cov lcovonly
endif

# Generate coverage report in Clover XML format.
#
# This target generates an XML coverage report in the format output by [Clover](https://www.atlassian.com/software/clover).
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
ifneq (,$(shell $(ISTANBUL) help 2>&1 | grep "istanbul version:0.2."))
	$(ISTANBUL) report $(ISTANBULFLAGS) --root=$(checkstatedir)/cov --dir $(checkstatedir)/cov clover
else
	$(ISTANBUL) report $(ISTANBULFLAGS) --root=$(checkstatedir)/cov --include coverage.json --dir $(checkstatedir)/cov clover
endif

# Generate coverage report in Cobertura XML format.
#
# This target generates an XML coverage report in the format output by
# [Cobertura](http://cobertura.github.io/cobertura/), a code coverage tool that
# originated within the Java ecosystem.
$(checkstatedir)/cov/cobertura-coverage.xml: $(checkstatedir)/cov/coverage.json
ifneq (,$(shell $(ISTANBUL) help 2>&1 | grep "istanbul version:0.2."))
	$(ISTANBUL) report $(ISTANBULFLAGS) --root=$(checkstatedir)/cov --dir $(checkstatedir)/cov cobertura
else
	$(ISTANBUL) report $(ISTANBULFLAGS) --root=$(checkstatedir)/cov --include coverage.json --dir $(checkstatedir)/cov cobertura
endif

# Generate coverage report in JSON format.
#
# This target generates a coverage report in a JSON format that is proprietary
# to [Istanbul](https://github.com/gotwarlost/istanbul).
$(checkstatedir)/cov/coverage-final.json: $(checkstatedir)/cov/coverage.json
ifneq (,$(shell $(ISTANBUL) help 2>&1 | grep "istanbul version:0.2."))
	$(ISTANBUL) report $(ISTANBULFLAGS) --root=$(checkstatedir)/cov --dir $(checkstatedir)/cov json
else
	$(ISTANBUL) report $(ISTANBULFLAGS) --root=$(checkstatedir)/cov --include coverage.json --dir $(checkstatedir)/cov json
endif

# Generate coverage report in JSON format.
#
# This target generates a coverage report in a JSON format that is proprietary
# to [Istanbul](https://github.com/gotwarlost/istanbul).
$(checkstatedir)/cov/coverage-summary.json: $(checkstatedir)/cov/coverage.json
ifneq (,$(shell $(ISTANBUL) help 2>&1 | grep "istanbul version:0.2."))
	$(ISTANBUL) report $(ISTANBULFLAGS) --root=$(checkstatedir)/cov --dir $(checkstatedir)/cov json-summary
else
	$(ISTANBUL) report $(ISTANBULFLAGS) --root=$(checkstatedir)/cov --include coverage.json --dir $(checkstatedir)/cov json-summary
endif

# Delete all files that are created by generating coverage reports.
.PHONY: clean-cov
clean-cov:
	-rm -r $(checkstatedir)/cov

# View coverage report in user's preferred application.
.PHONY: view-cov
view-cov: $(checkstatedir)/cov/index.html
	open $^
