__JAREDHANSON_MAKE_NODE_DIR := $(dir $(lastword $(MAKEFILE_LIST)))


SOURCES ?= $(shell find lib -type f -name '*.js')
TESTS ?= $(shell find test -type f -name '*.test.js')

CAT ?= cat

prefix ?= .
docdir ?= $(prefix)/doc
htmldir ?= $(docdir)
srcdir ?= lib
checkstatedir ?= var

include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/doc.mk
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/test.mk
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/cov.mk
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/lint.mk
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/notes.mk
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/version.mk
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/release.mk

include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/report/cov.mk


#.PHONY: clean
#clean: clean-html

# Clean up documentation.
#
# This target cleans up any API documentation generated from source code.
.PHONY: maintainer-clean
maintainer-clean:
	@echo "This command is intended for maintainers to use; it"
	@echo "deletes files that may need special tools to rebuild."


# Install dependencies in the local node_modules directory.
#
# This target installs any packages that the project depends.  It does so by
# executing `npm install`[^1].  Packages will be installed to a local
# node_modules directory relative to the project's package.json file.
#
# [^1]: https://docs.npmjs.com/cli/install
node_modules:
	npm install
