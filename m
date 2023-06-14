Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC6A4724327
	for <lists+linux-bluetooth@lfdr.de>; Tue,  6 Jun 2023 14:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237744AbjFFMx6 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 6 Jun 2023 08:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234308AbjFFMxy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 6 Jun 2023 08:53:54 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B023D10D9
        for <linux-bluetooth@vger.kernel.org>; Tue,  6 Jun 2023 05:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686056028; x=1717592028;
  h=date:from:to:cc:subject:message-id;
  bh=lrN6/BsLIlUuAYd7JJpfM9WWl7EyDGCsC90rkTPUNds=;
  b=jdSew4gMdZR7I1BIn4FbDGX4KvJvBTC6rfCoQYzcAeRESSAUduzb8UGh
   aF/o2HfaHhcu9/k0zf5hJ28lP8u8yWE3x4HJOp6avWT93uXDXTWi5sBJC
   l5TU5C82TySqYZ+YYwbhQYy21dRj6zObth+L5EirUgazcxXM52yYNpabn
   g0gEfGs8ypaqdERQYmCkR4MqEK8TieOMbngED2DknfZNBExv/ML/b9uvQ
   O/PbZ8Fz80LFnfuVc5p5Oq1mFi2ncck9BwzVP/IE+cDZCl7olZvDG7WAy
   Dvakd8v6qIJbNaY1Ef88eEljX+3vlk/2ON0AT20HWGxOx6wtWSM7Al4Fw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341299877"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="341299877"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 05:53:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="709066208"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="709066208"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Jun 2023 05:53:24 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q6WBf-0005Fi-2Z;
        Tue, 06 Jun 2023 12:53:23 +0000
Date:   Tue, 06 Jun 2023 20:52:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc:     linux-bluetooth@vger.kernel.org
Subject: [bluetooth-next:master] BUILD SUCCESS
 817efd3cad7481ce2ee25fac5108afecbad56228
Message-ID: <20230606125250.dF8N_%lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
branch HEAD: 817efd3cad7481ce2ee25fac5108afecbad56228  Bluetooth: hci_sock: Forward credentials to monitor

elapsed time: 725m

configs tested: 172
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230606   gcc  
alpha                randconfig-r022-20230606   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230605   gcc  
arc                  randconfig-r043-20230606   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r003-20230606   clang
arm                  randconfig-r046-20230605   clang
arm                  randconfig-r046-20230606   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230605   clang
arm64        buildonly-randconfig-r006-20230606   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230606   gcc  
arm64                randconfig-r012-20230605   gcc  
arm64                randconfig-r025-20230606   clang
csky                                defconfig   gcc  
csky                 randconfig-r035-20230605   gcc  
csky                 randconfig-r035-20230606   gcc  
hexagon      buildonly-randconfig-r001-20230605   clang
hexagon              randconfig-r004-20230606   clang
hexagon              randconfig-r041-20230605   clang
hexagon              randconfig-r045-20230605   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r005-20230606   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230605   clang
i386                 randconfig-i001-20230606   gcc  
i386                 randconfig-i002-20230605   clang
i386                 randconfig-i002-20230606   gcc  
i386                 randconfig-i003-20230605   clang
i386                 randconfig-i003-20230606   gcc  
i386                 randconfig-i004-20230605   clang
i386                 randconfig-i004-20230606   gcc  
i386                 randconfig-i005-20230605   clang
i386                 randconfig-i005-20230606   gcc  
i386                 randconfig-i006-20230605   clang
i386                 randconfig-i006-20230606   gcc  
i386                 randconfig-i011-20230605   gcc  
i386                 randconfig-i011-20230606   clang
i386                 randconfig-i012-20230605   gcc  
i386                 randconfig-i012-20230606   clang
i386                 randconfig-i013-20230605   gcc  
i386                 randconfig-i013-20230606   clang
i386                 randconfig-i014-20230605   gcc  
i386                 randconfig-i014-20230606   clang
i386                 randconfig-i015-20230605   gcc  
i386                 randconfig-i015-20230606   clang
i386                 randconfig-i016-20230605   gcc  
i386                 randconfig-i016-20230606   clang
i386                 randconfig-i051-20230605   clang
i386                 randconfig-i051-20230606   gcc  
i386                 randconfig-i052-20230605   clang
i386                 randconfig-i052-20230606   gcc  
i386                 randconfig-i053-20230605   clang
i386                 randconfig-i053-20230606   gcc  
i386                 randconfig-i054-20230605   clang
i386                 randconfig-i054-20230606   gcc  
i386                 randconfig-i055-20230605   clang
i386                 randconfig-i055-20230606   gcc  
i386                 randconfig-i056-20230605   clang
i386                 randconfig-i056-20230606   gcc  
i386                 randconfig-i061-20230605   clang
i386                 randconfig-i061-20230606   gcc  
i386                 randconfig-i062-20230605   clang
i386                 randconfig-i062-20230606   gcc  
i386                 randconfig-i063-20230605   clang
i386                 randconfig-i063-20230606   gcc  
i386                 randconfig-i064-20230605   clang
i386                 randconfig-i064-20230606   gcc  
i386                 randconfig-i065-20230605   clang
i386                 randconfig-i065-20230606   gcc  
i386                 randconfig-i066-20230605   clang
i386                 randconfig-i066-20230606   gcc  
i386                 randconfig-r006-20230606   gcc  
i386                 randconfig-r036-20230606   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230606   gcc  
loongarch            randconfig-r016-20230605   gcc  
loongarch            randconfig-r025-20230606   gcc  
loongarch            randconfig-r031-20230605   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230606   gcc  
m68k                 randconfig-r003-20230606   gcc  
m68k                 randconfig-r032-20230606   gcc  
microblaze           randconfig-r003-20230606   gcc  
microblaze           randconfig-r026-20230605   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r021-20230606   gcc  
mips                 randconfig-r035-20230605   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230605   gcc  
nios2                randconfig-r023-20230606   gcc  
openrisc     buildonly-randconfig-r004-20230605   gcc  
openrisc             randconfig-r033-20230605   gcc  
openrisc             randconfig-r036-20230605   gcc  
parisc       buildonly-randconfig-r003-20230606   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r015-20230605   gcc  
parisc               randconfig-r025-20230605   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r005-20230606   gcc  
powerpc              randconfig-r012-20230606   clang
powerpc              randconfig-r021-20230606   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r001-20230606   clang
riscv        buildonly-randconfig-r002-20230606   clang
riscv                               defconfig   gcc  
riscv                randconfig-r022-20230605   gcc  
riscv                randconfig-r042-20230605   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230606   clang
s390                                defconfig   gcc  
s390                 randconfig-r001-20230606   gcc  
s390                 randconfig-r002-20230606   gcc  
s390                 randconfig-r044-20230605   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230606   gcc  
sh                   randconfig-r031-20230605   gcc  
sh                   randconfig-r032-20230605   gcc  
sh                   randconfig-r033-20230605   gcc  
sh                   randconfig-r033-20230606   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r024-20230605   gcc  
sparc                randconfig-r032-20230605   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230606   gcc  
x86_64               randconfig-a002-20230606   gcc  
x86_64               randconfig-a003-20230606   gcc  
x86_64               randconfig-a004-20230606   gcc  
x86_64               randconfig-a005-20230606   gcc  
x86_64               randconfig-a006-20230606   gcc  
x86_64               randconfig-a011-20230606   clang
x86_64               randconfig-a012-20230606   clang
x86_64               randconfig-a013-20230606   clang
x86_64               randconfig-a014-20230606   clang
x86_64               randconfig-a015-20230606   clang
x86_64               randconfig-a016-20230606   clang
x86_64               randconfig-x051-20230606   clang
x86_64               randconfig-x052-20230606   clang
x86_64               randconfig-x053-20230606   clang
x86_64               randconfig-x054-20230606   clang
x86_64               randconfig-x055-20230606   clang
x86_64               randconfig-x056-20230606   clang
x86_64               randconfig-x061-20230606   clang
x86_64               randconfig-x062-20230606   clang
x86_64               randconfig-x063-20230606   clang
x86_64               randconfig-x064-20230606   clang
x86_64               randconfig-x065-20230606   clang
x86_64               randconfig-x066-20230606   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r006-20230605   gcc  
xtensa               randconfig-r013-20230605   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
