# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Bug <Bug2000@gmail.com>

pkgname=libotr
pkgver=4.1.1
pkgrel=3.1
pkgdesc='Off-the-Record Messaging Library and Toolkit'
url='https://otr.cypherpunks.ca/'
license=('GPL' 'LGPL')
arch=('x86_64')
depends=('libgcrypt')
source=(https://otr.cypherpunks.ca/${pkgname}-${pkgver}.tar.gz)
sha256sums=('8b3b182424251067a952fb4e6c7b95a21e644fbb27fbd5f8af2b2ed87ca419f5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
