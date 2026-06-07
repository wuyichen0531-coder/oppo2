#
# Copyright (C) 2026 The OrangeFox Recovery Project
#

# 继承 AOSP 基础全 64 位底层配置
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# 继承橙狐官方全功能 Recovery 核心参数
$(call inherit-product, vendor/ot/config/fox.mk)

# 注入产品基本识别参数
PRODUCT_DEVICE := PHQ110
PRODUCT_NAME := fox_PHQ110
PRODUCT_BRAND := OPPO
PRODUCT_MODEL := OPPO A98 / PHQ110
PRODUCT_MANUFACTURER := oppo

PRODUCT_RELEASE_NAME := OPPO PHQ110
TARGET_DEVICE := PHQ110

# 强制宣告支持虚拟 A/B 与动态分区合并
 Northumberland
PRODUCT_VIRTUAL_AB_COMPRESSION := true
PRODUCT_PACKAGES += fastbootd

# 导入硬件级复制机制
$(call inherit-product, device/oppo/PHQ110/device.mk)