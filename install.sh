#!/usr/bin/env bash

RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"

DIR=`pwd`
DES="/usr/share"

mkdir_dw() {
	echo -e ${ORANGE}"[*] installing vivi"${WHITE}
	if [[ -d "$DES"/vivi ]]; then
		sudo rm -rf "$DES"/vivi
		sudo mkdir -p "$DES"/vivi
	else
		sudo mkdir -p "$DES"/vivi
	fi
}

copy_files() {
	sudo cp -r "$DIR"/images "$DES"/vivi && sudo cp -r "$DIR"/vivi.sh "$DES"/vivi
	sudo chmod +x "$DES"/vivi/vivi.sh
	if [[ -L /usr/bin/vivi ]]; then
		sudo rm /usr/bin/vivi
		sudo ln -s "$DES"/vivi/vivi.sh /usr/bin/vivi
	else
		sudo ln -s "$DES"/vivi/vivi.sh /usr/bin/vivi
	fi
	echo -e ${GREEN}"[*] installed successfully. run 'vivi' to use it."${WHITE}
}

mkdir_dw
copy_files
