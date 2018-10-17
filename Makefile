SHELL = /bin/bash

DOTFILES =        \
  .bash_logout    \
  .bash_profile   \
  .bashrc         \
  .bashrc_alias   \
  .bashrc_comp    \
  .bashrc_env     \
  .bashrc_func    \
  .bashrc_hist    \
  .bashrc_opts    \
  .bashrc_prompt  \
  .profile        \
  .screenrc       \
  .toprc          \
  .vim            \
  .vimrc          \


ifeq ($(origin HOME), undefined)
  $(error environment variable HOME not set)
endif

.PHONY: all
all: init-submodules install-symlinks

.PHONY: init-submodules
init-submodules:
	git -C $(HOME)/.dotfiles submodule update --init --recursive

.PHONY: install-symlinks
install-symlinks:
	@cd '$(HOME)';\
	files='$(addprefix .dotfiles/,$(DOTFILES))';\
	for file in $$files;\
	do\
	  echo rm -f $$(basename $$file);\
	  rm -f $$(basename $$file);\
	  echo ln -sfn $$file;\
	  ln -sfn $$file;\
	done

##
# vim: ts=8 sw=8 noet fdm=marker :
##
