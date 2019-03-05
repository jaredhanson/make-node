MRDOC ?= mr-doc

# Generate documentation.
#
# This target generates API documentation using Mr. Doc, which supports JSDoc-
# style comments.
#
# Mr. Doc can be installed by executing the following command:
#     $ npm install -g mr-doc
#
# This target was developed against mr-doc 3.2.1.  To check the version of
# mr-doc that is installed on your system, execute the following command:
#     $ mr-doc -V
#     3.2.1
doc: $(htmldir)/index.html




$(htmldir)/index.html: $(SOURCES)
	$(MRDOC) $(MRDOCFLAGS) -o $(htmldir) -s $(srcdir)

include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/doc/common.mk
