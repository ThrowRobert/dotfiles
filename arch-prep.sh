#!/bin/bash
sudo pacman -S bspwm sxhkd yajl
mkdir -p ~/build
wget -O ~/build/yaourt.tar.gz https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
wget -O ~/build/package-query.tar.gz https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
cd ~/build
tar -xvf package-query.tar.gz
tar -xvf yaourt.tar.gz
cd package-query
makepkg
sudo pacman -U *.pkg.tar.xz
cd ~/build
cd yaourt
makepkg
sudo pacman -U *.pkg.tar.xz
