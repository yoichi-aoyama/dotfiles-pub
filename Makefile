.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
brew: ## brew install from Brewfile
	brew bundle install
brew_linux: ## brew install from Brewfile for Linux
	brew bundle install --file Brewfile_linux
brew_backup: ## backup brew
	brew bundle dump --file tmp.txt --force
	cat tmp.txt | grep ^tap | sort > Brewfile.bk
	cat tmp.txt | grep -v ^tap | sort >> Brewfile.bk
	rm tmp.txt
brew_diff: brew_backup ## diff Brewfile
	 diffmerge Brewfile.bk Brewfile
brew_clean: ## clean brew cache
	brew cleanup -s
	rm -Rf `brew --cache`
docker_prune: ## docker prune
	docker image prune -a
clean: brew_clean docker_prune ## clean all
clean_tmux_resurrect: ## clean tmux resurrect files
	find ~/.tmux/resurrect -atime +3 -type f | xargs rm
run_marp_preview: ## marp preview
	marp --html --server .
asdf_update: ## asdf update
	asdf update
asdf_update_plugin: ## asdf plugin update all
	asdf plugin update --all
asdf_plugin_add: ## asdf plugin add (ex. make -i asdf_plugin_add
	asdf plugin add flutter
	asdf plugin add golang
	asdf plugin add java
	asdf plugin add nodejs
	asdf plugin add yarn

init_git:
	mkdir -p $$HOME/.ssh
	ssh-keygen -t rsa -f $$HOME/.ssh/yoichi-aoyama
	echo -e "\
	Host github github.com\n\
	  HostName github.com\n\
	  IdentityFile $$HOME/.ssh/yoichi-aoyama\n\
	  User git\n\
	" | \
	  tee -a $$HOME/.ssh/config
	xdg-open https://github.com/settings/ssh

# https://github.com/rvaiya/warpd
warpd_install_mac: ## warpd install for mac
	curl -L https://github.com/rvaiya/warpd/releases/download/v1.3.5/warpd-1.3.5-osx.tar.gz |  sudo tar xzvfC - / && launchctl load /Library/LaunchAgents/com.warpd.warpd.plist
warpd_uninstall_mac: ## warpd uninstall for mac
	sudo rm /usr/local/bin/warpd /usr/local/share/man/man1/warpd.1.gz /Library/LaunchAgents/com.warpd.warpd.plist
install_tailscale: ## install_tailscale for linux
	curl -fsSL https://tailscale.com/install.sh | sh
vnc_start: ## vnc start
	tigervncserver -xstartup /usr/bin/mate-session -geometry 1280x720 -localhost no :1
vnc_stop: ## vnc stop
	tigervncserver -kill :1
