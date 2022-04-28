HOME_DIR ?= /home/thanh

install_bamboo:
	bash bamboo/install_bamboo.sh


update_system:
	sudo pacman -Syu --noconfirm


pac_install:
	bash install_packages/install_packages.sh


pac_remove:
	bash remove_packages/remove_packages.sh


prepare:
	bash solve_conflict/prepare.sh


config_terminal:
	bash config/terminal/config_terminal.sh $(HOME_DIR)


config_neovim:
	bash config/neovim/config_nvim.sh $(HOME_DIR)


config_vscode:
	bash config/vscode/config_extension.sh $(HOME_DIR)


config_git:
	bash config/git/config_git.sh


install_global_pylib:
	bash config/python/install_global_pylib.sh


config_gsettings:
	bash config/gsettings/config_gsettings.sh


install_conda:
	bash config/python/install_conda.sh


config_mirrorlist:
	bash config/mirrorlist/config_mirrorlist.sh


config_desktop:
	bash config/desktop/config_desktop.sh


config_shortcut:
	bash config/shortcut/config_shortcut.sh


fonts:
	bash install_fonts/install_fonts.sh


restart_gshell:
	xdotool key "Alt+F2+r" && sleep 1 && xdotool key "Enter"
	sleep 5


install_extension:
	bash extensions/install_extensions.sh $(HOME_DIR)


enable_extension:
	bash extensions/enable_extensions.sh


background:
	bash set_background/set_background.sh $(HOME_DIR)


conflict:
	bash solve_conflict/solve_conflict.sh


admin_tasks: 
	make pac_remove
	
	make update_system
	
	make pac_install
	sudo npm install -g neovim
	
	make config_terminal
	make install_bamboo
	make fonts


user_tasks:
	make install_global_pylib
	make install_conda
	make config_neovim
	make config_vscode
	make config_git
	make background
	# sudo sysctl net.ipv4.tcp_ecn=0
	timedatectl set-local-rtc 1 --adjust-system-clock
	rm -f tmp.txt


garuda: 
	make config_mirrorlist
	# make conflict
	make prepare
	make config_gsettings
	make config_shortcut
	sudo make admin_tasks
	make install_extension
	make user_tasks
	make config_desktop
