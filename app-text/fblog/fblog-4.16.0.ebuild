# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Small command-line JSON Log viewer"
HOMEPAGE="https://github.com/brocode/fblog"
SRC_URI="https://github.com/brocode/fblog/tarball/d0594fb6d2046362592619f9756fdcf4eeeaf56a -> fblog-4.16.0-d0594fb.tar.gz
https://direct-github.funmore.org/68/d6/2c/68d62c9cc6784dd519a798f90a1bc6158f600a67038d5cc451553a804cb798c783dc12062af3ad9570a1ce164dd521679a6b54c573a2b8972970c1a3805a4648 -> fblog-4.16.0-funtoo-crates-bundle-c06b1fa203705945e5f62158c262c359d88efbf724e2e4fd9a9655fc95334c22166ce9413ccf9b6e5cae0d025562946c882fd16002856ec20bc3408fc2145768.tar.gz"

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