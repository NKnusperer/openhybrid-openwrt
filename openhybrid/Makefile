include $(TOPDIR)/rules.mk
 
PKG_NAME:=openhybrid
PKG_VERSION:=0.1.1
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE
 
PKG_BUILD_DIR:=$(BUILD_DIR)/openhybrid-$(PKG_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/NKnusperer/openhybrid.git
PKG_SOURCE_VERSION:=82d9755bb794e4d8d5591a2c6bfe5c3d7c049467
PKG_MIRROR_HASH:=skip

include $(INCLUDE_DIR)/package.mk
 
define Package/openhybrid
	SECTION:=net
	CATEGORY:=Network
	TITLE:=OpenHybrid - An RFC8157 implementation.
	URL:=https://github.com/NKnusperer/openhybrid
	MAINTAINER:=hendrik@.0x00.to
	DEPENDS:=+libmnl +gre
endef
 
define Package/openhybrid/description
	An open client implementation of RFC8157.
	In other words: A way to use MagentaZuhause Hybrid without a Speedport Hybrid router.
endef

TARGET_CFLAGS += -Wall -Werror -std=gnu11 -fcommon -fomit-frame-pointer -pipe
TARGET_LDFLAGS += -Wl,--as-needed -Wl,--sort-common -Wl,--hash-style=gnu
 
define Package/openhybrid/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/openhybrid $(1)/usr/sbin/
	$(INSTALL_BIN) ./files/openhybrid-event $(1)/usr/sbin/

	$(INSTALL_DIR) $(1)/etc/openhybrid
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/data/openhybrid.conf $(1)/etc/openhybrid/

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/openhybrid.init $(1)/etc/init.d/openhybrid
endef
 
$(eval $(call BuildPackage,openhybrid))
