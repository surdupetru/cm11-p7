#!/system/bin/sh
PATH_SDCARD=/sdcard
PATH_MNT_SDCARD=/mnt/sdcard
PATH_SOURCE_SD=/storage/emulated/0

if [ 1 -eq $(getprop persist.sys.primarysd) ];then
    PATH_SOURCE_SD=/storage/sdcard1
fi

mount -o remount /

rm ${PATH_SDCARD}
ln -s ${PATH_SOURCE_SD} ${PATH_SDCARD}

rm ${PATH_MNT_SDCARD}
ln -s ${PATH_SOURCE_SD} ${PATH_MNT_SDCARD}
mount -o remount -r /
