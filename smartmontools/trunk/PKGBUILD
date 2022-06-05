# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Jani Talikka <jani.talikka@gmail.com>
# Contributor: Ralf Barth <archlinux.org@haggy.org>

pkgname=smartmontools
pkgver=7.3
pkgrel=1
pkgdesc='Control and monitor S.M.A.R.T. enabled ATA and SCSI Hard Drives'
url='http://smartmontools.sourceforge.net'
license=('GPL')
arch=('x86_64')
depends=('gcc-libs' 'libcap-ng' 'bash' 'libudev.so')
makedepends=('udev')
optdepends=('s-nail: to get mail alerts to work')
backup=('etc/smartd.conf')
validpgpkeys=('0C9577FD2C4CFCB4B9A599640A30812EFF3AEFF5') # Smartmontools Signing Key (through 2025) <smartmontools-support@listi.jpberlin.de>
source=("https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('a544f8808d0c58cfb0e7424ca1841cb858a974922b035d505d4e4c248be3a22b'
            'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # make sure to use `uname -n` instead of `hostname`
  sed -i "/^os_hostname/c os_hostname=\"'uname -n'\"" configure.ac

  autoreconf -fi
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --with-drivedbdir \
    --with-libcap-ng=yes \
    --with-libsystemd=no \
    --with-systemdsystemunitdir=no \
    --with-smartdscriptdir=/usr/share/smartmontools \
    --with-smartdplugindir=/usr/share/smartmontools/smartd_warning.d

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/etc/rc.d
}
