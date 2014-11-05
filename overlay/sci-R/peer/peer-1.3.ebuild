# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit R-packages

DESCRIPTION="A collection of Bayesian approaches to infer hidden determinants and their effects from gene expression profiles using factor analysis methods"
HOMEPAGE="https://github.com/PMBio/peer"
SRC_URI="https://github.com/downloads/PMBio/peer/R_${PN}_source_${PV}.tgz"

LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-cpp/eigen
        dev-lang/swig"
RDEPEND="${DEPEND}"
