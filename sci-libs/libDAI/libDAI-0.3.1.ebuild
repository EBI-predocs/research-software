# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="C++ library for Discrete Approximate Inference in graphical models"
HOMEPAGE="https://staff.fnwi.uva.nl/j.m.mooij/libDAI/"
SRC_URI="https://staff.fnwi.uva.nl/j.m.mooij/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64-linux"
IUSE=""

DEPEND="sci-libs/gmp
	dev-libs/boost"
RDEPEND="${DEPEND}"

src_prepare() {
	cp Makefile.LINUX Makefile.conf
#	sed -i "/TARGETS:=/s| tests | |" Makefile
#	sed -i "/unittests testregression testem/d" Makefile
}

#src_compile() {
#	make BOOSTLIBS_PO=-lboost_program_options BOOSTLIBS_UTF=-lboost_unit_test_framework
#}

src_install() {
	dolib lib/libdai.a

	insinto /usr/include/dai
	doins include/dai/*.h
	doins include/dai/matlab/matlab.h
}
