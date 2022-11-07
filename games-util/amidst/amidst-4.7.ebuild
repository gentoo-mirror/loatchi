# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit java-pkg-2

HOMEPAGE="https://github.com/toolbox4minecraft/amidst"
SRC_URI="https://github.com/toolbox4minecraft/amidst/releases/download/v4.7/amidst-v4-7.jar -> ${P}.jar"

LICENSE="GNU"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~x86 ~amd64-linux ~x86-linux"

CDEPEND=""

DEPEND="
	>=virtual/jdk-17:*
"

RDEPEND="
	>=virtual/jre-17:*
"

S="${WORKDIR}"

src_install(){
    java-pkg_dojar "${DISTDIR}/${P}.jar"
}