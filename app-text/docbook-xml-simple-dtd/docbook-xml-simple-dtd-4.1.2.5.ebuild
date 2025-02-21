# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit sgml-catalog

DESCRIPTION="Simplified Docbook DTD for XML"
HOMEPAGE="https://www.oasis-open.org/docbook/xml/simple/4.1.2.5/"
SRC_URI="https://www.oasis-open.org/docbook/xml/simple/4.1.2.5/simple4125.zip -> simple4125.zip"
LICENSE="docbook"

LICENSE="docbook"
SLOT="4.1.2.5"
KEYWORDS="*"
IUSE=""

RDEPEND=">=app-text/build-docbook-catalog-1.6"
DEPEND=">=app-arch/unzip-5.41"

S=${WORKDIR}

sgml-catalog_cat_include "/etc/sgml/xml-simple-docbook-${PV}.cat" \
	"/usr/share/sgml/docbook/${P#docbook-}/catalog"

src_install() {
	insinto /usr/share/sgml/docbook/${P#docbook-}
	doins *.dtd *.mod *.css

	newins "${FILESDIR}"/${P}.catalog catalog
}

pkg_postinst() {
	build-docbook-catalog
	sgml-catalog_pkg_postinst
}

pkg_postrm() {
	build-docbook-catalog
	sgml-catalog_pkg_postrm
}