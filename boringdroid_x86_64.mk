#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
QEMU_USE_SYSTEM_EXT_PARTITIONS := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true
# region @boringdroid
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/boringdroid/overlay
# endregion
#
# All components inherited here go to system image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline_system.mk)

# Enable mainline checking for excat this product name
ifeq (sdk_phone_x86_64,$(TARGET_PRODUCT))
PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := relaxed
endif
# region @boringdroid
PRODUCT_COPY_FILES += \
    device/generic/goldfish/data/etc/config.ini.freeform:config.ini \
# endregion

#
# All components inherited here go to system_ext image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

#
# All components inherited here go to product image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_product.mk)

#
# All components inherited here go to vendor image
#
$(call inherit-product-if-exists, device/generic/goldfish/x86_64-vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulator_vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/board/generic_x86_64/device.mk)
# region @boringdroid
$(call inherit-product, vendor/boringdroid/boringdroid.mk)
# endregion

# Define the host tools and libs that are parts of the SDK.
-include sdk/build/product_sdk.mk
-include development/build/product_sdk.mk

# Overrides
# region @boringdroid
# PRODUCT_BRAND := Android
# PRODUCT_NAME := sdk_phone_x86_64
# PRODUCT_DEVICE := generic_x86_64
# PRODUCT_MODEL := Android SDK built for x86_64
PRODUCT_BRAND := boringdroid
PRODUCT_NAME := boringdroid_x86_64
PRODUCT_DEVICE := boringdroid_x86_64
PRODUCT_MODEL := Boringdroid built for x86_64
# endregion
