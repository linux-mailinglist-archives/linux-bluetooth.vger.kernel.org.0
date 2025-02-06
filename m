Return-Path: <linux-bluetooth+bounces-10181-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84835A2B436
	for <lists+linux-bluetooth@lfdr.de>; Thu,  6 Feb 2025 22:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F772166EE1
	for <lists+linux-bluetooth@lfdr.de>; Thu,  6 Feb 2025 21:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD1022258D;
	Thu,  6 Feb 2025 21:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msglzu9Y"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED93522257E
	for <linux-bluetooth@vger.kernel.org>; Thu,  6 Feb 2025 21:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738877720; cv=none; b=BKVIQijcUNMm645zEvD5rfmi+qTcDCm6RPsffIc9ofhQNb1m6o7awo51HZp+r1mLcm4XACzb7liJo8PrWI5uekNc4kXMELiwVEHXzfrnEfL0xoB/4UcDuJVahPlQCdNacfZrLLGRoCZ7Puv0J1n4GikaEVBLBly6uKSINWG5cUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738877720; c=relaxed/simple;
	bh=Wq2N2kIhntara9kNpNCXhR4MDcTzvSLTBB3ZnlXJw50=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FDhRSpkynVG+TdQJe0yUcPLzBc5a0Ko1E4EiLl0j2SoBKfigtx8N55FSD5VOs+4/5Z8/XjgAGVXbfzAXZB6GO4D4mNyRrt/RtASmoT4h4XL8f1ihUcDS0WrmGmpE1k34Pd2YF+OvIMJOcWFESZ8ssQwBxZdfxg6U2j6tKu5Drb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msglzu9Y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738877719; x=1770413719;
  h=date:from:to:cc:subject:message-id;
  bh=Wq2N2kIhntara9kNpNCXhR4MDcTzvSLTBB3ZnlXJw50=;
  b=msglzu9YGHPRtDvuj0iadZo9o58+51EZWzGamxXJd0EwMEuL9o6UIeOU
   UlJAkA/Wl2LR6xhRJvgUqjt0KEYtY2TYNYOzvtKi2vM+rR+HCkLDHcrvH
   vmaRLV6UrAWtvp3vt/4wD9K82xfVMxRmd3hKsLHoVnVT6oy9rb7BncPd9
   P6PxWkCDZ3foXxuIqxtCG2IdQ2yDzcdCgbh3E00hInjuxxjMvZHFD0jm7
   X3nO+1dSFz/VeekiBmvOYkRQi0kmrJew7oN533WldZeTwvYruJW/lV44S
   iAK7qfvwuVEV7oSvYh7jsDtmqTKhLLX7CsUWmtLmP+6cLO4B9g20cMJ55
   A==;
X-CSE-ConnectionGUID: 0mIja7KNRd6G2zGfg8UeRQ==
X-CSE-MsgGUID: E7KMHXVtSzmOh7Vr7OjOiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50129209"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="50129209"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 13:35:16 -0800
X-CSE-ConnectionGUID: sG/JDI4QQoWtnd4nRnQbfg==
X-CSE-MsgGUID: DIZ8RkKBT1eGDg1ujZSFAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115952485"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Feb 2025 13:35:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg9Wj-000xM0-1u;
	Thu, 06 Feb 2025 21:35:13 +0000
Date: Fri, 07 Feb 2025 05:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: linux-bluetooth@vger.kernel.org
Subject: [bluetooth-next:master] BUILD SUCCESS
 37d0ec8e50cac4fd2ea7734b7e2d5c8be8f2a8a7
Message-ID: <202502070543.kCyDmwwU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
branch HEAD: 37d0ec8e50cac4fd2ea7734b7e2d5c8be8f2a8a7  Bluetooth: btintel_pcie: Fix a potential race condition

elapsed time: 1444m

configs tested: 104
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                     haps_hs_smp_defconfig    gcc-13.2.0
arc                   randconfig-001-20250206    gcc-13.2.0
arc                   randconfig-002-20250206    gcc-13.2.0
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250206    clang-21
arm                   randconfig-002-20250206    clang-19
arm                   randconfig-003-20250206    clang-21
arm                   randconfig-004-20250206    gcc-14.2.0
arm                         s3c6400_defconfig    gcc-14.2.0
arm                         wpcm450_defconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250206    clang-21
arm64                 randconfig-002-20250206    clang-21
arm64                 randconfig-003-20250206    clang-15
arm64                 randconfig-004-20250206    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250206    gcc-14.2.0
csky                  randconfig-002-20250206    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250206    clang-21
hexagon               randconfig-002-20250206    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250206    clang-19
i386        buildonly-randconfig-002-20250206    gcc-12
i386        buildonly-randconfig-003-20250206    clang-19
i386        buildonly-randconfig-004-20250206    clang-19
i386        buildonly-randconfig-005-20250206    clang-19
i386        buildonly-randconfig-006-20250206    gcc-12
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250206    gcc-14.2.0
loongarch             randconfig-002-20250206    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
mips                           gcw0_defconfig    clang-15
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250206    gcc-14.2.0
nios2                 randconfig-002-20250206    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250206    gcc-14.2.0
parisc                randconfig-002-20250206    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                 canyonlands_defconfig    clang-19
powerpc               randconfig-001-20250206    clang-21
powerpc               randconfig-002-20250206    clang-19
powerpc               randconfig-003-20250206    clang-21
powerpc                     tqm5200_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250206    clang-15
powerpc64             randconfig-002-20250206    clang-17
powerpc64             randconfig-003-20250206    clang-19
riscv                 randconfig-001-20250206    clang-19
riscv                 randconfig-002-20250206    clang-17
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250206    clang-21
s390                  randconfig-002-20250206    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250206    gcc-14.2.0
sh                    randconfig-002-20250206    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250206    gcc-14.2.0
sparc                 randconfig-002-20250206    gcc-14.2.0
sparc64               randconfig-001-20250206    gcc-14.2.0
sparc64               randconfig-002-20250206    gcc-14.2.0
um                               allmodconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250206    clang-15
um                    randconfig-002-20250206    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250206    clang-19
x86_64      buildonly-randconfig-002-20250206    clang-19
x86_64      buildonly-randconfig-003-20250206    clang-19
x86_64      buildonly-randconfig-004-20250206    clang-19
x86_64      buildonly-randconfig-005-20250206    clang-19
x86_64      buildonly-randconfig-006-20250206    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250206    gcc-14.2.0
xtensa                randconfig-002-20250206    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

