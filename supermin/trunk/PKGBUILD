# Maintainer: Nathan Owens <ndowens@artixlinux.org>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor:  Achilleas Pipinellis <axilleas archlinux gr>

pkgname=supermin
pkgver=5.3.2
pkgrel=1
pkgdesc="Tool for creating supermin appliances"
arch=('x86_64')
url="http://people.redhat.com/~rjones/supermin/"
license=('GPL')
makedepends=('ocaml' 'ocaml-findlib')
depends=('e2fsprogs' 'pacman' 'pacman-contrib' 'cpio')
conflicts=('febootstrap<=3.21')
source=("https://download.libguestfs.org/${pkgname}/5.3-development/${pkgname}-${pkgver}.tar.gz"{,.sig}
        "0001-remove-arch-release.patch")
sha512sums=('501731e9cce8bf1f4743eeff4af620813d466da10b664df037575a546b3b8e8697ed9e881dde7d3ba737e6a78536717c1823e22cdc1c92409db78d976a6678b5'
            'SKIP'
            'ee66056230c3bc5a18e4d45de8aa591db0b1680ec1e0915264f9ff79105f60c83bbc6d3c2732331c913a3fbc9396b3460b7da87c17d453df9650508c0c906340')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0') # Richard W.M. Jones <rjones@redhat.com>

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../0001-remove-arch-release.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
