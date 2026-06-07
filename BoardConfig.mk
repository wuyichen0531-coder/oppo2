#
# Copyright (C) 2026 The OrangeFox Recovery Project
#

DEVICE_PATH := device/oppo/PHQ110

# ==============================================================================
# 1. 架构与 CPU 配置 (高通骁龙 695 / SM6375)
# ==============================================================================
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo300

# ==============================================================================
# 2. 预编译内核与打包参数
# ==============================================================================
TARGET_NO_KERNEL := false
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_PREBUILT_DTBIMAGE := $(DEVICE_PATH)/prebuilt/dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

BOARD_BOOTIMG_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# ==============================================================================
# 3. 虚拟 A/B 与无独立 Recovery 分区配置
# ==============================================================================
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 167776256
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_SUPER_PARTITION_GROUPS := oppo_dynamic_partitions
BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true

# ==============================================================================
# 4. SELinux 策略与严格模式防御补丁
# ==============================================================================
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
BOARD_HAS_RECOVERY_SEPOLICY := true

# 注入宽容状态，同时允许预编译二进制在严格模式下通过 file_contexts 伪装加载
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
BUILD_BROKEN_PREBUILT_ELF_FILES := true

# ==============================================================================
# 5. 橙狐界面、触摸响应与背光配置
# ==============================================================================
OF_SCREEN_H := 2412
OF_STATUS_BAR_PADDING_LEFT := 80
OF_STATUS_BAR_PADDING_RIGHT := 80
OF_STATUS_BAR_PADDING_TOP := 60

TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1024

TW_THEME := portrait_hdpi
RECOVERY_TOUCHSCREEN_SWAP_XY := false

# ==============================================================================
# 6. 工具箱、高级参数与解密控制
# ==============================================================================
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
FOX_REPLACE_BUSYBOX_FOR_TWRP := 1
FOX_REMOVE_BASH := 0
FOX_VANILLA_BUILD := 0
EOF_DONT_ZIP := 1

TW_INCLUDE_CRYPTO := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
PLATFORM_VERSION := 12
PLATFORM_SECURITY_PATCH := 2026-09-09

# 引用外部的复制规则和独立模块定义
include $(DEVICE_PATH)/device.mk