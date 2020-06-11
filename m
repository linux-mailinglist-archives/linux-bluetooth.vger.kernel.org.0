Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025991F66F7
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 Jun 2020 13:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgFKLot (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 11 Jun 2020 07:44:49 -0400
Received: from mga12.intel.com ([192.55.52.136]:26678 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727053AbgFKLot (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 11 Jun 2020 07:44:49 -0400
IronPort-SDR: ADLqV6gLNFBRWzV9nVssr6VEU7PsKFiXFSIT9RV7PnqiTC1/auEoUNHG+dSqU09aNmucjVzzsh
 eH4fmNgbi8Kg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 04:44:49 -0700
IronPort-SDR: 3aBYBeqRXRJXIsYXHRRUKTDkE4JJnIm1NtMB2H9u4Xc6rW/oxdZd/CfDm+TnuOMsdcGEstzDTt
 kCzn/Dv3MMBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,499,1583222400"; 
   d="scan'208";a="296562824"
Received: from unknown (HELO intel-Lenovo-Legion-Y540-15IRH-PG0.iind.intel.com) ([10.224.186.95])
  by fmsmga004.fm.intel.com with ESMTP; 11 Jun 2020 04:44:47 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, kiraank@gmail.com,
        Kiran K <kiran.k@intel.com>
Subject: [PATCH 0/4] Add support for new generation Intel controllers
Date:   Thu, 11 Jun 2020 17:15:22 +0530
Message-Id: <20200611114526.13594-1-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi All,
This patchset series defines a structure and few helper functions required
to enable new generation Intel controllers

Raghuram Hegde (4):
  Bluetooth: btintel: Define tlv structure to enable firmware download
  Bluetooth: btintel: Add helper functions to dump boot/firmware info
  Bluetooth: btintel: Add helper functions to parse firmware name
  Bluetooth: btintel: Add helper function to help controller type

 drivers/bluetooth/btintel.c | 173 ++++++++++++++++++++++++++++++++++++
 drivers/bluetooth/btintel.h |  49 ++++++++++
 2 files changed, 222 insertions(+)

-- 
2.17.1

