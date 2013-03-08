# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils cmake-utils

DESCRIPTION="Platform-independent Qt API for storing passwords securely."
HOMEPAGE="https://github.com/frankosterfeld/qtkeychain"
SRC_URI="https://github.com/frankosterfeld/qtkeychain/archive/v${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=x11-libs/qt-gui-4.7"
RDEPEND="${DEPEND}"

src_configure() {
	#mycmakeargs=()
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
