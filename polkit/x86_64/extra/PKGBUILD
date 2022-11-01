# Maintainer: Nathan <ndowens@artixlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=polkit
pkgver=122
pkgrel=1
pkgdesc="Application development toolkit for controlling system-wide privileges"
url="https://gitlab.freedesktop.org/polkit/polkit"
arch=(x86_64)
license=(LGPL)
depends=(
  duktape
  elogind
  expat
  glib2
  pam
)
makedepends=(
  meson
  gtk-doc
  gobject-introspection
  git
)
checkdepends=(python-dbusmock)
provides=(libpolkit-{agent,gobject}-1.so)
backup=(etc/pam.d/polkit-1)
options=(debug)
_commit=da87c5698019897dd731bb2cbb54ebd9c9481f52  # tags/122
source=(
  "git+https://gitlab.freedesktop.org/polkit/polkit.git#commit=$_commit"
  '99-artix.rules'
  '0001-remove-sysd.patch')
b2sums=('SKIP'
        'd320d928b5480b5b8143717e6f88101912709020efc9583fbb233a2cc11aff51d36226b94cf69104db06f330e04d4dcfd6e4c7b027df75a3c72c43adec625fb2'
        'aadd7eb9dee584c7c0721e472b1ea52e6f7dcd1fffaea34bcc93baebccfa7c693db2478a83f0281005ead721523ace92222f06697faf98f13c50b09ca2d88848')

pkgver() {
  cd polkit
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd polkit
  patch -Np1 -i ../0001-remove-sysd.patch
}

build() {
  local meson_options=(
    -D examples=true
    -D gtk_doc=true
    -D man=true
    -D os_type=redhat
    -D session_tracking=libelogind
    -D tests=true
  )

  artix-meson polkit build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs -t 3
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "${srcdir}"/polkit/src/polkitbackend/50-default.rules \
        "${pkgdir}"/etc/polkit-1/rules.d
  
  install -Dm0644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf" <<END
u polkitd 102 "PolicyKit daemon"
m polkitd proc
END

  install -m0644 "${srcdir}"/99-artix.rules "${pkgdir}"/etc/polkit-1/rules.d
}

# vim:set sw=2 et:
