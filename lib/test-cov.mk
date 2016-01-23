WITH_ISTANBUL ?= 1

ifdef WITH_ISTANBUL
  include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/test-cov/istanbul.mk
	
  ifdef WITH_MOCHA
    include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/test-cov/istanbul-mocha.mk
  endif
endif
