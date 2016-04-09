#
# Copyright (C) 2012 OpenWrt.org
#
# author:cheapjr
#

include $(TOPDIR)/rules.mk

PKG_NAME:=TianYi
PKG_VERSION:=1.0
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

PO2LMO:=$(BUILD_DIR)/luci/build/po2lmo

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  DEPENDS:=+wget
  TITLE:=luci-app-TianYi
  PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
TianYI web UI
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh 
[ -n "${IPKG_INSTROOT}" ] || {
	( . /etc/uci-defaults/luci-TianYi ) && rm -f /etc/uci-defaults/luci-TianYi
	/etc/init.d/TianYi enable >/dev/null 2>&1
	chmod 755 /etc/init.d/TianYi  >/dev/null 2>&1
	chmod 755 /usr/sbin/TianYi  >/dev/null 2>&1
	exit 0
}
endef

define Package/$(PKG_NAME)/install
	$(CP) ./src/* $(1)
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(PO2LMO) ./po/TianYi.zh-cn.po $(1)/usr/lib/lua/luci/i18n/TianYi.zh-cn.lmo
endef

$(eval $(call BuildPackage,TianYi))

