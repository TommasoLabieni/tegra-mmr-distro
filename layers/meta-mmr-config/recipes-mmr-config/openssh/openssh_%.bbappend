SUMMARY = "Modify default ssh config to enable root login"

# Needed to add current files directory to files search path.
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI:append = "file://sshd_config"