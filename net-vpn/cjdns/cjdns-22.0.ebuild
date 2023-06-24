# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python{2_6,2_7} )

inherit eutils git-r3 linux-info systemd python-single-r1 flag-o-matic

DESCRIPTION="Cjdns implements an encrypted IPv6 network using public-key cryptography"
HOMEPAGE="https://github.com/cjdelisle/cjdns"
SRC_URI="git://github.com/cjdelisle/cjdns.git \
		https://github.com/cjdelisle/cjdns.git"
EGIT_BRANCH="master"
EGIT_COMMIT="1ccfbe5ed25b7d3a35aa1daadb46f9079d3522af"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=net-libs/nodejs-0.10.30
		>=dev-vcs/git-2.0.0
		${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

pkg_setup() {
		linux-info_pkg_setup
		if ! linux_config_exists; then
			eerror "Unable to check kernel for TUN support"
		else
			CONFIG_CHECK="~TUN"
			ERROR_TUN="TUN device not supported on kernel."
		fi
}


BDEPEND=""
