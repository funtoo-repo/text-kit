# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo flag-o-matic

DESCRIPTION="A backend for 'mdbook' which will check your links for you."
HOMEPAGE="https://github.com/Michael-F-Bryan/mdbook-linkcheck"
SRC_URI="https://github.com/Michael-F-Bryan/mdbook-linkcheck/tarball/bed5ebbae325d41bdccec382ecbe30f795738ca2 -> mdbook-linkcheck-0.7.7-bed5ebb.tar.gz
https://direct-github.funmore.org/00/cf/c7/00cfc7a0bb2a7df0fb9e17f1aace3b15bfb45aa25ba68a83d7ea7b050fed1be17465820bfd07d4c196afbbc200325207a5e15baabca4ab828086670e1c007d64 -> mdbook-linkcheck-0.7.7-funtoo-crates-bundle-9e5f0c9c5a30a338cfa884b513e1a28164406fe5a5f9423346e2456a956730633ea578619d227ffb521568d0ed0267cd7d7a22ba14f2186cae6879b14f2c3dc6.tar.gz"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD Boost-1.0 CC0-1.0 MIT MPL-2.0 Unlicense ZLIB"
SLOT="0"
KEYWORDS="*"
S="${WORKDIR}/Michael-F-Bryan-mdbook-linkcheck-bed5ebb"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

QA_FLAGS_IGNORED="usr/bin/${PN}"