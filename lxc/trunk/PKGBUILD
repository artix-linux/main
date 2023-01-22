# Maintainer: Nathan <ndowens@artixlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Andrea Zucchelli <zukka77@gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=lxc
epoch=1
pkgver=5.0.2
pkgrel=1
pkgdesc="Linux Containers"
arch=('x86_64')
url="https://linuxcontainers.org"
depends=('bash' 'perl' 'libseccomp' 'libcap' 'python' 'rsync' 'wget')
makedepends=('docbook2x' 'meson' 'lua' 'python-setuptools' 'apparmor')
optdepends=('dnsmasq'
	    'lua'
	    'lua-filesystem: lxc-top'
	    'lua-alt-getopt: lxc-top')
license=('LGPL')
options=('emptydirs')
backup=('etc/lxc/default.conf'
	'etc/default/lxc')
validpgpkeys=('602F567663E593BCBD14F338C638974D64792D67')
source=("https://linuxcontainers.org/downloads/lxc/$pkgname-${pkgver}.tar.gz"{,.asc}
	"lxc.tmpfiles.d"
       )
sha256sums=('bea08d2e49efcee34fa58acd2bc95c0adc64d291c07f4cfaf4ac1d8ac5a36f45'
            'SKIP'
            '10e4f661872f773bf3122a2f9f2cb13344fea86a4ab72beecb4213be4325c479')


prepare() {
  cd "$pkgname-${pkgver/_/-}"
  sed -i "s|if sanitize == 'none'|if false|g" src/lxc/cmd/meson.build
}

build() {
  cd "$pkgname-${pkgver/_/-}"
  local options=(
  -Dinit-script=sysvinit
  -Dsd-bus=disabled
  )

  artix-meson ${options[@]} build
}

package() {
  cd "$pkgname-${pkgver/_/-}"

  meson install -C build --destdir "$pkgdir"

  install -d -m755 "$pkgdir/var/lib/lxc"
  install -d -m755 "$pkgdir/usr/lib/lxc/rootfs/dev"
  install -D -m644 "$srcdir"/lxc.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/lxc.conf

  cd doc
  find . -type f -name '*.1' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man1/{}" \;
  find . -type f -name '*.5' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man5/{}" \;
  find . -type f -name '*.7' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man7/{}" \;
}
