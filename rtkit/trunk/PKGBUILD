# Maintainer: Nathan Owens <ndowens@artixlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=rtkit
pkgver=0.13
pkgrel=2.1
pkgdesc="Realtime Policy and Watchdog Daemon"
url="https://github.com/heftig/rtkit"
depends=(dbus polkit elogind)
arch=(x86_64)
license=(GPL3 custom:BSD)
makedepends=(git meson vim)
options=(debug)
_commit=b9169402fe5e82d20efb754509eb0b191f214599  # tags/v0.13^0
source=("git+https://github.com/heftig/rtkit?signed#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=('8218F88849AAC522E94CF470A5E9288C4FA415FA')  # Jan Alexander Steffens (heftig)

pkgver() {
  cd rtkit
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd rtkit
}

build() {
  artix-meson rtkit build -D installed_tests=false
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  # remove systemd service
  rm -r "$pkgdir"/usr/lib/systemd

  echo 'u rtkit 133 "RealtimeKit" /proc' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/rtkit.conf"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 rtkit/LICENSE
  sed -ne '4,25p' rtkit/rtkit.c |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
