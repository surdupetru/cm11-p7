# Copyright (C) 2013 The CyanogenMod Project
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

PATH_FILES := vendor/huawei/hwp7/proprietary

PRODUCT_COPY_FILES += \
    $(PATH_FILES)/app/AudioAlgoService.apk:system/app/AudioAlgoService.apk

PRODUCT_COPY_FILES += \
    $(PATH_FILES)/bin/afar:system/bin/afar \
    $(PATH_FILES)/bin/akmd8963:system/bin/akmd8963 \
    $(PATH_FILES)/bin/akmd09911:system/bin/akmd09911 \
    $(PATH_FILES)/bin/conntrack:system/bin/conntrack \
    $(PATH_FILES)/bin/device_monitor:system/bin/device_monitor \
    $(PATH_FILES)/bin/diagserver:system/bin/diagserver \
    $(PATH_FILES)/bin/flashlessd:system/bin/flashlessd \
    $(PATH_FILES)/bin/glgpscl:system/bin/glgpscl \
    $(PATH_FILES)/bin/gpsdeamon:system/bin/gpsdeamon \
    $(PATH_FILES)/bin/gpslogd:system/bin/gpslogd \
    $(PATH_FILES)/bin/hdmi_daemon:system/bin/hdmi_daemon \
    $(PATH_FILES)/bin/hwnff:system/bin/hwnff \
    $(PATH_FILES)/bin/hwnffserver:system/bin/hwnffserver \
    $(PATH_FILES)/bin/hwpged:system/bin/hwpged \
    $(PATH_FILES)/bin/imc_poweron:system/bin/imc_poweron \
    $(PATH_FILES)/bin/mac_addr_normalization:system/bin/mac_addr_normalization \
    $(PATH_FILES)/bin/mediaserver:system/bin/mediaserver \
    $(PATH_FILES)/bin/modemlogcat_balong:system/bin/modemlogcat_balong \
    $(PATH_FILES)/bin/modemlogcat_lte:system/bin/modemlogcat_lte \
    $(PATH_FILES)/bin/modemlogcat_via:system/bin/modemlogcat_via \
    $(PATH_FILES)/bin/mw3:system/bin/mw3 \
    $(PATH_FILES)/bin/nvm_server:system/bin/nvm_server \
    $(PATH_FILES)/bin/pcscd:system/bin/pcscd \
    $(PATH_FILES)/bin/pppd_via:system/bin/pppd_via \
    $(PATH_FILES)/bin/pppoe:system/bin/pppoe \
    $(PATH_FILES)/bin/rild:system/bin/rild \
    $(PATH_FILES)/bin/servicemanager:system/bin/servicemanager \
    $(PATH_FILES)/bin/statusd:system/bin/statusd \
    $(PATH_FILES)/bin/surfaceflinger:system/bin/surfaceflinger \
    $(PATH_FILES)/bin/thermalm:system/bin/thermalm \
    $(PATH_FILES)/bin/wl:system/bin/wl

PRODUCT_COPY_FILES += \
    $(PATH_FILES)/etc/permissions/com.huawei.audioalgo.xml:system/etc/permissions/com.huawei.audioalgo.xml

PRODUCT_COPY_FILES += \
    $(PATH_FILES)/framework/com.huawei.audioalgo.jar:system/framework/com.huawei.audioalgo.jar

PRODUCT_COPY_FILES += \
    $(PATH_FILES)/lib/drm/libdrmhwomavoneplugin.so:system/lib/drm/libdrmhwomavoneplugin.so

PRODUCT_COPY_FILES += \
    $(PATH_FILES)/lib/egl/libEGL_mali.so:system/lib/egl/libEGL_mali.so \
    $(PATH_FILES)/lib/egl/libGLESv1_CM_mali.so:system/lib/egl/libGLESv1_CM_mali.so \
    $(PATH_FILES)/lib/egl/libGLESv2_mali.so:system/lib/egl/libGLESv2_mali.so

PRODUCT_COPY_FILES += \
    $(PATH_FILES)/lib/hw/audio.primary.hi6620oem.so:system/lib/hw/audio.primary.hwp7.so \
    $(PATH_FILES)/lib/hw/audio_policy.default.so:system/lib/hw/audio_policy.hwp7.so \
    $(PATH_FILES)/lib/hw/camera.hi6620oem.so:system/lib/hw/camera.hi6620oem.so \
    $(PATH_FILES)/lib/hw/copybit.hi6620oem.so:system/lib/hw/copybit.hi6620oem.so \
    $(PATH_FILES)/lib/hw/gps.default.so:system/lib/hw/gps.hwp7.so \
    $(PATH_FILES)/lib/hw/gpscl.default.so:system/lib/hw/gpscl.hwp7.so \
    $(PATH_FILES)/lib/hw/gralloc.hi6620oem.so:system/lib/hw/gralloc.hi6620oem.so \
    $(PATH_FILES)/lib/hw/hwcomposer.hi6620oem.so:system/lib/hw/hwcomposer.hi6620oem.so \
    $(PATH_FILES)/lib/hw/libbcmfm_if.so:system/lib/hw/libbcmfm_if.so \
    $(PATH_FILES)/lib/hw/lights.default.so:system/lib/hw/lights.hwp7.so \
    $(PATH_FILES)/lib/hw/memtrack.hi6620oem.so:system/lib/hw/memtrack.hi6620oem.so \
    $(PATH_FILES)/lib/hw/nfc_nci_pn547.hi6620oem.so:system/lib/hw/nfc_nci_pn547.hi6620oem.so \
    $(PATH_FILES)/lib/hw/sensors.hi6620oem.so:system/lib/hw/sensors.hi6620oem.so

PRODUCT_COPY_FILES += \
    $(PATH_FILES)/lib/soundfx/libhuaweiaudiopreprocessing.so:system/lib/soundfx/libhuaweiaudiopreprocessing.so

PRODUCT_COPY_FILES += \
    $(PATH_FILES)/lib/lib_8290.so:system/lib/lib_8290.so \
    $(PATH_FILES)/lib/libaes.so:system/lib/libaes.so \
    $(PATH_FILES)/lib/libams-1.1.0-legacy.so:system/lib/libams-1.1.0-legacy.so \
    $(PATH_FILES)/lib/libassd.so:system/lib/libassd.so \
    $(PATH_FILES)/lib/libaudioalgoservice_jni.so:system/lib/libaudioalgoservice_jni.so \
    $(PATH_FILES)/lib/libaudioflinger.so:system/lib/libaudioflinger.so \
    $(PATH_FILES)/lib/libaudioom.so:system/lib/libaudioom.so \
    $(PATH_FILES)/lib/libbalong_audio_ril.so:system/lib/libbalong_audio_ril.so \
    $(PATH_FILES)/lib/libbalong-ril.so:system/lib/libbalong-ril.so \
    $(PATH_FILES)/lib/libbcm_gps_pdttest.so:system/lib/libbcm_gps_pdttest.so \
    $(PATH_FILES)/lib/libBestShot.so:system/lib/libBestShot.so \
    $(PATH_FILES)/lib/libbinder.so:system/lib/libbinder.so \
    $(PATH_FILES)/lib/libboard_param.so:system/lib/libboard_param.so \
    $(PATH_FILES)/lib/libcamera_client.so:system/lib/libcamera_client.so \
    $(PATH_FILES)/lib/libcamera_core.so:system/lib/libcamera_core.so \
    $(PATH_FILES)/lib/libcamera_omron.so:system/lib/libcamera_omron.so \
    $(PATH_FILES)/lib/libcameraservice.so:system/lib/libcameraservice.so \
    $(PATH_FILES)/lib/libcgroup.so:system/lib/libcgroup.so \
    $(PATH_FILES)/lib/libcryptor-1.0.0-legacy.so:system/lib/libcryptor-1.0.0-legacy.so \
    $(PATH_FILES)/lib/libcryptotsc.so:system/lib/libcryptotsc.so \
    $(PATH_FILES)/lib/libcyclone.so:system/lib/libcyclone.so \
    $(PATH_FILES)/lib/libdenoise.so:system/lib/libdenoise.so \
    $(PATH_FILES)/lib/libdrmdecrypt.so:system/lib/libdrmdecrypt.so \
    $(PATH_FILES)/lib/libfile_access_control.so:system/lib/libfile_access_control.so \
    $(PATH_FILES)/lib/libfilterframework_jni.so:system/lib/libfilterframework_jni.so \
    $(PATH_FILES)/lib/libfilterpack_facedetect.so:system/lib/libfilterpack_facedetect.so \
    $(PATH_FILES)/lib/libfilterpack_imageproc.so:system/lib/libfilterpack_imageproc.so \
    $(PATH_FILES)/lib/libfm_hal.so:system/lib/libfm_hal.so \
    $(PATH_FILES)/lib/libfm_volume.so:system/lib/libfm_volume.so \
    $(PATH_FILES)/lib/libframesequence.so:system/lib/libframesequence.so \
    $(PATH_FILES)/lib/lib_g1.so:system/lib/lib_g1.so \
    $(PATH_FILES)/lib/libGAL.so:system/lib/libGAL.so \
    $(PATH_FILES)/lib/libgifcodec.so:system/lib/libgifcodec.so \
    $(PATH_FILES)/lib/libgnuexif.so:system/lib/libgnuexif.so \
    $(PATH_FILES)/lib/libgnustl_shared.so:system/lib/libgnustl_shared.so \
    $(PATH_FILES)/lib/libgui.so:system/lib/libgui.so \
    $(PATH_FILES)/lib/libhdr.so:system/lib/libhdr.so \
    $(PATH_FILES)/lib/libhelixplayer.so:system/lib/libhelixplayer.so \
    $(PATH_FILES)/lib/libhiril.so:system/lib/libhiril.so \
    $(PATH_FILES)/lib/libhisi_efuse.so:system/lib/libhisi_efuse.so \
    $(PATH_FILES)/lib/libhisi_memset.so:system/lib/libhisi_memset.so \
    $(PATH_FILES)/lib/libhwffmpeg_neon.so:system/lib/libhwffmpeg_neon.so \
    $(PATH_FILES)/lib/libhwphyseng.so:system/lib/libhwphyseng.so \
    $(PATH_FILES)/lib/libhwplayergl.so:system/lib/libhwplayergl.so \
    $(PATH_FILES)/lib/libhwplayergl.so:system/lib/libhw_sys.so \
    $(PATH_FILES)/lib/libI420colorconvert.so:system/lib/libI420colorconvert.so \
    $(PATH_FILES)/lib/libimageinfo.so:system/lib/libimageinfo.so \
    $(PATH_FILES)/lib/libimeiaccess_jni.so:system/lib/libimeiaccess_jni.so \
    $(PATH_FILES)/lib/libisdb_omxcore.so:system/lib/libisdb_omxcore.so \
    $(PATH_FILES)/lib/libIvw30.so:system/lib/libIvw30.so \
    $(PATH_FILES)/lib/libixml.so:system/lib/libixml.so \
    $(PATH_FILES)/lib/libjni_hw_mosaic.so:system/lib/libjni_hw_mosaic.so \
    $(PATH_FILES)/lib/libjni_omron_facebeautifier.so:system/lib/libjni_omron_facebeautifier.so \
    $(PATH_FILES)/lib/libjni_personrecognition.so:system/lib/libjni_personrecognition.so \
    $(PATH_FILES)/lib/libjpegdechw.so:system/lib/libjpegdechw.so \
    $(PATH_FILES)/lib/libk3jpeg.so:system/lib/libk3jpeg.so \
    $(PATH_FILES)/lib/lib_k3_ffmpeg.so:system/lib/lib_k3_ffmpeg.so \
    $(PATH_FILES)/lib/lib_k3_omx_avc.so:system/lib/lib_k3_omx_avc.so \
    $(PATH_FILES)/lib/lib_k3_omx_avcenc.so:system/lib/lib_k3_omx_avcenc.so \
    $(PATH_FILES)/lib/lib_k3_omxcore.so:system/lib/lib_k3_omxcore.so \
    $(PATH_FILES)/lib/lib_k3_omx_mpeg2.so:system/lib/lib_k3_omx_mpeg2.so \
    $(PATH_FILES)/lib/lib_k3_omx_mpeg4.so:system/lib/lib_k3_omx_mpeg4.so \
    $(PATH_FILES)/lib/lib_k3_omx_rv.so:system/lib/lib_k3_omx_rv.so \
    $(PATH_FILES)/lib/lib_k3_omx_vc1.so:system/lib/lib_k3_omx_vc1.so \
    $(PATH_FILES)/lib/lib_k3_omx_vp8.so:system/lib/lib_k3_omx_vp8.so \
    $(PATH_FILES)/lib/libm2ts_player.so:system/lib/libm2ts_player.so \
    $(PATH_FILES)/lib/libMali.so:system/lib/libMali.so \
    $(PATH_FILES)/lib/libMirrorAudioService.so:system/lib/libMirrorAudioService.so \
    $(PATH_FILES)/lib/libmirror_media.so:system/lib/libmirror_media.so \
    $(PATH_FILES)/lib/libmirror_media_platform.so:system/lib/libmirror_media_platform.so \
    $(PATH_FILES)/lib/libmorpho_memory_allocator.so:system/lib/libmorpho_memory_allocator.so \
    $(PATH_FILES)/lib/libmorpho_panorama_gp.so:system/lib/libmorpho_panorama_gp.so \
    $(PATH_FILES)/lib/libmrc_cg_mfdenoise.so:system/lib/libmrc_cg_mfdenoise.so \
    $(PATH_FILES)/lib/libmrc_cg_postprocess.so:system/lib/libmrc_cg_postprocess.so \
    $(PATH_FILES)/lib/libMRSDK.so:system/lib/libMRSDK.so \
    $(PATH_FILES)/lib/libmtfilters.so:system/lib/libmtfilters.so \
    $(PATH_FILES)/lib/libmtfiltersdk.so:system/lib/libmtfiltersdk.so \
    $(PATH_FILES)/lib/libMusicHunterClient.so:system/lib/libMusicHunterClient.so \
    $(PATH_FILES)/lib/libNativeLibraryWrapper.so:system/lib/libNativeLibraryWrapper.so \
    $(PATH_FILES)/lib/libnfc-nci.so:system/lib/libnfc-nci.so \
    $(PATH_FILES)/lib/libnfc_nci_jni.so:system/lib/libnfc_nci_jni.so \
    $(PATH_FILES)/lib/libnfc_ndef.so:system/lib/libnfc_ndef.so \
    $(PATH_FILES)/lib/libnmsp_speex.so:system/lib/libnmsp_speex.so \
    $(PATH_FILES)/lib/libnvme.so:system/lib/libnvme.so \
    $(PATH_FILES)/lib/libnv_public_interface.so:system/lib/libnv_public_interface.so \
    $(PATH_FILES)/lib/libocrclient.so:system/lib/libocrclient.so \
    $(PATH_FILES)/lib/liboeminfo.so:system/lib/liboeminfo.so \
    $(PATH_FILES)/lib/liboverlay.so:system/lib/liboverlay.so \
    $(PATH_FILES)/lib/libpcsclite.so:system/lib/libpcsclite.so \
    $(PATH_FILES)/lib/libPersonRec.so:system/lib/libPersonRec.so \
    $(PATH_FILES)/lib/libphotoeditor_native.so:system/lib/libphotoeditor_native.so \
    $(PATH_FILES)/lib/libprojectmenu.so:system/lib/libprojectmenu.so \
    $(PATH_FILES)/lib/libqcom-ril.so:system/lib/libqcom-ril.so \
    $(PATH_FILES)/lib/libregionalphonejni.so:system/lib/libregionalphonejni.so \
    $(PATH_FILES)/lib/libril.so:system/lib/libril.so \
    $(PATH_FILES)/lib/librilutils.so:system/lib/librilutils.so \
    $(PATH_FILES)/lib/libSmartAE.so:system/lib/libSmartAE.so \
    $(PATH_FILES)/lib/libsrsprocessing.so:system/lib/libsrsprocessing.so \
    $(PATH_FILES)/lib/libssltsc.so:system/lib/libssltsc.so \
    $(PATH_FILES)/lib/libstagefrighthw.so:system/lib/libstagefrighthw.so \
    $(PATH_FILES)/lib/libsurfaceflinger.so:system/lib/libsurfaceflinger.so \
    $(PATH_FILES)/lib/libsurfaceflinger_client.so:system/lib/libsurfaceflinger_client.so \
    $(PATH_FILES)/lib/libtfa9887.so:system/lib/libtfa9887.so \
    $(PATH_FILES)/lib/libtrack.so:system/lib/libtrack.so \
    $(PATH_FILES)/lib/libui.so:system/lib/libui.so \
    $(PATH_FILES)/lib/libut.so:system/lib/libut.so \
    $(PATH_FILES)/lib/libutils.so:system/lib/libutils.so \
    $(PATH_FILES)/lib/libviagpsrpc.so:system/lib/libviagpsrpc.so \
    $(PATH_FILES)/lib/libvia-ril.so:system/lib/libvia-ril.so \
    $(PATH_FILES)/lib/libviatelutils.so:system/lib/libviatelutils.so \
    $(PATH_FILES)/lib/libvpp.so:system/lib/libvpp.so

PRODUCT_COPY_FILES += \
    $(PATH_FILES)/vendor/etc/audio_effects.conf:system/vendor/etc/audio_effects.conf

PRODUCT_COPY_FILES += \
    $(PATH_FILES)/vendor/lib/drm/libdrmwvmplugin.so:system/lib/drm/libdrmwvmplugin.so

PRODUCT_COPY_FILES += \
    $(PATH_FILES)/vendor/lib/mediadrm/libwvdrmengine.so:system/lib/mediadrm/libwvdrmengine.so

PRODUCT_COPY_FILES += \
    $(PATH_FILES)/vendor/lib/libwvdrm_L3.so:system/vendor/lib/libwvdrm_L3.so \
    $(PATH_FILES)/vendor/lib/libwvm.so:system/vendor/lib/libwvm.so \
    $(PATH_FILES)/vendor/lib/libWVStreamControlAPI_L3.so:system/vendor/lib/libWVStreamControlAPI_L3.so

PRODUCT_COPY_FILES += \
    $(PATH_FILES)/vendor/firmware/BCM4334B0_002.001.013.1164.1457_RC.hcd:system/vendor/firmware/BCM4334B0_002.001.013.1164.1457_RC.hcd \
    $(PATH_FILES)/vendor/firmware/fw_bcm4334_apsta_hw.bin:system/vendor/firmware/fw_bcm4334_apsta_hw.bin \
    $(PATH_FILES)/vendor/firmware/fw_bcm4334_apsta_hw.bin_lte:system/vendor/firmware/fw_bcm4334_apsta_hw.bin_lte \
    $(PATH_FILES)/vendor/firmware/fw_bcm4334_hw.bin:system/vendor/firmware/fw_bcm4334_hw.bin \
    $(PATH_FILES)/vendor/firmware/fw_bcm4334_hw.bin_lte:system/vendor/firmware/fw_bcm4334_hw.bin_lte \
    $(PATH_FILES)/vendor/firmware/fw_bcm4334_test_hw_apsta.bin:system/vendor/firmware/fw_bcm4334_test_hw_apsta.bin \
    $(PATH_FILES)/vendor/firmware/fw_bcm4334_test_hw_apsta.bin_lte:system/vendor/firmware/fw_bcm4334_test_hw_apsta.bin_lte \
    $(PATH_FILES)/vendor/firmware/libpn547_fw.so:system/vendor/firmware/libpn547_fw.so \
    $(PATH_FILES)/vendor/firmware/nvram4334_hw.txt:system/vendor/firmware/nvram4334_hw.txt \
    $(PATH_FILES)/vendor/firmware/nvram_EDGE_PLUS_UG.txt:system/vendor/firmware/nvram_EDGE_PLUS_UG.txt \
    $(PATH_FILES)/vendor/firmware/nvram_EDGE_PLUS_UL.txt:system/vendor/firmware/nvram_EDGE_PLUS_UL.txt \
    $(PATH_FILES)/vendor/firmware/nvram_EDGE_PLUS_UL_EMO.txt:system/vendor/firmware/nvram_EDGE_PLUS_UL_EMO.txt \
    $(PATH_FILES)/vendor/firmware/nvram_OSCAR_3G.txt:system/vendor/firmware/nvram_OSCAR_3G.txt \
    $(PATH_FILES)/vendor/firmware/nvram_OSCAR_4G.txt:system/vendor/firmware/nvram_OSCAR_4G.txt \
    $(PATH_FILES)/vendor/firmware/nvram_OSCAR_CG.txt:system/vendor/firmware/nvram_OSCAR_CG.txt \
    $(PATH_FILES)/vendor/firmware/nvram_OSCAR_TG.txt:system/vendor/firmware/nvram_OSCAR_TG.txt \
    $(PATH_FILES)/vendor/firmware/nvram_OSCAR_TL.txt:system/vendor/firmware/nvram_OSCAR_TL.txt \
    $(PATH_FILES)/vendor/firmware/nvram_OSCAR_UG.txt:system/vendor/firmware/nvram_OSCAR_UG.txt \
    $(PATH_FILES)/vendor/firmware/nvram_OSCAR_UL.txt:system/vendor/firmware/nvram_OSCAR_UL.txt \
    $(PATH_FILES)/vendor/firmware/nvram_SOPHIA_CLG.txt:system/vendor/firmware/nvram_SOPHIA_CLG.txt \
    $(PATH_FILES)/vendor/firmware/nvram_SOPHIA_TL.txt:system/vendor/firmware/nvram_SOPHIA_TL.txt \
    $(PATH_FILES)/vendor/firmware/nvram_SOPHIA_UL.txt:system/vendor/firmware/nvram_SOPHIA_UL.txt \
    $(PATH_FILES)/vendor/firmware/nvram_SOPHIA_ULG.txt:system/vendor/firmware/nvram_SOPHIA_ULG.txt

PRODUCT_COPY_FILES += \
    $(PATH_FILES)/xbin/acceleratord:system/xbin/acceleratord

PRODUCT_COPY_FILES += \
    $(PATH_FILES)/isp.bin:system/isp.bin \
    $(PATH_FILES)/ons.bin:system/ons.bin
