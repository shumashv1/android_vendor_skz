<<<<<<< HEAD
ifeq (pa_tenderloin,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/pa_tenderloin.mk
endif
ifeq (pa_galaxys2,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/pa_galaxys2.mk
=======
ifeq (pa_crespo,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/pa_crespo.mk
>>>>>>> 4ec61950cf7ab2171b19c593aac35544b318b1a9
endif
ifeq (pa_grouper,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/pa_grouper.mk
endif
ifeq (pa_maguro,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/pa_maguro.mk
endif
ifeq (pa_toro,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/pa_toro.mk
endif
ifeq (pa_toroplus,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/pa_toroplus.mk
endif
