# Maintainer: Nathan <ndowens@artixlinux.org>

pkgname=gpm
pkgver=1.20.7.r38.ge82d1a6
_commit='e82d1a653ca94aa4ed12441424da6ce780b1e530'
pkgrel=5
pkgdesc='A mouse server for the console and xterm'
arch=('x86_64')
url='https://www.nico.schottelius.org/software/gpm/'
license=('GPL')
depends=('bash' 'procps-ng')
makedepends=('git')
provides=('libgpm.so')
options=('!makeflags')
source=("git+https://github.com/telmich/gpm.git#commit=${_commit}"
        'gpm.sh')
sha256sums=('SKIP'
            'f41e90dcf6c0c6c4b8eff1c69039a20eb6b38ea851ffd1fa47ba311bf83d6ed8')

pkgver() {
  cd "${srcdir}/${pkgname}"

  GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"
  printf '%s.r%s.g%s' \
    "${GITTAG}" \
    "$(git rev-list --count ${GITTAG}..)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}"
  
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin
  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR="${pkgdir}" install
  install -D -m0644 ../gpm.sh "${pkgdir}/etc/profile.d/gpm.sh"

# library fixes
  cd "${pkgdir}/usr/lib/"
  ln -s libgpm.so.2.* libgpm.so
  chmod 0755 "${pkgdir}"/usr/lib/libgpm.so.*
}
