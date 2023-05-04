# Maintainer: Alois Nespor <alium@artixlinux.org>

pkgname=artixnews
pkgver=0.2.0
pkgrel=3
pkgdesc='Utility for displaying Artixlinux news feed in console'
arch=('x86_64')
url='https://github.com/ryukinix/artix-news'
license=('MIT')
depends=('python' 'python-setuptools' 'python-importlib-metadata')
source=("artix-news-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a79ee3b3ac7c97cb873990442339a46f2f372a22a3f5c1d3928dabad467aa7cb993ad7585d4c785fa63dbcd0120fdb138ccc134ad410c6e35e6a1063831c9e32')

build() {
  cd artix-news-$pkgver
  python setup.py build
}

package() {
  cd artix-news-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

