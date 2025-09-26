Return-Path: <linux-bluetooth+bounces-15509-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78483BA4681
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Sep 2025 17:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 964F616C528
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Sep 2025 15:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375971E0DD9;
	Fri, 26 Sep 2025 15:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFYN0FSd"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA32520408A
	for <linux-bluetooth@vger.kernel.org>; Fri, 26 Sep 2025 15:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758900403; cv=none; b=MMaWUxEk41/jzKhemCGMPmw0w1k4xXKLYMIOF/KkGLAOH9Evpc5Y7gK8GVQyQ15K9J6nhfER34GOpDy3LJjfk5zgaMw8fvgbnBZwB3thD/tkXuaW44Fuk0XcFUsET4cV8KsIVKEgzQ76dueKrCznLU5G3tixJkSkhsM6C8la2sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758900403; c=relaxed/simple;
	bh=XLC6wT4qg0xyEfhd0UOrN51ia6O+vuNcU1da/gd0tQc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nwd5XOs+0bjeIcMze06Ey3FVIaiA6YW2afZekW5pn9pmd710HvAKuFHXW7MO9jMq62tzJuKKKNzxeUfOXkmqY46TSsRIgdaUlFkthkUaUG3Klio2jIGX2i4ifMofQhPb2xZUTTuAJ1/+AHijjKQ3BnBBcjPCcVMxBBIsav+WWDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFYN0FSd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758900402; x=1790436402;
  h=date:from:to:cc:subject:message-id;
  bh=XLC6wT4qg0xyEfhd0UOrN51ia6O+vuNcU1da/gd0tQc=;
  b=hFYN0FSdC3cHJlEvHwdV+Z0yNiomCbgehgbaJPXfNDYfpAA7GTtvwqhJ
   jm4vBkZxW9rqOmZlTL5cxnPcFA90TtJqQGxtYlQRhathOFh1OUWS7dklf
   vIcBRRJQLYLTcP7M9gTWCdlW/KJMTNrbj4HpP296E602af6NkZoqAll+2
   rpM1oBE2VktYGHNV1ltTqAIhIFyyxdXn35xMMET07HnwwBwvPVDebRsIz
   jX5W37brDoEPwFylmEc+5ojuNRypOpYaQTduAoqxFmv0E7n2+lSWzLCfY
   X1QCQJVLccuoytUe/yqQCXj8OB7rmg81F7RvhitbfOdz0K0yAaPSVBOUi
   A==;
X-CSE-ConnectionGUID: eTo3M0d4QWi1vqHaPbIaWA==
X-CSE-MsgGUID: +mmjNSuUTZug8Uc7LjDrRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61154392"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="61154392"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 08:26:41 -0700
X-CSE-ConnectionGUID: IIA34b2SQCaBuRUUw/vtWg==
X-CSE-MsgGUID: zxfTXZDQQkmih5h2K0MDhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="177690735"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Sep 2025 08:26:40 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2ALF-0006MH-2K;
	Fri, 26 Sep 2025 15:26:37 +0000
Date: Fri, 26 Sep 2025 23:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: linux-bluetooth@vger.kernel.org
Subject: [bluetooth-next:master] BUILD SUCCESS
 8d0a1577fe0db496fa3cc674e5ebff28ebbdebd4
Message-ID: <202509262359.zXMEL5OU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
branch HEAD: 8d0a1577fe0db496fa3cc674e5ebff28ebbdebd4  Bluetooth: Avoid a couple dozen -Wflex-array-member-not-at-end warnings

elapsed time: 1470m

configs tested: 102
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                   randconfig-001-20250926    gcc-8.5.0
arc                   randconfig-002-20250926    gcc-9.5.0
arm                               allnoconfig    clang-22
arm                   randconfig-001-20250926    clang-22
arm                   randconfig-002-20250926    clang-17
arm                   randconfig-003-20250926    clang-22
arm                   randconfig-004-20250926    clang-22
arm                           sama7_defconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250926    gcc-8.5.0
arm64                 randconfig-002-20250926    gcc-12.5.0
arm64                 randconfig-003-20250926    gcc-9.5.0
arm64                 randconfig-004-20250926    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250926    gcc-15.1.0
csky                  randconfig-002-20250926    gcc-14.3.0
hexagon                          alldefconfig    clang-22
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250926    clang-22
hexagon               randconfig-002-20250926    clang-22
i386        buildonly-randconfig-001-20250926    clang-20
i386        buildonly-randconfig-002-20250926    clang-20
i386        buildonly-randconfig-003-20250926    clang-20
i386        buildonly-randconfig-004-20250926    clang-20
i386        buildonly-randconfig-005-20250926    clang-20
i386        buildonly-randconfig-006-20250926    clang-20
i386                  randconfig-011-20250925    clang-20
i386                  randconfig-012-20250925    gcc-14
i386                  randconfig-013-20250925    clang-20
i386                  randconfig-014-20250925    clang-20
i386                  randconfig-015-20250925    gcc-13
i386                  randconfig-016-20250925    clang-20
i386                  randconfig-017-20250925    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250926    gcc-15.1.0
loongarch             randconfig-002-20250926    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                         apollo_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                         rt305x_defconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20250926    gcc-11.5.0
nios2                 randconfig-002-20250926    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                randconfig-001-20250926    gcc-10.5.0
parisc                randconfig-002-20250926    gcc-10.5.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                 canyonlands_defconfig    clang-22
powerpc                     mpc512x_defconfig    clang-22
powerpc               randconfig-001-20250926    clang-22
powerpc               randconfig-002-20250926    clang-18
powerpc               randconfig-003-20250926    clang-22
powerpc64             randconfig-001-20250926    clang-22
powerpc64             randconfig-002-20250926    clang-16
powerpc64             randconfig-003-20250926    gcc-15.1.0
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20250926    clang-22
riscv                 randconfig-002-20250926    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250926    clang-22
s390                  randconfig-002-20250926    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250926    gcc-12.5.0
sh                    randconfig-002-20250926    gcc-15.1.0
sh                           se7712_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250926    gcc-14.3.0
sparc                 randconfig-002-20250926    gcc-15.1.0
sparc64               randconfig-001-20250926    gcc-12.5.0
sparc64               randconfig-002-20250926    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                    randconfig-001-20250926    clang-22
um                    randconfig-002-20250926    clang-22
x86_64      buildonly-randconfig-001-20250926    clang-20
x86_64      buildonly-randconfig-002-20250926    clang-20
x86_64      buildonly-randconfig-003-20250926    gcc-14
x86_64      buildonly-randconfig-004-20250926    gcc-14
x86_64      buildonly-randconfig-005-20250926    gcc-14
x86_64      buildonly-randconfig-006-20250926    gcc-14
xtensa                            allnoconfig    gcc-15.1.0
xtensa                       common_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250926    gcc-14.3.0
xtensa                randconfig-002-20250926    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

