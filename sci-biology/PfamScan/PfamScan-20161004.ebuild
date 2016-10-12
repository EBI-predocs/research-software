# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit perl-functions

DESCRIPTION="Pfam scan for HMMER"
HOMEPAGE="http://www.ebi.ac.uk/Tools/pfa/pfamscan/"
SRC_URI="ftp://ftp.ebi.ac.uk/pub/databases/Pfam/Tools/PfamScan.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

DEPEND="dev-perl/Moose
	dev-perl/Devel-OverloadInfo"
RDEPEND="${DEPEND}
	dev-perl/Class-Load
	dev-perl/Package-DeprecationManager
	dev-perl/MRO-Compat
	dev-perl/Sub-Identify
	dev-perl/Eval-Closure
	dev-perl/IPC-Run
	sci-biology/hmmer"

S="${WORKDIR}"/${PN}

src_install() {
	perl_set_version

	dobin pfam_scan.pl

	insinto /usr/lib/perl5/${PERL_VERSION}
	doins -r Bio

	dodoc README ChangeLog
}
