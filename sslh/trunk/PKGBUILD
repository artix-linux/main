# Maintainer: Nathan Owens <ndowens@artixlinux.org>
# Contributor: Le_suisse <lesuisse.dev+aur at gmail dot com>
# Contributor: Jason Rodriguez <jason-aur@catloaf.net>

pkgname=sslh
_pkgver=1.22c
# Remember: 1.22a < 1.22b < 1.22
pkgver=1.22.c
pkgrel=2
pkgdesc='SSL/SSH/OpenVPN/XMPP/tinc port multiplexer'
arch=('x86_64')
url='https://www.rutschle.net/tech/sslh/README.html'
license=('GPL2')
depends=('glibc' 'libcap' 'libconfig' 'pcre2')
backup=('etc/sslh.cfg')
source=("https://www.rutschle.net/tech/sslh/$pkgname-v$_pkgver.tar.gz"{,.asc}
        'sslh.cfg')
validpgpkeys=('CDDDBADBEA4B72748E007D326C056F7AC7934136') # Yves Rutschle <yves@rutschle.net>
sha256sums=('8e3742d14edf4119350cfdc7bb96b89134d9218eb6d2a6e1f70891ca18a649b1'
            'SKIP'
            '3feff7e2c096bc18d8f0073141c1017dccd4abbbc491fa16b55afd5c5ff6352c')

prepare() {
  cd $pkgname-v$_pkgver
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd $pkgname-v$_pkgver
  make VERSION=\"v$pkgver\" USELIBCAP=1 all
}

package() {
  # default arch config
  install -Dm 644 sslh.cfg "$pkgdir/etc/sslh.cfg"
  # manually install to have both ssl-fork and ssl-select
  cd $pkgname-v$_pkgver
  install -Dm 755 sslh-fork "$pkgdir/usr/bin/sslh-fork"
  install -Dm 755 sslh-select "$pkgdir/usr/bin/sslh-select"
  ln -s sslh-fork "$pkgdir/usr/bin/sslh"
  # install manpage
  install -Dm 644 sslh.8.gz "$pkgdir/usr/share/man/man8/sslh.8.gz"
  ln -s sslh.8.gz "$pkgdir/usr/share/man/man8/sslh-fork.8.gz"
  ln -s sslh.8.gz "$pkgdir/usr/share/man/man8/sslh-select.8.gz"
  # install examples files
  install -Dm 644 basic.cfg "$pkgdir/usr/share/doc/$pkgname/basic.cfg"
  install -Dm 644 example.cfg "$pkgdir/usr/share/doc/$pkgname/example.cfg"
}

# vim:set ts=2 sw=2 et:
