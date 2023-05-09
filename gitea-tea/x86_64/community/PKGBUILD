# Maintainer: artoo <artoo@artixlinux.org>

_pkgname=tea
_tag=fff1af1029a1c63c078e058c9a5c4d3ac7054594

pkgname=gitea-tea
pkgver=0.9.2
pkgrel=1
pkgdesc="A command line tool to interact with Gitea servers."
arch=(x86_64)
url="https://gitea.io"
license=(MIT)
makedepends=('go' 'make' 'git')
source=(git+https://gitea.com/gitea/tea.git#tag="${_tag}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --tags | sed 's/^v//'
}

build() {
    cd "${_pkgname}"
    go mod vendor
    make
}

package() {
    cd "${_pkgname}"
    install -Dm755 "${_pkgname}" -t "${pkgdir}"/usr/bin/
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
