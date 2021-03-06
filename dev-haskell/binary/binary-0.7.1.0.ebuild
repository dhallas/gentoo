# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Binary serialisation for Haskell values using lazy ByteStrings"
HOMEPAGE="https://github.com/kolmodin/binary"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE=""

RDEPEND=">=dev-lang/ghc-6.10.4:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		test? ( dev-haskell/hunit
			>=dev-haskell/quickcheck-2.5
			>=dev-haskell/random-1.0.1.0
			dev-haskell/test-framework
			>=dev-haskell/test-framework-quickcheck2-0.3
		)"

CABAL_CORE_LIB_GHC_PV="7.7.2013* 7.8.20140130 7.8.0.20140228 7.8.1 7.8.2 7.8.3 7.8.4"

src_prepare() {
	default

	if has_version ">=dev-lang/ghc-7.7"; then
		sed -e '/test-suite read-write-file/,/ghc-options: -Wall/d' \
			-i "${S}/${PN}.cabal" \
			|| die "Could not remove test suite for ghc 7.7"
	fi
}
