# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: lp76 <l.peduto@gmail.com>
pkgname=mailgraph
pkgver=1.14
pkgrel=6
pkgdesc="A very simple mail statistics RRDtool frontend for Postfix and Sendmail"
url="https://mailgraph.schweikert.ch/"
arch=('any')
license=('GPL')
options=(emptydirs)
depends=('rrdtool' 'perl-file-tail')
source=("https://mailgraph.schweikert.ch/pub/$pkgname-$pkgver.tar.gz")


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s:mailgraph.rrd:/var/lib/mailgraph/mailgraph.rrd:" mailgraph.cgi
  sed -i "s:mailgraph_virus.rrd:/var/lib/mailgraph/mailgraph_virus.rrd:" mailgraph.cgi
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  #CGI_DIR=`grep 'ScriptAlias /cgi-bin/' /etc/httpd/conf/httpd.conf | awk '{print $3}' | sed 's|"||g'`
  CGI_DIR="/usr/share/webapps/mailgraph"

  install -D -m755 mailgraph.pl "$pkgdir/usr/bin/mailgraph.pl"
  install -D -m755 mailgraph.cgi "$pkgdir/$CGI_DIR/mailgraph.cgi"
  install -D -m755 mailgraph.css "$pkgdir/$CGI_DIR/mailgraph.css"
  install -d -m755 "$pkgdir/var/lib/mailgraph"
}
sha256sums=('50ea6ea8a33f5015926edd8b70a4d954ac27df4863514bddc5e69c948a7aac81')
b2sums=('a4d72a557bc7718576d85aed930a0037cb7d83edcba62397d6e9a51ec7967c6ffdf6d310e6bf9b881839313ed4cf1969e40eae1a923bbae45ac71b9593f1805f')
