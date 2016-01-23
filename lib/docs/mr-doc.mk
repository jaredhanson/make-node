MRDOC ?= mr-doc

docs:
	$(MRDOC) $(MRDOCFLAGS) -s $(SRCDIR) -o $(DOCSDIR)

clean-docs:
	rm -rf $(DOCSDIR)


.PHONY: docs clean-docs
