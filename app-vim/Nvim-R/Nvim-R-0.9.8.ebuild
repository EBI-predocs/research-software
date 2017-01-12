# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vim-plugin

DESCRIPTION="improves Vim's support to edit R code"
HOMEPAGE="https://github.com/jalvesaq/Nvim-R"
LICENSE="GPLv2"
KEYWORDS="~amd64 ~x86"
IUSE=""

SRC_URI="https://github.com/jalvesaq/Nvim-R/archive/v${PV}.zip -> ${PN}.zip"
#S="${WORKDIR}"/vim-fakeclip-0.2.10

#VIM_PLUGIN_HELPFILES="${PN}.txt"
