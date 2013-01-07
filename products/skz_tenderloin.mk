# Check for target product
ifeq (skz_tenderloin,$(TARGET_PRODUCT))

# include ParanoidAndroid common configuration
include vendor/skz/config/skz_common.mk

# ROM stamp
#$(shell shuf -i 0-100000 -n 1 > .stamp)

# Inherit PAC AOKP common_tablet overlay
PRODUCT_PACKAGES += \
    ROMControl

# Inherit CM device configuration
$(call inherit-product, device/hp/tenderloin/device_tenderloin.mk)

PRODUCT_RELEASE_NAME := Touchpad
TARGET_BOOTANIMATION_NAME := horizontal-1024x768

# OVERLAY_TARGET adds overlay asset source and copy files required to build
OVERLAY_TARGET := skz_tenderloin

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=touchpad BUILD_FINGERPRINT=hp/hp_tenderloin/tenderloin:4.1.1/JR003C/228551:user/release-keys:user/release-keys PRIVATE_BUILD_DESC="tenderloin-user 4.1.1 JR003C 228551 release-keys"

PRODUCT_NAME := skz_tenderloin
PRODUCT_DEVICE := tenderloin

#GET_VENDOR_PROPS := $(shell vendor/skz/tools/getvendorprops.py $(PRODUCT_NAME))

endif
