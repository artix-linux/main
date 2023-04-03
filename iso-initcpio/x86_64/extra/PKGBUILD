# Maintainer: artoo <artoo@artixlinux.org>

pkgname=iso-initcpio
pkgver=4
pkgrel=1
arch=('any')
pkgdesc='Development tools for Artix (ISO initcpio)'
license=('GPL')
url='https://gitea.artixlinux.org/artix/iso-initcpio'
depends=('mkinitcpio')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('d9a02d42ea02992605925a749433b41e3811e18e46f3fd5047cc531d68ac53be')

prepare() {
    cd ${pkgname}
}

package() {
    cd ${pkgname}
    make DESTDIR=${pkgdir} install
}
