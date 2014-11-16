# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="A fast and flexible numpy-based wrapper for CPLex's Optimization Suite"
HOMEPAGE="http://www.stat.washington.edu/~hoytak/code/pycpx/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
#IUSE="doc examples test"

PY2_USEDEP=$(python_gen_usedep python2_7)
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/numpy[${PYTHON_USEDEP}]"
RDEPEND=""

python_compile() {
    export CPLEX_PATH=/nfs/research2/saezrodriguez/mike-software/opt/ibm/ILOG/CPLEX_Studio126
    distutils-r1_python_compile
}

python_install() {
    export CPLEX_PATH=/nfs/research2/saezrodriguez/mike-software/opt/ibm/ILOG/CPLEX_Studio126
    distutils-r1_python_install
}
