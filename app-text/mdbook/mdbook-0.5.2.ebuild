# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Create a book from markdown files"
HOMEPAGE="https://rust-lang.github.io/mdBook/"
SRC_URI="https://github.com/rust-lang/mdBook/tarball/7b29f8a7174fa4b7b31536b84ee62e50a786658b -> mdBook-0.5.2-7b29f8a.tar.gz
https://direct-github.funmore.org/a2/da/3a/a2da3a2e8d32a690977e954981eee864c80a1be560bcde50965c3e9a14e755a07d170872d7046679b86c12be99bf393b7f7d4976db7eee5906f2ec983ece4e32 -> mdbook-0.5.2-funtoo-crates-bundle-75c8a7cc77125413012660b9ddc96ae86a03255dd6d0f710f1d4c7ab22322f8e554671c0fa41f475de5fb2450fa978db04542ce5a353dee6735121f6f4dcc8e3.tar.gz"
S="${WORKDIR}/rust-lang-mdBook-7b29f8a"

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