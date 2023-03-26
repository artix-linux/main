# Maintainer: Nathan <ndowens@artixlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>

pkgname=ndisc6
pkgver=1.0.7
pkgrel=1
pkgdesc='Collection of IPv6 networking utilities'
arch=('x86_64')
url='https://www.remlab.net/ndisc6/'
license=('GPL')
depends=('glibc' 'perl')
makedepends=('glibc' 'gcc')
options=('!emptydirs')
source=("https://www.remlab.net/files/ndisc6/$pkgname-$pkgver.tar.bz2"
        'resolvconf-hook')
#Contacted by mail, Rémi was not able to provide its public key.
#He suggested to only rely on https to trust the source.
sha256sums=('edc431d70510d7321a5a39d243de0d0f63846dc9145b3b549c7348cc2bc96609'
            'c485bb8e5ee480dca2897f950ba9854f8b9deaf782480072536fa4f2d0152d24')

prepare() {
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
  # patch invalid path
  sed -ri 's,^PATH=.*,PATH=/usr/local/sbin:/usr/local/bin:/usr/bin,' rdnss/merge-hook.in
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --sysconfdir=/etc
  make
}

package() {
  pushd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  popd

  # tmpfiles
  install -Dm644 /dev/null "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  echo 'd /run/rdnssd 0755 nobody root' > "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # resolvconf merge hook
  install -Dm755 "$srcdir/resolvconf-hook" "$pkgdir/etc/rdnssd/resolvconf-hook"
}

# vim:set ts=2 sw=2 et:
