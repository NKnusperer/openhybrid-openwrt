include $(TOPDIR)/rules.mk
 
PKG_NAME:=openhybrid
PKG_VERSION:=0.1.0
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=LICENSE
 
PKG_BUILD_DIR:=$(BUILD_DIR)/openhybrid-$(PKG_VERSION)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/action-server/openhybrid.git
PKG_SOURCE_VERSION:=263fee312418b7eb7ee844ee8dc5b919c59e9142
PKG_MIRROR_HASH:=f726a39d77d2b2dd8845eaf458324a4e390bd044efdc1b433b2369c380525213

include $(INCLUDE_DIR)/package.mk
 
define Package/openhybrid
	CATEGORY:=Network
	TITLE:=OpenHybrid - An RFC8157 implementation.
	URL:=https://github.com/action-server/openhybrid.git
	MAINTAINER:=dev@action-server.com
	DEPENDS:=+libc +libmnl +busybox
endef
 
define Package/openhybrid/description
	An open client implementation of RFC8157.
	In other words: A way to use MagentaZuhause Hybrid without a Speedport Hybrid router.
endef
 
define Package/openhybrid/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/build/openhybrid $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/script/openhybrid-event $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/script/openhybrid-route $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/script/openhybrid-lte $(1)/usr/sbin/

	$(INSTALL_DIR) $(1)/etc/openhybrid
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/data/config $(1)/etc/openhybrid/

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/openhybrid.init $(1)/etc/init.d/openhybrid
endef
 
$(eval $(call BuildPackage,openhybrid))
