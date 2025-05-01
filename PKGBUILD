# Maintainer:  <jujodeve@gmail.com>
pkgname=hprtpos
pkgver=r1.2.8
pkgrel=1
pkgdesc=" CUPS filter for thermal printers HPRT"
arch=('x86_64')
url="https://github.com/jujodeve/hprtpos.git"
license=('BSD')
depends=('cups')
makedepends=('unzip')
provides=('hprtpos')

source=("git+https://github.com/jujodeve/hprtpos.git")
md5sums=('SKIP')

package() {
    install -d -m 755 ${pkgdir}/usr/share/cups/model/hprtpos/
    install -m 644 -D hprtpos/ppd/*.ppd ${pkgdir}/usr/share/cups/model/hprtpos/
    install -m 755 -D hprtpos/filter/x64/raster-esc ${pkgdir}/usr/lib/cups/filter/raster-esc
}

# vim:set ts=2 sw=2 et:
