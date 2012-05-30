# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils cmake-utils

DESCRIPTION="OwnCloud build of Mirall. One ore more specified directories on the local machine are going to be synced to your OwnCloud."
HOMEPAGE="http://owncloud.com/"
SRC_URI="http://download.owncloud.com/download/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-misc/csync-0.50.6
	x11-libs/qt-gui
	x11-libs/qt-test"
RDEPEND="${DEPEND}"
