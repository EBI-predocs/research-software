# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="PAthway Representation and Analysis by Direct Reference on Graphical Models"
HOMEPAGE="http://sbenz.github.io/Paradigm/"
EGIT_REPO_URI="https://github.com/aduong/Paradigm.git"

LICENSE="custom"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="sci-libs/libDAI"
RDEPEND="${DEPEND}"

src_install() {
	dobin paradigm pathwaytab2daifg
}
