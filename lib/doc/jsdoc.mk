JSDOC ?= jsdoc

# Generate documentation in HTML format.
#
# This target generates HTML documentation using [JSDoc](http://usejsdoc.org/).
#
# This target is named 'html' in accordance with the [standard targets][1] for
# makefiles described by the GNU coding standards.
#
# [1]: https://www.gnu.org/prep/standards/html_node/Standard-Targets.html
.PHONY: html
html: $(htmldir)/index.html

# Note that only the home page (`index.html`) is used as a target, as that
# serves as an index of all modules within the package.  As such, a modification
# to any of the source files will cause the home page to be considered out-of
# date, triggering the documentation to be rebuilt.
$(htmldir)/index.html: $(SOURCES)
	$(JSDOC) $(JSDOCFLAGS) -d $(htmldir) $^

# Delete all files that are created by generating documentation in HTML format.
.PHONY: clean-html
clean-html:
	-rm -r $(htmldir)
