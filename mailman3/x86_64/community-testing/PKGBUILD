# Maintainer: Qontinuum <qontinuum@artixlinux.org>

_name=mailman
pkgname=mailman3
pkgver=3.3.8
_commit=f06d9adae8e297798113f67ecda43145b23c7747  # refs/tags/3.3.8
pkgrel=2
pkgdesc="The GNU mailing list manager"
arch=(any)
url="https://www.list.org/"
license=(GPL3)
depends=(
  gunicorn
  python-aiosmtpd
  python-alembic
  python-atpublic
  python-authheaders
  python-authres
  python-click
  python-dateutil
  python-dnspython
  python-falcon
  python-flufl.bounce
  python-flufl.i18n
  python-flufl-lock
  python-importlib_resources
  python-lazr.config
  python-passlib
  python-requests
  'python-sqlalchemy>=1.4'
  python-zope-component
  python-zope-configuration
  python-zope-event
  python-zope-interface
)
makedepends=(git python-build python-installer python-setuptools python-wheel)
checkdepends=(python-flufl.testing python-nose2 python-psycopg2
python-pymysql python-pytest)
optdepends=(
  'hyperkitty: for local archive and list interaction'
  'lynx: for the default HTML to plaintext conversion'
  'mailman3-hyperkitty: for archiving mails with an instance of hyperkitty'
  'postorius: for local configuration interaction'
  'python-mailmanclient: for programmatically interfacing the mailman REST API locally'
  'python-psycopg2: for PostgreSQL support'
  'python-pymysql: for MySQL support'
  'smtp-server: for using a local mail server'
)
conflicts=(mailman)
replaces=(mailman-core)
backup=(etc/mailman.cfg)
source=(
  $pkgname::git+https://gitlab.com/$_name/$_name#tag=$_commit?signed
  $pkgname.sysusers
  $pkgname.tmpfiles
)
sha512sums=('SKIP'
            '074cf58a93204d4b7631c4cc8af62d5720560301c6fefef6baa5d3aa33e72720870757fac7803f7b2835f8f02bb776f9d049df5c7528c743b56dda7da2085b07'
            '6f4b51fd5eb34ac974b3312c34eb1437d9435cfd50f0cb89db02b94ce514bceca2c6dc7cb172b79b2d6a23d68e7ea391ec58dbd9899938c0fe88c03c67c521b9')
b2sums=('SKIP'
        '594d6a6712f9e817f4d935225d3a1d87c96e23f1e449caab6bfb00ce2a0421af1401505c6d1d280a03f8c551136639f0dabf27d8b549ca4ea26bdb3febdda660'
        '461dce577696405011ed89f7fc109caaf27f4183b4d315baa8ad03db0f12015ebc447cbe9c0b8c5bcba38b63fcaf45adcfcb3e5bf5afb7eb0bd87a2e1b0301e5')
validpgpkeys=('541EA0448453394FF77A0ECC9D9B2BA061D0A67C') # Abhilash Raj <maxking@asynchronous.in>

prepare() {
  cd $pkgname
  # make sure that mailman runs in a FHS compliant way
  printf "[mailman]\nlayout: fhs\n" >> ../$_name.cfg
  # set /var/lib/mailman instead of /var/tmp/mailman as default var_dir:
  sed -e 's|/var/tmp/mailman|/var/lib/mailman|g' -i src/$_name/config/schema.cfg
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  # thanks to test design it is impossible to run tests:
  # https://gitlab.com/mailman/mailman/-/issues/400
  # nose2 -v
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  # config
  install -vDm 640 ../$_name.cfg -t "$pkgdir/etc/"
  # state dir
  install -vdm 750 "$pkgdir/var/lib/mailman"
  # sysusers.d
  install -vDm 644 ../$pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  # tmpfiles.d
  install -vDm 644 ../$pkgname.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
