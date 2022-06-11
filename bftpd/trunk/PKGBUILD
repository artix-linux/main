# Maintainer: Nathan Owens <ndowens@artixlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=bftpd
pkgver=6.1
pkgrel=1
pkgdesc='Small, easy-to-configure FTP server'
url='http://bftpd.sourceforge.net/'
arch=('x86_64')
license=('GPL')
depends=('pam' 'zlib' 'glibc' 'libxcrypt' 'libcrypt.so')
backup=(etc/bftpd.conf
        etc/logrotate.d/bftpd
        etc/pam.d/bftpd
        etc/xinetd.d/bftpd)
source=(https://downloads.sourceforge.net/sourceforge/bftpd/bftpd-${pkgver}.tar.gz
        bftpd.logrotate
        bftpd.pam
        bftpd.xinetd
        bftpd.tmpfiles
        bftpd-4.9-Makefile.patch)
sha512sums=('12af9be4c8995988c9fccfe0d26d928faa551b0b3a58a433a42453a768e28e7fd2711228c8944242483368b5bf4ec6e3adea293e1118b9afeb612d03e4863b42'
            '50faec3cf93a4702945bb8aee5b2e9b227183ec098fe93c729ca14d02c9432ccf4b25bc86f9b4b1ae40c9a9820b6b5a9e83a1dde78085a36a2c84b69690262b6'
            '1e6183ab0eb812b3ef687ac2c26ce78f7cb30540f606d20023669ac00ba04075487fb72e4dc89cc05dab0269ff6aca98fc1167cc75669c225b88b592482fbf67'
            '98d7679faffd497f0cc2faa6129b010f0a47092e1caebc82582e362e3eb107c09cf17496b10bbc4fc406ebfea7f75a70d119c071721099d169765f53ce89b51a'
            '92650582747a34a29631b1755d2eb14d124a9632888c39cf2dbe5c2834f5b4c5f6506588ef0106cc643397587ffbe9a2240787030452bf29b17b7aacf1632cc1'
            'b6e7e455b94b6c6b442a57416b285f870e7a99546f9aa26c67d381ec1e62a1e1d2492d144cf075b6f1ecaa42bf1f9c3e0390a45d0edab456de8cb7fe5d24ede7')
prepare() {
  cd ${pkgname}
  patch -Np1 < ../bftpd-4.9-Makefile.patch
  # Fix default in config file
  sed 's|#ROOTDIR="/path/for/anonymous/user"|# bftpd interprets ROOTDIR="%h" (the default), as ROOTDIR="/" for the anonymous user, override it\n  ROOTDIR="/srv/ftp"|' -i bftpd.conf
  rm -f config.{cache,status}
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure \
    --prefix=/usr \
    --enable-pam \
    --enable-libz \
    --mandir=/usr/share/man \
    --sysconfdir=/etc \
    --sbindir=/usr/bin
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/var"
  install -Dm 644 ../bftpd.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/bftpd.conf"
  install -Dm 644 ../bftpd.logrotate "${pkgdir}/etc/logrotate.d/bftpd"
  install -Dm 644 ../bftpd.pam "${pkgdir}/etc/pam.d/bftpd"
  install -Dm 644 ../bftpd.xinetd "${pkgdir}/etc/xinetd.d/bftpd"
}

# vim: ts=2 sw=2 et:
