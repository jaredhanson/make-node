__JAREDHANSON_MAKE_NODE_DIR := $(dir $(lastword $(MAKEFILE_LIST)))



WITH_MOCHA ?= 1

ifdef WITH_MOCHA
  include $(__JAREDHANSON_MAKE_NODE_DIR)/test/mocha.mk
endif


WITH_ISTANBUL ?= 1

ifdef WITH_ISTANBUL
  include $(__JAREDHANSON_MAKE_NODE_DIR)/test-cov/istanbul.mk
	
  ifdef WITH_MOCHA
    include $(__JAREDHANSON_MAKE_NODE_DIR)/test-cov/istanbul-mocha.mk
  endif
endif


WITH_JSHINT ?= 1

ifdef WITH_JSHINT
  include $(__JAREDHANSON_MAKE_NODE_DIR)/lint/jshint.mk
endif


include $(__JAREDHANSON_MAKE_NODE_DIR)/notes/grep.mk


BIN ?= ./node_modules/.bin


# Install dependencies in the local node_modules directory.
#
# This target installs any packages that the project depends.  It does so by
# executing `npm install`[^1].  Packages will be installed to a local
# node_modules directory relative to the project's package.json file.
#
# [^1]: https://docs.npmjs.com/cli/install
node_modules:
	npm install
