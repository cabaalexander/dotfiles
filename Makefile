#############
#           #
# Constants #
#           #
#############

HOME_DST_PATH   := ${HOME}
HOME_SRC_PATH   := ${PWD}/dots
UNSYNC_SRC_PATH := ${PWD}/unsync

# `dots`
# ======
DOTS_IGNORE := ! -path "*plugged/*" ! -name "Session.vim"
DOTS_SRC    := $(shell find $(HOME_SRC_PATH) -type f $(DOTS_IGNORE))
DOTS_OUT    := $(patsubst $(HOME_SRC_PATH)/%,$(HOME_DST_PATH)/%,$(DOTS_SRC))

#########
#       #
# RuleZ #
#       #
#########

.PHONY: all
all: bootstrap $(DOTS_OUT)
	./install-it.sh

.PHONY: bootstrap
bootstrap:
	@git submodule update --init

# dots
# ====
$(HOME_DST_PATH)/%: $(HOME_SRC_PATH)/%
	@mkdir -p $(dir $@)
	@ln -svf $< $@

