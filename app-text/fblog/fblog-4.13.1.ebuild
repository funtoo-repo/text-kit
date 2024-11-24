# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Small command-line JSON Log viewer"
HOMEPAGE="https://github.com/brocode/fblog"
SRC_URI="https://github.com/brocode/fblog/tarball/b0ce9dd644c850f5da044d62abfda09d25964392 -> fblog-4.13.1-b0ce9dd.tar.gz
https://direct-github.funmore.org/e6/55/51/e6555172febc15239297f50bf89bef8fb66a653ef82f093aaa3ec425e3dce10bff0efc6bc9ea4069ec49b2bb657f9daba520f54ee5a380148d52deb4a3f8062c -> fblog-4.13.1-funtoo-crates-bundle-af581006f28a2e07637b6c1803f9e9dcf78a384e3cddd1e330a2eb9296170aaacaf312f9a86bee8c3fe67816ed4eb2609fa0d622beb24be89201646b320fec2f.tar.gz"

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