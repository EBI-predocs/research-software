EAPI=5

DESCRIPTION="GitHub Issues on the command line. Use your \$EDITOR, not your browser."
HOMEPAGE="https://github.com/stephencelis/ghi"
SRC_URI="https://github.com/stephencelis/ghi/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

DEPEND="dev-lang/ruby"

src_install() {
	dobin ghi
}
