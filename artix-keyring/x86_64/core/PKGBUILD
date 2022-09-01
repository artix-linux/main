# Maintainer: Chris Cromer <cromer@artixlinux.org>

pkgname=artix-keyring
pkgver=20220901
pkgrel=1
pkgdesc='Artix PGP keyring'
arch=('any')
url='https://gitea.artixlinux.org/artix/artix-keyring'
license=('GPL')
install="${pkgname}.install"
_srctarball='49bd3923-6bbc-4be8-959b-095727469154'
_srctarballsig='38c51538-abfa-467a-8dff-aaaaddf71754'
source=("${pkgname}-${pkgver}.tar.gz::https://gitea.artixlinux.org/attachments/${_srctarball}"
"${pkgname}-${pkgver}.tar.gz.sig::https://gitea.artixlinux.org/attachments/${_srctarballsig}")
sha512sums=('7a37ced42f31600fdfa9587e81fd6103891ea61caab19f1566315a5f5635e8102b274acd249dd7834969680289ab9f2e4b7ae42f023ec425769d592798839b10'
            'SKIP')
validpgpkeys=('A55C3F1BA61CAA63036D82BAFA91071797BEEEC2') # cromer

package() {
    cd "${pkgname}-${pkgver}"
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
