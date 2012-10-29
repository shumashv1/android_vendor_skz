# Check for target product
ifeq (pa_tenderloin,$(TARGET_PRODUCT))

# include ParanoidAndroid common configuration
include vendor/pa/config/pa_common.mk

# Inherit CM9 device configuration
$(call inherit-product, device/hp/tenderloin/device_tenderloin.mk)

PRODUCT_RELEASE_NAME := Touchpad
TARGET_BOOTANIMATION_NAME := horizontal-1024x768

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=touchpad BUILD_FINGERPRINT=hp/hp_tenderloin/tenderloin:4.0.4/IMM76I/330937:user/release-keys PRIVATE_BUILD_DESC="tenderloin-user 4.0.4 IMM76I 330937 release-keys"

PRODUCT_NAME := pa_tenderloin
PRODUCT_DEVICE := tenderloin

GET_VENDOR_PROPS := $(shell vendor/pa/tools/getvendorprops.py $(PRODUCT_NAME))

endif
