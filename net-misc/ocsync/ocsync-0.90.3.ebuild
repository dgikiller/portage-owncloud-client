# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils cmake-utils

DESCRIPTION="OwnCloud only build of CSync, a lightweight utility to synchronize files between multiple systems."
HOMEPAGE="http://owncloud.org/sync-clients/"
SRC_URI="http://download.owncloud.org/download/testing/${P}.tar.bz2"
#S="${WORKDIR}/${PN}-0.XX.XbetaX"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+sftp +webdav -samba doc test"

DEPEND="doc? ( app-doc/doxygen virtual/latex-base app-text/dvipsk )
		test? ( >=dev-libs/check-0.9.5 dev-util/cmocka )"
RDEPEND=">=dev-db/sqlite-3.4:3
		>=dev-libs/iniparser-2.10
		webdav? ( net-libs/neon )
		sftp? ( >=net-libs/libssh-0.5 )
		samba? ( net-fs/samba )"

src_configure() {
	mycmakeargs=(
		-DSYSCONF_INSTALL_DIR=/etc
		-DLOG_TO_CALLBACK=ON
		-DWITH_LOG4C=OFF
		#-DCMAKE_BUILD_TYPE="Debug"
		$(cmake-utils_use_with webdav Neon)
		$(cmake-utils_use_with sftp LibSSH)
		$(cmake-utils_use_with samba Libsmbclient)
		$(cmake-utils_use test UNIT_TESTING)
		$(cmake-utils_use_with doc APIDOC)
		)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}

#pkg_postinst() {
#	echo
#	ewarn "csync was renamed ocsync be upstream."
#	ewarn "Consider removing csync after installing ocsync."
#}
