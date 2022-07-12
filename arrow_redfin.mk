#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common Arrow stuff.
$(call inherit-product, vendor/arrow/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/google/redfin/aosp_redfin.mk)

$(call inherit-product-if-exists, vendor/lawnchair/lawnchair.mk)

include device/google/redfin/device-arrow.mk

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 5
PRODUCT_NAME := arrow_redfin
TARGET_MANUFACTURER= : = Google

ARROW_GAPPS=true

DEVICE_MAINTAINER := soup6020

# Boot animation
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Repainter integration
PRODUCT_PACKAGES += \
    RepainterServicePriv \

# Permissions for Google product apps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/default-permissions-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/default-permissions-product.xml \

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=redfin \
    PRIVATE_BUILD_DESC="redfin-user 12 SQ3A.220605.009.A1 8643238 release-keys"

BUILD_FINGERPRINT := google/redfin/redfin:12/SQ3A.220605.009.A1/8643238:user/release-keys

$(call inherit-product, vendor/google/redfin/redfin-vendor.mk)
