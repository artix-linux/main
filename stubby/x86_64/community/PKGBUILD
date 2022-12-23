# Maintainer: Nathan <ndowens@artixlinux.org>

pkgname=stubby
pkgver=0.4.3
pkgrel=1
pkgdesc="DNS Privacy stub resolver"
arch=(x86_64)
url="https://dnsprivacy.org/wiki/display/DP/DNS+Privacy+Daemon+-+Stubby"
license=(BSD)
backup=(etc/stubby/stubby.yml)
depends=(getdns libyaml)
makedepends=(cmake git)
_tag=b9a56ea629b9abdc2aaaf5aa7d7b568143b3d9c7 # git rev-parse v${pkgver}
source=(git+https://github.com/getdnsapi/stubby.git?signed#tag=${_tag}
        stubby-sysusers.conf)
sha256sums=('SKIP'
            '2b67c70aab850b76187d73d0d5ecde6bc0de182f9fcc76108d82729757183596')
validpgpkeys=(DC34EE5DB2417BCC151E5100E5F8F8212F77A498)

prepare() {
  cd ${pkgname}
  sed -e 's/^# appdata_dir:/appdata_dir:/g' \
      -e 's:/etc/unbound/getdns-root.key:/etc/trusted-key.key:g' \
  -i stubby.yml.example
}

build() {
  cmake -B build -S ${pkgname} \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rmdir "${pkgdir}"/var{/run,}
  cd ${pkgname}
  install -Dm644 COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}
  # Add sysusers conf needed for OpenRC script
  install -Dm644 "$srcdir/stubby-sysusers.conf" "$pkgdir/usr/lib/sysusers.d/stubby.conf"
}
