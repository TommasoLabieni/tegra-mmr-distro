SUMMARY = "Modify default ssh config"

# Needed to add current files directory to files search path.
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI:append = "file://sshd_config"