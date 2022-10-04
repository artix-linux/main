# Maintainer: Nathan <ndowens@artixlinux.org>

pkgname=darkhttpd
pkgver=1.14
pkgrel=1
pkgdesc="A small and secure static webserver"
arch=('x86_64')
url="https://unix4lyfe.org/darkhttpd/"
license=('BSD')
backup=('etc/conf.d/mimetypes')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/emikulic/darkhttpd/archive/v${pkgver}.tar.gz")
sha256sums=('e063de9efa5635260c8def00a4d41ec6145226a492d53fa1dac436967670d195')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # install darkhttpd
  install -Dm755 "$srcdir/$pkgname-$pkgver/darkhttpd" "$pkgdir/usr/bin/darkhttpd"

  # install license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  sed -n '1,/^$/p' darkhttpd.c > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
