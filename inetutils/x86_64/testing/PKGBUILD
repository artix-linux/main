# Maintainer: artoo <artoo@artixlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=inetutils
pkgver=2.4
pkgrel=1
pkgdesc="A collection of common network programs"
arch=('x86_64')
url="https://www.gnu.org/software/inetutils/"
license=('GPL3')
depends=('pam' 'libcap' 'readline' 'ncurses' 'libxcrypt'
	     libpam.so libcrypt.so libreadline.so libncursesw.so)
makedepends=('help2man')
backup=('etc/xinetd.d/telnet' 'etc/xinetd.d/talk'
        'etc/xinetd.d/rlogin' 'etc/xinetd.d/rsh'
        'etc/pam.d/rlogin' 'etc/pam.d/rsh')
options=('!emptydirs')
install=inetutils.install
source=("https://ftp.gnu.org/gnu/inetutils/${pkgname}-${pkgver}.tar.xz"{,.sig}
        'rlogin.pam' 'rlogin.xinetd'
        'rsh.pam' 'rsh.xinetd'
        'talk.xinetd' 'telnet.xinetd')
sha512sums=('e7e6a5d7e2e02f07a2a6cfc09694e3c0a4e4a8ef8a435eed41902eba13caeed329ae6d6ba94b0de8f789e307f04656d12c48c1c0217b69d162bc5efb0ff6adee'
            'SKIP'
            '432a45af5cd4f9f2dee4b631b45745b734e47cf631553e79db31905fa0839988914bcfed1dfcdd00d2ea6e4029b0674d46623c33ce0bd0678c2628fbaa0d1b25'
            '7091c983bb6d96da3b471fa95d6fdda02cee5b42c4abb93048f7db0d313c17f6c11356cafa835ab4ad01401a30c2169288da2d6a1c4e661c93c36496c04cf507'
            'c957708315ea2d873da55691bb0d0997ee3e2dcb40fb47cef19fd60c25379f1660d0605edd8fb0a477252c5af3e422b44b5e0aaa5b76220dadc90791dd526801'
            '6f5f8b2e1ed24bccfdd08f37d2efca3750d632a5ff4188ed12a10b6cbfe84e85be996020704dfab7b427c023fcc3f328bbda23d69266eba98af0069dcb9de6ea'
            'd440094014d13ca7c3afb4eef735d3526ed8de2cc2de98a48d9682bee9aa197ea750de916c90a6b9e9839529a30b98138fb52427d89e1ee541a87e3401d892b2'
            '7445417b3cde6dd5a8ad5568c1272ac0b9b4a2375735c707c0cff09ad98a2ba322e6921945b5b1efd0e86212db13eacb5606bd3fa841da9515df5d40f75ad4a2')
# GNU Keyring: https://ftp.gnu.org/gnu/gnu-keyring.gpg
validpgpkeys=(
  '4FBD67621082C4C502448E3B180551BAD95A3C35' # Alfred M. Szmidt <ams@gnu.org>
  '9AA9BDB11BB1B99A21285A330664A76954265E8C' # Simon Josefsson <simon@josefsson.org>
  'B1D2BD1375BECB784CF4F8C4D73CF638C53C06BE' # simon@josefsson.org
)

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --libexec=/usr/bin \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --without-wrap \
    --with-pam \
    --enable-ftp \
    --enable-ftpd \
    --enable-telnet \
    --enable-telnetd \
    --enable-talk \
    --enable-talkd \
    --enable-rlogin \
    --enable-rlogind \
    --enable-rsh \
    --enable-rshd \
    --enable-rcp \
    --enable-hostname \
    --enable-dnsdomainname \
    --disable-rexec \
    --disable-rexecd \
    --disable-tftp \
    --disable-tftpd \
    --disable-ping \
    --disable-ping6 \
    --disable-logger \
    --disable-syslogd \
    --disable-inetd \
    --disable-whois \
    --disable-uucpd \
    --disable-ifconfig \
    --disable-traceroute
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  chmod -s "${pkgdir}"/usr/bin/{rcp,rlogin,rsh}

  install -D -m644 "${srcdir}/telnet.xinetd" "${pkgdir}/etc/xinetd.d/telnet"
  install -D -m644 "${srcdir}/talk.xinetd" "${pkgdir}/etc/xinetd.d/talk"
  install -D -m644 "${srcdir}/rlogin.xinetd" "${pkgdir}/etc/xinetd.d/rlogin"
  install -D -m644 "${srcdir}/rsh.xinetd" "${pkgdir}/etc/xinetd.d/rsh"

  install -D -m644 "${srcdir}/rlogin.pam" "${pkgdir}/etc/pam.d/rlogin"
  install -D -m644 "${srcdir}/rsh.pam" "${pkgdir}/etc/pam.d/rsh"
}
