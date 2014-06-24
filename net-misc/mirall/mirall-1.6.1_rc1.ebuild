# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils cmake-utils

DESCRIPTION="OwnCloud build of Mirall. Directories on the local machine are going to be synced to OwnCloud."
HOMEPAGE="http://owncloud.org/"
SRC_URI="http://download.owncloud.com/desktop/testing/${PN}-1.6.1rc1.tar.bz2"
S="${WORKDIR}/${PN}-1.6.1rc1"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+sftp -samba doc test qt5"

DEPEND="doc? ( virtual/latex-base dev-texlive/texlive-latexextra dev-python/sphinx app-doc/doxygen app-text/dvipsk )
		test? ( >=dev-libs/check-0.9.5 dev-util/cmocka )"
RDEPEND="!net-misc/ocsync	
		!qt5? (
			dev-libs/qtkeychain
			dev-qt/qtcore:4
			dev-qt/qtgui:4
			dev-qt/qttest:4
			dev-qt/qtdbus:4
			dev-qt/qtwebkit:4
		)
		qt5? ( 
			dev-libs/qtkeychain[qt5] 
			dev-qt/qtcore:5
			dev-qt/qtgui:5
			dev-qt/qttest:5
			dev-qt/qtdbus:5
			dev-qt/qtwebkit:5
			dev-qt/qtprintsupport:5
			dev-qt/qtxml:5
			dev-qt/linguist-tools:5
		)
		sys-fs/inotify-tools
		dev-db/sqlite:3
		net-libs/neon
		sftp? ( >=net-libs/libssh-0.5 )
		samba? ( net-fs/samba )"

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with doc SPHINX)
		$(cmake-utils_use_with sftp LibSSH)
		$(cmake-utils_use_with samba Libsmbclient)
		$(cmake-utils_use test UNIT_TESTING)
		$(cmake-utils_use_with doc APIDOC)
		$(cmake-utils_use_build !qt5 WITH_QT4)
		-DSYSCONF_INSTALL_DIR=/etc
		)
	cmake-utils_src_configure
}

src_compile()
{
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
	insinto /usr/share/applications
	doins "${FILESDIR}"/ownCloud.desktop
	insinto /usr/share/pixmaps
	doins "${D}"/usr/share/icons/hicolor/48x48/apps/owncloud.png
}
