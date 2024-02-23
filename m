Return-Path: <linux-bluetooth+bounces-2132-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C87861FD9
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Feb 2024 23:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 003711C23C22
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Feb 2024 22:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B8B24B28;
	Fri, 23 Feb 2024 22:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZHIItf3"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01356225AD
	for <linux-bluetooth@vger.kernel.org>; Fri, 23 Feb 2024 22:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708727649; cv=none; b=IMpBCcphJVVCV6s7U2pSmFNwYJjQoWM1Hhjd8ynPBIA6SRF3jmNS9PbnuPr+TJj71GBaKyCYadMCEoIsM3OQsgg3SmPsa1Btbgp1G8N5y8iqbrhRIsVcIJP5/wHGnTOYW001nV4dHf/62wK1OYWuWiByIhwf3dJ3i8hMcbZyAQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708727649; c=relaxed/simple;
	bh=uKykZXJmjk1d+bH2rUPZCTZt9u5wr6VkkxA5n6rsBuA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dBIDh2ndeLyyneUZvyMSS0xsm49711JmrWVXSOq+mtugpwQU9+1xAC7GQpJmc1ZePBL+NGAI+T7ZfZIFAjzcbyiZXkAodzU++EgMZcKcxd3xTa8nRdypGJKMeiGgT/EeoYjoyUj8LBnkrroGNOXd70Q0/9gvxKgcAEoPM7EUwGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZHIItf3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708727648; x=1740263648;
  h=date:from:to:cc:subject:message-id;
  bh=uKykZXJmjk1d+bH2rUPZCTZt9u5wr6VkkxA5n6rsBuA=;
  b=IZHIItf3y5okTcz6jPXjC8E4uP30vfmkoHzYctnoZx/GuKm/H7k7eNTH
   rygFVCfFdd3Jv3AypBGW9KwL7zYy0Bo7hNIbK7TSweChbEVS4fiu5Brl6
   XfF/r87hGOGlNZEcx23jfJmJ14r/OrjTKNzISpNnK/EzoOaqtNYkHuD9s
   ggbSvKAKk2w36zeV7hjJD/mYfFBQ+R2CAnCmxLeTQq6kMAMNS0vYhaoH5
   Y42g4WeWYE+tyoPghHLocIRr8uqsWpyRUueK5gdBX5Pa9GHZzGig5sRRg
   qrwYa+6tuXjTAglNvHu/uivggrGYofNlXrPFQU+rxlvJfRuvNdZB2mhav
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="2918790"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="2918790"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 14:34:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5974567"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Feb 2024 14:34:06 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rde7H-0007x6-2t;
	Fri, 23 Feb 2024 22:34:03 +0000
Date: Sat, 24 Feb 2024 06:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: linux-bluetooth@vger.kernel.org
Subject: [bluetooth-next:master] BUILD SUCCESS
 75518da8cf76df4510d452f3214130d17efce283
Message-ID: <202402240654.944F1OB5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
branch HEAD: 75518da8cf76df4510d452f3214130d17efce283  Bluetooth: hci_qca: don't use IS_ERR_OR_NULL() with gpiod_get_optional()

elapsed time: 1445m

configs tested: 194
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240223   gcc  
arc                   randconfig-002-20240223   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   gcc  
arm                          collie_defconfig   gcc  
arm                                 defconfig   clang
arm                            hisi_defconfig   gcc  
arm                      jornada720_defconfig   clang
arm                            mps2_defconfig   clang
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20240223   gcc  
arm                   randconfig-002-20240223   clang
arm                   randconfig-003-20240223   clang
arm                   randconfig-004-20240223   gcc  
arm                        realview_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240223   clang
arm64                 randconfig-002-20240223   gcc  
arm64                 randconfig-003-20240223   clang
arm64                 randconfig-004-20240223   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240223   gcc  
csky                  randconfig-002-20240223   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240223   clang
hexagon               randconfig-002-20240223   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240223   gcc  
i386         buildonly-randconfig-002-20240223   gcc  
i386         buildonly-randconfig-002-20240224   clang
i386         buildonly-randconfig-003-20240223   gcc  
i386         buildonly-randconfig-004-20240223   gcc  
i386         buildonly-randconfig-005-20240223   gcc  
i386         buildonly-randconfig-005-20240224   clang
i386         buildonly-randconfig-006-20240223   clang
i386         buildonly-randconfig-006-20240224   clang
i386                                defconfig   clang
i386                  randconfig-001-20240223   clang
i386                  randconfig-002-20240223   gcc  
i386                  randconfig-002-20240224   clang
i386                  randconfig-003-20240223   gcc  
i386                  randconfig-003-20240224   clang
i386                  randconfig-004-20240223   gcc  
i386                  randconfig-005-20240223   gcc  
i386                  randconfig-006-20240223   clang
i386                  randconfig-011-20240223   gcc  
i386                  randconfig-012-20240223   gcc  
i386                  randconfig-013-20240223   clang
i386                  randconfig-013-20240224   clang
i386                  randconfig-014-20240223   clang
i386                  randconfig-014-20240224   clang
i386                  randconfig-015-20240223   clang
i386                  randconfig-015-20240224   clang
i386                  randconfig-016-20240223   clang
i386                  randconfig-016-20240224   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240223   gcc  
loongarch             randconfig-002-20240223   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                  cavium_octeon_defconfig   gcc  
mips                            gpr_defconfig   clang
mips                           ip28_defconfig   gcc  
mips                     loongson1b_defconfig   clang
mips                      maltasmvp_defconfig   gcc  
mips                          rm200_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240223   gcc  
nios2                 randconfig-002-20240223   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc                randconfig-001-20240223   gcc  
parisc                randconfig-002-20240223   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ksi8560_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   clang
powerpc                    mvme5100_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc               randconfig-001-20240223   clang
powerpc               randconfig-002-20240223   clang
powerpc               randconfig-003-20240223   clang
powerpc64             randconfig-001-20240223   gcc  
powerpc64             randconfig-002-20240223   gcc  
powerpc64             randconfig-003-20240223   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240223   gcc  
riscv                 randconfig-002-20240223   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240223   gcc  
s390                  randconfig-002-20240223   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                    randconfig-001-20240223   gcc  
sh                    randconfig-002-20240223   gcc  
sh                          rsk7201_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240223   gcc  
sparc64               randconfig-002-20240223   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240223   clang
um                    randconfig-002-20240223   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240223   gcc  
x86_64       buildonly-randconfig-002-20240223   gcc  
x86_64       buildonly-randconfig-003-20240223   clang
x86_64       buildonly-randconfig-004-20240223   clang
x86_64       buildonly-randconfig-005-20240223   gcc  
x86_64       buildonly-randconfig-006-20240223   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240223   gcc  
x86_64                randconfig-002-20240223   clang
x86_64                randconfig-003-20240223   gcc  
x86_64                randconfig-004-20240223   gcc  
x86_64                randconfig-005-20240223   clang
x86_64                randconfig-006-20240223   gcc  
x86_64                randconfig-011-20240223   gcc  
x86_64                randconfig-012-20240223   gcc  
x86_64                randconfig-013-20240223   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240223   gcc  
xtensa                randconfig-002-20240223   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

