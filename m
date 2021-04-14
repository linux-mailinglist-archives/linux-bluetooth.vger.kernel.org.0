Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D06B35EF74
	for <lists+linux-bluetooth@lfdr.de>; Wed, 14 Apr 2021 10:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349938AbhDNIWg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 14 Apr 2021 04:22:36 -0400
Received: from mga02.intel.com ([134.134.136.20]:24874 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348780AbhDNIWg (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 14 Apr 2021 04:22:36 -0400
IronPort-SDR: CI2YU4VGFO9AlBZI89+NYFpSCAVebbagwSm55Q7Kmvaxh4jpcfOjEW/J66cInIX4+yaD4ILS2O
 6yOqjGELt3hw==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="181715153"
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; 
   d="scan'208";a="181715153"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2021 01:22:14 -0700
IronPort-SDR: GX0lyXW+SN2cEbHI2aN5tXE+ro5QVzaab+FEsa3xlAblad1a5ceQ2XwZ5U4MFg0f5s716EssFK
 aa5NRNC/oRSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; 
   d="scan'208";a="424623196"
Received: from lkp-server01.sh.intel.com (HELO abb8824c7ed7) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Apr 2021 01:22:13 -0700
Received: from kbuild by abb8824c7ed7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lWamq-000013-Ov; Wed, 14 Apr 2021 08:22:12 +0000
Date:   Wed, 14 Apr 2021 16:22:00 +0800
From:   kernel test robot <lkp@intel.com>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     linux-bluetooth@vger.kernel.org
Subject: [bluetooth-next:master] BUILD SUCCESS
 1c55c39f8232f02a742e6e84c812574f7c460a7b
Message-ID: <6076a628.hYf5rykxVo79SKyG%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
branch HEAD: 1c55c39f8232f02a742e6e84c812574f7c460a7b  Bluetooth: cmtp: fix file refcount when cmtp_attach_device fails

elapsed time: 728m

configs tested: 138
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allmodconfig
x86_64                           allyesconfig
riscv                            allyesconfig
i386                             allyesconfig
arm                       omap2plus_defconfig
m68k                             alldefconfig
sh                          rsk7203_defconfig
powerpc                  storcenter_defconfig
riscv                             allnoconfig
sh                        sh7785lcr_defconfig
arm                          pxa3xx_defconfig
openrisc                         alldefconfig
powerpc64                           defconfig
sh                        apsh4ad0a_defconfig
h8300                       h8s-sim_defconfig
sh                           se7206_defconfig
s390                             allmodconfig
riscv             nommu_k210_sdcard_defconfig
sh                           se7343_defconfig
arc                         haps_hs_defconfig
powerpc                     taishan_defconfig
powerpc64                        alldefconfig
powerpc                     ksi8560_defconfig
xtensa                  cadence_csp_defconfig
sh                          urquell_defconfig
h8300                    h8300h-sim_defconfig
arm                          collie_defconfig
powerpc                    socrates_defconfig
powerpc                   lite5200b_defconfig
powerpc                      bamboo_defconfig
arm                            xcep_defconfig
mips                        nlm_xlp_defconfig
powerpc                  iss476-smp_defconfig
mips                         db1xxx_defconfig
sh                            titan_defconfig
m68k                         amcore_defconfig
arm                       netwinder_defconfig
m68k                        mvme147_defconfig
ia64                            zx1_defconfig
sh                          landisk_defconfig
csky                             alldefconfig
powerpc                     tqm8560_defconfig
arm                       spear13xx_defconfig
arc                     haps_hs_smp_defconfig
mips                        maltaup_defconfig
arm                        realview_defconfig
arm                     am200epdkit_defconfig
arm                     eseries_pxa_defconfig
sparc                            allyesconfig
xtensa                  nommu_kc705_defconfig
arm                           corgi_defconfig
mips                        omega2p_defconfig
arm                          ixp4xx_defconfig
powerpc                     tqm8540_defconfig
powerpc                      ep88xc_defconfig
powerpc                     rainier_defconfig
arm                          pxa168_defconfig
mips                           ci20_defconfig
arm                       aspeed_g4_defconfig
sh                         microdev_defconfig
powerpc                     sequoia_defconfig
sh                          lboxre2_defconfig
arm                        clps711x_defconfig
xtensa                generic_kc705_defconfig
arm                      footbridge_defconfig
sparc64                          alldefconfig
arm                      jornada720_defconfig
ia64                             allmodconfig
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
parisc                           allyesconfig
s390                                defconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210413
x86_64               randconfig-a002-20210413
x86_64               randconfig-a001-20210413
x86_64               randconfig-a005-20210413
x86_64               randconfig-a006-20210413
x86_64               randconfig-a004-20210413
i386                 randconfig-a003-20210413
i386                 randconfig-a001-20210413
i386                 randconfig-a006-20210413
i386                 randconfig-a005-20210413
i386                 randconfig-a004-20210413
i386                 randconfig-a002-20210413
i386                 randconfig-a015-20210413
i386                 randconfig-a014-20210413
i386                 randconfig-a013-20210413
i386                 randconfig-a012-20210413
i386                 randconfig-a016-20210413
i386                 randconfig-a011-20210413
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210413
x86_64               randconfig-a015-20210413
x86_64               randconfig-a011-20210413
x86_64               randconfig-a013-20210413
x86_64               randconfig-a012-20210413
x86_64               randconfig-a016-20210413

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
