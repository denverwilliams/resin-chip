IMAGE_FSTYPES_append_chip = " multiubivol"

RESIN_BOOT_PARTITION_FILES_chip = " \
    ../../../../../../../../../../../../../../../../../../../${TOPDIR}/../config.json:/config.json \
    "
export UBI_VOLNAME = "resin-ubi"

UBIMULTIVOL_BUILD = "rootfs data conf boot"

UBINIZE_ARGS = "-m 0x4000 -p 0x200000 -s 16384"
export MKUBIFS_ARGS_rootfs = "-e 0x1f8000 -c 2000 -m 0x4000 -x lzo"
export ADDITIONAL_MKUBIFS_ARGS_rootfs = "-r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs"
export ADDITIONAL_UBINIZE_ARGS_rootfs = "mode=ubi\nimage=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs\nvol_id=0\nvol_size=200MiB\nvol_type=dynamic\nvol_name=rootfs"

export MKUBIFS_ARGS_data = "-e 0x1f8000 -c 2000 -m 0x4000 -x lzo"
export ADDITIONAL_MKUBIFS_ARGS_data = "-r ${DEPLOY_DIR_IMAGE}/data_disk -o ${DEPLOY_DIR_IMAGE}/data.ubifs"
export ADDITIONAL_UBINIZE_ARGS_data = "mode=ubi\nimage=${DEPLOY_DIR_IMAGE}/data.ubifs\nvol_id=1\nvol_type=dynamic\nvol_name=data\nvol_flags=autoresize"

export MKUBIFS_ARGS_conf = "-e 0x1f8000 -c 2000 -m 0x4000 -x lzo"
export ADDITIONAL_MKUBIFS_ARGS_conf = "-r ${RESIN_CONF_DIR} -o ${DEPLOY_DIR_IMAGE}/conf.ubifs"
export ADDITIONAL_UBINIZE_ARGS_conf = "mode=ubi\nimage=${DEPLOY_DIR_IMAGE}/conf.ubifs\nvol_id=2\nvol_size=50MiB\nvol_type=dynamic\nvol_name=conf"

export MKUBIFS_ARGS_boot = "-e 0x1f8000 -c 2000 -m 0x4000 -x lzo"
export ADDITIONAL_MKUBIFS_ARGS_boot = "-r ${RESIN_BOOT_DIR} -o ${DEPLOY_DIR_IMAGE}/boot.ubifs"
export ADDITIONAL_UBINIZE_ARGS_boot = "mode=ubi\nimage=${DEPLOY_DIR_IMAGE}/boot.ubifs\nvol_id=3\nvol_size=50MiB\nvol_type=dynamic\nvol_name=boot"

IMAGE_POSTPROCESS_COMMAND_append_chip = " \
    deploy_bundle; \
    "

deploy_bundle() {
   # Remove Dir
   rm -rf ${DEPLOY_DIR_IMAGE}/images
   # Create artifact Dir
   mkdir -p ${DEPLOY_DIR_IMAGE}/images
   cp ${DEPLOY_DIR_IMAGE}/resin-image-chip_resin-ubi.ubi ${DEPLOY_DIR_IMAGE}/images/rootfs.ubi
   cp ${DEPLOY_DIR_IMAGE}/sunxi-spl.bin ${DEPLOY_DIR_IMAGE}/images
   cp ${DEPLOY_DIR_IMAGE}/sunxi-spl-with-ecc.bin ${DEPLOY_DIR_IMAGE}/images
   cp ${DEPLOY_DIR_IMAGE}/u-boot-dtb.bin ${DEPLOY_DIR_IMAGE}/images
   cp ${DEPLOY_DIR_IMAGE}/zImage-sun5i-r8-chip.dtb ${DEPLOY_DIR_IMAGE}/images/sun5i-r8-chip.dtb
   cp ${DEPLOY_DIR_IMAGE}/uboot-env.bin ${DEPLOY_DIR_IMAGE}/images
   cp ${DEPLOY_DIR_IMAGE}/zImage-chip.bin ${DEPLOY_DIR_IMAGE}/images/zImage
}
