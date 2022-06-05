# Maintainer: Artoo <artoo@artixlinux.org>

pkgname=blocaled
pkgver=0.3
pkgrel=1
pkgdesc='Provides a stand-alone implementation of the localed D-Bus service.'
arch=('x86_64')
url='https://github.com/pierre-labastie/blocaled'
license=('BSD')
depends=('polkit' 'libdaemon')
makedepends=('gtk-doc')
conflicts=('openrc-settingsd')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7bb9793a60122475d49f02e4f59594dcf0e08700bbcf1269e8380c19a8fb7ed4')

build(){
    cd ${pkgname}-${pkgver}
    ./autogen.sh
    ./configure \
        --sysconfdir=/etc \
        --prefix=/usr \
        --libexecdir=/usr/lib/blocaled \
        --with-keyboardconfig=/etc/vconsole.conf \
        --with-localeconfig=/etc/locale.conf
    make
}

check(){
    cd ${pkgname}-${pkgver}
    make -k check
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
}
