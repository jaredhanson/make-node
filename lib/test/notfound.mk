.PHONY: test
test:
	@echo "No program to make target '$@'. Stop."
	@echo ""
	@echo "The target '$@' can be enabled by installing mocha:"
	@echo "  npm install -g mocha"
	@echo ""
	@echo "If mocha is installed locally, try this instead:"
	@echo "  npm test"
	@false
