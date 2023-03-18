# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..10} )
inherit distutils-r1

DESCRIPTION="This library allows you to write entries to a KeePass database."
HOMEPAGE="https://github.com/libkeepass/pykeepass"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=dev-python/argon2-cffi-19.2.0[${PYTHON_USEDEP}]
	>=dev-python/construct-2.10.54[${PYTHON_USEDEP}]
	>=dev-python/future-0.18.2[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.3.5[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.8.2[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.1[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

src_prepare() {
	distutils-r1_src_prepare
	sed -i 's/Cryptodome/Crypto/g' pykeepass/kdbx_parsing/{common,twofish}.py || die
}