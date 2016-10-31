IMAGE_FSTYPES_append_chip = " multiubivol"

RESIN_BOOT_PARTITION_FILES_chip = " \
    "

UBIMULTIVOL_BUILD = "rootfs data conf boot"

UBINIZE_ARGS = "-m 0x4000 -p 0x200000 -s 16384"
export MKUBIFS_ARGS_rootfs = "-e 0x1f8000 -c 500 -m 0x4000 -x lzo"
export ADDITIONAL_MKUBIFS_ARGS_rootfs = "-r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs"
export ADDITIONAL_UBINIZE_ARGS_rootfs = "mode=ubi\nimage=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs\nvol_id=0\nvol_size=500MiB\nvol_type=dynamic\nvol_name=rootfs"

export MKUBIFS_ARGS_data = "-e 0x1f8000 -c 500 -m 0x4000 -x lzo"
export ADDITIONAL_MKUBIFS_ARGS_data = "-r ${DEPLOY_DIR_IMAGE}/data_disk -o ${DEPLOY_DIR_IMAGE}/data.ubifs"
export ADDITIONAL_UBINIZE_ARGS_data = "mode=ubi\nimage=${DEPLOY_DIR_IMAGE}/data.ubifs\nvol_id=1\nvol_type=dynamic\nvol_name=data\nvol_flags=autoresize"

export MKUBIFS_ARGS_conf = "-e 0x1f8000 -c 500 -m 0x4000 -x lzo"
export ADDITIONAL_MKUBIFS_ARGS_conf = "-r ${RESIN_CONF_DIR} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.conf.ubifs"
export ADDITIONAL_UBINIZE_ARGS_conf = "mode=ubi\nimage=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.conf.ubifs\nvol_id=2\nvol_size=500MiB\nvol_type=dynamic\nvol_name=conf"

export MKUBIFS_ARGS_boot = "-e 0x1f8000 -c 500 -m 0x4000 -x lzo"
export ADDITIONAL_MKUBIFS_ARGS_boot = "-r ${RESIN_BOOT_DIR} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.boot.ubifs"
export ADDITIONAL_UBINIZE_ARGS_boot = "mode=ubi\nimage=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.boot.ubifs\nvol_id=3\nvol_size=500MiB\nvol_type=dynamic\nvol_name=boot"
