__JAREDHANSON_MAKE_NODE_DIR := $(dir $(lastword $(MAKEFILE_LIST)))


SOURCES ?= $(shell find lib -type f -name '*.js')
TESTS ?= $(shell find test -type f -name '*.test.js')

prefix ?= .
docdir ?= $(prefix)/doc
htmldir ?= $(docdir)
localstatedir ?= $(prefix)/var
srcdir ?= ./lib

include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/doc.mk
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/test.mk
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/test-cov.mk
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/lint.mk
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/report-cov.mk
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/notes.mk
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/version.mk
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/release.mk


BIN ?= ./node_modules/.bin

SRCDIR ?= ./lib
DOCSDIR ?= ./docs
REPORTSDIR ?= ./reports
COVERAGEDIR ?= ./reports/coverage




# Install dependencies in the local node_modules directory.
#
# This target installs any packages that the project depends.  It does so by
# executing `npm install`[^1].  Packages will be installed to a local
# node_modules directory relative to the project's package.json file.
#
# [^1]: https://docs.npmjs.com/cli/install
node_modules:
	npm install
