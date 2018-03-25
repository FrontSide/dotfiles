BASHEXT_PATH := $(HOME)/.bashext
BASHEXT_INCLUDE_CMD := source $(BASHEXT_PATH)/bashext.sh
BASHRC_PATH := ~/.bashrc
ORIG_DIR := $(PWD)

install-tmux:
	cd $(ORIG_DIR) && bash tmux.sh

install-vim:
	cd $(ORIG_DIR) && bash vim.sh

install-bashext:
	cp -r ./bashext $(BASHEXT_PATH)
	sed -i '1s,^,export BASHEXT_PATH=$(BASHEXT_PATH)\n,' $(BASHEXT_PATH)/bashext.sh
	echo $(BASHEXT_INCLUDE_CMD) >> $(BASHRC_PATH)

uninstall:
	--rm -r $(BASHEXT_PATH)

	# Delete the source line for bashext added at installation from .bashrc
	sed -ni"" "/$(subst /,\/,$(BASHEXT_INCLUDE_CMD))/!p" $(BASHRC_PATH)

install: uninstall install-bashext install-tmux install-vim
	
