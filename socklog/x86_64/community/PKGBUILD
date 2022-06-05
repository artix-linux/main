# Maintainer: Muhammad Herdiansyah <herdiansyah@netc.eu>
# Contributor: Rafli Akmal <thefallenrat@artixlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=socklog
pkgver=2.1.0
pkgrel=5.1
pkgdesc="Small and secure syslogd replacement for use with Runit"
arch=('i686' 'x86_64')
depends=('glibc' 'runit')
makedepends=('make')
url="http://smarden.org/socklog/"
license=('BSD')
source=(http://smarden.org/socklog/$pkgname-$pkgver.tar.gz
        headers.patch
        klog.sv.run
        socklog.sv.check
        socklog.sv.logrun
        socklog.sv.run
        cron.config
        daemon.config
        debug.config
        errors.config
        everything.config
        lpr.config
        mail.config
        messages.config
        remote-udp.config
        secure.config
        tty12.config
        user.config)
sha256sums=('aa869a787ee004da4e5509b5a0031bcc17a4ab4ac650c2ce8d4e488123acb455'
            '6687d9d7c93c993b99f47948999c03b6b1402cda78d5f854d093ac881171ddf3'
            'ae9864e8dc86fb9d0de74bc988bb0f896c4811d12d52a649374903bd3257246a'
            'f84241c1dff3b67499ecec7be9385c6c190b3b43c839956df8458fb2c0b58f2b'
            '1176635347a8816b16798eff5b0aec788b355b1bd3c675d99f71878fee156cc0'
            'f62fd60c54e735f95153d1f0018cadb556c56833235f24653855445dc91e152f'
            '34922844f408018d94e890bffa76cdaa273d520b24a45731cd38f1f1f16ee9a8'
            'd5ccc2d25d74fba548dfd5bd03b0266a9a3cc629a5791a3ef44d49865328b463'
            '2cf4ba89e89dc879c8ed34eb5d919a62b666b8f855dfaf7a709637ac4f29dc6c'
            '5bdbdd1af786943021bf9876d0348c9b90d997a3476f5343949147f609a05b60'
            'c9c88aeeb84fdc3ea0d50df969b3d6a01f8616c2ddaff8b093fffc08097c71ca'
            '22283d75bd2944c1bb7e7a3dc98f542be66c511fe8476db099abdb22692c44ce'
            '1aab46e8b58b107ab69ea3f635dc52b2ad6e8a00b2d6397918bbdfabc11254dd'
            '8bf9051d8f57bc95e37cd1f19a681a84369e551663416ec5e3fd43f6fdc3d00b'
            'c9f6cf0ffe8f4304b9d130a736605f18e86be37f36be389d9f7d377e477269c5'
            '60b152f2f5fe65d1647fd03dcce72fb0db44537377640d879cbf41c631f8f03f'
            '05afefc343026350f8057a85e09c4306b5f9045705c409d55b72e72c593d6f3e'
            '1cc218670b456d2653da199dd79dab0fccd1364fb3206755674237442b11cadf')
provides=('socklog')

prepare() {
  cd "$srcdir/admin/$pkgname-$pkgver/src"

  msg 'Patching headers...'
  patch -p1 < "$srcdir/headers.patch"

  msg 'Setting default kernel message path to /proc/kmsg...'
  sed -i -e 's:^#define _PATH_KLOG "\/dev\/klog"$:#define _PATH_KLOG "\/proc\/kmsg":' socklog-conf.c
}

build() {
  cd "$srcdir/admin/$pkgname-$pkgver/src"

  msg 'Building...'
  echo "${CC:-gcc} ${CFLAGS:-O2 -Wall}" > conf-cc
  echo "${LD:-gcc -s}" > conf-ld
  make
}

check() {
  cd "$srcdir/admin/$pkgname-$pkgver/src"

  msg 'Testing...'
  make check
}

package() {
  cd "$srcdir/admin/$pkgname-$pkgver/src"

  msg 'Installing license...'
  install -D -m644 "$srcdir/admin/$pkgname-$pkgver/package/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  msg 'Installing documentation...'
  install -d "$pkgdir/usr/share/doc/socklog"
  install -D -m644 "$srcdir/admin/$pkgname-$pkgver/doc"/*.html "$pkgdir/usr/share/doc/socklog"

  msg 'Installing man pages...'
  install -d "$pkgdir/usr/share/man/man8"
  install -D -m644 "$srcdir/admin/$pkgname-$pkgver/man"/* "$pkgdir/usr/share/man/man8"

  msg 'Installing executables...'
  install -d "$pkgdir/usr/bin"
  for i in `cat $srcdir/admin/$pkgname-$pkgver/package/commands`; do
    install -s -D -m755 "$srcdir/admin/$pkgname-$pkgver/src/$i" "$pkgdir/usr/bin"
  done

  msg 'Installing Runit service files...'
  install -D -m755 "$srcdir/klog.sv.run" "$pkgdir/etc/runit/sv/klog/run"
  install -D -m755 "$srcdir/socklog.sv.check" "$pkgdir/etc/runit/sv/socklog/check"
  install -D -m755 "$srcdir/socklog.sv.logrun" "$pkgdir/etc/runit/sv/socklog/log/run"
  install -D -m755 "$srcdir/socklog.sv.run" "$pkgdir/etc/runit/sv/socklog/run"

  msg 'Installing default socklog configs...'
  for file in cron daemon debug errors everything lpr mail messages \
      remote-udp secure tty12 user; do
    install -D -m644 "$srcdir/$file.config" "$pkgdir/var/log/socklog/$file/config"
  done
}
