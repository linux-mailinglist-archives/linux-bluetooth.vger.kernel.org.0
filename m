Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 601C973F810
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jun 2023 11:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbjF0JDq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 27 Jun 2023 05:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbjF0JDp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 27 Jun 2023 05:03:45 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51651E75
        for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jun 2023 02:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687856624; x=1719392624;
  h=date:from:to:cc:subject:message-id;
  bh=BahFLHpbPXAmowsXOS0HjbpoRe+t8iWFL+Trdg+X/zw=;
  b=grRU4rA3OpMrahjVSv2PcjYyrWfR48YqQ0x95GZ6m0f6uASYjlentk/n
   DBPNxFtgvF03FCBTwGZVWqUaZ2X4cDNFBvo90Yd4zXDGfT5+uiZwDzU5q
   fCljLyu92Pg+w2IUIs/ms8SzYO7OIzcnmUFRP25tnMe1Wp6rxcaMKPxV2
   XaaOFG0+bWJ59w1qj/9PEKS0d8DO50AwG05GGt4l5NbVtg2l0abYcPzZ4
   wPCKlCuJz/9RSNm9iwix0Y3Mch+V9fx/wnBB4SnWaX0BSODIhqMkljxSu
   6arDpfwMy/UEYoa5H9jhjUASlKI5otKEpjgqwA2JMO+ENdeRhGqq9txNG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="359017119"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="359017119"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 02:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="781768914"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="781768914"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Jun 2023 02:03:42 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qE4bF-000Bpa-2w;
        Tue, 27 Jun 2023 09:03:01 +0000
Date:   Tue, 27 Jun 2023 17:02:37 +0800
From:   kernel test robot <lkp@intel.com>
To:     Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc:     linux-bluetooth@vger.kernel.org
Subject: [bluetooth-next:master] BUILD REGRESSION
 53c7c193d66ae7a22f137b38d0d374c756892bd4
Message-ID: <202306271735.N4sUxjJY-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
branch HEAD: 53c7c193d66ae7a22f137b38d0d374c756892bd4  Bluetooth: msft: Extended monitor tracking by address filter

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202306270959.9Y2gQBta-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "pidfd_prepare" [net/bluetooth/bluetooth.ko] undefined!

Error/Warning ids grouped by kconfigs:

clang_recent_errors
|-- i386-buildonly-randconfig-r005-20230626
|   `-- ERROR:pidfd_prepare-net-bluetooth-bluetooth.ko-undefined
`-- x86_64-randconfig-r006-20230626
    `-- ERROR:pidfd_prepare-net-bluetooth-bluetooth.ko-undefined

elapsed time: 724m

configs tested: 112
configs skipped: 7

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r022-20230626   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r004-20230626   gcc  
arc                  randconfig-r036-20230627   gcc  
arc                  randconfig-r043-20230626   gcc  
arc                  randconfig-r043-20230627   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230626   clang
arm                        vexpress_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r031-20230627   gcc  
hexagon              randconfig-r005-20230626   clang
hexagon              randconfig-r016-20230626   clang
hexagon              randconfig-r041-20230626   clang
hexagon              randconfig-r045-20230626   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230626   clang
i386         buildonly-randconfig-r005-20230626   clang
i386         buildonly-randconfig-r006-20230626   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230626   clang
i386                 randconfig-i002-20230626   clang
i386                 randconfig-i003-20230626   clang
i386                 randconfig-i004-20230626   clang
i386                 randconfig-i005-20230626   clang
i386                 randconfig-i006-20230626   clang
i386                 randconfig-i011-20230626   gcc  
i386                 randconfig-i012-20230626   gcc  
i386                 randconfig-i013-20230626   gcc  
i386                 randconfig-i014-20230626   gcc  
i386                 randconfig-i015-20230626   gcc  
i386                 randconfig-i016-20230626   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r013-20230626   gcc  
loongarch            randconfig-r024-20230626   gcc  
loongarch            randconfig-r034-20230626   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r021-20230626   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r031-20230626   gcc  
mips                 randconfig-r035-20230626   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r011-20230626   gcc  
openrisc             randconfig-r012-20230627   gcc  
openrisc             randconfig-r014-20230626   gcc  
openrisc             randconfig-r015-20230626   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                 mpc8313_rdb_defconfig   clang
powerpc              randconfig-r036-20230626   clang
powerpc                     redwood_defconfig   gcc  
powerpc                        warp_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230626   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r033-20230626   clang
s390                 randconfig-r044-20230626   gcc  
sh                               allmodconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                   randconfig-r002-20230626   gcc  
sh                   randconfig-r012-20230626   gcc  
sh                   randconfig-r032-20230626   gcc  
sh                          rsk7264_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r023-20230626   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230626   clang
x86_64       buildonly-randconfig-r002-20230626   clang
x86_64       buildonly-randconfig-r003-20230626   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r006-20230626   clang
x86_64               randconfig-x011-20230627   gcc  
x86_64               randconfig-x012-20230627   gcc  
x86_64               randconfig-x013-20230627   gcc  
x86_64               randconfig-x014-20230627   gcc  
x86_64               randconfig-x015-20230627   gcc  
x86_64               randconfig-x016-20230627   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
