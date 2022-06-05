# Maintainer:  Christian Hesse <mail@eworm.de>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: pootzko <pootzko at gmail dot com>

pkgname=haveged
pkgver=1.9.18
pkgrel=1
pkgdesc='Entropy harvesting daemon using CPU timings'
arch=('x86_64')
url='https://github.com/jirka-h/haveged'
license=('GPL')
depends=('glibc')
options=('debug')
validpgpkeys=('8F6B7293B03E5AC5762B65CE2E2F252B05CCA168') # Jirka Hladky <hladky.jiri@gmail.com>
source=("$pkgname-$pkgver.tar.gz::https://github.com/jirka-h/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b835fa02b52ee7d06276e028571cadcb14d08f5e5a4b5767adf81451f70561c7')

build() {
  cd $pkgname-$pkgver

  ./configure \
      --prefix=/usr \
      --bindir=/usr/bin \
      --sbindir=/usr/bin
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check || :
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
