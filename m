Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D525426C47
	for <lists+linux-bluetooth@lfdr.de>; Fri,  8 Oct 2021 16:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbhJHOE7 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 8 Oct 2021 10:04:59 -0400
Received: from mga17.intel.com ([192.55.52.151]:29654 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230376AbhJHOE7 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 8 Oct 2021 10:04:59 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="207321183"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; 
   d="scan'208";a="207321183"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2021 07:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; 
   d="scan'208";a="715521107"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by fmsmga005.fm.intel.com with ESMTP; 08 Oct 2021 07:03:01 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        luiz.von.dentz@intel.com, Kiran K <kiran.k@intel.com>
Subject: [PATCH v2 7/7] Bluetooth: Read Output codec capabilities
Date:   Fri,  8 Oct 2021 19:37:59 +0530
Message-Id: <20211008140759.15493-7-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211008140759.15493-1-kiran.k@intel.com>
References: <20211008140759.15493-1-kiran.k@intel.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When reading codec capabilities, read output (controller to host)
capabilities also along with input (host to controller) capabilities.

Signed-off-by: Kiran K <kiran.k@intel.com>
---
 net/bluetooth/hci_codec.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/net/bluetooth/hci_codec.c b/net/bluetooth/hci_codec.c
index 6d4e5353f05c..c6bd934dcf36 100644
--- a/net/bluetooth/hci_codec.c
+++ b/net/bluetooth/hci_codec.c
@@ -159,6 +159,9 @@ void hci_read_supported_codecs(struct hci_dev *hdev)
 		caps.id = std_codecs->codec[i];
 		caps.direction = 0x00;
 		hci_read_codec_capabilities(hdev, LOCAL_CODEC_ACL_MASK, &caps);
+
+		caps.direction = 0x01;
+		hci_read_codec_capabilities(hdev, LOCAL_CODEC_ACL_MASK, &caps);
 	}
 
 	skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
@@ -179,6 +182,9 @@ void hci_read_supported_codecs(struct hci_dev *hdev)
 		caps.vid = vnd_codecs->codec[i].vid;
 		caps.direction = 0x00;
 		hci_read_codec_capabilities(hdev, LOCAL_CODEC_ACL_MASK, &caps);
+
+		caps.direction = 0x01;
+		hci_read_codec_capabilities(hdev, LOCAL_CODEC_ACL_MASK, &caps);
 	}
 
 error:
@@ -224,6 +230,10 @@ void hci_read_supported_codecs_v2(struct hci_dev *hdev)
 
 	for (i = 0; i < std_codecs->num; i++) {
 		caps.id = std_codecs->codec[i].id;
+		caps.direction = 0x00;
+		hci_read_codec_capabilities(hdev, std_codecs->codec[i].transport,
+					    &caps);
+		caps.direction = 0x01;
 		hci_read_codec_capabilities(hdev, std_codecs->codec[i].transport,
 					    &caps);
 	}
@@ -243,6 +253,10 @@ void hci_read_supported_codecs_v2(struct hci_dev *hdev)
 		caps.id = 0xFF;
 		caps.cid = vnd_codecs->codec[i].cid;
 		caps.vid = vnd_codecs->codec[i].vid;
+		caps.direction = 0x00;
+		hci_read_codec_capabilities(hdev, vnd_codecs->codec[i].transport,
+					    &caps);
+		caps.direction = 0x01;
 		hci_read_codec_capabilities(hdev, vnd_codecs->codec[i].transport,
 					    &caps);
 	}
-- 
2.17.1

