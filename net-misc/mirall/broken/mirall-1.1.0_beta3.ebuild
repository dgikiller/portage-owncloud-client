# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils cmake-utils

DESCRIPTION="OwnCloud build of Mirall. Directories on the local machine are going to be synced to OwnCloud."
HOMEPAGE="http://owncloud.com/"
#SRC_URI="http://download.owncloud.com/download/${P}.tar.bz2"
SRC_URI="http://download.owncloud.com/download/beta/${PN}-1.1.0beta3.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-misc/ocsync-0.50.11
	>=x11-libs/qt-gui-4.7
	>=x11-libs/qt-test-4.7"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-1.1.0beta3"

src_configure() {
	mycmakeargs=(
		-DCMAKE_BUILD_TYPE="Debug"
		)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	insinto /usr/share/applications
	doins "${FILESDIR}"/ownCloud.desktop
	insinto /usr/share/pixmaps
	doins "${D}"/usr/share/icons/hicolor/48x48/apps/owncloud.png
}
