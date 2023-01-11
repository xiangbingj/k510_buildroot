################################################################################
#
# uvc_app
#
################################################################################

UVC_APP_SITE = $(BR2_EXTERNAL_K510_PATH)/package/uvc_app/src
UVC_APP_SITE_METHOD = local
UVC_APP_INSTALL_STAGING = YES

define UVC_APP_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) 
endef

define UVC_APP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/uvc_app $(TARGET_DIR)/app/uvc_app/uvc_app
	cp -rf $(@D)/canaan-uvc.sh $(TARGET_DIR)/app/uvc_app/canaan-uvc.sh
endef

$(eval $(generic-package))
