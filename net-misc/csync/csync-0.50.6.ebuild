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
	dev-libs/iniparser
	net-libs/neon"
RDEPEND="${DEPEND}"
