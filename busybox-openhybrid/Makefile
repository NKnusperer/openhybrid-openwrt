# SPDX-License-Identifier: GPL-2.0-or-later
#
# Copyright (C) 2006-2021 OpenWrt.org
# Based on https://github.com/openwrt/openwrt/blob/openwrt-24.10/package/utils/busybox/Makefile

include $(TOPDIR)/rules.mk

PKG_NAME:=busybox-openhybrid
PKG_VERSION:=1.36.1
PKG_RELEASE:=1

PKG_SOURCE:=busybox-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://www.busybox.net/downloads \
		https://sources.buildroot.net/busybox
PKG_HASH:=b8cc24c9574d809e7279c3be349795c5d5ceb6fdf19ca709f80cde50e47de314

PKG_BUILD_DIR:=$(BUILD_DIR)/busybox-$(PKG_VERSION)
PKG_BUILD_PARALLEL:=1
PKG_BUILD_FLAGS:=lto
ifeq ($(CONFIG_SOFT_FLOAT),)
  PKG_BUILD_FLAGS+=no-mips16
endif

PKG_CHECK_FORMAT_SECURITY:=0

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=LICENSE archival/libarchive/bz/LICENSE

include $(INCLUDE_DIR)/package.mk

define Package/busybox-openhybrid
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Patched busybox for OpenHybrid.
	URL:=https://github.com/NKnusperer/openhybrid
	MAINTAINER:=hendrik@.0x00.to
endef

ifndef CONFIG_USE_MUSL
	LDLIBS:=m crypt
endif

MAKE_VARS :=
MAKE_FLAGS += \
	EXTRA_CFLAGS="$(TARGET_CFLAGS) $(TARGET_CPPFLAGS)" \
	EXTRA_LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_CFLAGS)" \
	LDLIBS="$(LDLIBS)" \
	LD="$(TARGET_CC)" \
	SKIP_STRIP=y
ifneq ($(findstring c,$(OPENWRT_VERBOSE)),)
  	MAKE_FLAGS += V=1
endif

define Build/Configure
	$(CP) ./files/.config $(PKG_BUILD_DIR)/.config
endef

define Build/Compile
	$(call Build/Compile/Default, \
		CONFIG_PREFIX="$(PKG_INSTALL_DIR)" \
		all install \
	)
endef

define Package/busybox-openhybrid/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/busybox $(1)/bin/busybox-openhybrid
	-rm -rf $(1)/lib64
endef


$(eval $(call BuildPackage,busybox-openhybrid))
