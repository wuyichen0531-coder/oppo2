#
# Copyright (C) 2026 The OrangeFox Recovery Project
#

DEVICE_PATH := device/oppo/PHQ110

# 声明在 Recovery 模式下必须编译并强制拉起的自定义硬件服务
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.keymaster@4.1-service-qti \
    android.hardware.gatekeeper@1.0-service-qti \
    vendor-oplus-hardware-touch-V2-service

# 1. 映射解密核心服务组件 (Keymaster / Gatekeeper)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/vendor/bin/hw/android.hardware.keymaster@4.1-service-qti:recovery/root/vendor/bin/hw/android.hardware.keymaster@4.1-service-qti \
    $(DEVICE_PATH)/recovery/root/vendor/bin/hw/android.hardware.gatekeeper@1.0-service-qti:recovery/root/vendor/bin/hw/android.hardware.gatekeeper@1.0-service-qti \
    $(DEVICE_PATH)/recovery/root/vendor/etc/init/android.hardware.keymaster@4.1-service-qti.rc:recovery/root/vendor/etc/init/android.hardware.keymaster@4.1-service-qti.rc \
    $(DEVICE_PATH)/recovery/root/vendor/lib64/libkeymasterdeviceutils.so:recovery/root/vendor/lib64/libkeymasterdeviceutils.so \
    $(DEVICE_PATH)/recovery/root/vendor/lib64/libkeymasterprovision.so:recovery/root/vendor/lib64/libkeymasterprovision.so \
    $(DEVICE_PATH)/recovery/root/vendor/lib64/libkeymasterutils.so:recovery/root/vendor/lib64/libkeymasterutils.so \
    $(DEVICE_PATH)/recovery/root/vendor/lib64/libqtikeymaster4.so:recovery/root/vendor/lib64/libqtikeymaster4.so

# 2. 映射 OPPO 原生触控专属二进制、启动脚本和 NDK 依赖库
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/vendor/bin/hw/vendor-oplus-hardware-touch-V2-service:recovery/root/vendor/bin/hw/vendor-oplus-hardware-touch-V2-service \
    $(DEVICE_PATH)/recovery/root/vendor/etc/init/vendor-oplus-hardware-touch-V2-service.rc:recovery/root/vendor/etc/init/vendor-oplus-hardware-touch-V2-service.rc \
    $(DEVICE_PATH)/recovery/root/vendor/lib64/vendor.oplus.hardware.touch-V1-ndk.so:recovery/root/vendor/lib64/vendor.oplus.hardware.touch-V1-ndk.so \
    $(DEVICE_PATH)/recovery/root/vendor/lib64/vendor.oplus.hardware.touch-V2-ndk.so:recovery/root/vendor/lib64/vendor.oplus.hardware.touch-V2-ndk.so \
    $(DEVICE_PATH)/recovery/root/vendor/lib64/vendor.oplus.hardware.touch-V2-ndk_platform.so:recovery/root/vendor/lib64/vendor.oplus.hardware.touch-V2-ndk_platform.so \
    $(DEVICE_PATH)/recovery/root/vendor/lib64/vendor.oplus.hardware.touch@1.0.so:recovery/root/vendor/lib64/vendor.oplus.hardware.touch@1.0.so

# 3. 映射防死锁的 VINTF 严格模式架构声明文件 (.xml)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/vendor/etc/vintf/manifest/vendor-oplus-hardware-touch.xml:recovery/root/vendor/etc/vintf/manifest/vendor-oplus-hardware-touch.xml 
