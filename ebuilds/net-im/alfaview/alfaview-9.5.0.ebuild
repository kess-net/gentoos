# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

DESCRIPTION="High quality audio video conferencing"
HOMEPAGE="https://alfaview.com/"
SRC_URI="https://assets.alfaview.com/stable/linux/deb/${PN}_${PV}.deb"
S="${WORKDIR}"

LICENSE="alfaview"
SLOT="0"
KEYWORDS="-* amd64"
IUSE="selinux"

QA_PREBUILT="*"
RESTRICT="mirror bindist strip" #299368

RDEPEND="
	media-libs/alsa-lib
	sys-apps/dbus
	media-libs/fontconfig:1.0
	media-libs/freetype:2
	media-libs/gst-plugins-bad
	media-plugins/gst-plugins-v4l2
	media-libs/libpulse
	app-crypt/libsecret
	x11-libs/libXfixes
	x11-libs/libxkbcommon
	media-fonts/roboto
	virtual/ttf-fonts
	x11-misc/xdg-utils
"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	dodir /opt
	cp -a opt/alfaview "${ED}"/opt || die

	doicon usr/share/pixmaps/alfaview.png

	# local res
	# for res in 16 32 256 512; do
	# 	newicon -s ${res} usr/share/icons/hicolor/${res}x${res}/apps/alfaview.png alfaview.png
	# done

	domenu usr/share/applications/alfaview.desktop
}
