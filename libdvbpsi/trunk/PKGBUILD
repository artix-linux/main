# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Gilles CHAUVIN <gcnweb@gmail.com>

pkgname=libdvbpsi
pkgver=1.3.3
pkgrel=2.1
epoch=1
pkgdesc='Library designed for decoding and generation of MPEG TS and DVB PSI tables'
url='https://www.videolan.org/developers/libdvbpsi.html'
arch=('x86_64')
license=('LGPL2.1')
depends=('glibc')
provides=('libdvbpsi.so')
source=(https://download.videolan.org/pub/libdvbpsi/$pkgver/libdvbpsi-$pkgver.tar.gz)
sha512sums=('224e98ce41389396e97d6909cc829779a3266f98550f09d68026938a201db003abd77152d21fd14169049335d280958ee3ab1d2c52bb2604467c8b95427d8554')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
