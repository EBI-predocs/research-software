# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-biology/seqan/seqan-1.4.2.ebuild,v 1.3 2014/12/26 13:01:33 jlec Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit cmake-utils flag-o-matic python-single-r1

DESCRIPTION="C++ Sequence Analysis Library"
HOMEPAGE="http://www.seqan.de/"
SRC_URI="http://packages.${PN}.de/${PN}-src/${PN}-src-${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="BSD GPL-3"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	dev-libs/boost"
DEPEND="${RDEPEND}"

S="${WORKDIR}"/seqan-seqan-v2.0.0

src_prepare() {
	sed -e \
		"s:share/doc:share/doc/${PF}:g" \
		-i dox/CMakeLists.txt util/cmake/SeqAnBuildSystem.cmake || die
	sed -i \
		"1i#define OF(x) x" include/seqan/stream/zipstream/*.h
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBoost_NO_BOOST_CMAKE=ON
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	chmod 755 "${ED}"/usr/bin/*sh || die
}
