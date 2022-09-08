# Maintainer: Nathan Owens <ndowens@artixlinux.org>
# Contributor: Johannes Löthberg <demizide@gmail.com>

pkgname=atftp
pkgver=0.8.0
pkgrel=3
pkgdesc='Client/server implementation of the TFTP protocol that implements RFCs 1350, 2090, 2347, 2348, and 2349'
arch=('x86_64')
url='https://sourceforge.net/projects/atftp/'
license=('GPL')
depends=('pcre2' 'readline')
backup=('etc/conf.d/atftpd')
options=('debug' '!lto')
source=("$pkgname_$pkgname.tar.gz::https://downloads.sf.net/sourceforge/atftp/atftp-${pkgver}.tar.gz"
        'sysusers.conf'
        'tmpfiles.conf')
sha256sums=('df2aa089c7670f9eab40e5598e5d2cb6a582dc5182926ea50b4d690e4e37f316'
            'e56f601bcdf0d64bf98813cd4a1be323541e33921c7d4f350168f62b56e66d11'
            '2096272445c736ba05529af628cc2d46d0236c8f1ecbd50bb1db6dc6c4a972c5')

prepare() {
  cd "atftp-${pkgver}/"

  autoreconf -fi
}

build() {
  cd "atftp-${pkgver}/"

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin \
    --enable-libreadline \
    --disable-libwrap
  make
}

package() {
  cd "atftp-${pkgver}/"

  make DESTDIR="$pkgdir" install

  install -D -m0644 ../sysusers.conf "$pkgdir"/usr/lib/sysusers.d/atftp.conf
  install -D -m0644 ../tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/atftp.conf

  # remove in.tftpd link as it conflicts with extra/tftp-hpa
  rm "${pkgdir}/usr/share/man/man8/in.tftpd.8"
  rm "${pkgdir}/usr/bin/in.tftpd"
}
