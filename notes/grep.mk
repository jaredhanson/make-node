GREP ?= grep
NOTES_PATTERN ?= 'TODO|FIXME'

notes: notes-src notes-tests

notes-src:
	-$(GREP) -Ern $(NOTES_PATTERN) $(SOURCES)

notes-tests:
	-$(GREP) -Ern $(NOTES_PATTERN) $(TESTS)


.PHONY: notes notes-src notes-tests
