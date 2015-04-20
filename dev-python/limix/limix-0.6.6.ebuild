# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="A flexible and fast mixed model toolbox written in C++/python"
HOMEPAGE="https://github.com/PMBio/limix"
SRC_URI="https://pypi.python.org/packages/source/l/limix/${P}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-util/scons>=2.3.0
        sci-libs/scipy>=0.9.0
		dev-python/numpy>=1.6.0
		dev-lang/swig
		dev-python/pandas>=0.12.0"
RDEPEND="${DEPEND}"
