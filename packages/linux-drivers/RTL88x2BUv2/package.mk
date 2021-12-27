PKG_NAME="RTL88x2BUv2"
PKG_VERSION="7f96b19b07fc4780fd79a38f4f6881ee13178683"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/RinCat/RTL88x2BU-Linux-Driver"
PKG_URL="https://github.com/RinCat/RTL88x2BU-Linux-Driver/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="Realtek RTL88x2BU Linux driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=$TARGET_KERNEL_ARCH \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=$TARGET_KERNEL_PREFIX \
       CONFIG_POWER_SAVING=n
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
    cp *.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}
