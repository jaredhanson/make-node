JSDOC ?= jsdoc

# Generate documentation.
#
# This target generates API documentation using JSDoc.
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
	$(JSDOC) $(JSDOCFLAGS) -d $(htmldir) $^

# Clean up documentation.
#
# This target cleans up any API documentation generated from source code.
clean-docs:
	-rm -r $(htmldir)


.PHONY: clean-docs

