# Check for target product
ifeq (skz_encore,$(TARGET_PRODUCT))

BUILD_FROM_SOURCE := false

# include Schizoid common configuration
include vendor/skz/config/skz_common.mk

# Schizoid bootanimation
    PRODUCT_COPY_FILES += \
	vendor/skz/overlay/$(TARGET_PRODUCT)/bootanimation.zip:system/media/bootanimation.zip

#Check to see if we should use prebuilt
ifneq ($(BUILD_FROM_SOURCE),true)
    PRODUCT_COPY_FILES += \
        vendor/skz/prebuilt/common/apk/ROMControl.apk:system/app/ROMControl.apk
else
#Build ROMControl from modified source
# ROM stamp
$(shell shuf -i 0-100000 -n 1 > .stamp)

PRODUCT_PACKAGES += \
    ROMControl
endif



# Inherit CM device configuration
$(call inherit-product, device/bn/encore/cm.mk)

# OVERLAY_TARGET adds overlay asset source and copy files required to build
OVERLAY_TARGET := skz_encore

PRODUCT_NAME := skz_encore
PRODUCT_DEVICE := encore

GET_VENDOR_PROPS := $(shell vendor/skz/tools/getvendorprops.py $(PRODUCT_NAME))

endif
