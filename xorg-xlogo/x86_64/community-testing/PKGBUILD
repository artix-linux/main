# Maintainer: Torr <torr@artixlinux.org>

pkgname=xorg-xlogo
pkgver=1.0.6
pkgrel=1
pkgdesc="Displays the X Window System logo"
arch=("x86_64")
url="https://xorg.freedesktop.org/"
license=("custom")
depends=("libsm" "libxaw" "libxmu" "libxt" "libxext" "libx11" "libxrender" "libxft" "libxkbfile")
makedepends=(
	"make"
	"gcc"
	"autogen"
	"autoconf"
	"automake"
	"pkgconf"
	"xorg-util-macros"
)
source=(
	"https://gitlab.freedesktop.org/xorg/app/xlogo/-/archive/xlogo-$pkgver/xlogo-xlogo-$pkgver.tar.gz"
)
sha256sums=(
	"a4f72f57db2675efe78ed5f232809844de4d86ec8cb339eb70ade50862238e1a"
)

build() {
	cd xlogo-xlogo-$pkgver
	./autogen.sh
	./configure --prefix=/usr \
		--with-render \
		--with-xkb
	make
}

package() {
	cd xlogo-xlogo-$pkgver
	make install DESTDIR="$pkgdir" 
	install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
