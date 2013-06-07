# Check for target product
ifeq (skz_encore,$(TARGET_PRODUCT))

# include Schizoid common configuration
include vendor/skz/config/skz_common.mk

# Schizoid bootanimation
    PRODUCT_COPY_FILES += \
	vendor/skz/overlay/$(TARGET_PRODUCT)/bootanimation.zip:system/media/bootanimation.zip

# Inherit CM device configuration
$(call inherit-product, device/bn/encore/cm.mk)

# OVERLAY_TARGET adds overlay asset source and copy files required to build
OVERLAY_TARGET := skz_encore

PRODUCT_NAME := skz_encore
PRODUCT_DEVICE := encore
PRODUCT_BRAND := BN

GET_VENDOR_PROPS := $(shell vendor/skz/tools/getvendorprops.py $(PRODUCT_NAME))

endif
