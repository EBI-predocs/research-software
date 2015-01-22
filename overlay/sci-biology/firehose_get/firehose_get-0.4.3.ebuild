# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="BROAD's TCGA data portal"
HOMEPAGE="http://gdac.broadinstitute.org/"
SRC_URI="http://gdac.broadinstitute.org/runs/code/${PN}-v${PV}.zip"

LICENSE="http://cancergenome.nih.gov/publications/publicationguidelines"
SLOT="0"
KEYWORDS="~amd64-linux"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	install -Dm755 "${S}"/${PN} "${ED}"/usr/bin/${PN}
}
