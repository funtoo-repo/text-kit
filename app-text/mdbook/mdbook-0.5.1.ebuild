# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Create a book from markdown files"
HOMEPAGE="https://rust-lang.github.io/mdBook/"
SRC_URI="https://github.com/rust-lang/mdBook/tarball/d63aeb6526356464f627b2d7de413b5b6bbb87c2 -> mdBook-0.5.1-d63aeb6.tar.gz
https://direct-github.funmore.org/bf/8b/06/bf8b06629f808974abf2e8ecd5569e33fc29d8bd61e27d8a6ca9e96df4aa213400292181a20040f1bd806c450266ec5ed7415a571563d37847cfaf6ef814622e -> mdbook-0.5.1-funtoo-crates-bundle-80746f32052bb657bd1b8145269b41219c0bb8550c57843f5a238d00d20e2fe96d501f08c2ac3ad18920821e63ae173454eebd80be19b186e9d1571f311029af.tar.gz"
S="${WORKDIR}/rust-lang-mdBook-d63aeb6"

# CC-BY-4.0/OFL-1.1: embeds fonts inside the executable
LICENSE="MPL-2.0 CC-BY-4.0 OFL-1.1"
LICENSE+="
	Apache-2.0 BSD ISC MIT Unicode-DFS-2016
	|| ( Artistic-2 CC0-1.0 )
" # crates
SLOT="0"
KEYWORDS="*"
IUSE="doc"

QA_FLAGS_IGNORED="usr/bin/${PN}"

src_compile() {
	cargo_src_compile

	if use doc; then
		if tc-is-cross-compiler; then
			ewarn "html docs were skipped due to cross-compilation"
		else
			target/$(usex debug{,} release)/${PN} build -d html guide || die
		fi
	fi
}

src_install() {
	cargo_src_install

	dodoc CHANGELOG.md README.md
	use doc && ! tc-is-cross-compiler && dodoc -r guide/html
}