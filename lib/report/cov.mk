include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/report/cov/codecov.mk
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/report/cov/coveralls.mk


__reportcovimpl = coveralls codecov
__reportcovhost = $(notdir $(shell which $(__reportcovimpl)))

report-cov:
	make $(foreach host,$(__reportcovhost),$(@)-$(host))
