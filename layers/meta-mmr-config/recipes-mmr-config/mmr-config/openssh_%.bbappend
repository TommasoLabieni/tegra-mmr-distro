SUMMARY = "Modify default ssh config"

# Needed to add current files directory to files search path.
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI:append = "file://0001-enable-root-ssh-login.patch"