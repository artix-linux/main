# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=pkgfile
pkgver=21
pkgrel=2.1
pkgdesc="a pacman .files metadata explorer"
arch=('x86_64')
url="https://github.com/falconindy/pkgfile"
license=('MIT')
depends=('libarchive' 'curl' 'pcre' 'pacman')
makedepends=('git' 'meson' 'clang')
source=("git+https://github.com/falconindy/pkgfile?signed#tag=v$pkgver")
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53')  # Dave Reisner
install=pkgfile.install
md5sums=('SKIP')

build() {
  cd "$pkgname"

  arch-meson -D systemd_units=false build
  ninja -v -C build
}

package() {
  cd "$pkgname"

  DESTDIR=$pkgdir ninja -C build install
}

# vim: ft=sh syn=sh
