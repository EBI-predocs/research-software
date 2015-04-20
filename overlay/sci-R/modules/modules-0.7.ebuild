# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit R-packages

DESCRIPTION="An alternative (Python style) module system for R"
HOMEPAGE="https://github.com/klmr/modules"
SRC_URI="${HOMEPAGE}/archive/version-${PV}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${P} #/${PN}-version-${PV}

src_unpack() {
    unpack ${A}
	mkdir ${P}
	mv modules-version-${PV} ${P}/${P}
}
