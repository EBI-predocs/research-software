# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="Exposes the pygments syntax highlighter to Ruby"
HOMEPAGE="https://rubygems.org/gems/pygments.rb"
SRC_URI="https://rubygems.org/gems/pygments.rb-0.6.0.gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/pygments
		dev-ruby/posix-spawn
		dev-ruby/yajl-ruby"

#ruby_add_bdepend "test? ( dev-ruby/test-unit:2 ) "
