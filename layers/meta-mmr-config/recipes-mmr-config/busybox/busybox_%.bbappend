SUMMARY = "Modify default busybox config to include devmem and iproute applets"

# Needed to add current files directory to files search path.
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://overlay.cfg"
