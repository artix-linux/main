# Maintainer: Nathan <ndowens@artixlinux.org>
# Contributor: Nathan Baum <n@p12a.org.uk>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Todd Musall <tmusall@comcast.net>

pkgname=at
pkgver=3.2.5
pkgrel=2
pkgdesc='AT and batch delayed command scheduling utility and daemon'
arch=('x86_64')
url='https://salsa.debian.org/debian/at'
license=('GPL')
depends=('pam' 'flex')
makedepends=('smtp-forwarder' 'git')
backup=('etc/at.deny'
        'etc/pam.d/atd'
        'var/spool/atd/.SEQ')
options=('!makeflags')
validpgpkeys=('464BC7CD439FEE5E8B4098A0348A778D6885EF8F') # Jose M Calhariz (Técnico) <jose.calhariz@tecnico.ulisboa.pt>
source=("http://software.calhariz.com/$pkgname/${pkgname}_${pkgver}.orig.tar.gz"{,.sig}
        'pam.conf')
sha256sums=('bb066b389d7c9bb9d84a35738032b85c30cba7d949f758192adc72c9477fd3b8'
            'SKIP'
            '663cd2f7c5abf56d1ea3f38dfac8d3e64896f1384ca5e97b7ec6d26fd6afafef')

build() {
  cd "$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --with-jobdir=/var/spool/atd \
    --with-atspool=/var/spool/atd

  CFLAGS="$CFLAGS -w" make
}

package() {
  make -C "$pkgname-$pkgver" IROOT="$pkgdir" docdir=/usr/share/doc install

  install -D -m0644 pam.conf "$pkgdir"/etc/pam.d/atd
}

# vim:set ts=2 sw=2 et:
