################################################################
#
# ko_configfs_sample
#
################################################################
KO_CONFIGFS_SAMPLE_VERSION = 1.0
KO_CONFIGFS_SAMPLE_SITE_METHOD = local
KO_CONFIGFS_SAMPLE_SITE = $(BR2_EXTERNAL_K510_PATH)/package/ko_configfs_sample/src
KO_CONFIGFS_SAMPLE_LICENSE = GPL-2.0
KO_CONFIGFS_SAMPLE_LICENSE_FILES = LICENSE

define KO_CONFIGFS_SAMPLE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/ko_configfs_sample.ko $(TARGET_DIR)/app/ko_configfs_sample/ko_configfs_sample.ko
endef

$(eval $(kernel-module))
$(eval $(generic-package))
