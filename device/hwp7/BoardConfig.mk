BOARD_VENDOR := Huawei

DEVICE_FOLDER := device/huawei/hwp7

USE_CAMERA_STUB := false

# Audio
#USE_PROPRIETARY_AUDIO_EXTENSIONS := true
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_GENERIC_AUDIO := true
#BOARD_USES_SRS_TRUEMEDIA := true

# inherit from the proprietary version
include vendor/huawei/hwp7/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := hi6620oem
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
NEED_WORKAROUND_CORTEX_A9_745320 := true

TARGET_BOOTLOADER_BOARD_NAME := hwp7

HISI_TARGET_PRODUCT := hi6620oem

# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Wifi related defines
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm4334
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/firmware/fw_bcm4334_hw.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/firmware/fw_bcm4334_apsta_hw.bin"
WIFI_DRIVER_MODULE_NAME          := "dhd"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/vendor/firmware/fw_bcm4334_hw.bin nvram_path=/system/vendor/firmware/nvram4334_hw.txt"
WIFI_DRIVER_MODULE_AP_ARG        := "firmware_path=/system/vendor/firmware/fw_bcm4334_apsta_hw.bin nvram_path=/system/vendor/firmware/nvram4334_hw.txt"
WIFI_BAND                        := 802_11_ABG

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
#BOARD_BLUEDROID_VENDOR_CONF := $(DEVICE_FOLDER)/bluetooth/vnd_hwp7.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_FOLDER)/bluetooth

# kernel build
TARGET_PREBUILT_KERNEL := $(DEVICE_FOLDER)/kernel
#TARGET_KERNEL_SOURCE := kernel/huawei/hwp7
#TARGET_KERNEL_CONFIG := hisi_hi6620oem_defconfig

# Hardware
#BOARD_HARDWARE_CLASS := $(DEVICE_FOLDER)/cmhw

BOARD_HAL_STATIC_LIBRARIES += libhealthd.hi6620oem

# adb has root
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mass_storage

# Graphics
BOARD_EGL_CFG := $(DEVICE_FOLDER)/prebuilt/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true
#BOARD_USES_SKIAHWJPEG := true
#COMMON_GLOBAL_CFLAGS += -DSEC_HWJPEG_G2D -DFORCE_SCREENSHOT_CPU_PATH 
#TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
#BOARD_USE_SYSFS_VSYNC_NOTIFICATION := true
#BOARD_HAVE_PIXEL_FORMAT_INFO := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true
BOARD_EGL_SKIP_FIRST_DEQUEUE := true
#BOARD_USE_SKIA_LCDTEXT := true
#BOARD_NEEDS_MEMORYHEAPPMEM := true
#TARGET_ENABLE_OFFLOAD_ENHANCEMENTS := true
#LOCAL_CFLAGS     += -DENABLE_AV_ENHANCEMENTS
# Camera
BOARD_CAMERA_HAVE_ISO := true

# Misc
BOARD_NEEDS_CUTILS_LOG := true
BOARD_SCREENRECORD_DEVICE_FORCE_AUDIO_MIC := true
BOARD_USES_SECURE_SERVICES := true
TARGET_USES_ION := true
TARGET_GRALLOC_USES_ASHMEM := true

# Kernel
BOARD_KERNEL_CMDLINE := k3v2mem k3v2_ion=1 vmalloc=448M maxcpus=4 initcall_debug=n
BOARD_KERNEL_BASE := 0x08600000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x0c600000

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12740198400

TARGET_OTA_ASSERT_DEVICE := hwp7,P7-L10

# USB mass storage
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun/file"
BOARD_VOLD_MAX_PARTITIONS := 30

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_TOUCH_RECOVERY := 
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGR_565"
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_HAS_LOCKED_BOOTLOADER := true
RECOVERY_FSTAB_VERSION := 2
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../$(DEVICE_FOLDER)/recovery/recovery_keys.c
TARGET_RECOVERY_FSTAB := device/huawei/hwp7/recovery/recovery.fstab
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

BOARD_RECOVERY_SWIPE := true

TARGET_PREBUILT_RECOVERY_KERNEL := $(DEVICE_FOLDER)/recovery-kernel
TARGET_RECOVERY_INITRC := $(DEVICE_FOLDER)/recovery/init.rc

#TWRP
HAVE_SELINUX := true

TW_MAX_BRIGHTNESS := 255
DEVICE_RESOLUTION := 1080x1920
RECOVERY_GRAPHICS_USE_LINELENGTH := true

TW_CUSTOM_BATTERY_PATH := "/sys/devices/platform/bq_bci_battery.1/power_supply/Battery"

RECOVERY_SDCARD_ON_DATA := true 
TW_FLASH_FROM_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true

TW_BRIGHTNESS_PATH := "/sys/devices/platform/k3_fb.1/leds/lcd_backlight0/brightness"
