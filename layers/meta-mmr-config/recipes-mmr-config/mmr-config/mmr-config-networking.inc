ROOTFS_POSTPROCESS_COMMAND += "set_static_ip"

set_static_ip() {
   install -d ${D}${sysconfdir}/network/
   install -m 0755 ${WORKDIR}/static-ip-addr-conf ${D}${sysconfdir}/network/interfaces
}
