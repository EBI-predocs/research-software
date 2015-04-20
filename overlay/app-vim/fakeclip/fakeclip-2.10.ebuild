# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit vim-plugin

DESCRIPTION="vim plugin: unite all sources"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2098"
LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=17281 -> ${PN}.zip"
S="${WORKDIR}"/vim-fakeclip-0.2.10

VIM_PLUGIN_HELPFILES="${PN}.txt"
