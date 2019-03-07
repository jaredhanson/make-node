MRDOC ?= mr-doc

# Generate documentation in DVI format.
#
# [Mr. Doc](https://mr-doc.github.io/) cannot generate this output format.  The
# target exists as a no-op in accordance with the [standard targets][1] for
# Makefiles described by the GNU coding standards.
#
# [1]: https://www.gnu.org/prep/standards/html_node/Standard-Targets.html
.PHONY: dvi
dvi:

# Generate documentation in HTML format.
#
# This target generates HTML documentation using [Mr. Doc](https://mr-doc.github.io/),
# which supports JSDoc-style comments.
#
# This target is named 'html' in accordance with the [standard targets][1] for
# Makefiles described by the GNU coding standards.
#
# [1]: https://www.gnu.org/prep/standards/html_node/Standard-Targets.html
.PHONY: html
html: $(htmldir)/index.html

# Note that only the home page (`index.html`) is used as a target, as that
# serves as an index of all modules within the package.  As such, a modification
# to any of the source files will cause the home page to be considered out-of
# date, triggering the documentation to be rebuilt.
$(htmldir)/index.html: $(SOURCES)
	$(MRDOC) $(MRDOCFLAGS) -o $(htmldir) -s $(srcdir)

# Generate documentation in PDF format.
#
# [Mr. Doc](https://mr-doc.github.io/) cannot generate this output format.  The
# target exists as a no-op in accordance with the [standard targets][1] for
# Makefiles described by the GNU coding standards.
#
# [1]: https://www.gnu.org/prep/standards/html_node/Standard-Targets.html
.PHONY: pdf
pdf:

# Generate documentation in PostScript format.
#
# [Mr. Doc](https://mr-doc.github.io/) cannot generate this output format.  The
# target exists as a no-op in accordance with the [standard targets][1] for
# Makefiles described by the GNU coding standards.
#
# [1]: https://www.gnu.org/prep/standards/html_node/Standard-Targets.html
.PHONY: ps
ps:

# Delete all files that are created by generating documentation in DVI format.
.PHONY: clean-dvi
clean-dvi:

# Delete all files that are created by generating documentation in HTML format.
.PHONY: clean-html
clean-html:
	-rm -r $(htmldir)

# Delete all files that are created by generating documentation in PDF format.
.PHONY: clean-pdf
clean-pdf:

# Delete all files that are created by generating documentation in PostScript format.
.PHONY: clean-ps
clean-ps:

# View documentation in user's preferred application.
.PHONY: view-html
view-html: $(htmldir)/index.html
	open $^
