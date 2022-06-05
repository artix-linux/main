# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: svvac <_@svvac.net>

# NOTE: package version is a pinned commit (titled 'bump to version 1.2.11').
# this is used due to inactivity upstream and CVE-2021-20314.
# when/if upstream becomes active again, this package can be re-done in a
# better way.

pkgname=libspf2
pkgver=1.2.11
pkgrel=1
pkgdesc="Sender Policy Framework record checking library"
arch=('x86_64')
url="https://www.libspf2.org/"
license=('LGPL')
depends=('glibc' 'libnsl')
makedepends=('libmilter' 'git' 'autoconf')
source=("$pkgname::git+https://github.com/shevek/libspf2#commit=8131fe140704eaae695e76b5cd09e39bd1dd220b"
	"0001-Fix-resolv-functions.patch")
sha512sums=('SKIP'
            '3f951d1b35842c6a60ffdb0ab832de988675f5425afa74c3ce2224d84db002202ec7f7496917523654b436794fe9bbf439ee87f834cb6f373419439b7704a621')

prepare() {
  cd "$pkgname"
  patch -Np1 -i ../0001-Fix-resolv-functions.patch
  autoreconf -fi
}

build() {
  cd "$pkgname"
  ./configure --prefix='/usr'
  make
}

check() {
  cd "$pkgname"
  make check
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install

  # remove unused binaries
  rm -v "${pkgdir}"/usr/bin/*_static "${pkgdir}/usr/bin/spfd" "${pkgdir}/usr/bin/spf_example" "${pkgdir}/usr/bin/spftest"
}
