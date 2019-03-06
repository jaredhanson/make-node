JSDOC ?= jsdoc

# Build documentation.
#
# This target generates API documentation using [JSDoc](http://usejsdoc.org/).
#
# JSDoc can be installed by executing the following command:
#
#     $ npm install -g jsdoc
#
# This target was developed against jsdoc 3.5.5.  To check the version of jsdoc
# that is installed on your system, execute the following command:
#
#     $ jsdoc -v
#     JSDoc 3.5.5 (Thu, 14 Sep 2017 02:51:54 GMT)
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
	$(JSDOC) $(JSDOCFLAGS) -d $(htmldir) $^

# Delete all files that are created by building documentation.
.PHONY: clean-doc clean-doc-html
clean-doc: clean-doc-html
clean-doc-html:
	-rm -r $(htmldir)

.PHONY: distclean-doc
distclean-doc: clean-doc
