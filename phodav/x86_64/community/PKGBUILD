# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=phodav
pkgver=3.0
pkgrel=2
pkgdesc="WebDav server implementation using libsoup (RFC 4918)"
arch=('x86_64')
url="https://wiki.gnome.org/phodav"
license=('LGPL2.1')
depends=('avahi' 'glib2' 'libsoup3' 'libxml2')
makedepends=('asciidoc' 'gtk-doc' 'meson' 'xmlto')
source=("https://download.gnome.org/sources/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('392ec2d06d50300dcff1ef269a2a985304e29bce3520002fca29f2edc1d138d1')


build() {
	artix-meson $pkgname-$pkgver build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"

}
