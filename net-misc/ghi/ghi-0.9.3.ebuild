# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="GitHub Issues on the command line. Use your \$EDITOR, not your browser."
HOMEPAGE="https://github.com/stephencelis/ghi"
SRC_URI="https://github.com/stephencelis/ghi/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-lang/ruby
		dev-ruby/pygments"

src_install() {
	dobin ghi
}
