# Maintainer: artoo <artoo@artixlinux.org>

pkgname=bootlogd
pkgver=2.89
pkgrel=3
arch=('x86_64')
pkgdesc='Bootlogd extracted from sysvinit'
license=('GPL')
url='https://github.com/artix-linux/bootlogd'
depends=('glibc' 'logrotate')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
    cd ${pkgname}
    make
}

package() {
    cd ${pkgname}
    make DESTDIR=${pkgdir} install
}
