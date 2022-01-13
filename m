Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF7F48D69B
	for <lists+linux-bluetooth@lfdr.de>; Thu, 13 Jan 2022 12:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234135AbiAMLTr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 13 Jan 2022 06:19:47 -0500
Received: from mga14.intel.com ([192.55.52.115]:58294 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230186AbiAMLTq (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 13 Jan 2022 06:19:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642072786; x=1673608786;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pRgmaFZdx1iF9wxe8qkBP1Iuotlet3LzEj6TNNGy/xM=;
  b=CJ15zpgxtq4r4p2zqEMNgGAPU7p/YQ7jOW18XXeXGJKSGUXPm3rMXCG2
   aE2qL0UKIUYFPCrm4LyGs61aviyyybwj34CHZCASpGNanzB1EME6n7RGn
   CdZiFIwddKMm0JvuhmaAqY+GYm7LpUVpfW647QeM+dcv4zSxoKVbzeq44
   1e/sidGOF3mmWBHZd5+2uW0UcT9XTQlxn2JW9vHxinM2xFbhtChGvl4Pe
   JmMm9R4iBq50qIerFXSvSkI6tiissqdSWujwOntbhdQPRfGasapORVHLT
   NhlsGjkpRcLNCK7wxiJH9fJD8i6g4UJ4WWdqDIj0o3KXI2tO8LH91KQ7x
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="244192593"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="244192593"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 03:19:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; 
   d="scan'208";a="613921729"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Jan 2022 03:19:41 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1n7y8r-00077l-6G; Thu, 13 Jan 2022 11:19:41 +0000
Date:   Thu, 13 Jan 2022 19:18:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc:     linux-bluetooth@vger.kernel.org
Subject: [bluetooth-next:master] BUILD SUCCESS
 c07ba878ca199a6089cdb323bf526adbeeb4201f
Message-ID: <61e00aa1.MHik+XsdlA9IzU2l%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
branch HEAD: c07ba878ca199a6089cdb323bf526adbeeb4201f  Bluetooth: hci_sync: unlock on error in hci_inquiry_result_with_rssi_evt()

elapsed time: 731m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
openrisc                  or1klitex_defconfig
mips                           jazz_defconfig
um                               alldefconfig
ia64                            zx1_defconfig
sh                          landisk_defconfig
sh                   sh7724_generic_defconfig
sh                               alldefconfig
powerpc                      mgcoge_defconfig
arm                            lart_defconfig
sh                          sdk7780_defconfig
sparc                       sparc32_defconfig
m68k                       m5475evb_defconfig
mips                             allyesconfig
arm                            pleb_defconfig
arm                           stm32_defconfig
arm                        trizeps4_defconfig
sh                           se7705_defconfig
mips                         mpc30x_defconfig
sh                     magicpanelr2_defconfig
mips                  maltasmvp_eva_defconfig
xtensa                  audio_kc705_defconfig
mips                 decstation_r4k_defconfig
nios2                            alldefconfig
powerpc                      pasemi_defconfig
m68k                            q40_defconfig
arm                           tegra_defconfig
arm                          badge4_defconfig
ia64                             allmodconfig
sh                         apsh4a3a_defconfig
mips                           xway_defconfig
powerpc                       ppc64_defconfig
ia64                         bigsur_defconfig
arm                          simpad_defconfig
arm                         lpc18xx_defconfig
m68k                        mvme16x_defconfig
ia64                          tiger_defconfig
m68k                       bvme6000_defconfig
sh                             sh03_defconfig
arm                        cerfcube_defconfig
powerpc                 mpc837x_mds_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                       maple_defconfig
i386                             alldefconfig
arm                           sunxi_defconfig
sh                           se7721_defconfig
sh                           se7780_defconfig
powerpc                   motionpro_defconfig
arm                           h3600_defconfig
m68k                         amcore_defconfig
powerpc                        warp_defconfig
sh                          rsk7264_defconfig
sh                          kfr2r09_defconfig
um                             i386_defconfig
h8300                               defconfig
arm                  randconfig-c002-20220113
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
riscv                randconfig-r042-20220113
arc                  randconfig-r043-20220113
s390                 randconfig-r044-20220113
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220113
x86_64                        randconfig-c007
riscv                randconfig-c006-20220113
powerpc              randconfig-c003-20220113
i386                          randconfig-c001
mips                 randconfig-c004-20220113
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220113
hexagon              randconfig-r041-20220113

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
