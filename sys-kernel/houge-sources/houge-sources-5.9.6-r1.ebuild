# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="1"
K_SECURITY_UNSUPPORTED="1"
K_NOSETEXTRAVERSION="1"
HOUGE_VERSION="r0"
ETYPE="sources"

inherit kernel-2-src-prepare-overlay
detect_version

DESCRIPTION="Full Project-C CPU Scheduler sources including the Gentoo patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
HOMEPAGE="https://cchalpha.blogspot.com/"
LICENSE+=" CDDL"
SRC_URI="${KERNEL_BASE_URI}/linux-5.9.tar.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/0003-glitched-muqss.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/0004-glitched-ondemand-muqss.xz https://github.com/HougeLangley/customkernel/releases/download/Patches-Reversion/0001-patch-5.9.6.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/MuQSSv204.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/mm59.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/elevator59.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/CPUf59.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/cpu59.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/25659.xz https://github.com/HougeLangley/customkernel/releases/download/Patches-Reversion/UKSM59R5.xz https://github.com/HougeLangley/customkernel/releases/download/5.9/zen59.xz ${GENPATCHES_URI}"

UNIPATCH_LIST_DEFAULT=""
UNIPATCH_LIST="${DISTDIR}/0001-patch-5.9.6.xz ${DISTDIR}/0003-glitched-muqss.xz ${DISTDIR}/0004-glitched-ondemand-muqss.xz ${DISTDIR}/MuQSSv204.xz ${DISTDIR}/mm59.xz ${DISTDIR}/elevator59.xz ${DISTDIR}/CPUf59.xz ${DISTDIR}/cpu59.xz ${DISTDIR}/25659.xz ${DISTDIR}/UKSM59R5.xz ${DISTDIR}/zen59.xz"

KEYWORDS="~amd64"

src_prepare() {

    eapply "${FILESDIR}/fsync59.patch"

	kernel-2-src-prepare-overlay_src_prepare

}
