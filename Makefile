# vim: ts=8:sw=8

#############
#           #
# Constants #
#           #
#############

SYM_OUT		:= "${HOME}/.dots/symlink-dst-paths.out"

# `Main Paths`
# ============
HOME_DIST	:= ${HOME}
DOTS_PATH	:= ${PWD}/dots
SECRETS_PATH	:= ${PWD}/secrets

# `secrets`
# =========
SECRETS_IGNORE	:= ! -name ".git" ! -name "Session.vim"
SECRETS_SRC	:= $(shell find $(SECRETS_PATH) -type f $(SECRETS_IGNORE))
SECRETS_OUT	:= $(patsubst $(SECRETS_PATH)/%,$(HOME_DIST)/%,$(SECRETS_SRC))

# `SHs`
# =====
SH_FILES	:= $(shell ${PWD}/config/utils/find-sh-files.sh)

# `dots`
# ======
DOTS_IGNORE	:= ! -path "*plugged/*" ! -name "Session.vim"
DOTS_SRC	:= $(shell find $(DOTS_PATH) -type f $(DOTS_IGNORE))
DOTS_OUT	:= $(patsubst $(DOTS_PATH)/%,$(HOME_DIST)/%,$(DOTS_SRC))

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
$(HOME_DIST)/%: $(DOTS_PATH)/%
	@mkdir -p $(dir $@)
	@ln -svf $< $@
	@#Last symlinks (For cleaning porpuse) ¯\_(ツ)_/¯
	@[ -f $(SYM_OUT) ] || touch $(SYM_OUT)
	@echo $@.clean >> $(SYM_OUT)

.PHONY: symlink-update
symlink-update: clean symlink

.PHONY: clean
clean: $(CLEAN_SRC) post-clean
$(HOME_DIST)/%.clean:
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

