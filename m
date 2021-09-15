Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73FD840BDCC
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Sep 2021 04:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhIOCdy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 14 Sep 2021 22:33:54 -0400
Received: from mga05.intel.com ([192.55.52.43]:24121 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229595AbhIOCdy (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 14 Sep 2021 22:33:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="307741921"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="307741921"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2021 19:32:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; 
   d="scan'208";a="698070896"
Received: from lkp-server01.sh.intel.com (HELO 730d49888f40) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Sep 2021 19:32:34 -0700
Received: from kbuild by 730d49888f40 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1mQKiw-0008yy-73; Wed, 15 Sep 2021 02:32:34 +0000
Date:   Wed, 15 Sep 2021 10:31:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     linux-bluetooth@vger.kernel.org
Subject: [bluetooth-next:master] BUILD SUCCESS
 81be03e026dc0c16dc1c64e088b2a53b73caa895
Message-ID: <61415b0b.3rTPblcJh/R3tZnL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
branch HEAD: 81be03e026dc0c16dc1c64e088b2a53b73caa895  Bluetooth: RFCOMM: Replace use of memcpy_from_msg with bt_skb_sendmmsg

elapsed time: 1779m

configs tested: 210
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210913
i386                 randconfig-c001-20210914
nds32                            alldefconfig
parisc                generic-64bit_defconfig
powerpc                          g5_defconfig
mips                         mpc30x_defconfig
powerpc                      acadia_defconfig
sh                        sh7785lcr_defconfig
powerpc                   motionpro_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        m5307c3_defconfig
powerpc                      ppc6xx_defconfig
arm                     eseries_pxa_defconfig
powerpc                   currituck_defconfig
powerpc                     skiroot_defconfig
mips                       lemote2f_defconfig
sh                   sh7724_generic_defconfig
sh                          kfr2r09_defconfig
sh                     sh7710voipgw_defconfig
mips                 decstation_r4k_defconfig
arm                       aspeed_g4_defconfig
sparc                            alldefconfig
mips                          rb532_defconfig
powerpc                     ksi8560_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                  mpc885_ads_defconfig
mips                         rt305x_defconfig
mips                     loongson1b_defconfig
powerpc                   lite5200b_defconfig
powerpc                 xes_mpc85xx_defconfig
xtensa                    xip_kc705_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                             mxs_defconfig
arm                     davinci_all_defconfig
powerpc                     redwood_defconfig
arm                       netwinder_defconfig
powerpc                        cell_defconfig
mips                      maltasmvp_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                    gamecube_defconfig
sh                      rts7751r2d1_defconfig
arm                          gemini_defconfig
arm                           h3600_defconfig
arm                         lubbock_defconfig
powerpc                           allnoconfig
sh                                  defconfig
mips                           ip27_defconfig
powerpc                      katmai_defconfig
powerpc                     tqm8555_defconfig
arm                          ixp4xx_defconfig
mips                   sb1250_swarm_defconfig
powerpc                 mpc836x_rdk_defconfig
sh                           se7705_defconfig
arm                            qcom_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                        magician_defconfig
arm                           corgi_defconfig
m68k                            mac_defconfig
xtensa                          iss_defconfig
arm                           sama5_defconfig
arm                          lpd270_defconfig
arc                          axs101_defconfig
alpha                            alldefconfig
powerpc                    mvme5100_defconfig
microblaze                      mmu_defconfig
um                                  defconfig
mips                        omega2p_defconfig
ia64                        generic_defconfig
sh                           se7721_defconfig
arm                       aspeed_g5_defconfig
riscv                    nommu_virt_defconfig
xtensa                  audio_kc705_defconfig
alpha                               defconfig
s390                             alldefconfig
sh                           se7206_defconfig
arc                         haps_hs_defconfig
m68k                          sun3x_defconfig
arm                        neponset_defconfig
sh                          r7785rp_defconfig
m68k                       m5275evb_defconfig
arm                           spitz_defconfig
arm                        spear6xx_defconfig
mips                           xway_defconfig
arm                            mmp2_defconfig
powerpc                        fsp2_defconfig
arc                              alldefconfig
arc                      axs103_smp_defconfig
mips                         bigsur_defconfig
x86_64               randconfig-c001-20210914
arm                  randconfig-c002-20210914
x86_64               randconfig-c001-20210913
arm                  randconfig-c002-20210913
x86_64               randconfig-c001-20210915
arm                  randconfig-c002-20210915
i386                 randconfig-c001-20210915
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a002-20210913
x86_64               randconfig-a003-20210913
x86_64               randconfig-a006-20210913
x86_64               randconfig-a004-20210913
x86_64               randconfig-a005-20210913
x86_64               randconfig-a001-20210913
x86_64               randconfig-a002-20210915
x86_64               randconfig-a003-20210915
x86_64               randconfig-a004-20210915
x86_64               randconfig-a006-20210915
x86_64               randconfig-a005-20210915
x86_64               randconfig-a001-20210915
i386                 randconfig-a004-20210913
i386                 randconfig-a005-20210913
i386                 randconfig-a002-20210913
i386                 randconfig-a006-20210913
i386                 randconfig-a003-20210913
i386                 randconfig-a001-20210913
x86_64               randconfig-a013-20210914
x86_64               randconfig-a016-20210914
x86_64               randconfig-a012-20210914
x86_64               randconfig-a011-20210914
x86_64               randconfig-a014-20210914
x86_64               randconfig-a015-20210914
i386                 randconfig-a016-20210914
i386                 randconfig-a015-20210914
i386                 randconfig-a011-20210914
i386                 randconfig-a012-20210914
i386                 randconfig-a013-20210914
i386                 randconfig-a014-20210914
arc                  randconfig-r043-20210913
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20210913
x86_64               randconfig-c007-20210913
mips                 randconfig-c004-20210913
powerpc              randconfig-c003-20210913
i386                 randconfig-c001-20210913
arm                  randconfig-c002-20210913
s390                 randconfig-c005-20210913
riscv                randconfig-c006-20210914
x86_64               randconfig-c007-20210914
powerpc              randconfig-c003-20210914
arm                  randconfig-c002-20210914
i386                 randconfig-c001-20210914
s390                 randconfig-c005-20210914
i386                 randconfig-a004-20210914
i386                 randconfig-a005-20210914
i386                 randconfig-a006-20210914
i386                 randconfig-a002-20210914
i386                 randconfig-a001-20210914
i386                 randconfig-a003-20210914
x86_64               randconfig-a016-20210913
x86_64               randconfig-a013-20210913
x86_64               randconfig-a012-20210913
x86_64               randconfig-a011-20210913
x86_64               randconfig-a014-20210913
x86_64               randconfig-a015-20210913
x86_64               randconfig-a002-20210914
x86_64               randconfig-a003-20210914
x86_64               randconfig-a004-20210914
x86_64               randconfig-a006-20210914
x86_64               randconfig-a005-20210914
x86_64               randconfig-a001-20210914
i386                 randconfig-a016-20210913
i386                 randconfig-a011-20210913
i386                 randconfig-a015-20210913
i386                 randconfig-a012-20210913
i386                 randconfig-a013-20210913
i386                 randconfig-a014-20210913
hexagon              randconfig-r045-20210914
hexagon              randconfig-r041-20210914

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
