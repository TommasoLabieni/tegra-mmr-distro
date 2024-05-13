SUMMARY = "mmr-config recipe"
DESCRIPTION = "Recipe used to add custom configurations"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = " file://wired-ifaces.conf"            
S = "${WORKDIR}"

python do_display_banner() {
    bb.plain("***********************************************");
    bb.plain("*                                             *");
    bb.plain("*     INSTALLING CUSTOM MMR CONFIGUATIONS     *");
    bb.plain("*                                             *");
    bb.plain("***********************************************");
}

addtask display_banner before do_install

do_install() {
    install -d ${D}${sysconfdir}/systemd/network/80-wired.network.d
    install -m 0644 ${S}/wired-ifaces.conf ${D}${sysconfdir}/systemd/network/80-wired.network.d/

}
