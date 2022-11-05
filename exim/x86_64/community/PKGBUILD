# Maintainer: Nathan <ndowens@artixlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=exim
pkgver=4.96
pkgrel=2
pkgdesc='Message Transfer Agent'
arch=('x86_64')
url='https://www.exim.org/'
license=('GPL')
backup=('etc/mail/aliases' 'etc/mail/exim.conf' 'etc/logrotate.d/exim')
depends=('gdbm' 'libldap' 'libidn' 'libidn2' 'libnsl' 'libspf2' 'libxcrypt' 'openssl' 'pam' 'pcre2' 'sqlite')
provides=('smtp-server' 'smtp-forwarder')
conflicts=('smtp-server' 'smtp-forwarder')
source=("https://ftp.exim.org/pub/exim/exim4/exim-$pkgver.tar.bz2"{,.asc}
        aliases
        exim.logrotate
        exim.Makefile
        exim.sysusers
        exim.tmpfiles)
sha512sums=('675dcb13dac449edede61926e7af6dcc3ff3a455c053d413a35c873b926dfc4d63540ba7d52347516c6a9b4b60a3627b449685210ddfba0a4c61ec7a0a0b8333'
            'SKIP'
            '6494d9aae71a630935f3946a136855aadede54fd10b7b3cd7df47972d320ae142410076871e839f6caca8e02ec136604464b0b9c593721db243d8edf75c2f17f'
            'd8e3b466e0bba8175cfe762058dec49018495a260aa5efd139f4ef435284c305958cbd7fc514e81042146368b749ae38f0bf276fc0b4b91918ef33126900aa81'
            '6e93e8154e9a19c79b72072cfa79e37ed742998fca823bfe87169a038c93e9ab0c11124633ca8c85d5b9ed6195ffb03ccc564f5cda3f1063f5ff62eda8157751'
            '87a16aa7bd60a8df0da8131bb811825232f25e934b9326460a2f8f0f8e0f44c53d71b1225ecfee8d30c8714f6e9f85f5f0821e346a7751d43683b406376d605b'
            'f8a34fea0a65d0992732bc444bbb334d060de7d91d9cca6f00bc950ba289afa813783517dd3999437f89bc194290785805df7081606a65abb1db3fd3b3aa94ca')
validpgpkeys=('C693A034E1ED6EE954CAE2DA13DAD99C7E41519C'  # Phil Pennock <pdp@exim.org>
              'ACBB4324393ADE3515DA2DDA4D1E900E14C1CC04'  # Phil Pennock <phil.pennock@spodhuis.org>
              'E5CA331D44AB8E4C806FDBEE26101B62F69376CE'  # Heiko Schlittermann (Exim MTA Maintainer) <heiko@exim.org>
              'A986F3A6BD6377D8730958DEBCE58C8CE41F32DF') # Jeremy Harris <jgh@wizmail.org>

build() {
  cd $pkgname-$pkgver

  cp ../$pkgname.Makefile Local/Makefile
  make
}

package() {
  cd $pkgname-$pkgver

  install -Dm0644 ../exim.logrotate "$pkgdir"/etc/logrotate.d/exim
  install -Dm0644 doc/exim.8 "$pkgdir"/usr/share/man/man8/exim.8

  install -Dm0644 ../exim.sysusers "$pkgdir"/usr/lib/sysusers.d/exim.conf
  install -Dm0644 ../exim.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/exim.conf

  cd build-Linux-*
  for i in exicyclog exim_checkaccess exim_dumpdb exim_lock exim_tidydb \
    exipick exiqsumm exigrep exim_dbmbuild exim exim_fixdb eximstats exinext \
    exiqgrep exiwhat; do
    install -Dm0755 "$i" "$pkgdir"/usr/bin/$i
  done
  chmod u+s "$pkgdir"/usr/bin/exim

  cd ../src
  sed -e "s|/etc/aliases|/etc/mail/aliases|g" \
    -e "s|SYSTEM_ALIASES_FILE|/etc/mail/aliases|g" \
    configure.default | install -Dm0644 /dev/stdin "$pkgdir"/etc/mail/exim.conf

  install -Dm0644 "$srcdir"/aliases "$pkgdir"/etc/mail/aliases

  cd "$pkgdir"/usr/bin
  for i in mailq newaliases rmail rsmtp runq sendmail; do
    ln -s exim "$i"
  done

  # fhs compliancy
  ln -s ../bin/exim ../lib/sendmail
}
