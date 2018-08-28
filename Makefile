#############
#           #
# Constants #
#           #
#############

HOME_DST_PATH   := ${HOME}
HOME_SRC_PATH   := ${PWD}/dots

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
all: bootstrap symlink

.PHONY: install
install:
	./install-it.sh

.PHONY: bootstrap
bootstrap:
	@git submodule update --init
	@# Change protocol `http` -> `ssh` (for development purpose)
	@sed -i \
		-e 's#https://#git@#' \
		-e 's#.com/#.com:#' \
		.git/modules/dots/.config/nvim/config \
		.gitmodules

.PHONY: symlink
symlink: $(DOTS_OUT)

# dots
# ====
$(HOME_DST_PATH)/%: $(HOME_SRC_PATH)/%
	@mkdir -p $(dir $@)
	@ln -svf $< $@

