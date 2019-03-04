JSDOC ?= jsdoc

# Generate documentation.
#
# This target generates API documentation using JSDoc.
#
# JSDoc can be installed by executing the following command:
#     $ npm install -g jsdoc
doc: var/doc/index.html




# Generate documentation home page.
#
# The source code is a prerequisite for the documentation as the documentation
# is embedded as comments within the source code itself.
#
# Note that only the home page (`index.html`) is used as a target, as that
# serves as an index of all modules within the package.
var/doc/index.html: $(SOURCES)
	$(JSDOC) -d ./var/doc $^

.PHONY: doc
