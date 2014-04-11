# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils cmake-utils

DESCRIPTION="OwnCloud build of Mirall. Directories on the local machine are going to be synced to OwnCloud."
HOMEPAGE="http://owncloud.org/"
SRC_URI="http://download.owncloud.com/desktop/testing/${PN}-1.6.0beta1.tar.bz2"
S="${WORKDIR}/${PN}-1.6.0beta1"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+sftp -samba doc test"

DEPEND="doc? ( virtual/latex-base dev-texlive/texlive-latexextra dev-python/sphinx app-doc/doxygen app-text/dvipsk )
		test? ( >=dev-libs/check-0.9.5 dev-util/cmocka )"
RDEPEND="!net-misc/ocsync
		>=dev-libs/qtkeychain-0.1.0
		sys-fs/inotify-tools
		>=dev-qt/qtcore-4.7:4
		>=dev-qt/qtgui-4.7:4
		>=dev-qt/qttest-4.7:4
		>=dev-qt/qtdbus-4.7:4
		>=dev-qt/qtwebkit-4.7:4
		>=dev-db/sqlite-3.4:3
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
