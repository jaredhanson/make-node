WITH_MOCHA ?= 1

ifdef WITH_MOCHA
  include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/test/mocha.mk
endif
