# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Create a book from markdown files"
HOMEPAGE="https://rust-lang.github.io/mdBook/"
SRC_URI="https://github.com/rust-lang/mdBook/tarball/1a5286b25cc70e6de3173027a7a0d82cb23b1cd2 -> mdBook-0.4.46-1a5286b.tar.gz
https://direct-github.funmore.org/34/d5/33/34d533e7c88924b616af14eda788a9fe04c1614a3e720365ce8207e415c4ac4d8d11b66f1f62162582a2dd6167e0517ebb4b960aaf0ac2efdc44109801b26238 -> mdbook-0.4.46-funtoo-crates-bundle-1832443b4de3690f8f5c9857923492943c4037e0690a4e06aef27df9dfbbde4308e1195de9550f959800caa8c20e5223d370bfb0096becaa8497c70e9dcdd4ab.tar.gz"
S="${WORKDIR}/rust-lang-mdBook-1a5286b"

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