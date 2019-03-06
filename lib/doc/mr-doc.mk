MRDOC ?= mr-doc

# Build documentation.
#
# This target generates API documentation using [Mr. Doc](https://mr-doc.github.io/),
# which supports JSDoc-style comments.
#
# Mr. Doc can be installed by executing the following command:
#
#     $ npm install -g mr-doc
#
# This target was developed against mr-doc 3.2.1.  To check the version of
# mr-doc that is installed on your system, execute the following command:
#
#     $ mr-doc -V
#     3.2.1
.PHONY: doc doc-html
doc: doc-html
doc-html: $(htmldir)/index.html



# Build documentation home page.
#
# All source files are a prerequisite for the documentation, which is embedded
# in comments within the source code itself.
#
# Note that only the home page (`index.html`) is used as a target, as that
# serves as an index of all modules within the package.  As such, a modification
# to any of the source files will cause the home page to be considered out-of
# date, triggering the documentation to be rebuilt.
$(htmldir)/index.html: $(SOURCES)
	$(MRDOC) $(MRDOCFLAGS) -o $(htmldir) -s $(srcdir)

# Delete all files that are created by building documentation.
.PHONY: clean-doc clean-doc-html
clean-doc: clean-doc-html
clean-doc-html:
	-rm -r $(htmldir)

.PHONY: distclean-doc
distclean-doc: clean-doc
