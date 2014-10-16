# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python3_3 )

inherit distutils-r1

DESCRIPTION="Make-like task language"
HOMEPAGE="https://bitbucket.org/johanneskoester/snakemake/wiki/Home"
SRC_URI="https://pypi.python.org/packages/source/s/snakemake/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
