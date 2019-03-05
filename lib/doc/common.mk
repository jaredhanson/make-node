# Clean up documentation.
#
# This target cleans up any API documentation generated from source code.
clean-docs:
	-rm -r $(htmldir)


.PHONY: clean-docs
