# Copyright (c) 2020 TietoEVRY. All rights reserved.

# Inherit from common
$(call inherit-product, device/genivi/genivi_audio/genivi_audio_common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_x86_64.mk)

PRODUCT_NAME := genivi_audio_x86_64
PRODUCT_DEVICE := generic_x86_64
PRODUCT_BRAND := Android
PRODUCT_MODEL := genivi_audio_x86_64 model
