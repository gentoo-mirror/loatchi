# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

DESCRIPTION="Epson Inkjet Printer Driver (ESC/P-R)"
HOMEPAGE="https://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
SRC_URI="https://download3.ebz.epson.net/dsc/f/03/00/15/68/85/403b320df777490a52c42030397edd10363b2c56/epson-inkjet-printer-escpr-1.8.5-1.src.rpm"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc64"

DEPEND="net-print/cups"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/1.6.5-warnings.diff"
	"${FILESDIR}/${PN}-1.7.7-fnocommon.patch"
)

src_unpack() {
    rpm_src_unpack "${A}"
}

src_configure() {
	econf --disable-shared

	# Makefile calls ls to generate a file list which is included in Makefile.am
	# Set the collation to C to avoid automake being called automatically
	unset LC_ALL
	export LC_COLLATE=C
}

src_install() {
	emake -C ppd DESTDIR="${D}" install
	emake -C src DESTDIR="${D}" install
	einstalldocs
}
