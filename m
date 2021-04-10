Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5963335AA45
	for <lists+linux-bluetooth@lfdr.de>; Sat, 10 Apr 2021 04:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234133AbhDJCNm (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 9 Apr 2021 22:13:42 -0400
Received: from mga11.intel.com ([192.55.52.93]:16340 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232796AbhDJCNm (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 9 Apr 2021 22:13:42 -0400
IronPort-SDR: 5YAQBBUQQ/qAtj0AwzLROgg/pm5FzsaAwMjGgTyUiTDiFfAsaYP8XLrSl/DZk18BL9ZiwDe4CD
 shcvrXypvagw==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="190679777"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; 
   d="scan'208";a="190679777"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 19:13:28 -0700
IronPort-SDR: gjzqlGGKoB55550gkHQ/X0JrRX6pXbKFJ7hpmCV5OoRXSU+cmPJMT72d911vX4JcOfa9xJaPe6
 8qjAx6WJiQ8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; 
   d="scan'208";a="382292228"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Apr 2021 19:13:26 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lV37m-000HiG-7l; Sat, 10 Apr 2021 02:13:26 +0000
Date:   Sat, 10 Apr 2021 10:12:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     linux-bluetooth@vger.kernel.org
Subject: [bluetooth-next:master] BUILD SUCCESS
 18bfbc777ee19dc4d688aa2a55107ab8aeda2a6c
Message-ID: <607109a8.LHtGprhXMh+O++/J%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
branch HEAD: 18bfbc777ee19dc4d688aa2a55107ab8aeda2a6c  Bluetooth: 6lowpan: delete unneeded variable initialization

elapsed time: 724m

configs tested: 115
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
i386                             allyesconfig
sh                           se7750_defconfig
powerpc                       ebony_defconfig
mips                           xway_defconfig
powerpc                     mpc83xx_defconfig
ia64                      gensparse_defconfig
arm                          simpad_defconfig
powerpc64                           defconfig
sh                             espt_defconfig
arm                         vf610m4_defconfig
mips                          rb532_defconfig
mips                            gpr_defconfig
arm                             rpc_defconfig
powerpc                   currituck_defconfig
sh                        dreamcast_defconfig
powerpc                 mpc837x_mds_defconfig
microblaze                      mmu_defconfig
mips                        workpad_defconfig
nds32                               defconfig
mips                       bmips_be_defconfig
sh                            shmin_defconfig
arm                        multi_v7_defconfig
arc                            hsdk_defconfig
riscv             nommu_k210_sdcard_defconfig
arm                        multi_v5_defconfig
h8300                               defconfig
powerpc                 mpc836x_rdk_defconfig
m68k                       m5249evb_defconfig
ia64                            zx1_defconfig
arm                          ixp4xx_defconfig
powerpc                   bluestone_defconfig
arc                                 defconfig
mips                      loongson3_defconfig
m68k                          multi_defconfig
arm                         s3c6400_defconfig
sh                          r7785rp_defconfig
powerpc                     asp8347_defconfig
powerpc                     sbc8548_defconfig
powerpc                     tqm8540_defconfig
powerpc                 mpc837x_rdb_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20210409
i386                 randconfig-a003-20210409
i386                 randconfig-a001-20210409
i386                 randconfig-a004-20210409
i386                 randconfig-a002-20210409
i386                 randconfig-a005-20210409
x86_64               randconfig-a014-20210409
x86_64               randconfig-a015-20210409
x86_64               randconfig-a012-20210409
x86_64               randconfig-a011-20210409
x86_64               randconfig-a013-20210409
x86_64               randconfig-a016-20210409
i386                 randconfig-a014-20210409
i386                 randconfig-a011-20210409
i386                 randconfig-a016-20210409
i386                 randconfig-a012-20210409
i386                 randconfig-a013-20210409
i386                 randconfig-a015-20210409
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
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
x86_64               randconfig-a004-20210409
x86_64               randconfig-a005-20210409
x86_64               randconfig-a003-20210409
x86_64               randconfig-a001-20210409
x86_64               randconfig-a002-20210409
x86_64               randconfig-a006-20210409

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
