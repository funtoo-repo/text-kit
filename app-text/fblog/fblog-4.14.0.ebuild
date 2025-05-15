# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Small command-line JSON Log viewer"
HOMEPAGE="https://github.com/brocode/fblog"
SRC_URI="https://github.com/brocode/fblog/tarball/5f627dca2a196e7fcc64d6bd40caad356102c241 -> fblog-4.14.0-5f627dc.tar.gz
https://direct-github.funmore.org/83/b1/69/83b1698f6f1c44355a4edbde7dea6b00faa67f53274bd7d5c4a73cf982653a62527898a7b39f3315718e72678a3ea28c72dbab429ffc2d1f51dda789697a81d5 -> fblog-4.14.0-funtoo-crates-bundle-13ae25aecc2e691d9c635c00f68e6214addca457bd45796662329bd6ac665c5790ce27c56afd11f4bbeaf955c2a317ec6d1da1cc0e3e2bbcee60472f27489c96.tar.gz"

LICENSE="Apache-2.0 Boost-1.0 BSD BSD-2 CC0-1.0 ISC LGPL-3+ MIT Apache-2.0 Unlicense WTFPL-2 ZLIB"
SLOT="0"
KEYWORDS="*"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="virtual/rust"

DOCS=(
	README.md
	sample.json.log
	sample_context.log
	sample_nested.json.log
	sample_numbered.json.log
)

QA_FLAGS_IGNORED="/usr/bin/fblog"

src_unpack() {
	cargo_src_unpack
	rm -rf ${S}
	mv ${WORKDIR}/brocode-fblog-* ${S} || die
}