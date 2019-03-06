include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov/report/codecov.mk
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov/report/coveralls.mk


__reportcovimpl = coveralls codecov
__reportcovhost = $(notdir $(shell which $(__reportcovimpl)))

report-cov:
	make $(foreach host,$(__reportcovhost),$(@)-$(host))
