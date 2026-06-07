#
# Copyright (C) 2026 The OrangeFox Recovery Project
#

# 继承 AOSP 基础全 64 位底层配置
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# 继承标准的 AOSP 最小化通用编译基础配置（替代之前找不到的 vendor 路径，各平台通杀）
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# 注入产品基本识别参数
PRODUCT_DEVICE := PHQ110
PRODUCT_NAME := fox_PHQ110
PRODUCT_BRAND := OPPO
PRODUCT_MODEL := OPPO A98 / PHQ110
PRODUCT_MANUFACTURER := oppo

PRODUCT_RELEASE_NAME := OPPO PHQ110
TARGET_DEVICE := PHQ110

# 强制宣告支持虚拟 A/B 与动态分区合并
PRODUCT_VIRTUAL_AB_COMPRESSION := true
PRODUCT_PACKAGES += fastbootd

# 导入硬件级复制机制 (如果你的设备树文件夹里没有 device.mk，可以在这行最前面加 # 注释掉)
$(call inherit-product, device/oppo/PHQ110/device.mk)
