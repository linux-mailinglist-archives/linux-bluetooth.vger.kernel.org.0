Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B22F6A282A
	for <lists+linux-bluetooth@lfdr.de>; Sat, 25 Feb 2023 10:17:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjBYJR2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 25 Feb 2023 04:17:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjBYJR1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 25 Feb 2023 04:17:27 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BBB412F21
        for <linux-bluetooth@vger.kernel.org>; Sat, 25 Feb 2023 01:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677316647; x=1708852647;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/yErBe6D0uKw6yjMZBPgOO3WtzKg78Xvh6f5T9JK4M0=;
  b=d1H0+57ijt59xDMoVFadri/joU/+33cbkJXOmw73hdYm44JHXdggUqiD
   4gg+o0Nhlby8b22OkDbFqW020gxuxSZadgI/GSmMhMUH6CDWF7miBg++x
   wy08RP71rTeLrc4DWD1Q0HK21lPUZt0xVf1H38A3wxHmEa8DX5uwU/qE6
   n558PbEqBN1IIaVr2RS9W6/dlP+eJwQrm0TpBHA5cK7etNXj5gO8R59KB
   XnUwI+HhESJaQHp2V/6NETQqPrhgfhRhw+4kmJfb8AbGwRbh5QEi2Cgjh
   A5SQgmZbVP2j8dql/cj6ABY0qvt+AN2uhmpDQeKYGaMQOsLl8bcV2dJSS
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="361159775"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="361159775"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 01:17:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="673160305"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="673160305"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Feb 2023 01:17:25 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pVqgG-00035D-2t;
        Sat, 25 Feb 2023 09:17:24 +0000
Date:   Sat, 25 Feb 2023 17:16:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc:     linux-bluetooth@vger.kernel.org
Subject: [bluetooth-next:master] BUILD SUCCESS
 fbfd2d6d43f8e701f89692e05fcb34e904b087b4
Message-ID: <63f9d1f9.BwZ1OCUMmJ6SnjIk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
branch HEAD: fbfd2d6d43f8e701f89692e05fcb34e904b087b4  Bluetooth: btrtl: Add support for RTL8852BS

elapsed time: 723m

configs tested: 19
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
clang                                   alpha   defconfig
gcc                                       arc   defconfig
gcc                                       arm   defconfig
gcc                                     arm64   defconfig
gcc                                      csky   defconfig
gcc                                      i386   defconfig
gcc                                      ia64   defconfig
gcc                                 loongarch   defconfig
gcc                                      m68k   defconfig
gcc                                     nios2   defconfig
gcc                                    parisc   defconfig
gcc                                  parisc64   defconfig
gcc                                     riscv   defconfig
gcc                                     riscv   rv32_defconfig
gcc                                      s390   defconfig
gcc                                     sparc   defconfig
gcc                                        um   i386_defconfig
gcc                                        um   x86_64_defconfig
gcc                                    x86_64   defconfig
gcc                                                  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
