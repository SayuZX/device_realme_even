#
# Copyright (C) 2020 Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/realme/lily

# Call proprietary blob setup
$(call inherit-product, vendor/realme/lily/lily-vendor.mk)

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# IMS
$(call inherit-product, vendor/realme/lily-ims/lily-ims.mk)

# RealmeDirac
$(call inherit-product, $(DEVICE_PATH)/app/RealmeDirac/dirac.mk)

# RealmeParts
$(call inherit-product, $(DEVICE_PATH)/app/RealmeParts/parts.mk)

# API
PRODUCT_SHIPPING_API_LEVEL := 30

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

# Dynamic Partition
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Disable APEX compression
# Keep this after including updatable_apex.mk
PRODUCT_COMPRESSED_APEX := false

# Extra VNDK Versions
PRODUCT_EXTRA_VNDK_VERSIONS := 30

# Always use GPU for sreen compositing
PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.disable_hwc_overlays=1

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_ODM)/etc/audio_policy_configuration.xml

PRODUCT_PACKAGES += \
    BesLoudness \
    MtkInCallService

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0 \
    android.hardware.bluetooth@1.0.vendor \
    android.hardware.bluetooth@1.1 \
    android.hardware.bluetooth@1.1.vendor \
    android.hardware.bluetooth.audio@2.1-impl \
    libbt-vendor \
    libldacBT_bco

PRODUCT_PACKAGES += \
    libbtconfigstore

# Camera
PRODUCT_PACKAGES += \
    Camera \
    Aperture 

PRODUCT_PACKAGES += \
    RemoveCameraPackages

# Configstore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.0-service \
    android.hardware.configstore@1.1-service

# Public libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Dex/ART optimization
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
USE_DEX2OAT_DEBUG := false
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true
DONT_DEXPREOPT_PREBUILTS := true
#Enable whole-program R8 Java optimization for SystemUI and system_server
SYSTEM_OPTIMIZE_JAVA := true
SYSEMUI_OPTIMIZE_JAVA := true

# DT2W
PRODUCT_PACKAGES += \
    DT2W-Service-lily

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6768:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6768

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.lily

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.ims.xml

# Freeform Multiwindow
PRODUCT_COPY_FILES += \
frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml

# HIDL
PRODUCT_PACKAGES += \
    libhidltransport \
    libhardware \
    libhwbinder

# Perf
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# Init
PRODUCT_PACKAGES += \
    init.mt6768.rc \
    fstab.mt6768 \
    perf_profile.sh

# Keylayouts
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/idc/mtk-kpd.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/mtk-kpd.idc \
    $(DEVICE_PATH)/keylayout/mtk-kpd.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/mtk-kpd.kl \
    $(DEVICE_PATH)/keylayout/touchpanel.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/touchpanel.kl

# KPOC
PRODUCT_PACKAGES += \
    libsuspend \
    android.hardware.health@2.0

# Keymaster
PRODUCT_PACKAGES += \
    libkeymaster4.vendor:64 \
    libkeymaster4support.vendor:64 \
    libkeymaster_portable.vendor:64 \
    libkeymaster_messages.vendor:64 \
    libsoft_attestation_cert.vendor:64 \
    libpuresoftkeymasterdevice.vendor:64 \
    libsoft_attestation_cert.vendor:64 \

# Viper4Android
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/prebuilt/viper/lib/soundfx/libv4a_re.so:$(TARGET_COPY_OUT_VENDOR)/lib/soundfx/libv4a_re.so \
    $(DEVICE_PATH)/prebuilt/viper/lib64/soundfx/libv4a_re.so:$(TARGET_COPY_OUT_VENDOR)/lib/soundfx/libv4a_re.so \
    $(DEVICE_PATH)/prebuilt/viper/etc/audio_effects.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_effects.conf

# Libxml2
PRODUCT_PACKAGES += \
    libxml2.vendor

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.lily

# MTK IMS Overlays
PRODUCT_PACKAGES += \
    mtk-ims \
    mtk-ims-telephony

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.gsma.services.nfc  \
    NfcNci \
    SecureElement \
    Tag

# Offline charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.controls.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.controls.xml \
    $(DEVICE_PATH)/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.3.vendor

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/power/powercontable.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powercontable.xml \
    $(DEVICE_PATH)/configs/power/powerscntbl.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerscntbl.xml \
    $(LOCAL_PATH)/configs/power/power_app_cfg.xml:$(TARGET_COPY_OUT_VENDOR)/etc/power_app_cfg.xml

# Properties
-include $(DEVICE_PATH)/configs/props/vendor.prop
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Recovery
PRODUCT_PACKAGES += \
    init.recovery.mt6768.rc

# Screen density
PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Screen Recorder
PRODUCT_PACKAGES += \
    ScreenRecorder

# Speed up
PRODUCT_DEXPREOPT_SPEED_APPS += \
    Launcher3QuickStep \
    Settings \
    SystemUI

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v32/arm/arch-arm-armv7-a-neon/shared/vndk-sp/libutils.so:$(TARGET_COPY_OUT_VENDOR)/lib/libutils-v32.so \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-sp/libutils.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libutils-v32.so \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-core/libcrypto.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libcrypto-v32.so

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH) \
    hardware/mediatek \
    hardware/oplus

# Wi-Fi
PRODUCT_PACKAGES += \
    TetheringConfigOverlay \
    wpa_supplicant.conf \
    WifiOverlay
