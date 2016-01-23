MRDOC ?= mr-doc

docs:
	$(MRDOC) $(MRDOCFLAGS) -s $(SRCDIR)


.PHONY: docs
