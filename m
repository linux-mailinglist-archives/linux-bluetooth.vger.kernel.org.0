Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 845892122D5
	for <lists+linux-bluetooth@lfdr.de>; Thu,  2 Jul 2020 14:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbgGBMCG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 2 Jul 2020 08:02:06 -0400
Received: from mga14.intel.com ([192.55.52.115]:27652 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728697AbgGBMCG (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 2 Jul 2020 08:02:06 -0400
IronPort-SDR: TG4/sEYIa8m7xIk78sPgt0iAGN5zZBnq7BZcoqy5obJY+9FhCgljYP7rRPWxTK/HnvVItVrAIu
 XOyRW3IvM9Kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="145947812"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="145947812"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2020 05:02:06 -0700
IronPort-SDR: djcz1Eo83MXMCRmRyJRqmliIvD50mP7od4NQwsU9NZN8B9U3eHLZJlhYI8DKZPZ2R/zEOyJ1jL
 cgZ2KVIE8yAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="304224689"
Received: from unknown (HELO intel-Lenovo-Legion-Y540-15IRH-PG0.iind.intel.com) ([10.224.186.95])
  by fmsmga004.fm.intel.com with ESMTP; 02 Jul 2020 05:02:04 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        kiraank@gmail.com, Kiran K <kiran.k@intel.com>
Subject: [PATCH 0/5]  Refactor firmware download
Date:   Thu,  2 Jul 2020 17:33:10 +0530
Message-Id: <20200702120315.26768-1-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

This patchset series refactors firmware download sequence to accomodate
new generation Intel controllers. Few functions have been split to enhance
readability and reusability.

Kiran K (5):
  Bluetooth: btintel: Make controller version read generic
  Bluetooth: btintel: Refactor firmware header download sequence
  Bluetooth: btintel: Refactor firmware payload download code
  Bluetooth: btintel: Define tlv structure for new generation
    Controllers
  Bluetooth: btintel: Parse controller information present in TLV format

 drivers/bluetooth/btintel.c   | 223 ++++++++++++++++++++++++++++++----
 drivers/bluetooth/btintel.h   | 110 +++++++++++++++--
 drivers/bluetooth/btusb.c     |  73 +++++++----
 drivers/bluetooth/hci_ag6xx.c |  12 +-
 drivers/bluetooth/hci_intel.c |  14 ++-
 5 files changed, 369 insertions(+), 63 deletions(-)

-- 
2.17.1

