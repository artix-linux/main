# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Chris Severance <aur.severach@spamgourmet.com>
# Contributor: Neal Buchanan <neal.buchanan@gmx.com>

pkgname=libldm
pkgver=0.2.5
pkgrel=2
pkgdesc='A tool and library for managing Microsoft Windows Dynamic Disks'
arch=(x86_64)
url=https://github.com/mdbooth/libldm
license=(
  GPL3
  LGPL3
)
depends=(
  device-mapper
  glib2
  json-glib
  libreadline.so
  libuuid.so
  zlib
  udev
)
makedepends=(
  git
  gtk-doc
)
provides=(
  ldmtool
  libldm-1.0.so
)
conflicts=(ldmtool)
_tag=aa60557dc59b7aeeda5aaf694c71b7649340ab2f
source=(
  git+https://github.com/mdbooth/libldm.git#tag=${_tag}
)
b2sums=('SKIP')

pkgver() {
  cd libldm

  git describe --tags | sed 's/^libldm-//; s/-/.r/; s/-g/./'
}

prepare() {
  cd libldm
  autoreconf -fiv
}

build() {
  cd libldm
  ./configure \
    --prefix=/usr
  make
}

package() {
  make DESTDIR="${pkgdir}" -C libldm install
}

# vim: ts=2 sw=2 et:
