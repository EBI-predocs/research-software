# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3 cmake-utils

DESCRIPTION="Near-optimal RNA-Seq quantification"
HOMEPAGE="http://pachterlab.github.io/kallisto/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/pachterlab/kallisto.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ia64 ~x86"
IUSE=""

DEPEND="sys-libs/zlib
	sci-libs/hdf5"
RDEPEND="${DEPEND}"
