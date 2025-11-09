# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="rga is a line-oriented search tool that allows you to look for a regex in a multitude of file types"
HOMEPAGE="https://github.com/phiresky/ripgrep-all"
SRC_URI="https://github.com/phiresky/ripgrep-all/tarball/e8cd5552379d60b12a17997177b7a8d34eedcdc4 -> ripgrep-all-0.10.10-e8cd555.tar.gz
https://direct-github.funmore.org/f4/e9/3a/f4e93ab89d7f340a57759eb52a7a2cf38ec9199d831a9a683a102e875891c8ddbe33ed5f332c3faa3f636669a0872fbb30eeee4231f263f691b56871af0c710c -> ripgrep_all-0.10.10-funtoo-crates-bundle-4d6462fcb14535fa85865f0e12fd24253562c7cd76f9c96e1f5446d806e06fa0bdacb440de0e31dd2eb7b86a77a015b44078b6be7103fdcd7424b35dd19f99f9.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
	virtual/rust
	|| (
		app-text/pandoc-bin
		app-text/pandoc
	)
	app-text/poppler
	media-video/ffmpeg
	sys-apps/ripgrep
"

src_unpack() {
	cargo_src_unpack

	rm -rf ${S}
	mv ${WORKDIR}/phiresky-ripgrep-all-* ${S} || die
}