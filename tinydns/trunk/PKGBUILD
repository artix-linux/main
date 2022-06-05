# Maintainer: CupIvan <mail@cupivan.ru>

pkgname=tinydns
pkgver=0.3.1
pkgrel=1.3
pkgdesc='Tiny cache DNS server'
arch=('x86_64')
url="https://github.com/CupIvan/tinydns"
license=('MIT')
source=("https://github.com/CupIvan/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('baf5d4246a22bd0c2d8ac3579cea18b50b3636762fecc452cad8614c13fc9807')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's:tinydns:& -Wl,-z,now,-z,relro:' Makefile
  # Correct version
  sed -i '/char version/s|0.3|0.3.1|' main.c
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package_tinydns() {
  cd "$srcdir/$pkgname-$pkgver"
  backup=(etc/${pkgname}.conf)
	
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.conf ${pkgdir}/etc/${pkgname}.conf
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
