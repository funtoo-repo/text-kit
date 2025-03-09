# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cargo

DESCRIPTION="Create a book from markdown files"
HOMEPAGE="https://rust-lang.github.io/mdBook/"
SRC_URI="https://github.com/rust-lang/mdBook/tarball/07b25cdb643899aeca2307fbab7690fa7eeec36b -> mdBook-0.4.47-07b25cd.tar.gz
https://direct-github.funmore.org/26/b7/a8/26b7a860fef7b38f58155ec3d2f93f1d3ae85c56d1537c175a10d6fbec93f7e795b863b22e857a73ae8698173e1e87f587e013fef9f05596ad6fa07242f0a761 -> mdbook-0.4.47-funtoo-crates-bundle-1832443b4de3690f8f5c9857923492943c4037e0690a4e06aef27df9dfbbde4308e1195de9550f959800caa8c20e5223d370bfb0096becaa8497c70e9dcdd4ab.tar.gz"
S="${WORKDIR}/rust-lang-mdBook-07b25cd"

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