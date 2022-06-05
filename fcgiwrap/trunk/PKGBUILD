# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Aaron Bull Schaefer <aaron@elasticdog.com>
# Contributor: Ron Huang <ronhuang+aur at gmail dot com>

pkgname=fcgiwrap
pkgver=1.1.0
pkgrel=8
pkgdesc='A simple server for running CGI applications over FastCGI.'
arch=('x86_64')
url='https://www.nginx.com/resources/wiki/start/topics/examples/fcgiwrap/'
license=('MIT')
depends=('fcgi')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gnosek/fcgiwrap/archive/${pkgver}.tar.gz"
        'dc0c3b14f0d7bb014a9a4c6c17eb55a123496365.patch'
        'LICENSE')
md5sums=('d14f56bda6758a6e02aa7b3fb125cbce'
         '3d573f45fac637a1076388683bd0beaf'
         '5aee62c27b4308f25ab32f05da387366')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # fix kill() parameters
  patch -Np1 -i ../dc0c3b14f0d7bb014a9a4c6c17eb55a123496365.patch

  autoreconf -vi
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # -Werror is not much fun in release builds
  CFLAGS+=' -Wno-error=implicit-fallthrough'

  # Here --sbindir is implicitly prefixed by /usr
  ./configure --prefix=/usr --mandir=/share/man --sbindir=/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm0644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
