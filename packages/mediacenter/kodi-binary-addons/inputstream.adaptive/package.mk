# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="inputstream.adaptive"
PKG_VERSION="20.0.3-Nexus"
PKG_SHA256="903d0ec029bb68744a36e36f342392e39824f328b94fabea43be579a412607e9"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/xbmc/inputstream.adaptive"
PKG_URL="https://github.com/xbmc/inputstream.adaptive/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform bento4"
PKG_SECTION=""
PKG_SHORTDESC="inputstream.adaptive"
PKG_LONGDESC="inputstream.adaptive"

PKG_IS_ADDON="yes"

if [ "${TARGET_ARCH}" = "x86_64" ] || [ "${TARGET_ARCH}" = "arm" ]; then
  PKG_DEPENDS_TARGET+=" nss"
fi

addon() {
  install_binary_addon ${PKG_ADDON_ID}

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}
  cp -P ${PKG_BUILD}/.${TARGET_NAME}/wvdecrypter/libssd_wv.so ${ADDON_BUILD}/${PKG_ADDON_ID}
}
