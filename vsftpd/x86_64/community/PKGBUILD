# Maintainer: Nathan <ndowens@artixlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=vsftpd
pkgver=3.0.3
pkgrel=8
pkgdesc='Very Secure FTP daemon'
url='https://security.appspot.com/vsftpd.html'
arch=('x86_64')
license=('GPL2')
depends=('glibc' 'openssl' 'libcap' 'pam' 'libnsl')
optdepends=('logrotate')
backup=('etc/vsftpd.conf'
        'etc/xinetd.d/vsftpd'
        "etc/logrotate.d/vsftpd")
source=(https://security.appspot.com/downloads/${pkgname}-${pkgver}.tar.gz{,.asc}
            vsftpd-fix-seccomp.patch
            vsftpd-conf-pam.patch
            vsftpd-disable-anonymous-access-by-default.patch)
validpgpkeys=('8660FD3291B184CDBC2F6418AA62EC463C0E751C') # Chris Evans

prepare() {
  cd ${pkgname}-${pkgver}
  # build-time config
  sed -e 's|^#undef VSF_BUILD_SSL$|#define VSF_BUILD_SSL|' -i builddefs.h
  sed -e 's|/usr/share/empty|/var/empty|g' -i tunables.c vsftpd.conf.5 INSTALL
  sed -e 's|/usr/local/sbin/vsftpd|/usr/bin/vsftpd|' -i EXAMPLE/INTERNET_SITE/${pkgname}.xinetd

  # fix linking to openssl 1.1
  sed -e 's|SSL_library_init|SSL_CTX_new|' -i vsf_findlibs.sh

  patch -Np1 < ../vsftpd-fix-seccomp.patch
  patch -Np1 < ../vsftpd-conf-pam.patch
  patch -Np1 < ../vsftpd-disable-anonymous-access-by-default.patch
}

build() {
  cd ${pkgname}-${pkgver}
  make LINK='' CFLAGS="${CFLAGS} ${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm 755 ${pkgname} -t "${pkgdir}/usr/bin"
  install -dm 755 "${pkgdir}/var/empty"
  
  install -Dm 644 ${pkgname}.conf -t "${pkgdir}/etc"
  install -Dm 644 EXAMPLE/INTERNET_SITE/${pkgname}.xinetd "${pkgdir}/etc/xinetd.d/${pkgname}"
  install -Dm 644 RedHat/vsftpd.log "${pkgdir}/etc/logrotate.d/${pkgname}"
  install -Dm 644 RedHat/vsftpd.pam "${pkgdir}/etc/pam.d/${pkgname}"
  # TODO: check pam /etc/ftpusers files from debian and redhat, its linked

  install -Dm 644 ${pkgname}.8 -t "${pkgdir}/usr/share/man/man8"
  install -Dm 644 ${pkgname}.conf.5 -t "${pkgdir}/usr/share/man/man5"
  install -Dm 644 BENCHMARKS BUGS Changelog FAQ INSTALL README README.ssl REFS \
    REWARD SPEED TODO TUNING -t "${pkgdir}/usr/share/doc/${pkgname}"
}

sha256sums=('9d4d2bf6e6e2884852ba4e69e157a2cecd68c5a7635d66a3a8cf8d898c955ef7'
            'SKIP'
            '8bb7e4e4640137d38a2944859c2f443eea559ecb7f594c0fa4e962539107af66'
            '751715726c4b888d5c96846ac0bd0d64238cceb28ef3c2ef447af85cdc2b79f1'
            '4baa5a2db122974fa2a9603d335aed59dee5ad4217615fbe247301d129281d20')
