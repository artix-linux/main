# Maintainer: Torr <torr@artixlinux.org>
pkgname=timew
pkgver=1.5.0
_libshared_c="47c3262fa97c4b69542040d39be6c516c38d0e57"
pkgrel=1
pkgdesc="Commandline Time Tracking and Reporting"
arch=("x86_64")
url="https://timewarrior.net"
## File: https://github.com/GothenburgBitFactory/timewarrior/blob/develop/ChangeLog
changelog=Changelog.txt
license=("MIT")
depends=("gcc-libs")
makedepends=(
	"gcc"
	"make"
	"cmake>=2.8.12"
	"asciidoctor"
)
checkdepends=(
	"python"
	"python-dateutil"
	"man"
)
source=(
	"https://github.com/GothenburgBitFactory/timewarrior/archive/refs/tags/v$pkgver.tar.gz"
	"https://github.com/GothenburgBitFactory/libshared/archive/$_libshared_c.tar.gz"
	"help_man_test.patch"
)
sha256sums=(
	"4179d9115ffbb671a4092152740e08ed53eaced9bc5ec5553de17f309b743f7f"
	"0ca2ad809bcfc68d9563e7c43ae52cffb5729d4761a80be6b5f66332b6e9ad39"
	"SKIP"
)

prepare() {
	rm -rf "timewarrior-$pkgver/src/libshared"
	ln -sr "libshared-$_libshared_c" "timewarrior-$pkgver/src/libshared"

	cd "timewarrior-$pkgver"
	## Broken test.
	patch -Np 1 -i ../help_man_test.patch
}

build() {
	cd "timewarrior-$pkgver"
	cmake -D CMAKE_INSTALL_PREFIX=/usr .
	make
}

check() {
	cd "timewarrior-$pkgver"
	make test
}

package() {
	cd "timewarrior-$pkgver"
	make install DESTDIR="$pkgdir"
}
