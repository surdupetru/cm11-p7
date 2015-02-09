# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/huawei/hwp7/hwp7-vendor.mk)

LOCAL_PATH := device/huawei/hwp7

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/fstab.hi6620oem:root/fstab.hi6620oem \
    $(LOCAL_PATH)/root/init.hi6620oem.rc:root/init.hi6620oem.rc \
    $(LOCAL_PATH)/root/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/root/init.hi6620oem.cpu.rc:root/init.hi6620oem.cpu.rc \
    $(LOCAL_PATH)/root/init.hi6620oem.glove.rc:root/init.hi6620oem.glove.rc \
    $(LOCAL_PATH)/recovery/ueventd.hi6620oem.rc:root/ueventd.hi6620oem.rc \
    $(LOCAL_PATH)/recovery/ueventd.rc:root/ueventd.rc \
    $(LOCAL_PATH)/root/init.via.rc:root/init.via.rc \
    $(LOCAL_PATH)/root/init.rc:root/init.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/sbin/e2fsck_s:root/sbin/e2fsck_s \
    $(LOCAL_PATH)/recovery/sbin/oeminfo_nvm_server:root/sbin/oeminfo_nvm_server

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/sbin/e2fsck_s:recovery/root/sbin/e2fsck_s \
    $(LOCAL_PATH)/recovery/sbin/oeminfo_nvm_server:recovery/root/sbin/oeminfo_nvm_server

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/ueventd.hi6620oem.rc:recovery/root/ueventd.hi6620oem.rc \
    $(LOCAL_PATH)/recovery/fstab.hi6620oem:recovery/root/fstab.hi6620oem \
    $(LOCAL_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/system/bin/linker:recovery/root/system/bin/linker \
    $(LOCAL_PATH)/recovery/system/lib/libc.so:recovery/root/system/lib/libc.so \
    $(LOCAL_PATH)/recovery/system/lib/libdl.so:recovery/root/system/lib/libdl.so \
    $(LOCAL_PATH)/recovery/system/lib/liblog.so:recovery/root/system/lib/liblog.so \
    $(LOCAL_PATH)/recovery/system/lib/libm.so:recovery/root/system/lib/libm.so \
    $(LOCAL_PATH)/recovery/system/lib/libstdc++.so:recovery/root/system/lib/libstdc++.so \
    $(LOCAL_PATH)/recovery/system/lib/libz.so:recovery/root/system/lib/libz.so

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/batt_level_scale.png:recovery/root/res/images/1080x1920/batt_level_scale.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/batt_level_top.png:recovery/root/res/images/1080x1920/batt_level_top.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/bg.png:recovery/root/res/images/1080x1920/bg.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/empty_charge.png:recovery/root/res/images/1080x1920/empty_charge.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/err_charge.png:recovery/root/res/images/1080x1920/err_charge.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/full_charge.png:recovery/root/res/images/1080x1920/full_charge.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/number_0.png:recovery/root/res/images/1080x1920/number_0.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/number_1.png:recovery/root/res/images/1080x1920/number_1.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/number_2.png:recovery/root/res/images/1080x1920/number_2.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/number_3.png:recovery/root/res/images/1080x1920/number_3.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/number_4.png:recovery/root/res/images/1080x1920/number_4.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/number_5.png:recovery/root/res/images/1080x1920/number_5.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/number_6.png:recovery/root/res/images/1080x1920/number_6.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/number_7.png:recovery/root/res/images/1080x1920/number_7.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/number_8.png:recovery/root/res/images/1080x1920/number_8.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/number_9.png:recovery/root/res/images/1080x1920/number_9.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/percent_5.png:recovery/root/res/images/1080x1920/percent_5.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/percent_10.png:recovery/root/res/images/1080x1920/percent_10.png \
    $(LOCAL_PATH)/recovery/res/images/1080x1920/percent_sign.png:recovery/root/res/images/1080x1920/percent_sign.png

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/usr/idc/hisik3_touchscreen.idc:system/usr/idc/hisik3_touchscreen.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/k3_keypad.idc:system/usr/idc/k3_keypad.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/logical_tp.idc:system/usr/idc/logical_tp.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/synaptics.idc:system/usr/idc/synaptics.idc \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/k3_keypad.kl:system/usr/keylayout/k3_keypad.kl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/asound_ADL.dat:system/etc/asound_ADL.dat \
    $(LOCAL_PATH)/prebuilt/etc/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/prebuilt/etc/camera_orientation.cfg:system/etc/camera_orientation.cfg \
    $(LOCAL_PATH)/prebuilt/etc/camera_resolutions.cfg:system/etc/camera_resolutions.cfg \
    $(LOCAL_PATH)/prebuilt/etc/camera_videosnapshot.cfg:system/etc/camera_videosnapshot.cfg \
    $(LOCAL_PATH)/prebuilt/etc/device_state_monitor.conf:system/etc/device_state_monitor.conf \
    $(LOCAL_PATH)/prebuilt/etc/EDGE_PLUS_EMO.conf:system/etc/EDGE_PLUS_EMO.conf \
    $(LOCAL_PATH)/prebuilt/etc/EDGE_PLUS_UG.conf:system/etc/EDGE_PLUS_UG.conf \
    $(LOCAL_PATH)/prebuilt/etc/EDGE_PLUS_UL.conf:system/etc/EDGE_PLUS_UL.conf \
    $(LOCAL_PATH)/prebuilt/etc/es305.bin:system/etc/es305.bin \
    $(LOCAL_PATH)/prebuilt/etc/es305_uart.bin:system/etc/es305_uart.bin \
    $(LOCAL_PATH)/prebuilt/etc/globalAutoAdapt-conf.xml:system/etc/globalAutoAdapt-conf.xml \
    $(LOCAL_PATH)/prebuilt/etc/globalMatchs-conf.xml:system/etc/globalMatchs-conf.xml \
    $(LOCAL_PATH)/prebuilt/etc/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/prebuilt/etc/gpsconfig.xml:system/etc/gpsconfig.xml \
    $(LOCAL_PATH)/prebuilt/etc/gpsconfig_cl.xml:system/etc/gpsconfig_cl.xml \
    $(LOCAL_PATH)/prebuilt/etc/gpsconfig_tlg.xml:system/etc/gpsconfig_tlg.xml \
    $(LOCAL_PATH)/prebuilt/etc/k3_omx.cfg:system/etc/k3_omx.cfg \
    $(LOCAL_PATH)/prebuilt/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/prebuilt/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/prebuilt/etc/libnfc-nxp-xtal.conf:system/etc/libnfc-nxp-xtal.conf \
    $(LOCAL_PATH)/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/prebuilt/etc/nfcee_access.xml:system/etc/nfcee_access.xml \
    $(LOCAL_PATH)/prebuilt/etc/OSCAR_3G.conf:system/etc/OSCAR_3G.conf \
    $(LOCAL_PATH)/prebuilt/etc/OSCAR_CG.conf:system/etc/OSCAR_CG.conf \
    $(LOCAL_PATH)/prebuilt/etc/OSCAR_TG.conf:system/etc/OSCAR_TG.conf \
    $(LOCAL_PATH)/prebuilt/etc/OSCAR_TL.conf:system/etc/OSCAR_TL.conf \
    $(LOCAL_PATH)/prebuilt/etc/OSCAR_UG.conf:system/etc/OSCAR_UG.conf \
    $(LOCAL_PATH)/prebuilt/etc/OSCAR_UL.conf:system/etc/OSCAR_UL.conf \
    $(LOCAL_PATH)/prebuilt/etc/ril_balong_radio.cfg:/system/etc/ril_balong_radio.cfg \
    $(LOCAL_PATH)/prebuilt/etc/ril_xgold_radio.cfg:/system/etc/ril_xgold_radio.cfg \
    $(LOCAL_PATH)/prebuilt/etc/SOPHIA_CLG.conf:system/etc/SOPHIA_CLG.conf \
    $(LOCAL_PATH)/prebuilt/etc/SOPHIA_TL.conf:system/etc/SOPHIA_TL.conf \
    $(LOCAL_PATH)/prebuilt/etc/SOPHIA_UL.conf:system/etc/SOPHIA_UL.conf \
    $(LOCAL_PATH)/prebuilt/etc/SOPHIA_ULG.conf:system/etc/SOPHIA_ULG.conf \
    $(LOCAL_PATH)/prebuilt/etc/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/audio/algorithm/algorithm_default_normal.xml:system/etc/audio/algorithm/algorithm_default_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/algorithm/algorithm_EDGEPUG_normal.xml:system/etc/audio/algorithm/algorithm_EDGEPUG_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/algorithm/algorithm_EDGEPUL_normal.xml:system/etc/audio/algorithm/algorithm_EDGEPUL_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/algorithm/algorithm_OSCAR_normal.xml:system/etc/audio/algorithm/algorithm_OSCAR_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/algorithm/algorithm_OSCARTL_normal.xml:system/etc/audio/algorithm/algorithm_OSCARTL_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/algorithm/algorithm_OSCARUL_normal.xml:system/etc/audio/algorithm/algorithm_OSCARUL_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/algorithm/algorithm_OSCARVA_normal.xml:system/etc/audio/algorithm/algorithm_OSCARVA_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/algorithm/algorithm_SOPHIACLG_normal.xml:system/etc/audio/algorithm/algorithm_SOPHIACLG_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/algorithm/algorithm_SOPHIA_normal.xml:system/etc/audio/algorithm/algorithm_SOPHIA_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/audience/audience_default_cs.bin:system/etc/audio/audience/audience_default_cs.bin \
    $(LOCAL_PATH)/prebuilt/etc/audio/audience/audience_hi6620oem_normal_cs.bin:system/etc/audio/audience/audience_hi6620oem_normal_cs.bin \
    $(LOCAL_PATH)/prebuilt/etc/audio/audience/audience_OSCAR_ce_cs.bin:system/etc/audio/audience/audience_OSCAR_ce_cs.bin \
    $(LOCAL_PATH)/prebuilt/etc/audio/audience/audience_OSCAR_normal_cs.bin:system/etc/audio/audience/audience_OSCAR_normal_cs.bin \
    $(LOCAL_PATH)/prebuilt/etc/audio/audience/audience_OSCARTL_ce_cs.bin:system/etc/audio/audience/audience_OSCARTL_ce_cs.bin \
    $(LOCAL_PATH)/prebuilt/etc/audio/audience/audience_OSCARTL_normal_cs.bin:system/etc/audio/audience/audience_OSCARTL_normal_cs.bin \
    $(LOCAL_PATH)/prebuilt/etc/audio/audience/audience_OSCARUL_ce_cs.bin:system/etc/audio/audience/audience_OSCARUL_ce_cs.bin \
    $(LOCAL_PATH)/prebuilt/etc/audio/audience/audience_OSCARUL_normal_cs.bin:system/etc/audio/audience/audience_OSCARUL_normal_cs.bin \
    $(LOCAL_PATH)/prebuilt/etc/audio/audience/audience_OSCARVA_ce_cs.bin:system/etc/audio/audience/audience_OSCARVA_ce_cs.bin \
    $(LOCAL_PATH)/prebuilt/etc/audio/audience/audience_OSCARVA_normal_cs.bin:system/etc/audio/audience/audience_OSCARVA_normal_cs.bin \
    $(LOCAL_PATH)/prebuilt/etc/audio/audience/audience_SOPHIA_ce_cs.bin:system/etc/audio/audience/audience_SOPHIA_ce_cs.bin \
    $(LOCAL_PATH)/prebuilt/etc/audio/audience/audience_SOPHIA_normal_cs.bin:system/etc/audio/audience/audience_SOPHIA_normal_cs.bin \
    $(LOCAL_PATH)/prebuilt/etc/audio/audience/audience_SOPHIACLG_ce_cs.bin:system/etc/audio/audience/audience_SOPHIACLG_ce_cs.bin \
    $(LOCAL_PATH)/prebuilt/etc/audio/audience/audience_SOPHIACLG_normal_cs.bin:system/etc/audio/audience/audience_SOPHIACLG_normal_cs.bin \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_default_ce.xml:system/etc/audio/codec/ascend_default_ce.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_default_normal.xml:system/etc/audio/codec/ascend_default_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_EDGEPUG_ce.xml:system/etc/audio/codec/ascend_EDGEPUG_ce.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_EDGEPUG_normal.xml:system/etc/audio/codec/ascend_EDGEPUG_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_EDGEPUL_ce.xml:system/etc/audio/codec/ascend_EDGEPUL_ce.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_EDGEPUL_normal.xml:system/etc/audio/codec/ascend_EDGEPUL_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_OSCAR_ce.xml:system/etc/audio/codec/ascend_OSCAR_ce.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_OSCAR_normal.xml:system/etc/audio/codec/ascend_OSCAR_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_OSCARTL_ce.xml:system/etc/audio/codec/ascend_OSCARTL_ce.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_OSCARTL_normal.xml:system/etc/audio/codec/ascend_OSCARTL_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_OSCARUL_ce.xml:system/etc/audio/codec/ascend_OSCARUL_ce.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_OSCARUL_normal.xml:system/etc/audio/codec/ascend_OSCARUL_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_OSCARVA_ce.xml:system/etc/audio/codec/ascend_OSCARVA_ce.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_OSCARVA_normal.xml:system/etc/audio/codec/ascend_OSCARVA_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_SOPHIA_ce.xml:system/etc/audio/codec/ascend_SOPHIA_ce.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_SOPHIA_normal.xml:system/etc/audio/codec/ascend_SOPHIA_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_SOPHIACLG_ce.xml:system/etc/audio/codec/ascend_SOPHIACLG_ce.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/codec/ascend_SOPHIACLG_normal.xml:system/etc/audio/codec/ascend_SOPHIACLG_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/dts/ascend_dts_algo_default_normal.xml:system/etc/audio/dts/ascend_dts_algo_default_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/dts/ascend_dts_algo_EDGEPUG_normal.xml:system/etc/audio/dts/ascend_dts_algo_EDGEPUG_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/dts/ascend_dts_algo_EDGEPUL_normal.xml:system/etc/audio/dts/ascend_dts_algo_EDGEPUL_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/dts/ascend_dts_algo_OSCAR_normal.xml:system/etc/audio/dts/ascend_dts_algo_OSCAR_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/dts/ascend_dts_algo_OSCARTL_normal.xml:system/etc/audio/dts/ascend_dts_algo_OSCARTL_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/dts/ascend_dts_algo_OSCARUL_normal.xml:system/etc/audio/dts/ascend_dts_algo_OSCARUL_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/dts/ascend_dts_algo_OSCARVA_normal.xml:system/etc/audio/dts/ascend_dts_algo_OSCARVA_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/dts/ascend_dts_algo_SOPHIACLG_normal.xml:system/etc/audio/dts/ascend_dts_algo_SOPHIACLG_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/dts/ascend_dts_algo_SOPHIA_normal.xml:system/etc/audio/dts/ascend_dts_algo_SOPHIA_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/mbdrc/ascend_mbdrc_algo_default_normal.xml:system/etc/audio/mbdrc/ascend_mbdrc_algo_default_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/mbdrc/ascend_mbdrc_algo_EDGEPUG_normal.xml:system/etc/audio/mbdrc/ascend_mbdrc_algo_EDGEPUG_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/mbdrc/ascend_mbdrc_algo_EDGEPUL_normal.xml:system/etc/audio/mbdrc/ascend_mbdrc_algo_EDGEPUL_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/mbdrc/ascend_mbdrc_algo_OSCAR_normal.xml:system/etc/audio/mbdrc/ascend_mbdrc_algo_OSCAR_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/mbdrc/ascend_mbdrc_algo_OSCARTL_normal.xml:system/etc/audio/mbdrc/ascend_mbdrc_algo_OSCARTL_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/mbdrc/ascend_mbdrc_algo_OSCARUL_normal.xml:system/etc/audio/mbdrc/ascend_mbdrc_algo_OSCARUL_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/mbdrc/ascend_mbdrc_algo_OSCARVA_normal.xml:system/etc/audio/mbdrc/ascend_mbdrc_algo_OSCARVA_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/mbdrc/ascend_mbdrc_algo_SOPHIACLG_normal.xml:system/etc/audio/mbdrc/ascend_mbdrc_algo_SOPHIACLG_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/mbdrc/ascend_mbdrc_algo_SOPHIA_normal.xml:system/etc/audio/mbdrc/ascend_mbdrc_algo_SOPHIA_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/modem/ascend_modem_algo_default_normal.xml:system/etc/audio/modem/ascend_modem_algo_default_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/modem/ascend_modem_algo_EDGEPUG_normal.xml:system/etc/audio/modem/ascend_modem_algo_EDGEPUG_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/modem/ascend_modem_algo_EDGEPUL_normal.xml:system/etc/audio/modem/ascend_modem_algo_EDGEPUL_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/modem/ascend_modem_algo_OSCAR_normal.xml:system/etc/audio/modem/ascend_modem_algo_OSCAR_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/modem/ascend_modem_algo_OSCARTL_normal.xml:system/etc/audio/modem/ascend_modem_algo_OSCARTL_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/modem/ascend_modem_algo_OSCARUL_normal.xml:system/etc/audio/modem/ascend_modem_algo_OSCARUL_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/modem/ascend_modem_algo_OSCARVA_normal.xml:system/etc/audio/modem/ascend_modem_algo_OSCARVA_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/modem/ascend_modem_algo_SOPHIACLG_normal.xml:system/etc/audio/modem/ascend_modem_algo_SOPHIACLG_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/modem/ascend_modem_algo_SOPHIA_normal.xml:system/etc/audio/modem/ascend_modem_algo_SOPHIA_normal.xml \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/ce/fm/fm.eq:system/etc/audio/tfa9887/default/ce/fm/fm.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/ce/fm/fm.preset:system/etc/audio/tfa9887/default/ce/fm/fm.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/ce/incall_nb/incall_nb.eq:system/etc/audio/tfa9887/default/ce/incall_nb/incall_nb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/ce/incall_nb/incall_nb.preset:system/etc/audio/tfa9887/default/ce/incall_nb/incall_nb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/ce/incall_wb/incall_wb.eq:system/etc/audio/tfa9887/default/ce/incall_wb/incall_wb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/ce/incall_wb/incall_wb.preset:system/etc/audio/tfa9887/default/ce/incall_wb/incall_wb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/ce/music/music.eq:system/etc/audio/tfa9887/default/ce/music/music.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/ce/music/music.preset:system/etc/audio/tfa9887/default/ce/music/music.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/ce/ringtone/ringtone.eq:system/etc/audio/tfa9887/default/ce/ringtone/ringtone.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/ce/ringtone/ringtone.preset:system/etc/audio/tfa9887/default/ce/ringtone/ringtone.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/ce/ringtone_hs_spk/ringtone_hs_spk.eq:system/etc/audio/tfa9887/default/ce/ringtone_hs_spk/ringtone_hs_spk.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/ce/ringtone_hs_spk/ringtone_hs_spk.preset:system/etc/audio/tfa9887/default/ce/ringtone_hs_spk/ringtone_hs_spk.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/ce/voip/voip.eq:system/etc/audio/tfa9887/default/ce/voip/voip.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/ce/voip/voip.preset:system/etc/audio/tfa9887/default/ce/voip/voip.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/normal/fm/fm.eq:system/etc/audio/tfa9887/default/normal/fm/fm.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/normal/fm/fm.preset:system/etc/audio/tfa9887/default/normal/fm/fm.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/normal/incall_nb/incall_nb.eq:system/etc/audio/tfa9887/default/normal/incall_nb/incall_nb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/normal/incall_nb/incall_nb.preset:system/etc/audio/tfa9887/default/normal/incall_nb/incall_nb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/normal/incall_wb/incall_wb.eq:system/etc/audio/tfa9887/default/normal/incall_wb/incall_wb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/normal/incall_wb/incall_wb.preset:system/etc/audio/tfa9887/default/normal/incall_wb/incall_wb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/normal/music/music.eq:system/etc/audio/tfa9887/default/normal/music/music.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/normal/music/music.preset:system/etc/audio/tfa9887/default/normal/music/music.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/normal/ringtone/ringtone.eq:system/etc/audio/tfa9887/default/normal/ringtone/ringtone.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/normal/ringtone/ringtone.preset:system/etc/audio/tfa9887/default/normal/ringtone/ringtone.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/normal/ringtone_hs_spk/ringtone_hs_spk.eq:system/etc/audio/tfa9887/default/normal/ringtone_hs_spk/ringtone_hs_spk.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/normal/ringtone_hs_spk/ringtone_hs_spk.preset:system/etc/audio/tfa9887/default/normal/ringtone_hs_spk/ringtone_hs_spk.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/normal/voip/voip.eq:system/etc/audio/tfa9887/default/normal/voip/voip.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/normal/voip/voip.preset:system/etc/audio/tfa9887/default/normal/voip/voip.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/dsp_coefficient.config:system/etc/audio/tfa9887/default/dsp_coefficient.config \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/default/speaker_model.speaker:system/etc/audio/tfa9887/default/speaker_model.speaker \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/ce/fm/fm.eq:system/etc/audio/tfa9887/EDGEPUG/ce/fm/fm.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/ce/fm/fm.preset:system/etc/audio/tfa9887/EDGEPUG/ce/fm/fm.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/ce/incall_nb/incall_nb.eq:system/etc/audio/tfa9887/EDGEPUG/ce/incall_nb/incall_nb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/ce/incall_nb/incall_nb.preset:system/etc/audio/tfa9887/EDGEPUG/ce/incall_nb/incall_nb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/ce/incall_wb/incall_wb.eq:system/etc/audio/tfa9887/EDGEPUG/ce/incall_wb/incall_wb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/ce/incall_wb/incall_wb.preset:system/etc/audio/tfa9887/EDGEPUG/ce/incall_wb/incall_wb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/ce/music/music.eq:system/etc/audio/tfa9887/EDGEPUG/ce/music/music.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/ce/music/music.preset:system/etc/audio/tfa9887/EDGEPUG/ce/music/music.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/ce/ringtone/ringtone.eq:system/etc/audio/tfa9887/EDGEPUG/ce/ringtone/ringtone.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/ce/ringtone/ringtone.preset:system/etc/audio/tfa9887/EDGEPUG/ce/ringtone/ringtone.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/ce/ringtone_hs_spk/ringtone_hs_spk.eq:system/etc/audio/tfa9887/EDGEPUG/ce/ringtone_hs_spk/ringtone_hs_spk.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/ce/ringtone_hs_spk/ringtone_hs_spk.preset:system/etc/audio/tfa9887/EDGEPUG/ce/ringtone_hs_spk/ringtone_hs_spk.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/ce/voip/voip.eq:system/etc/audio/tfa9887/EDGEPUG/ce/voip/voip.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/ce/voip/voip.preset:system/etc/audio/tfa9887/EDGEPUG/ce/voip/voip.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/normal/fm/fm.eq:system/etc/audio/tfa9887/EDGEPUG/normal/fm/fm.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/normal/fm/fm.preset:system/etc/audio/tfa9887/EDGEPUG/normal/fm/fm.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/normal/incall_nb/incall_nb.eq:system/etc/audio/tfa9887/EDGEPUG/normal/incall_nb/incall_nb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/normal/incall_nb/incall_nb.preset:system/etc/audio/tfa9887/EDGEPUG/normal/incall_nb/incall_nb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/normal/incall_wb/incall_wb.eq:system/etc/audio/tfa9887/EDGEPUG/normal/incall_wb/incall_wb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/normal/incall_wb/incall_wb.preset:system/etc/audio/tfa9887/EDGEPUG/normal/incall_wb/incall_wb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/normal/music/music.eq:system/etc/audio/tfa9887/EDGEPUG/normal/music/music.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/normal/music/music.preset:system/etc/audio/tfa9887/EDGEPUG/normal/music/music.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/normal/ringtone/ringtone.eq:system/etc/audio/tfa9887/EDGEPUG/normal/ringtone/ringtone.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/normal/ringtone/ringtone.preset:system/etc/audio/tfa9887/EDGEPUG/normal/ringtone/ringtone.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/normal/ringtone_hs_spk/ringtone_hs_spk.eq:system/etc/audio/tfa9887/EDGEPUG/normal/ringtone_hs_spk/ringtone_hs_spk.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/normal/ringtone_hs_spk/ringtone_hs_spk.preset:system/etc/audio/tfa9887/EDGEPUG/normal/ringtone_hs_spk/ringtone_hs_spk.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/normal/voip/voip.eq:system/etc/audio/tfa9887/EDGEPUG/normal/voip/voip.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/normal/voip/voip.preset:system/etc/audio/tfa9887/EDGEPUG/normal/voip/voip.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/dsp_coefficient.config:system/etc/audio/tfa9887/EDGEPUG/dsp_coefficient.config \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUG/speaker_model.speaker:system/etc/audio/tfa9887/EDGEPUG/speaker_model.speaker \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/ce/fm/fm.eq:system/etc/audio/tfa9887/EDGEPUL/ce/fm/fm.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/ce/fm/fm.preset:system/etc/audio/tfa9887/EDGEPUL/ce/fm/fm.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/ce/incall_nb/incall_nb.eq:system/etc/audio/tfa9887/EDGEPUL/ce/incall_nb/incall_nb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/ce/incall_nb/incall_nb.preset:system/etc/audio/tfa9887/EDGEPUL/ce/incall_nb/incall_nb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/ce/incall_wb/incall_wb.eq:system/etc/audio/tfa9887/EDGEPUL/ce/incall_wb/incall_wb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/ce/incall_wb/incall_wb.preset:system/etc/audio/tfa9887/EDGEPUL/ce/incall_wb/incall_wb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/ce/music/music.eq:system/etc/audio/tfa9887/EDGEPUL/ce/music/music.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/ce/music/music.preset:system/etc/audio/tfa9887/EDGEPUL/ce/music/music.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/ce/ringtone/ringtone.eq:system/etc/audio/tfa9887/EDGEPUL/ce/ringtone/ringtone.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/ce/ringtone/ringtone.preset:system/etc/audio/tfa9887/EDGEPUL/ce/ringtone/ringtone.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/ce/ringtone_hs_spk/ringtone_hs_spk.eq:system/etc/audio/tfa9887/EDGEPUL/ce/ringtone_hs_spk/ringtone_hs_spk.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/ce/ringtone_hs_spk/ringtone_hs_spk.preset:system/etc/audio/tfa9887/EDGEPUL/ce/ringtone_hs_spk/ringtone_hs_spk.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/ce/voip/voip.eq:system/etc/audio/tfa9887/EDGEPUL/ce/voip/voip.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/ce/voip/voip.preset:system/etc/audio/tfa9887/EDGEPUL/ce/voip/voip.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/normal/fm/fm.eq:system/etc/audio/tfa9887/EDGEPUL/normal/fm/fm.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/normal/fm/fm.preset:system/etc/audio/tfa9887/EDGEPUL/normal/fm/fm.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/normal/incall_nb/incall_nb.eq:system/etc/audio/tfa9887/EDGEPUL/normal/incall_nb/incall_nb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/normal/incall_nb/incall_nb.preset:system/etc/audio/tfa9887/EDGEPUL/normal/incall_nb/incall_nb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/normal/incall_wb/incall_wb.eq:system/etc/audio/tfa9887/EDGEPUL/normal/incall_wb/incall_wb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/normal/incall_wb/incall_wb.preset:system/etc/audio/tfa9887/EDGEPUL/normal/incall_wb/incall_wb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/normal/music/music.eq:system/etc/audio/tfa9887/EDGEPUL/normal/music/music.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/normal/music/music.preset:system/etc/audio/tfa9887/EDGEPUL/normal/music/music.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/normal/ringtone/ringtone.eq:system/etc/audio/tfa9887/EDGEPUL/normal/ringtone/ringtone.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/normal/ringtone/ringtone.preset:system/etc/audio/tfa9887/EDGEPUL/normal/ringtone/ringtone.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/normal/ringtone_hs_spk/ringtone_hs_spk.eq:system/etc/audio/tfa9887/EDGEPUL/normal/ringtone_hs_spk/ringtone_hs_spk.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/normal/ringtone_hs_spk/ringtone_hs_spk.preset:system/etc/audio/tfa9887/EDGEPUL/normal/ringtone_hs_spk/ringtone_hs_spk.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/normal/voip/voip.eq:system/etc/audio/tfa9887/EDGEPUL/normal/voip/voip.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/normal/voip/voip.preset:system/etc/audio/tfa9887/EDGEPUL/normal/voip/voip.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/dsp_coefficient.config:system/etc/audio/tfa9887/EDGEPUL/dsp_coefficient.config \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/EDGEPUL/speaker_model.speaker:system/etc/audio/tfa9887/EDGEPUL/speaker_model.speaker \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/ce/fm/fm.eq:system/etc/audio/tfa9887/SOPHIA/ce/fm/fm.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/ce/fm/fm.preset:system/etc/audio/tfa9887/SOPHIA/ce/fm/fm.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/ce/incall_nb/incall_nb.eq:system/etc/audio/tfa9887/SOPHIA/ce/incall_nb/incall_nb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/ce/incall_nb/incall_nb.preset:system/etc/audio/tfa9887/SOPHIA/ce/incall_nb/incall_nb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/ce/incall_wb/incall_wb.eq:system/etc/audio/tfa9887/SOPHIA/ce/incall_wb/incall_wb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/ce/incall_wb/incall_wb.preset:system/etc/audio/tfa9887/SOPHIA/ce/incall_wb/incall_wb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/ce/music/music.eq:system/etc/audio/tfa9887/SOPHIA/ce/music/music.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/ce/music/music.preset:system/etc/audio/tfa9887/SOPHIA/ce/music/music.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/ce/ringtone/ringtone.eq:system/etc/audio/tfa9887/SOPHIA/ce/ringtone/ringtone.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/ce/ringtone/ringtone.preset:system/etc/audio/tfa9887/SOPHIA/ce/ringtone/ringtone.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/ce/ringtone_hs_spk/ringtone_hs_spk.eq:system/etc/audio/tfa9887/SOPHIA/ce/ringtone_hs_spk/ringtone_hs_spk.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/ce/ringtone_hs_spk/ringtone_hs_spk.preset:system/etc/audio/tfa9887/SOPHIA/ce/ringtone_hs_spk/ringtone_hs_spk.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/ce/voip/voip.eq:system/etc/audio/tfa9887/SOPHIA/ce/voip/voip.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/ce/voip/voip.preset:system/etc/audio/tfa9887/SOPHIA/ce/voip/voip.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/normal/fm/fm.eq:system/etc/audio/tfa9887/SOPHIA/normal/fm/fm.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/normal/fm/fm.preset:system/etc/audio/tfa9887/SOPHIA/normal/fm/fm.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/normal/incall_nb/incall_nb.eq:system/etc/audio/tfa9887/SOPHIA/normal/incall_nb/incall_nb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/normal/incall_nb/incall_nb.preset:system/etc/audio/tfa9887/SOPHIA/normal/incall_nb/incall_nb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/normal/incall_wb/incall_wb.eq:system/etc/audio/tfa9887/SOPHIA/normal/incall_wb/incall_wb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/normal/incall_wb/incall_wb.preset:system/etc/audio/tfa9887/SOPHIA/normal/incall_wb/incall_wb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/normal/music/music.eq:system/etc/audio/tfa9887/SOPHIA/normal/music/music.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/normal/music/music.preset:system/etc/audio/tfa9887/SOPHIA/normal/music/music.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/normal/ringtone/ringtone.eq:system/etc/audio/tfa9887/SOPHIA/normal/ringtone/ringtone.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/normal/ringtone/ringtone.preset:system/etc/audio/tfa9887/SOPHIA/normal/ringtone/ringtone.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/normal/ringtone_hs_spk/ringtone_hs_spk.eq:system/etc/audio/tfa9887/SOPHIA/normal/ringtone_hs_spk/ringtone_hs_spk.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/normal/ringtone_hs_spk/ringtone_hs_spk.preset:system/etc/audio/tfa9887/SOPHIA/normal/ringtone_hs_spk/ringtone_hs_spk.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/normal/voip/voip.eq:system/etc/audio/tfa9887/SOPHIA/normal/voip/voip.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/normal/voip/voip.preset:system/etc/audio/tfa9887/SOPHIA/normal/voip/voip.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/dsp_coefficient.config:system/etc/audio/tfa9887/SOPHIA/dsp_coefficient.config \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIA/speaker_model.speaker:system/etc/audio/tfa9887/SOPHIA/speaker_model.speaker \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/ce/fm/fm.eq:system/etc/audio/tfa9887/SOPHIACLG/ce/fm/fm.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/ce/fm/fm.preset:system/etc/audio/tfa9887/SOPHIACLG/ce/fm/fm.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/ce/incall_nb/incall_nb.eq:system/etc/audio/tfa9887/SOPHIACLG/ce/incall_nb/incall_nb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/ce/incall_nb/incall_nb.preset:system/etc/audio/tfa9887/SOPHIACLG/ce/incall_nb/incall_nb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/ce/incall_wb/incall_wb.eq:system/etc/audio/tfa9887/SOPHIACLG/ce/incall_wb/incall_wb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/ce/incall_wb/incall_wb.preset:system/etc/audio/tfa9887/SOPHIACLG/ce/incall_wb/incall_wb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/ce/music/music.eq:system/etc/audio/tfa9887/SOPHIACLG/ce/music/music.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/ce/music/music.preset:system/etc/audio/tfa9887/SOPHIACLG/ce/music/music.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/ce/ringtone/ringtone.eq:system/etc/audio/tfa9887/SOPHIACLG/ce/ringtone/ringtone.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/ce/ringtone/ringtone.preset:system/etc/audio/tfa9887/SOPHIACLG/ce/ringtone/ringtone.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/ce/ringtone_hs_spk/ringtone_hs_spk.eq:system/etc/audio/tfa9887/SOPHIACLG/ce/ringtone_hs_spk/ringtone_hs_spk.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/ce/ringtone_hs_spk/ringtone_hs_spk.preset:system/etc/audio/tfa9887/SOPHIACLG/ce/ringtone_hs_spk/ringtone_hs_spk.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/ce/voip/voip.eq:system/etc/audio/tfa9887/SOPHIACLG/ce/voip/voip.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/ce/voip/voip.preset:system/etc/audio/tfa9887/SOPHIACLG/ce/voip/voip.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/normal/fm/fm.eq:system/etc/audio/tfa9887/SOPHIACLG/normal/fm/fm.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/normal/fm/fm.preset:system/etc/audio/tfa9887/SOPHIACLG/normal/fm/fm.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/normal/incall_nb/incall_nb.eq:system/etc/audio/tfa9887/SOPHIACLG/normal/incall_nb/incall_nb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/normal/incall_nb/incall_nb.preset:system/etc/audio/tfa9887/SOPHIACLG/normal/incall_nb/incall_nb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/normal/incall_wb/incall_wb.eq:system/etc/audio/tfa9887/SOPHIACLG/normal/incall_wb/incall_wb.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/normal/incall_wb/incall_wb.preset:system/etc/audio/tfa9887/SOPHIACLG/normal/incall_wb/incall_wb.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/normal/music/music.eq:system/etc/audio/tfa9887/SOPHIACLG/normal/music/music.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/normal/music/music.preset:system/etc/audio/tfa9887/SOPHIACLG/normal/music/music.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/normal/ringtone/ringtone.eq:system/etc/audio/tfa9887/SOPHIACLG/normal/ringtone/ringtone.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/normal/ringtone/ringtone.preset:system/etc/audio/tfa9887/SOPHIACLG/normal/ringtone/ringtone.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/normal/ringtone_hs_spk/ringtone_hs_spk.eq:system/etc/audio/tfa9887/SOPHIACLG/normal/ringtone_hs_spk/ringtone_hs_spk.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/normal/ringtone_hs_spk/ringtone_hs_spk.preset:system/etc/audio/tfa9887/SOPHIACLG/normal/ringtone_hs_spk/ringtone_hs_spk.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/normal/voip/voip.eq:system/etc/audio/tfa9887/SOPHIACLG/normal/voip/voip.eq \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/normal/voip/voip.preset:system/etc/audio/tfa9887/SOPHIACLG/normal/voip/voip.preset \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/dsp_coefficient.config:system/etc/audio/tfa9887/SOPHIACLG/dsp_coefficient.config \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/SOPHIACLG/speaker_model.speaker:system/etc/audio/tfa9887/SOPHIACLG/speaker_model.speaker \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/coldboot.patch:system/etc/audio/tfa9887/coldboot.patch \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/tfa9887_feature.config:system/etc/audio/tfa9887/tfa9887_feature.config \
    $(LOCAL_PATH)/prebuilt/etc/audio/tfa9887/tfa9887_firmware.patch:system/etc/audio/tfa9887/tfa9887_firmware.patch

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/default/cm_correction.dat:system/etc/camera/davinci/default/cm_correction.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/default/cm_foliage.dat:system/etc/camera/davinci/default/cm_foliage.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/default/cm_normal.dat:system/etc/camera/davinci/default/cm_normal.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/default/cm_sky.dat:system/etc/camera/davinci/default/cm_sky.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/default/cm_sunset.dat:system/etc/camera/davinci/default/cm_sunset.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/default/imgproc.xml:system/etc/camera/davinci/default/imgproc.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/hi542/cm_foliage.dat:system/etc/camera/davinci/hi542/cm_foliage.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/hi542/imgproc.xml:system/etc/camera/davinci/hi542/imgproc.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/ov5648_foxconn/imgproc.xml:system/etc/camera/davinci/ov5648_foxconn/imgproc.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/ov5648_sunny/imgproc.xml:system/etc/camera/davinci/ov5648_sunny/imgproc.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/ov8830/imgproc.xml:system/etc/camera/davinci/ov8830/imgproc.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/s5k4e1ga_foxconn/cm_foliage.dat:system/etc/camera/davinci/s5k4e1ga_foxconn/cm_foliage.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/s5k4e1ga_foxconn/imgproc.xml:system/etc/camera/davinci/s5k4e1ga_foxconn/imgproc.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/s5k4e1gx_foxconn/imgproc.xml:system/etc/camera/davinci/s5k4e1gx_foxconn/imgproc.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx134_liteon/cm_foliage.dat:system/etc/camera/davinci/sonyimx134_liteon/cm_foliage.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx134_liteon/cm_foliage_s.dat:system/etc/camera/davinci/sonyimx134_liteon/cm_foliage_s.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx134_liteon/cm_normal.dat:system/etc/camera/davinci/sonyimx134_liteon/cm_normal.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx134_liteon/cm_normal_s.dat:system/etc/camera/davinci/sonyimx134_liteon/cm_normal_s.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx134_liteon/cm_sky.dat:system/etc/camera/davinci/sonyimx134_liteon/cm_sky.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx134_liteon/cm_sky_s.dat:system/etc/camera/davinci/sonyimx134_liteon/cm_sky_s.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx134_liteon/cm_sunset.dat:system/etc/camera/davinci/sonyimx134_liteon/cm_sunset.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx134_liteon/imgproc.xml:system/etc/camera/davinci/sonyimx134_liteon/imgproc.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx134_liteon/multiframe.xml:system/etc/camera/davinci/sonyimx134_liteon/multiframe.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx135_liteon/cm_foliage.dat:system/etc/camera/davinci/sonyimx135_liteon/cm_foliage.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx135_liteon/cm_foliage_s.dat:system/etc/camera/davinci/sonyimx135_liteon/cm_foliage_s.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx135_liteon/cm_normal.dat:system/etc/camera/davinci/sonyimx135_liteon/cm_normal.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx135_liteon/cm_normal_s.dat:system/etc/camera/davinci/sonyimx135_liteon/cm_normal_s.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx135_liteon/cm_sky.dat:system/etc/camera/davinci/sonyimx135_liteon/cm_sky.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx135_liteon/cm_sky_s.dat:system/etc/camera/davinci/sonyimx135_liteon/cm_sky_s.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx135_liteon/cm_sunset.dat:system/etc/camera/davinci/sonyimx135_liteon/cm_sunset.dat \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx135_liteon/imgproc.xml:system/etc/camera/davinci/sonyimx135_liteon/imgproc.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx135_liteon/multiframe.xml:system/etc/camera/davinci/sonyimx135_liteon/multiframe.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx179_liteon/imgproc.xml:system/etc/camera/davinci/sonyimx179_liteon/imgproc.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx179_sunny/imgproc.xml:system/etc/camera/davinci/sonyimx179_sunny/imgproc.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx214_foxconn/imgproc.xml:system/etc/camera/davinci/sonyimx214_foxconn/imgproc.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx214_foxconn/multiframe.xml:system/etc/camera/davinci/sonyimx214_foxconn/multiframe.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx214_sunny/imgproc.xml:system/etc/camera/davinci/sonyimx214_sunny/imgproc.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/sonyimx214_sunny/multiframe.xml:system/etc/camera/davinci/sonyimx214_sunny/multiframe.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/davinci/device.config:system/etc/camera/davinci/device.config \
    $(LOCAL_PATH)/prebuilt/etc/camera/hwscope/hwscope.xml:system/etc/camera/hwscope/hwscope.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/meitu/chengguang.mtdata:system/etc/camera/meitu/chengguang.mtdata \
    $(LOCAL_PATH)/prebuilt/etc/camera/meitu/dianying.mtdata:system/etc/camera/meitu/dianying.mtdata \
    $(LOCAL_PATH)/prebuilt/etc/camera/meitu/kujiu1.mtdata:system/etc/camera/meitu/kujiu1.mtdata \
    $(LOCAL_PATH)/prebuilt/etc/camera/meitu/kujiu2.mtdata:system/etc/camera/meitu/kujiu2.mtdata \
    $(LOCAL_PATH)/prebuilt/etc/camera/meitu/kujiu3.mtdata:system/etc/camera/meitu/kujiu3.mtdata \
    $(LOCAL_PATH)/prebuilt/etc/camera/meitu/kujiu4.mtdata:system/etc/camera/meitu/kujiu4.mtdata \
    $(LOCAL_PATH)/prebuilt/etc/camera/meitu/kujiu5.mtdata:system/etc/camera/meitu/kujiu5.mtdata \
    $(LOCAL_PATH)/prebuilt/etc/camera/meitu/moran.mtdata:system/etc/camera/meitu/moran.mtdata \
    $(LOCAL_PATH)/prebuilt/etc/camera/meitu/overlayMap.mtdata:system/etc/camera/meitu/overlayMap.mtdata \
    $(LOCAL_PATH)/prebuilt/etc/camera/meitu/PSScreen.mtdata:system/etc/camera/meitu/PSScreen.mtdata \
    $(LOCAL_PATH)/prebuilt/etc/camera/meitu/qingse1.mtdata:system/etc/camera/meitu/qingse1.mtdata \
    $(LOCAL_PATH)/prebuilt/etc/camera/meitu/sucai3.mtdata:system/etc/camera/meitu/sucai3.mtdata \
    $(LOCAL_PATH)/prebuilt/etc/camera/meitu/sucai4.mtdata:system/etc/camera/meitu/sucai4.mtdata \
    $(LOCAL_PATH)/prebuilt/etc/camera/meitu/sucai5.mtdata:system/etc/camera/meitu/sucai5.mtdata \
    $(LOCAL_PATH)/prebuilt/etc/camera/meitu/sucai7.mtdata:system/etc/camera/meitu/sucai7.mtdata \
    $(LOCAL_PATH)/prebuilt/etc/camera/multidenoise/default/multiframe.xml:system/etc/camera/multidenoise/default/multiframe.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/multidenoise/sonyimx134_liteon/multiframe.xml:system/etc/camera/multidenoise/sonyimx134_liteon/multiframe.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/multidenoise/sonyimx134_sunny/multiframe.xml:system/etc/camera/multidenoise/sonyimx134_sunny/multiframe.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/multidenoise/sonyimx135_liteon/multiframe.xml:system/etc/camera/multidenoise/sonyimx135_liteon/multiframe.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/multidenoise/sonyimx214_foxconn/multiframe.xml:system/etc/camera/multidenoise/sonyimx214_foxconn/multiframe.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/multidenoise/sonyimx214_sunny/multiframe.xml:system/etc/camera/multidenoise/sonyimx214_sunny/multiframe.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/multidenoise/device.config:system/etc/camera/multidenoise/device.config \
    $(LOCAL_PATH)/prebuilt/etc/camera/multidenoise/multidenoise.xml:system/etc/camera/multidenoise/multidenoise.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/smartae/ov5648_foxconn/SmartAE.xml:system/etc/camera/smartae/ov5648_foxconn/SmartAE.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/smartae/ov5648_sunny/SmartAE.xml:system/etc/camera/smartae/ov5648_sunny/SmartAE.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/smartae/s5k4e1ga_foxconn/SmartAE.xml:system/etc/camera/smartae/s5k4e1ga_foxconn/SmartAE.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/smartae/s5k4e1gx_foxconn/SmartAE.xml:system/etc/camera/smartae/s5k4e1gx_foxconn/SmartAE.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/smartae/sonyimx134_liteon/SmartAE.xml:system/etc/camera/smartae/sonyimx134_liteon/SmartAE.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/smartae/sonyimx134_sunny/SmartAE.xml:system/etc/camera/smartae/sonyimx134_sunny/SmartAE.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/smartae/sonyimx135_liteon/SmartAE.xml:system/etc/camera/smartae/sonyimx135_liteon/SmartAE.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/smartae/sonyimx179_liteon/SmartAE.xml:system/etc/camera/smartae/sonyimx179_liteon/SmartAE.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/smartae/sonyimx179_sunny/SmartAE.xml:system/etc/camera/smartae/sonyimx179_sunny/SmartAE.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/smartae/sonyimx214_foxconn/SmartAE.xml:system/etc/camera/smartae/sonyimx214_foxconn/SmartAE.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/smartae/sonyimx214_sunny/SmartAE.xml:system/etc/camera/smartae/sonyimx214_sunny/SmartAE.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/smartae/device.config:system/etc/camera/smartae/device.config \
    $(LOCAL_PATH)/prebuilt/etc/camera/soft3aconfig/ov5648_foxconn/soft3Aconfig.xml:system/etc/camera/soft3aconfig/ov5648_foxconn/soft3Aconfig.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/soft3aconfig/ov5648_sunny/soft3Aconfig.xml:system/etc/camera/soft3aconfig/ov5648_sunny/soft3Aconfig.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/soft3aconfig/s5k4e1ga_foxconn/soft3Aconfig.xml:system/etc/camera/smartae/s5k4e1ga_foxconn/soft3Aconfig.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/soft3aconfig/s5k4e1gx_foxconn/soft3Aconfig.xml:system/etc/camera/soft3aconfig/s5k4e1gx_foxconn/soft3Aconfig.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/soft3aconfig/sonyimx134_liteon/soft3Aconfig.xml:system/etc/camera/soft3aconfig/sonyimx134_liteon/soft3Aconfig.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/soft3aconfig/sonyimx134_sunny/soft3Aconfig.xml:system/etc/camera/soft3aconfig/sonyimx134_sunny/soft3Aconfig.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/soft3aconfig/sonyimx135_liteon/soft3Aconfig.xml:system/etc/camera/soft3aconfig/sonyimx135_liteon/soft3Aconfig.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/soft3aconfig/sonyimx179_liteon/soft3Aconfig.xml:system/etc/camera/soft3aconfig/sonyimx179_liteon/soft3Aconfig.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/soft3aconfig/sonyimx179_sunny/soft3Aconfig.xml:system/etc/camera/soft3aconfig/sonyimx179_sunny/soft3Aconfig.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/soft3aconfig/sonyimx214_foxconn/soft3Aconfig.xml:system/etc/camera/soft3aconfig/sonyimx214_foxconn/soft3Aconfig.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/soft3aconfig/sonyimx214_sunny/soft3Aconfig.xml:system/etc/camera/soft3aconfig/sonyimx214_sunny/soft3Aconfig.xml \
    $(LOCAL_PATH)/prebuilt/etc/camera/soft3aconfig/device.config:system/etc/camera/soft3aconfig/device.config \
    $(LOCAL_PATH)/prebuilt/etc/camera/tornado/sonyimx134_liteon/TornadoI.ini:system/etc/camera/tornado/sonyimx134_liteon/TornadoI.ini \
    $(LOCAL_PATH)/prebuilt/etc/camera/tornado/sonyimx134_sunny/TornadoI.ini:system/etc/camera/tornado/sonyimx134_sunny/TornadoI.ini \
    $(LOCAL_PATH)/prebuilt/etc/camera/tornado/sonyimx135_liteon/TornadoI.ini:system/etc/camera/tornado/sonyimx135_liteon/TornadoI.ini \
    $(LOCAL_PATH)/prebuilt/etc/camera/tornado/sonyimx214_foxconn/TornadoI.ini:system/etc/camera/tornado/sonyimx214_foxconn/TornadoI.ini \
    $(LOCAL_PATH)/prebuilt/etc/camera/tornado/sonyimx214_sunny/TornadoI.ini:system/etc/camera/tornado/sonyimx214_sunny/TornadoI.ini \
    $(LOCAL_PATH)/prebuilt/etc/camera/tornado/FoliageMinMaxTOA.txt:system/etc/camera/tornado/FoliageMinMaxTOA.txt \
    $(LOCAL_PATH)/prebuilt/etc/camera/tornado/FoliageModelTOA.model:system/etc/camera/tornado/FoliageModelTOA.model \
    $(LOCAL_PATH)/prebuilt/etc/camera/tornado/NightMinMaxTOA.txt:system/etc/camera/tornado/NightMinMaxTOA.txt \
    $(LOCAL_PATH)/prebuilt/etc/camera/tornado/NightModelTOA.model:system/etc/camera/tornado/NightModelTOA.model \
    $(LOCAL_PATH)/prebuilt/etc/camera/tornado/SunsetMinMaxTOA.txt:system/etc/camera/tornado/SunsetMinMaxTOA.txt \
    $(LOCAL_PATH)/prebuilt/etc/camera/tornado/SunsetModelTOA.model:system/etc/camera/tornado/SunsetModelTOA.model \
    $(LOCAL_PATH)/prebuilt/etc/camera/tornado/TornadoI.ini:system/etc/camera/tornado/TornadoI.ini \
    $(LOCAL_PATH)/prebuilt/etc/camera/tracking/targettracking.xml:system/etc/camera/tracking/targettracking.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/flashless/boot.rom:system/etc/flashless/boot.rom \
    $(LOCAL_PATH)/prebuilt/etc/flashless/cp.rom:system/etc/flashless/cp.rom \
    $(LOCAL_PATH)/prebuilt/etc/flashless/fsm_df.img:system/etc/flashless/fsm_df.img

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/init.d/preparesd:/system/etc/init.d/preparesd

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/modemConfig/balong/basic_name:/system/etc/modemConfig/balong/basic_name \
    $(LOCAL_PATH)/prebuilt/etc/modemConfig/balong/SystemCmd_audio.cmf:/system/etc/modemConfig/balong/SystemCmd_audio.cmf \
    $(LOCAL_PATH)/prebuilt/etc/modemConfig/balongLTE/basic_name:/system/etc/modemConfig/balongLTE/basic_name \
    $(LOCAL_PATH)/prebuilt/etc/modemConfig/balongLTE/lte_ue_msg_ftta.cfg:/system/etc/modemConfig/balongLTE/lte_ue_msg_ftta.cfg \
    $(LOCAL_PATH)/prebuilt/etc/modemConfig/via/basic_name:/system/etc/modemConfig/via/basic_name \
    $(LOCAL_PATH)/prebuilt/etc/modemConfig/via/viacbp82d_log_audio.bcfg:/system/etc/modemConfig/via/viacbp82d_log_audio.bcfg \
    $(LOCAL_PATH)/prebuilt/etc/modemConfig/lte_ue_msg.cfg:/system/etc/modemConfig/lte_ue_msg.cfg \
    $(LOCAL_PATH)/prebuilt/etc/modemConfig/SystemCmd.cmf:/system/etc/modemConfig/SystemCmd.cmf \
    $(LOCAL_PATH)/prebuilt/etc/modemConfig/viacbp82d_log.bcfg:/system/etc/modemConfig/viacbp82d_log.bcfg

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/param/route.xml:/system/etc/param/route.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/ppp/ip-up-cdma:/system/etc/ppp/ip-up-cdma \
    $(LOCAL_PATH)/prebuilt/etc/ppp/ipv6-up-cdma:/system/etc/ppp/ipv6-up-cdma \
    $(LOCAL_PATH)/prebuilt/etc/ppp/link-down-cdma:/system/etc/ppp/link-down-cdma

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/srs/models.txt:/system/etc/srs/models.txt \
    $(LOCAL_PATH)/prebuilt/etc/srs/srsmodels.lic:/system/etc/srs/srsmodels.lic \
    $(LOCAL_PATH)/prebuilt/etc/srs/srs_processing.cfg:/system/etc/srs/srs_processing.cfg

# This device have enough room for precise davick
PRODUCT_TAGS += dalvik.gc.type-precise

# Device uses ultra-high-density artwork where available
PRODUCT_LOCALES := en_US
PRODUCT_AAPT_CONFIG := hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Prime spacific overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.manufacturer=HUAWEI \
    ro.product.model=P7-L10

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libemoji \
    sf2 \
    stream \
    record \
    recordvideo \
    libaudioutils \
    libaudio-resampler \
    codec

PRODUCT_PACKAGES += \
    wpa_supplicant.conf \
    hostapd.conf

# Misc
PRODUCT_PACKAGES += \
    setup_fs \
    librs_jni \
    libsrec_jni \
    com.android.future.usb.accessory \
    make_ext4fs 

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers

PRODUCT_PACKAGES += \
    Torch \
    SOP

# Bluetooth
PRODUCT_PACKAGES += \
    bt_sco_app \
    BluetoothSCOApp \
    libtinyalsa

PRODUCT_PACKAGES += \
    bt_vendor.conf \
    libbt-vendor \
    lib-imsvt

# NFC
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_ndef \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-meta=true \
    media.stagefright.enable-scan=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-rtsp=true \
    media.stagefright.enable-record=true \
    net.rmnet0.dns1=8.8.8.8 \
    net.rmnet0.dns2=8.8.4.4 \
    net.dns1=8.8.8.8 \
    net.dns2=8.8.4.4

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=1 \
    ro.opengles.version=131072 \
    ro.bq.gpu_to_cpu_unsupported=1 \
    debug.hwui.render_dirty_regions=false

PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1 \
    ro.config.hw_flashless=true \
    ro.config.modem_hsic=true \
    ro.config.hisi_soc_type=true \
    ro.config.hisi_rpt_mode=0 \
    balong.debug.on=true \
    ro.config.fm_type=libbcmfm_if \
    ro.bt.bdaddr_path=/data/misc/bluedroid/macbt \
    ro.thmodem.type=sprd \
    ril.gsm.deviceid=-1 \
    ril.cdma.deviceid=-1 \
    ril.gsm.rssi=-1 \
    ril.cdma.rssi=-1 \
    ril.hw_modem0.rssi=-1 \
    ril.hw_modem1.rssi=-1 \
    persist.demo.hdmirotation=portrait \
    persist.demo.hdmirotationlock=false \
    debug.atrace.tags.enableflags=0 \
    ro.config.hw_dts=true \
    ro.config.hw_music_lp=true \
    ro.config.helix_enable=true \
    af.resampler.quality=3 \
    af.resampler.quality=4 \
    persist.sys.hdcp_checking=never \
    ro.config.balong_test=false \
    ro.hw_se13list_version=20130826 \
    bpersist.sys.thermalm=default \
    ro.config.hw_acceleratord_onoff=1 \
    ro.config.hw_sglte.mcc=460 \
    ro.config.hw_sglte_simblist=46001 \
    ro.config.huawei_lowwindow=394,194,706,888 \
    persist.service.tm2.tofile=true \
    ro.config.dlvs=true \
    ro.config.hw.VIS=true \
    ro.config.hw_omacp=1 \
    ro.config.hwscope=true \
    ro.pwrtmg.aegis.state=20 \
    ro.networkstatus.delaytimer=6 \
    ro.config.spare_ntp_server=pool.ntp.org

PRODUCT_PROPERTY_OVERRIDES += ro.config.low_ram=false    

$(call inherit-product, build/target/product/full.mk)

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4334/device-bcm.mk)

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

PRODUCT_PROPERTY_OVERRIDES += service.inputaccel.config=2,5,0,0,4,160
# Properties for OpenGLRenderer
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_flushrate=0.4  \
    ro.hwui.text_large_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048  \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_small_cache_width=1024
