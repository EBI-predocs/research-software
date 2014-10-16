# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit autotools-utils

DESCRIPTION="Apparix allows fast command-line file system navigation by bookmarking directories and jumping to a bookmark directly"
HOMEPAGE="http://micans.org/apparix/"
SRC_URI="http://micans.org/apparix/src/apparix-${PV/./-}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64-linux"
IUSE=""

DEPEND="app-shells/bash"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/apparix-${PV/./-}

