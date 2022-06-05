# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Florian Pritz <f-p@gmx.at>
# Contributor: Xyne <xyne at archlinux dot us>
# Contributor: thiagoc
# Contributor: Chris <chris at christopherjones dot us>
# Contributor: henning mueller <henning@orgizm.net>
# Contributor: Fabiano Furtado <fusca14 at gmail dot com>

pkgname=fwknop
pkgver=2.6.10
pkgrel=2
pkgdesc='FireWall KNock OPerator: Single Packet Authorization and Port Knocking'
url='https://www.cipherdyne.org/fwknop'
arch=('x86_64')
license=('GPL2')
backup=(etc/${pkgname}/access.conf
        etc/${pkgname}/fwknopd.conf)
depends=('gpgme' 'iptables' 'libpcap' 'wget')
source=(https://cipherdyne.org/fwknop/download/fwknop-${pkgver}.tar.bz2{,.asc})
validpgpkeys=('4D6644A9DA036904BDA2CB90E6C9E3350D3E7410') # Michael Rash (Signing key for cipherdyne.org projects) <mbr@cipherdyne.org>

build() {
  cd ${pkgname}-${pkgver}
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  autoreconf -fiv
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
sha512sums=('3fe0a7c673ebe3d417da9bf8e3c9a882181391ecc64d9f67e77e00a56f9f7bcec2c6d94dc51a5ee77a6c64a89f032a865dd304f1cb8ebb359580c70dc0cd374f'
            'SKIP')
