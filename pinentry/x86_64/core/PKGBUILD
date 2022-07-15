# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=pinentry
pkgver=1.2.0
pkgrel=1.1
pkgdesc='Collection of simple PIN or passphrase entry dialogs which utilize the Assuan protocol'
url='https://gnupg.org/related_software/pinentry/'
arch=('x86_64')
license=('GPL')
depends=(
  'glibc' 'ncurses' 'libcap' 'libassuan' 'libsecret' 'glib2'
  libsecret-1.so libcap.so libncursesw.so libassuan.so libglib-2.0.so)
makedepends=('gtk2' 'qt5-base' 'gcr')
optdepends=(
  'gtk2: gtk2 backend'
  'qt5-base: qt backend'
  'gcr: gnome3 backend'
)
backup=('etc/pinentry/preexec')
source=(
  "https://www.gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2"{,.sig}
  "pinentry"
  "preexec"

  # All 5 for version 1.2.
  "https://manpages.debian.org/testing/pinentry-tty/pinentry-tty.1.en.gz"
  "https://manpages.debian.org/testing/pinentry-curses/pinentry-curses.1.en.gz"
  "https://manpages.debian.org/testing/pinentry-gtk2/pinentry-gtk-2.1.en.gz"
  "https://manpages.debian.org/testing/pinentry-qt/pinentry-qt.1.en.gz"
  "https://manpages.debian.org/testing/pinentry-gnome3/pinentry-gnome3.1.en.gz"
)
sha256sums=('10072045a3e043d0581f91cd5676fcac7ffee957a16636adedaa4f583a616470'
            'SKIP'
            'af7c27139b20a7f1b9a227f3663abb21bb2b954523352b7844da27db1b0c1c86'
            'f428f08d77f1f7830eadb8435af282a833fc13d8b623b122eefd9d3b628bef90'
            '6e47cc750123fa44ddf67759c78a0468574292345504110c11acbaac575c3c54'
            'e155aa5e55e7e1b5fd99b20a3e40cadf93f2dd07508312699410b61ebac173ed'
            '57bf5f8c69fbf893fe106aea053a128e2623b18cc141253cf49e7acd2f196683'
            '06a2cd9d83e9f28a1dc881b1e989e99566c5b3fb823b2e27c294df3e1b45772a'
            '0b32339ed8bc776ff72c81f3512c3e800a459e1e5bf85ee8c9dc7e022cdea39b')
validpgpkeys=(
  'D8692123C4065DEA5E0F3AB5249B39D24F25E3B6' # Werner Koch (dist sig)
  '6DAA6E64A76D2840571B4902528897B826403ADA' # Werner Koch (dist signing 2020)
)

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --enable-pinentry-tty \
    --enable-pinentry-curses \
    --enable-fallback-curses \
    --enable-pinentry-emacs \
    --enable-pinentry-gtk2 \
    --enable-pinentry-gnome3 \
    --enable-pinentry-qt \
    --enable-libsecret \

  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm 755 ../pinentry -t "${pkgdir}/usr/bin"
  install -Dm 755 ../preexec -t "${pkgdir}/etc/pinentry"

  install -D --mode 644 --target-directory "$pkgdir/usr/share/man/man1" \
    ../pinentry-tty.1.en.gz \
    ../pinentry-curses.1.en.gz \
    ../pinentry-gtk-2.1.en.gz \
    ../pinentry-qt.1.en.gz \
    ../pinentry-gnome3.1.en.gz
}

# vim: ts=2 sw=2 et:
