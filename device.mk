#
# Copyright (C) 2015 The CyanogenMod Project
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

$(call inherit-product-if-exists, vendor/xiaomi/hm2014811/hm2014811-vendor.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/acdb/Bluetooth_cal.acdb:system/etc/acdbdata/QRD/Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/General_cal.acdb:system/etc/acdbdata/QRD/General_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Global_cal.acdb:system/etc/acdbdata/QRD/Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Handset_cal.acdb:system/etc/acdbdata/QRD/Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Hdmi_cal.acdb:system/etc/acdbdata/QRD/Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Headset_cal.acdb:system/etc/acdbdata/QRD/Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Speaker_cal.acdb:system/etc/acdbdata/QRD/Speaker_cal.acdb \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Camera
PRODUCT_PACKAGES += \
    camera.msm8916 \
    libmm-qcamera

# Charger
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.usb.vid=2717 \
    ro.usb.id.charge=F006 \
    ro.usb.id.mtp=ff60 \
    ro.usb.id.mtp_adb=ff68 \
    ro.usb.id.ptp=ff10 \
    ro.usb.id.ptp_adb=ff18 \
    ro.usb.id.ums=ff20 \
    ro.usb.id.ums_adb=ff28

# GPS
PRODUCT_PACKAGES += \
    gps.msm8916

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/gps/flp.conf:system/etc/flp.conf \
    $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/gps/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/gps/quipc.conf:system/etc/quipc.conf \
    $(LOCAL_PATH)/gps/sap.conf:system/etc/sap.conf

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/ft5x06_ts.kl:system/usr/keylayout/ft5x06_ts.kl

# Lights
PRODUCT_PACKAGES += \
    lights.msm8916

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.target.rc

# LMK
PRODUCT_PACKAGES += \
    init.redmi.sh

# Sensor HAL
PRODUCT_PACKAGES += \
    calmodule.cfg \
    libcalmodule_common \
    sensors.msm8916

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# Inherit the rest from msm8916-common
$(call inherit-product, device/cyanogen/msm8916-common/msm8916.mk)
