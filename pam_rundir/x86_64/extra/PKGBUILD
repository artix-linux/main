# Maintainer: Dudemanguy <dudemanguy@artixlinux.org>
pkgname=pam_rundir
pkgver=1.2.0
pkgrel=1
pkgdesc='PAM module to provide $XDG_RUNTIME_DIR'
arch=('x86_64')
url="https://gitea.artixlinux.org/artix/pam_rundir"
license=('GPL2+')
depends=('pam')
makedepends=('git')
_commit=5338dec85e201b7e5fb4aeb0d548448d140ac41e  # tags/1.2.0^0
source=("git+https://gitea.artixlinux.org/artix/pam_rundir.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" make install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # empty directory for tmpfiles-setup
  install -d $pkgdir/usr/share/factory/etc/pam.d
}
