# Set audio
PRODUCT_PROPERTY_OVERRIDES += \
  ro.config.ringtone=Themos.ogg \
  ro.config.notification_sound=Proxima.ogg \
  ro.config.alarm_alert=Cesium.ogg

# Copy specific ROM files
PRODUCT_COPY_FILES += \
vendor/skz/prebuilt/common/apk/ParanoidPreferences.apk:system/app/ParanoidPreferences.apk \
vendor/skz/prebuilt/common/apk/GooManager.apk:system/app/GooManager.apk \
vendor/skz/prebuilt/common/xbin/su:system/xbin/su 


# init.d support
PRODUCT_COPY_FILES += \
    vendor/skz/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/skz/prebuilt/common/etc/init.skz.rc:root/init.skz.rc

# userinit support
PRODUCT_COPY_FILES += \
   vendor/skz/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
   vendor/skz/prebuilt/common/etc/init.d/01freqs:system/etc/init.d/01freqs

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/skz/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/skz/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/skz/prebuilt/common/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/skz/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/skz/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Bring in all video files
$(call inherit-product, frameworks/base/data/videos/VideoPackage2.mk)

# ParanoidAndroid common packages
PRODUCT_PACKAGES += \
    HALO \

# Embed SuperUser in Settings
SUPERUSER_EMBEDDED := true

# T-Mobile theme engine
include vendor/skz/config/themes_common.mk

# device common prebuilts
ifneq ($(DEVICE_COMMON),)
    -include vendor/skz/prebuilt/$(DEVICE_COMMON)/prebuilt.mk
endif

# device specific prebuilts
-include vendor/skz/prebuilt/$(TARGET_PRODUCT)/prebuilt.mk

BOARD := $(subst skz_,,$(TARGET_PRODUCT))

# ParanoidAndroid Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/skz/overlay/common

# SKZ overlays 
 $(shell cp -f vendor/skz/overlay/common/frameworks/base/core/res/assets/images/android-logo-mask.png frameworks/base/core/res/assets/images/android-logo-mask.png) 
 $(shell cp -f vendor/skz/overlay/common/frameworks/base/core/res/res/drawable-nodpi/default_wallpaper.jpg frameworks/base/core/res/res/drawable-nodpi/default_wallpaper.jpg) 

# Allow device family to add overlays and use a same prop.conf
ifneq ($(OVERLAY_TARGET),)
    PRODUCT_PACKAGE_OVERLAYS += vendor/skz/overlay/$(OVERLAY_TARGET)
    SKZ_CONF_SOURCE := $(OVERLAY_TARGET)
else
    SKZ_CONF_SOURCE := $(TARGET_PRODUCT)
endif

PRODUCT_COPY_FILES += \
    vendor/skz/prebuilt/$(SKZ_CONF_SOURCE).conf:system/etc/paranoid/properties.conf \
    vendor/skz/prebuilt/$(SKZ_CONF_SOURCE).conf:system/etc/paranoid/backup.conf 

TARGET_CUSTOM_RELEASETOOL := vendor/skz/tools/squisher

SKZ_VERSION_MAJOR = 3
SKZ_VERSION_MINOR = 0
SKZ_VERSION_MAINTENANCE = 0

SKZ_VERSION := $(SKZ_VERSION_MAJOR).$(SKZ_VERSION_MINOR)$(SKZ_VERSION_MAINTENANCE)
SKZ_VERSION := skz_$(BOARD)-$(SKZ_VERSION)

PA_VERSION_MAJOR = 3
PA_VERSION_MINOR = 9
PA_VERSION_MAINTENANCE = 5

PA_VERSION := $(PA_VERSION_MAJOR).$(PA_VERSION_MINOR)$(PA_VERSION_MAINTENANCE)
PA_VERSION := $(BOARD)-$(PA_VERSION)

PAC_VERSION_MAJOR = alpha
PAC_VERSION_MINOR = build
PAC_VERSION_MAINTENANCE = 0
PAC_VERSION := $(PAC_VERSION_MAJOR).$(PAC_VERSION_MINOR).$(PAC_VERSION_MAINTENANCE)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.skz.version=$(SKZ_VERSION) \
    ro.skzrom.version=$(SKZ_VERSION)_jb \
    ro.modversion=$(SKZ_VERSION)_jb_4.3-$(shell date +%0d%^b%Y-%H%M%S) \
    ro.pa.version=$(PA_VERSION) \
    ro.pac.version=$(PAC_VERSION) \
    ro.aokp.version=$(BOARD)_jb-mr1_milestone-2

# goo.im properties
ifneq ($(DEVELOPER_VERSION),true)
    PRODUCT_PROPERTY_OVERRIDES += \
      ro.goo.developerid=shumash \
      ro.goo.rom=SCHIZOID \
      ro.goo.version=$(shell date +%s)
endif
