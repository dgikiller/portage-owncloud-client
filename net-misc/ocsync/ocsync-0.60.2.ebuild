# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils cmake-utils

DESCRIPTION="OwnCloud only build of CSync, a lightweight utility to synchronize files between multiple systems."
HOMEPAGE="http://owncloud.org/sync-clients/"
SRC_URI="http://download.owncloud.com/download/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-db/sqlite-3.4:3
	>=dev-libs/iniparser-2.10
	net-libs/neon
	app-doc/doxygen
	>=dev-libs/check-0.9.5
	virtual/latex-base
	app-text/dvipsk
	>=net-libs/libssh-0.5"
RDEPEND="${DEPEND}"

src_configure() {
	mycmakeargs=(
		-DSYSCONF_INSTALL_DIR=/etc
		-DLOG_TO_CALLBACK=ON
		-DWITH_LOG4C=OFF
		-DCMAKE_BUILD_TYPE="Debug"
		)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}

pkg_postinst() {
	echo
	ewarn "csync was renamed ocsync be upstream."
	ewarn "Consider removing csync after installing ocsync."
}
