# Maintainer: artoo <artoo@artixlinux.org>
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=rpcbind
pkgver=1.2.6
pkgrel=3
pkgdesc="portmap replacement which supports RPC over various protocols"
arch=(x86_64)
url="http://rpcbind.sourceforge.net"
license=('custom')
depends=('bash' 'glibc' 'libtirpc')
options=('debug')
replaces=('portmap')
# see also http://git.linux-nfs.org/?p=steved/rpcbind.git;a=summary
source=(https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2
        rpcbind-sunrpc.patch
        tmpfiles.d
        sysusers.d
        CVE-2017-8779.diff)
sha1sums=('a6dad1d9454f42f2f25a92caba8d3d7bddf527e3'
          '1b997ce76f9727efc8c72fc5f97189591c9a60e2'
          'eb8b7375a4ca31b3f61fa726f387884d5e4ca7a3'
          '97fed152572790a44e972114cbb436ca517254f9'
          '38044ce8f3376a0b69da8e078e988fd1645bd435')
sha256sums=('5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5e83b9defeee8de'
            '7a32111c74e708ad431b7114580c60d7405c591273e6cc00baf5baff05952573'
            '08b04f4da12b34d66cc8fefa0a6dcac239019b0de0090e08d61cb18cc36a6045'
            '288edf4d317dbeb6607a049d4451ae7e708ab2ad284c674bed19f444036d55c1'
            'bfb7f022b44ca83309dec6dfcb1ff4a5e0b0a40078e3688a2c7ceaaaa19a9686')

prepare() {
  cd $pkgname-$pkgver
  # patch for iana services file # FS#20273
  patch -Np1 -i ../rpcbind-sunrpc.patch
  # http://seclists.org/oss-sec/2017/q2/209
  patch -Np1 -i ../CVE-2017-8779.diff
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin \
    --with-rpcuser=rpc \
    --enable-warmstarts \
    --with-statedir=/var/lib/rpcbind \
    --with-systemdsystemunitdir=no \
    --enable-rmtcalls
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  # install missing man page - https://bugs.archlinux.org/task/21271
  install -m644 man/rpcinfo.8 "$pkgdir"/usr/share/man/man8/
  # systemd sysusers/tempfile
  install -Dm644 ../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/rpcbind.conf
  install -Dm644 ../sysusers.d "${pkgdir}"/usr/lib/sysusers.d/rpcbind.conf
  # install license
  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/rpcbind/COPYING
}
