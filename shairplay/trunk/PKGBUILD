# Maintainer: Nathan <ndowens@artixlinux.org>
# Contributor: winlu

pkgname=shairplay
_commit=096b61a
pkgver=20180824.096b61a
pkgrel=4
pkgdesc='Apple airplay and raop protocol server'
arch=('x86_64')
url='https://github.com/juhovh/shairplay'
license=('custom')
depends=('libao' 'avahi')
makedepends=('git')
source=(
    "$pkgname::git+https://github.com/juhovh/shairplay.git#commit=$_commit"
)
sha256sums=('SKIP')
options=(!libtool)

pkgver() {
	cd "$pkgname"
	git log -1 --date=short --format="%cd.%h" | tr -d '-'
}

build() {
	cd "$pkgname"

	# installing airport.key to /etc/shairplay/
	sed 's/airport.key/\/etc\/shairplay\/airport.key/' -i "$srcdir/$pkgname"/src/shairplay.c

	./autogen.sh
	./configure --prefix=/usr/
	make
}


package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install

	# install key file
	install -Dm644 airport.key "$pkgdir/etc/shairplay/airport.key"

	# install license file
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# install documentation
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
