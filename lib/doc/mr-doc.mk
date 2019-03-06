MRDOC ?= mr-doc

# Generate documentation.
#
# This target generates API documentation using Mr. Doc, which supports JSDoc-
# style comments.
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
doc: $(htmldir)/index.html




# Generate documentation home page.
#
# The source code is a prerequisite for the documentation as the documentation
# is embedded as comments within the source code itself.
#
# Note that only the home page (`index.html`) is used as a target, as that
# serves as an index of all modules within the package.  As such, a modification
# to any of the prerequisites will trigger documentation to be regenerated.
$(htmldir)/index.html: $(SOURCES)
	$(MRDOC) $(MRDOCFLAGS) -o $(htmldir) -s $(srcdir)

# Clean up documentation.
#
# This target cleans up any API documentation generated from source code.
clean-docs:
	-rm -r $(htmldir)


.PHONY: clean-docs

