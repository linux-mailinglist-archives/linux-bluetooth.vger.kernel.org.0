Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0DAF5B5A61
	for <lists+linux-bluetooth@lfdr.de>; Mon, 12 Sep 2022 14:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiILMpq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 12 Sep 2022 08:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiILMpl (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 12 Sep 2022 08:45:41 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F00D411A3E
        for <linux-bluetooth@vger.kernel.org>; Mon, 12 Sep 2022 05:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662986735; x=1694522735;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3CMCkOA8mGHb3oteDds4/fDrBfneJWig0Km/3eOThVQ=;
  b=WGRpLKrZE5flJV4MN3yxdSZvQGQrtpIC+0WOaUiLkf+qF6iIqmS4GWy8
   8CWNhu8T3C+5QF9UDOAt+05n0uqwVCFF+NY0p+n67zI31i26HR5EOMM92
   pP//L+HeD4zVhTeEI/CYfL0CNkYMH2M1cmzDRkcmzXU2kUIoP8RkQ3ZOj
   l+j3DdNGuKOxEKz3hytjIt+lcU8SjEQV2HcJq8swzCfpY0fDUORsp5RPi
   8vZyyVMzgrvfshq30PPL/EKNL2TeycguQ2ARJLGYJltFePI9Qgd6l+2D5
   kgoj4D23HCNPJKsVorGWKPgOWSQRQpP30l+0rYDjbfUEy+mUNlxePtvLw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="297855572"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="297855572"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 05:45:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="758382770"
Received: from bsblt022.iind.intel.com ([10.224.186.21])
  by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2022 05:45:20 -0700
From:   Sathish Narasimman <sathish.narasimman@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Sathish Narasimman <sathish.narasimman@intel.com>
Subject: [PATCH BlueZ 0/4] Volume Control Profile
Date:   Mon, 12 Sep 2022 18:16:53 +0530
Message-Id: <20220912124657.404551-1-sathish.narasimman@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Initial Development of Volment Control profile and its service
Volume Control Service.

Sathish Narasimman (4):
  lib/uuid: Add VCS UUIDs
  shared/vcp: Add initial code for handling VCP
  profiles: Add initial code for vcp plugin
  monitor/att: Add decoding support for Volume Control Serice

 Makefile.am          |    1 +
 Makefile.plugins     |    5 +
 configure.ac         |    4 +
 lib/uuid.h           |    7 +
 monitor/att.c        |  159 +++++++
 profiles/audio/vcp.c |  312 +++++++++++++
 src/shared/vcp.c     | 1033 ++++++++++++++++++++++++++++++++++++++++++
 src/shared/vcp.h     |   58 +++
 8 files changed, 1579 insertions(+)
 create mode 100644 profiles/audio/vcp.c
 create mode 100644 src/shared/vcp.c
 create mode 100644 src/shared/vcp.h

-- 
2.25.1

