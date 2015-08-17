# Android fstab file.
# The filesystem that contains the filesystem checker binary (typically /system) cannot
# specify MF_CHECK, and must come before any filesystems that do specify MF_CHECK

#TODO: Add 'check' as fs_mgr_flags with data partition.
# Currently we dont have e2fsck compiled. So fs check would failed.

#<src>                                     <mnt_point>     <type>  <mnt_flags and options>                                             <fs_mgr_flags>
/dev/block/bootdevice/by-name/system       /system         ext4    ro,barrier=1,noatime                                                wait,check
/dev/block/bootdevice/by-name/userdata     /data           ext4    nosuid,nodev,barrier=1,noatime,noauto_da_alloc,errors=continue      wait,check,encryptable=/dev/block/bootdevice/by-name/encrypt
/dev/block/bootdevice/by-name/cache        /cache          ext4    nosuid,nodev,barrier=1,noatime,noauto_da_alloc,errors=continue      wait,check
/dev/block/bootdevice/by-name/persist      /persist        ext4    nosuid,nodev,barrier=1,data=ordered,nodelalloc,errors=panic         wait
/dev/block/bootdevice/by-name/persistent   /persistent     emmc    defaults                                                            defaults
/dev/block/bootdevice/by-name/boot         /boot           emmc    defaults                                                            recoveryonly
/dev/block/bootdevice/by-name/recovery     /recovery       emmc    defaults                                                            recoveryonly
/dev/block/bootdevice/by-name/modem        /firmware       vfat    ro,shortname=lower,uid=1000,gid=1000,dmask=227,fmask=337,context=u:object_r:firmware_file:s0        wait

/dev/block/bootdevice/by-name/sns          /sns            ext4    nosuid,nodev,barrier=1,noatime,noauto_da_alloc,errors=continue      wait
/dev/block/bootdevice/by-name/drm          /persist-lg     ext4    nosuid,nodev,barrier=1,noatime,noauto_da_alloc,errors=continue      wait
/dev/block/bootdevice/by-name/mpt          /mpt            ext4    nosuid,nodev,barrier=1,noatime,noauto_da_alloc,errors=continue      wait

/devices/msm_sdcc.2/mmc_host                        auto            vfat    defaults voldmanaged=sdcard1:auto
/devices/platform/xhci-hcd                          auto            vfat    defaults voldmanaged=usbdisk0:auto
