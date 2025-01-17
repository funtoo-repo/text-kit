# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN%%-bin}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Universal markup converter"
HOMEPAGE="
	https://pandoc.org
	https://github.com/jgm/pandoc
"
SRC_URI="https://github.com/jgm/pandoc/releases/download/3.6.2/pandoc-3.6.2-linux-amd64.tar.gz -> pandoc-3.6.2-linux-amd64.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	!${CATEGORY}/${MY_PN}
"

RESTRICT="strip"

S="${WORKDIR}/${MY_P}"

src_unpack() {
	default

	gzip -d "${S}/share/man/man1/${MY_PN}.1.gz" \
		|| die 'failed to decompress man page'
}

src_install() {
	dobin "bin/${MY_PN}"

	doman "share/man/man1/${MY_PN}.1"
}