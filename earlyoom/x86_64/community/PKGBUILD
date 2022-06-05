# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=earlyoom
pkgver=1.7
pkgrel=1
pkgdesc="Early OOM Daemon for Linux"
arch=('x86_64')
url="https://github.com/rfjakob/earlyoom"
license=('MIT')
depends=('glibc')
makedepends=('pandoc')
optdepends=('systembus-notify: desktop notifications')
backup=("etc/default/earlyoom")
source=("https://github.com/rfjakob/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ebda1279a813d9b0f7860ce5029ccf5ea9f8868be070f2eaf40f90f2e64b6414')

prepare() {
    cd "$pkgname-$pkgver"
    sed 's;^EARLYOOM_ARGS="(.*)";EARLYOOM_ARGS="\1 -n --avoid '\''(^|/)(init|systemd|Xorg|sshd)$'\''";' -ri earlyoom.default
}

build() {
    cd "$pkgname-$pkgver"
    make PREFIX=/usr VERSION=$pkgver earlyoom
}

package() {
    cd "$pkgname-$pkgver"
    # (Artix) Avoid installing service
    make install-default install-bin install-man  DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
