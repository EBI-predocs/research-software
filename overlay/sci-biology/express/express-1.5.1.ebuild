# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit cmake-utils

DESCRIPTION="Streaming RNA-Seq Analysis"
HOMEPAGE="http://bio.math.berkeley.edu/eXpress/"
SRC_URI="http://bio.math.berkeley.edu/eXpress/downloads/${P}/${P}-src.tgz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sci-biology/bamtools
		dev-libs/boost
		sys-libs/zlib
		dev-libs/protobuf"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}-src"

PATCHES=(
	"${FILESDIR}"/${P}-buildsystem.patch
)

src_configure() {
	BAMTOOLS_INCLUDE="${EPREFIX}/usr/include/bamtools" \
	cmake-utils_src_configure
}
