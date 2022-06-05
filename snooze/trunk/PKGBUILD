# Maintainer: Nathan  <ndowens@artixlinux.org>
pkgname=snooze
pkgver=0.5
pkgrel=1
pkgdesc="Run a command at a particular time"
arch=('x86_64')
url="https://github.com/leahneukirchen/snooze"
license=('custom:CC0-1.0')
depends=("glibc")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/leahneukirchen/snooze/archive/v${pkgver}.tar.gz")
sha512sums=('889502e3bc1265fbac99e3af5f1023729b52299e358c87783c339f1cf3004e8c8ba26c7f8ff877c047d79c7c98c95e5ba1b3d5e833c8222d05a55d09804e7fb1')

prepare() {
  cd "$pkgname-$pkgver"
  awk '/To the extent/,/1.0/ {print}' snooze.c > LICENSE
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/snooze
}
