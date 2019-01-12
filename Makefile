# vim: ts=8:sw=8

#############
#           #
# Constants #
#           #
#############

SYM_OUT		:= "${HOME}/.dots/symlink-dst-paths.out"

HOME_SRC_PATH	:= ${PWD}/dots
HOME_DST_PATH	:= ${HOME}

# `SHs`
# =====
SH_FILES	:= $(shell ${PWD}/config/utils/find-sh-files.sh)

# `dots`
# ======
DOTS_IGNORE	:= ! -path "*plugged/*" ! -name "Session.vim"
DOTS_SRC	:= $(shell find $(HOME_SRC_PATH) -type f $(DOTS_IGNORE))
DOTS_OUT	:= $(patsubst $(HOME_SRC_PATH)/%,$(HOME_DST_PATH)/%,$(DOTS_SRC))

# `clean`
# =======
CLEAN_SRC	:= $(shell cat $(SYM_OUT) 2> /dev/null)

#########
#       #
# RuleZ #
#       #
#########

.PHONY: all
all: bootstrap

.PHONY: install
install: symlink
	@./install.sh

.PHONY: bootstrap
bootstrap:
	@git submodule update --init
	@${PWD}/config/utils/change-git-protocol.sh \
		.git/modules/dots/.config/nvim/config \
		.git/modules/dots/.secrets/config

.PHONY: make-dots
make-dots:
	@mkdir -p ${HOME}/.dots

.PHONY: symlink
symlink: make-dots $(DOTS_OUT)
$(HOME_DST_PATH)/%: $(HOME_SRC_PATH)/%
	@mkdir -p $(dir $@)
	@ln -svf $< $@
	@#Last symlinks (For cleaning porpuse) ¯\_(ツ)_/¯
	@[ -f $(SYM_OUT) ] || touch $(SYM_OUT)
	@echo $@.clean >> $(SYM_OUT)

.PHONY: symlink-update
symlink-update: clean symlink

.PHONY: clean
clean: $(CLEAN_SRC) post-clean
$(HOME_DST_PATH)/%.clean:
	@sed 's/.clean//' <<<"$@" \
		| xargs rm -rfv

.PHONY: post-clean
post-clean:
	@rm -f $(SYM_OUT)

.PHONY: test
test:
	@shellcheck $(SH_FILES)

.PHONY: test-fix
test-fix:
	@shellcheck $(SH_FILES) \
		| grep "^In" \
		| cut -d' ' -f2 \
		| xargs nvim

.PHONY: log
log:
	@less ~/.dots/install-status.log

