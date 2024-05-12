DESCRIPTION = "Tegra demo base image"

require demo-image-common.inc

inherit extrausers
EXTRA_USERS_PARAMS = "usermod -p '\$6\$movtWRpdFtd/FnXg\$HbEYuBK0AcH6G/rTI4Amxnf.LdGYwNS4V5XxoFXpQC3PZVI5fZKCOruL0KkSZS6ijLTanSTjOuuX1vaPFQCW70' root;"

CORE_IMAGE_BASE_INSTALL += "mmr-config"