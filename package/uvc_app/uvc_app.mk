################################################################################
#
# uvc_app
#
################################################################################

UVC_APP_SITE = $(BR2_EXTERNAL_K510_PATH)/package/uvc_app/src
UVC_APP_SITE_METHOD = local
UVC_APP_INSTALL_STAGING = YES

UVC_APP_DEPENDENCIES += mediactl_lib opencv4 libdrm

UVC_APP_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libdrm -I$(STAGING_DIR)/usr/include/opencv4
UVC_APP_LDFLAGS = -L$(STAGING_DIR)/usr/lib -ldrm -lopencv_core -lopencv_imgcodecs -lopencv_imgproc -lopencv_videoio -lmediactl -lpthread

define UVC_APP_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CFLAG="$(UVC_APP_CFLAGS)" LDFLAG="$(UVC_APP_LDFLAGS)"
endef

define UVC_APP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/uvc_app $(TARGET_DIR)/app/uvc_app/uvc_app
	cp -rf $(@D)/canaan-uvc.sh $(TARGET_DIR)/app/uvc_app/canaan-uvc.sh
	cp -rf $(@D)/uvc_1920x1080.conf $(TARGET_DIR)/app/uvc_app/uvc_1920x1080.conf
	cp -rf $(@D)/imx219_0.conf $(TARGET_DIR)/app/uvc_app/imx219_0.conf
	cp -rf $(@D)/imx219_1.conf $(TARGET_DIR)/app/uvc_app/imx219_1.conf
	cp -rf $(@D)/imx219_1080x1920_0.conf $(TARGET_DIR)/app/uvc_app/imx219_1080x1920_0.conf
endef

$(eval $(generic-package))
