# Maintainer: Nathan <ndowens@artixlinux.org>
# Contributor: Alasdair Haswell <ali at arhaswell dot co dot uk>

pkgname=rng-tools
pkgver=6.16
pkgrel=1
pkgdesc="Random number generator related utilities"
arch=('x86_64')
url="https://github.com/nhorman/rng-tools"
license=('GPL')
depends=('curl' 'libxml2' 'sysfsutils' 'jitterentropy' 'libp11' 'jansson' 'rtl-sdr')
optdepends=('opensc: PKCS11 entropy engine to gather entropy from smart card readers')
options=('debug')
source=(https://github.com/nhorman/rng-tools/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('17666c4745fb635d91df293be188daf94b9e465d51d8503c0195fa3beb390894')

prepare() {
	cd $pkgname-$pkgver
	mv README{.md,}

	libtoolize --force
	aclocal
	autoheader
	automake --force-missing --add-missing
	autoconf
}

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}
