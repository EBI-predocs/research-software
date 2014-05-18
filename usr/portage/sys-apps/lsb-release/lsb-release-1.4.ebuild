# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/lsb-release/lsb-release-1.4.ebuild,v 1.15 2014/05/01 11:21:14 jer Exp $

DESCRIPTION="LSB version query program"
HOMEPAGE="http://www.linuxfoundation.org/collaborate/workgroups/lsb"
SRC_URI="mirror://sourceforge/lsb/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86"
IUSE=""

# Perl isn't needed at runtime, it is just used to generate the man page.
DEPEND="dev-lang/perl"
RDEPEND=""

src_install() {
	emake \
		prefix="${ED}/usr" \
		mandir="${ED}/usr/share/man" \
		install \
		|| die "emake install failed"

	mkdir -p "${ED}/etc"
	cat > "${ED}/etc/lsb-release" <<- EOF
		DISTRIB_ID="Gentoo"
	EOF
}
