ifeq (skz_tenderloin,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/skz_tenderloin.mk
endif
ifeq (skz_encore,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/skz_encore.mk
endif
