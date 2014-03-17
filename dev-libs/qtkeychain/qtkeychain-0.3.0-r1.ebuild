# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils cmake-utils

DESCRIPTION="Platform-independent Qt API for storing passwords securely."
HOMEPAGE="https://github.com/frankosterfeld/qtkeychain"
SRC_URI="http://smash-net.org/owncloud-client/${P}.tar.gz"
#S="${WORKDIR}/qtkeychain-master"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="qt5"

DEPEND=""
RDEPEND="
		qt5? (
			dev-qt/qtcore:5
			dev-qt/qtdbus:5
		)
		!qt5? (
			dev-qt/qtcore:4
		 	dev-qt/qtdbus:4
		)
		"


src_configure() {
	local mycmakeargs=(
				$(cmake-utils_use_build !qt5 WITH_QT4)
				)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
