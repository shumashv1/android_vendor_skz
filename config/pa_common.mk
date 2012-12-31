# Set audio
PRODUCT_PROPERTY_OVERRIDES += \
  ro.config.ringtone=Themos.ogg \
  ro.config.notification_sound=Proxima.ogg \
  ro.config.alarm_alert=Cesium.ogg

# Copy specific ROM files
PRODUCT_COPY_FILES += \
vendor/pa/prebuilt/common/apk/ParanoidPreferences.apk:system/app/ParanoidPreferences.apk \
vendor/pa/prebuilt/common/apk/GooManager.apk:system/app/GooManager.apk \
vendor/pa/prebuilt/common/apk/PerformanceControl.apk:system/app/PerformanceControl.apk \
vendor/pa/prebuilt/common/apk/ROMControl.apk:system/app/ROMControl.apk \
vendor/pa/prebuilt/common/apk/SuperSU.apk:system/app/SuperSU.apk \
vendor/pa/prebuilt/common/xbin/su:system/xbin/su \
vendor/pa/prebuilt/common/apk/LatinIMEGoogle.apk:system/app/LatinIMEGoogle.apk \
vendor/pa/prebuilt/common/apk/LatinIMEDictionaryPack.apk:system/app/LatinIMEDictionaryPack.apk \
vendor/pa/prebuilt/common/apk/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so 

# init.d support
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/pa/prebuilt/common/etc/init.pa.rc:root/init.pa.rc

# userinit support
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/pa/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/pa/prebuilt/common/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/pa/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/pa/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Bring in all video files
$(call inherit-product, frameworks/base/data/videos/VideoPackage2.mk)

# ROM stamp
$(shell shuf -i 0-100000 -n 1 > .stamp)

# Build ROMControl from source
    PRODUCT_PACKAGES += \
        ROMControl

# Schizoid bootanimation
    PRODUCT_COPY_FILES += \
        vendor/pa/prebuilt/common/bootanimation/XHDPI.zip:system/media/bootanimation.zip

# ParanoidAndroid common packages
PRODUCT_PACKAGES += \
    ParanoidWallpapers

# T-Mobile theme engine
include vendor/pa/config/themes_common.mk

# device common prebuilts
ifneq ($(DEVICE_COMMON),)
    -include vendor/pa/prebuilt/$(DEVICE_COMMON)/prebuilt.mk
endif

# device specific prebuilts
-include vendor/pa/prebuilt/$(TARGET_PRODUCT)/prebuilt.mk

BOARD := $(subst pa_,,$(TARGET_PRODUCT))

# ParanoidAndroid Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/$(TARGET_PRODUCT)

# AOKP Overlays
# PRODUCT_PACKAGE_OVERLAYS += vendor/pac/overlay/aokp/common

# Allow device family to add overlays and use a same prop.conf
ifneq ($(OVERLAY_TARGET),)
    PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/$(OVERLAY_TARGET)
    PA_CONF_SOURCE := $(OVERLAY_TARGET)
else
    PA_CONF_SOURCE := $(TARGET_PRODUCT)
endif

PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/$(PA_CONF_SOURCE).conf:system/etc/paranoid/properties.conf \
    vendor/pa/prebuilt/$(PA_CONF_SOURCE).conf:system/etc/paranoid/backup.conf

TARGET_CUSTOM_RELEASETOOL := vendor/pa/tools/squisher

BOARD := $(subst skz_,,$(TARGET_PRODUCT))

SKZ_VERSION_MAJOR = 1
SKZ_VERSION_MINOR = 0
SKZ_VERSION_MAINTENANCE = 2

VERSION := $(SKZ_VERSION_MAJOR).$(SKZ_VERSION_MINOR)$(SKZ_VERSION_MAINTENANCE)
SKZ_VERSION := $(BOARD)-$(SKZ_VERSION)-$(shell date +%0d%^b%Y-%H%M%S)

PA_VERSION_MAJOR = 2
PA_VERSION_MINOR = 9
PA_VERSION_MAINTENANCE = 9

PA_VERSION := $(PA_VERSION_MAJOR).$(PA_VERSION_MINOR)$(PA_VERSION_MAINTENANCE)
PA_VERSION := $(BOARD)-$(PA_VERSION)

PAC_VERSION_MAJOR = 18
PAC_VERSION_MINOR = 0
PAC_VERSION_MAINTENANCE = 0
PAC_VERSION := $(PAC_VERSION_MAJOR).$(PAC_VERSION_MINOR).$(PAC_VERSION_MAINTENANCE)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.skz.version=$(SKZ_VERSION) \
    ro.skzrom.version=SKZ_$(BOARD)_jb-RC0-v$(SKZ_VERSION)-$(shell date +%0d%^b%Y-%H%M%S) \
    ro.modversion=$(PA_VERSION) \
    ro.pa.family=$(PA_CONF_SOURCE) \
    ro.pa.version=$(VERSION) \
    ro.aokp.version=$(BOARD)_jb-Milestone-1

# goo.im properties
ifneq ($(DEVELOPER_VERSION),true)
    PRODUCT_PROPERTY_OVERRIDES += \
      ro.goo.developerid=paranoidandroid \
      ro.goo.rom=paranoidandroid \
      ro.goo.version=$(shell date +%s)
endif
