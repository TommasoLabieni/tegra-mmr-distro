PATCH_PATH := "${THISDIR}/${PN}"

BPFDTB_OVERLAYS = "tegra194-a02-bpmp-p2888-a04-mmr.dts"

do_compile() {
    if [ "${SOC_FAMILY}" = "tegra194" ]; then
        for f in ${S}/bootloader/${NVIDIA_BOARD}/tegra194-*-bpmp-*.dtb; do
            dtb_basename=$(basename ${f} .dtb)
            if echo ${BPFDTB_OVERLAYS} | grep ${dtb_basename}
            then
                # De-compile file to patch
                dtc -I "dtb" ${f} -O "dts" -o "${dtb_basename}.dts"

                # Apply patch
                patch -i "${PATCH_PATH}/${dtb_basename}.patch" "${dtb_basename}.dts"

                # Re-compile patched file
                dtc -I "dts" "${dtb_basename}.dts" -O "dtb" -o ${f}

                # Cleanup dts file"
                rm "${dtb_basename}.dts"
            fi 
            compressedfile=${B}/$(basename "$f" .dtb)_lz4.dtb
            lz4c -f $f $compressedfile
	done
	cp ${S}/bootloader/nvdisp-init.bin ${B}
	truncate --size=393216 ${B}/nvdisp-init.bin
    fi
    prepare_badpage_mapfile
}