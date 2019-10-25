#
# Copyright 2016 The Android Open Source Project
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

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 1440p

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

DEVICE_PACKAGE_OVERLAYS += vendor/omni/overlay/CarrierConfig

# Inherit device configuration
$(call inherit-product, device/google/crosshatch/aosp_crosshatch.mk)

-include device/google/crosshatch/crosshatch/device-omni.mk

# Discard inherited values and use our own instead.
PRODUCT_MANUFACTURER := Google
PRODUCT_BRAND := google
PRODUCT_NAME := omni_crosshatch
PRODUCT_DEVICE := crosshatch
PRODUCT_MODEL := Pixel 3 XL

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="crosshatch" \
    TARGET_DEVICE="crosshatch" \
    PRIVATE_BUILD_DESC="crosshatch-user 10 QP1A.191005.007 5878874 release-keys"

BUILD_FINGERPRINT := "google/crosshatch/crosshatch:10/QP1A.191005.007/5878874:user/release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=google/crosshatch/crosshatch:10/QP1A.191005.007/5878874:user/release-keys

$(call inherit-product-if-exists, vendor/google/crosshatch/crosshatch-vendor.mk)
