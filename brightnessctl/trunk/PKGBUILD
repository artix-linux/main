# Maintainer: Antoine Damhet <antoine.damhet@lse.epita.fr>

pkgname=brightnessctl
pkgver=0.5.1
pkgrel=2.2
pkgdesc="Lightweight brightness control tool"
arch=('x86_64')
url='https://github.com/Hummer12007/brightnessctl'
license=('MIT')
depends=('udev')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Hummer12007/brightnessctl/archive/${pkgver}.tar.gz"
  "${pkgname}.install"
)
sha512sums=('41ac86357b3b5a3d54a043140a6bdb1fb68d5080a16e86692059ad58f4b9134a8532432a3f664c70c665a4ad73ea8a94cc9b88fa84abc28f0356b8b397aaebc7'
            '6491393c969d7116e273ce638a82d55dcc8000e00edff42d7b983a3ab588e6ba1a9dafeed59fa7e1daabd75327a856525f3d1eb42a0bc0f412252fff84817820')
install='brightnessctl.install'

build() {
  cd "${pkgname}-${pkgver}"

}

package() {
  cd "${pkgname}-${pkgver}"
  make UDEVDIR="/usr/lib/udev/rules.d" INSTALL_UDEV_RULES=1 DESTDIR="$pkgdir" install

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
