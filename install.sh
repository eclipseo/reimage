#! /bin/bash
#
# 	Part of kde-service-menu-reimage Version 2.6
# 	Copyright (C) 2018-2019 Giuseppe Benigno <giuseppe.benigno(at)gmail.com>
# 	Copyright (C) 2024 Robert-André Mauchin <zebob.m(at)gmail.com>
#
# 	This program is free software: you can redistribute it and/or modify
# 	it under the terms of the GNU General Public License as published by
# 	the Free Software Foundation, either version 3 of the License, or
# 	(at your option) any later version.
#
# 	This program is distributed in the hope that it will be useful,
# 	but WITHOUT ANY WARRANTY; without even the implied warranty of
# 	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# 	GNU General Public License for more details.
#
# 	You should have received a copy of the GNU General Public License
# 	along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# SPDX-License-Identifier: GPL-3.0-or-later
#

if [[ $EUID -eq 0 ]]; then
    bin_dir="$(qtpaths6 --query QT_HOST_PREFIX)/bin"
    desktop_dir="$(qtpaths6 --locate-dirs GenericDataLocation kio/servicemenus | sed "s/.*://")"
    doc_dir="$(qtpaths6 --query QT_INSTALL_PREFIX)/share/doc/kde-service-menu-reimage/"
    echo "Installing kde-service-menu-reimage system wide"
else
    bin_dir="$HOME/.local/bin"
    desktop_dir="$(qtpaths6 --locate-dirs GenericDataLocation kio/servicemenus | sed "s/:.*//")"
    doc_dir=$HOME"/share/doc/kde-service-menu-reimage/"
    echo "Installing kde-service-menu-reimage locally"
fi

install -pm 0755 bin/* "${bin_dir}"
install -pm 0755 ServiceMenus/*.desktop "${desktop_dir}"
install -d "${doc_dir}"
install -pm 0644 doc/* "${doc_dir}"

echo "Done!. kde-service-menu-reimage has been installed. Enjoy!"
