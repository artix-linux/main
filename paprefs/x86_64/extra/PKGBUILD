# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=paprefs
pkgver=1.2
pkgrel=1
pkgdesc="Configuration dialog for PulseAudio"
url="https://freedesktop.org/software/pulseaudio/paprefs/"
license=(GPL2)
arch=(x86_64)
depends=(gtkmm3 libsigc++ pulseaudio)
makedepends=(meson lynx tidy git)
_commit=d70f061e1703c53aa327d3e836222e47dde86204  # tags/v1.2^0
source=("https://gitlab.freedesktop.org/pulseaudio/paprefs/-/archive/v${pkgver}/paprefs-v${pkgver}.tar.gz")
sha512sums=('3b711cf51bf6f7036dd8a7bcee68edb253d8ed8ad8d6b1bacc980bb1bcfa747cf67ecf44b55861ab277d12b0860c608ccfe9c5b0350bc5aa8364e0efa6dd0c68')

build() {
  artix-meson paprefs-v${pkgver} build -D lynx=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 build/doc/README
}
