# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils cmake-utils

DESCRIPTION="Platform-independent Qt API for storing passwords securely."
HOMEPAGE="https://github.com/frankosterfeld/qtkeychain"
SRC_URI="http://smash-net.org/owncloud-client/${P}_20140311.tar.gz"
S="${WORKDIR}/qtkeychain-master"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-qt/qtgui-4.7
		 >=dev-qt/qtdbus-4.7"


src_configure() {
	#mycmakeargs=()
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
