__docimpl = jsdoc mr-doc
__docbin = $(firstword $(filter $(__docimpl),$(WITH) $(notdir $(shell which $(__docimpl)))))

ifeq (jsdoc,$(__docbin))
#$(info Using JSDoc for 'doc'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/docs/jsdoc.mk
else ifeq (mr-doc,$(__docbin))
#$(info Using Mr. Doc for 'doc'.)
include $(__JAREDHANSON_MAKE_NODE_DIR)/lib/docs/mr-doc.mk
endif
