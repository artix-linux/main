# Maintainer: dorphell <dorphell@archlinux.org>

pkgname=bc
pkgver=1.07.1
pkgrel=4.1
pkgdesc="An arbitrary precision calculator language"
arch=('x86_64')
url="https://www.gnu.org/software/bc/"
license=('GPL')
depends=('readline')
makedepends=('ed')
replaces=('bc-readline')
conflicts=('bc-readline')
source=(https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man \
    --infodir=/usr/share/info --with-readline
  make -j1
}

check () {
  cd "${pkgname}-${pkgver}"
  echo "quit" | ./bc/bc -l Test/checklib.b
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
