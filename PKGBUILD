# Maintainer: Radu Ursache <radu@ursache.dev>
pkgname=proton-run
pkgver=0.1.0
pkgrel=1
pkgdesc="Run Windows executables with Steam Proton outside of Steam"
arch=('any')
url="https://github.com/rursache/proton-run"
license=('MIT')
depends=('bash' 'steam')
source=("proton-run" "proton-run.desktop")
sha256sums=('SKIP' 'SKIP')

package() {
    cd "$srcdir/.."
    make DESTDIR="$pkgdir" install
}
