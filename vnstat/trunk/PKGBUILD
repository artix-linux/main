# Maintainer: Nathan <ndowens@artixlinux.org>
# Maintainer:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>

pkgname=vnstat
pkgver=2.10
pkgrel=1
pkgdesc="A console-based network traffic monitor"
arch=('x86_64')
url="https://humdi.net/vnstat/"
license=('GPL')
depends=('bash' 'sqlite')
makedepends=('gd')
optdepends=('gd: image output')
backup=(etc/vnstat.conf)
source=(https://humdi.net/vnstat/$pkgname-$pkgver.tar.gz
        vnstatd.tmpfile vnstatd.sysusers)
sha256sums=('a9c61744e5cd8c366e2db4d282badc74021ddb614bd65b41240937997e457d25'
            '91c9577f36c7f7ec32bb2963035a6ac49e7556ac6adc41564c033db8889b669e'
            'b9c3af7c6e8dc42aa6be0b52988aba8d64646116c211a1d055a17262c1d32edf')
validpgpkeys=(23EF1DD76E65248FB055201ADAFE84E63D140114) # Teemu Toivola

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  mkdir -p "$pkgdir"/usr/bin
  make DESTDIR="$pkgdir" install
  install -Dm0755 examples/vnstat.cgi "$pkgdir"/usr/share/doc/vnstat/examples/vnstat.cgi
  # Artix
  install -Dm644 "$srcdir"/vnstatd.tmpfile "$pkgdir"/usr/lib/tmpfiles.d/vnstatd.conf
  install -Dm644 "$srcdir"/vnstatd.sysusers "$pkgdir"/usr/lib/sysusers.d/vnstatd.conf
}
