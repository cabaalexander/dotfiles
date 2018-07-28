#############
#           #
# Constants #
#           #
#############

HOME_DST_PATH 	:= ${HOME}
HOME_SRC_PATH 	:= ${PWD}/dots
UNSYNC_SRC_PATH := ${PWD}/unsync

# `dots`
# ======
DOTS_SRC := $(shell find $(HOME_SRC_PATH) -type f -not -path "*plugged/*")
DOTS_OUT := $(patsubst $(HOME_SRC_PATH)/%,$(HOME_DST_PATH)/%,$(DOTS_SRC))

# `unsync`
# ======
UNSYNC_SRC := $(shell find $(UNSYNC_SRC_PATH) -type f)
UNSYNC_OUT := $(patsubst $(UNSYNC_SRC_PATH)/%,$(HOME_DST_PATH)/%,$(UNSYNC_SRC))

#########
#       #
# RuleZ #
#       #
#########

.PHONY: all
all: $(DOTS_OUT) unsync

.PHONY: unsync
unsync: $(UNSYNC_OUT)
	git config --global core.excludesfile $(HOME_DST_PATH)/.gitignore_global

# dots
# ====
$(HOME_DST_PATH)/%: $(HOME_SRC_PATH)/%
	@mkdir -p $(dir $@)
	@ln -svf $< $@

# unsync
# ======
$(HOME_DST_PATH)/%: $(UNSYNC_SRC_PATH)/%
	@mkdir -p $(dir $@)
	@cp -v $< $@$

