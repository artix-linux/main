# Maintainer:
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

_url=https://sources.debian.org/data/main/f/fakechroot/2.20.1+ds-15/debian/patches/

pkgname=fakechroot
pkgver=2.20.1
pkgrel=2.2
pkgdesc="Gives a fake chroot environment"
arch=('x86_64')
url="https://github.com/dex4er/fakechroot/wiki"
license=('LGPL')
depends=('sh' 'perl' 'glibc')
source=($pkgname-$pkgver.tar.gz::https://github.com/dex4er/fakechroot/archive/${pkgver}.tar.gz
        $_url/0001-New-statx-function.patch
        $_url/0002-src-lckpwdf.c-create-an-empty-etc-.pwd.lock.patch
        $_url/0003-check-return-value-of-dladdr.patch
        $_url/0004-tmpnam.c-fix-heap-overflow.patch
        $_url/0005-declare-missing-bufs-remove-ver-from-lstat.patch
        $_url/0006-fix-glibc-2.33-compatibility.patch
        $_url/0007-wrap-fstatat-and-fstatat64.patch
        $_url/0008-Wrap-all-functions-accessing-etc-passwd-etc-group-an.patch
        $_url/0009-add-test-t-rm.t-and-amend-test-t-touch.t-with-no-der.patch
        $_url/0010-support-glibc-2.34-by-wrapping-__-f-l-stat-at-64_tim.patch
        $_url/0011-also-investigate-.interp-section-for-architectures-t.patch
        $_url/0012-test-touch.inc.sh-use-testtree-variable.patch)
sha256sums=('7f9d60d0d48611969e195fadf84d05f6c74f71bbf8f41950ad8f5bf061773e18'
            'b9cf303a7fd7fabadae865176450407d0fb38b90c9aff76d1c7b5acc594f6365'
            'c9c9f05dd8097b1bc41f393feb0bc547337b184a6e13c153dcdaa27c631cee7e'
            '9c6348dc4cefe93fecaec205bf3b4fbc9d1a2e3d7e3ad7dd751f729451dd7aa6'
            '21963cb34609baac72fcf213eb7648ec049088b6055a2a78e01aac5a082cbeeb'
            '4ca6b8b56d22ed581e661d0f1d5738ade1640b5d41b8771546957f20c27ede1d'
            'f12ead4e0c8fb0ee83e7160cae2cf0fd03c4480eb0d51bdd8aa49161d2871dad'
            'e0f22257dd942f25b92e119e1c7e2848452bc18326bd19472ee7c6a84e63de29'
            '9816480152f32c3fa0c8d3729212147a0bc4d02af990209c2b2f39a29740fd73'
            '676755b23fd60c70b7e9b4dd23ee0e6f0775bef001577df4f99707066bac029d'
            '5725e6e7568c53dfba079572ef96f477a1c67da4ee7942f3bf64ef8b925ee893'
            'd46c4869f0854769869835f1d4e4f69fc1c67fb54b1d7faca187a52197c375bc'
            'f07797dddb581fd25dda1869e9d411adc03b32b4a4f4136d4f3c5ab4049ebd4b')
b2sums=('56140ecedd852bb2889f34c5025eb4312299aace048acf5da5a55d520e227a0c7890c8d3355a54d01a20493fa6284bab1c542c910c6cb4fbd99e3154b7cc30ac'
        'd26210e355cc312c66bb3b806b5fe1be3644f15bcb372781abb4dec2558a043e6a00f801db7841b924c08cdb28528381d5418b78f312cc4a6a1840b5b9dec0d9'
        '905d2954ce4e375c13abf7b18797758d32031d0c28a37313998ccdc30b8adc975c0db13c1b450a2165fa0a34fcb862a9866b3da7005441f89dceb241041a43c9'
        '2b8217fcceddebce3d057d7829198f148fbd833e83cdf294297ac3a953e8741b602ae5d31cec3ea4991928c6a421cf97ee1c3e69865dd43de695a693ed90c585'
        '0b0ca98ddc40dfaa3352d701bffe2668f3eab2b208309f2903cf9aa40d8dbeffce9c88e600e56c05aa72df560c35b33f789a581a7db28ebd1c47050f7e631e4e'
        '0c98207cd21b33c63ad1a12c6eac9fb0c002d4f7fd9a8cf4ffcb640fa8f518c49537f936d923f519036bb6c6bb6666ed0ec207609d95031d4e3a33d1b7f80e39'
        '82ff1f66e978f1156388bb40cd8192795517650b3469d0178985140e135da6b1d743696649a42d8eea2799d828691ab43f00b693624848fd2fb0686fca6537cc'
        '3ba8633c986ebbec4284d23cee30e2ef6cef5d6c76890ef706f70aba7f5b255a417e2a0cb6df30da6733bdc9f323704f6c5b7de65ca067d45b350a55365b438a'
        '20ecc6dc445bdbe07794a452f1b2dbf7eab5a1184638acb7d42622e62fc3474bdaa6ff370cc7bf3bcd77f5e3baf463953c66b747f393f724700ae74f509f82b9'
        'fa4f3deb7f07577bea4bbbb1d8f2c875f1803b456b06f9960bd410b60e95e2a7cdd63977b276470d0c3b1c6a1d38441cc2ea085f222ed51981e7d475144b3cbb'
        '446f9bbfd2d06054e607d0d1253c9c3e1ac8a879ff7cd447ce270b458e49138ae3884d30ad7479e541e21e57f1d8d90fc695c58d67f56297bfc1771fb2d234ba'
        '55c52c5207969303dd77b1a1ab8c938a85550a7b6b097ad8f53ba9710d5c25ea79bf044df487534fb9660a5f6bdcfa09269057f59bf9a67bf086f8fa4512aa0e'
        'd2578e757ea704439e68be2092d8fefdfc2eea0a89c7f55cf995d78beb65c681112285f2e452aee9302234a9b22ae548f67a53c36dd1ab88aa0d4ae062489024')

prepare() {
  cd $pkgname-$pkgver
  for p in ${srcdir}/*.patch; do
        patch -Np1 -i "$p"
  done
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin \
    --libdir=/usr/lib/libfakeroot --sysconfdir=/etc
  make
}

check() {
  cd $pkgname-$pkgver

  # t/fts.t fails when building on BTRFS...  (really!)
  make -k check || :
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}"/etc/ld.so.conf.d/
  echo '/usr/lib/libfakeroot/fakechroot/' > "${pkgdir}"/etc/ld.so.conf.d/fakechroot.conf
}
