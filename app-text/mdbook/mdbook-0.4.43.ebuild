# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Create a book from markdown files"
HOMEPAGE="https://rust-lang.github.io/mdBook/"
SRC_URI="https://github.com/rust-lang/mdBook/tarball/74b2c79d46df45ab9c196646f98339dd7e0c00c3 -> mdBook-0.4.43-74b2c79.tar.gz
https://direct-github.funmore.org/5a/a4/a9/5aa4a9f768be4fbda0bcc52f0dd94462c08b788a47ebc35f09a12f68beb862270701833ba1e81d9e90c4e3e1e5cc998787ca5f37ce7ced7ae02c4d6005c01b4e -> mdbook-0.4.43-funtoo-crates-bundle-5d5d4e7c83fd31079e90d1bcccf62f6be4abf27f1a4db08ce64003a3f33ae116171dcd7a94189c9fc2e5c9d955c665edd691e43d2cf55b30fefdcaf7d4e5d8d9.tar.gz"
S="${WORKDIR}/rust-lang-mdBook-74b2c79"

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