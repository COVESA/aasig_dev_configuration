# Copyright (c) 2020 TietoEVRY. All rights reserved.

# Inherit from common
$(call inherit-product, device/genivi/common/common.mk)

PRODUCT_NAME := genivi_vhal_x86_64
PRODUCT_DEVICE := generic_x86_64
PRODUCT_BRAND := Android
PRODUCT_MODEL := genivi_vhal_x86_64 model

# Tieto Vehicle HAL implementation
PRODUCT_PACKAGES += android.hardware.automotive.vehicle@2.0-service-tieto
BOARD_SEPOLICY_DIRS += vendor/tieto/packages/vehicle/sepolicy

# Tieto VehiclePlugin HAL policies
BOARD_SEPOLICY_DIRS += vendor/tieto/interfaces/automotive/vehicle/plugin/sepolicy

# Tieto Vehicle HAL Config file
PRODUCT_COPY_FILES += \
    vendor/tieto/packages/vehicle/vehicle_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/vehicle_config.json

# Titeo VehiclePlugin HAL dummy implementation - for testing purposes only.
# For production it shall be overridden by a valid plugin
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
BOARD_SEPOLICY_DIRS += vendor/tieto/interfaces/automotive/vehicle/plugin/1.0/default/sepolicy
PRODUCT_PACKAGES += vendor.tieto.hardware.automotive.vehicle.plugin@1.0-service
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    vendor/tieto/interfaces/automotive/vehicle/plugin/1.0/default/vendor.tieto.hardware.automotive.vehicle.plugin@1.0-service_fcm.xml
endif

# GraphQL Vehicle Plugin
PRODUCT_PACKAGES += com.tieto.vehicleplugin.graphql
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    vendor/genivi/packages/vehicleplugin-vss-graphql/vendor.tieto.hardware.automotive.vehicle.plugin@1.0-service-graphql_fcm.xml
