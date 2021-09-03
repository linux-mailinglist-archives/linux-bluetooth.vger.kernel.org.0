Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E6B3FFE70
	for <lists+linux-bluetooth@lfdr.de>; Fri,  3 Sep 2021 12:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349204AbhICKyE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 3 Sep 2021 06:54:04 -0400
Received: from mga02.intel.com ([134.134.136.20]:35135 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349223AbhICKyC (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 3 Sep 2021 06:54:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="206611703"
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; 
   d="scan'208";a="206611703"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2021 03:53:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; 
   d="scan'208";a="692090016"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by fmsmga005.fm.intel.com with ESMTP; 03 Sep 2021 03:53:00 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        tedd.an@intel.com, luiz.von.dentz@intel.com,
        Kiran K <kiran.k@intel.com>
Subject: [PATCH v14 02/12] Bluetooth: Add support for Read Local Supported Codecs V2
Date:   Fri,  3 Sep 2021 16:28:03 +0530
Message-Id: <20210903105813.2440-2-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210903105813.2440-1-kiran.k@intel.com>
References: <20210903105813.2440-1-kiran.k@intel.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Use V2 version of read local supported command is controller
supports

snoop:
> HCI Event: Command Complete (0x0e) plen 20
      Read Local Supported Codecs V2 (0x04|0x000d) ncmd 1
        Status: Success (0x00)
        Number of supported codecs: 7
          Codec: u-law log (0x00)
          Logical Transport Type: 0x02
            Codec supported over BR/EDR SCO and eSCO
          Codec: A-law log (0x01)
          Logical Transport Type: 0x02
            Codec supported over BR/EDR SCO and eSCO
          Codec: CVSD (0x02)
          Logical Transport Type: 0x02
            Codec supported over BR/EDR SCO and eSCO
          Codec: Transparent (0x03)
          Logical Transport Type: 0x02
            Codec supported over BR/EDR SCO and eSCO
          Codec: Linear PCM (0x04)
          Logical Transport Type: 0x02
            Codec supported over BR/EDR SCO and eSCO
          Codec: Reserved (0x08)
          Logical Transport Type: 0x03
            Codec supported over BR/EDR ACL
            Codec supported over BR/EDR SCO and eSCO
          Codec: mSBC (0x05)
          Logical Transport Type: 0x03
            Codec supported over BR/EDR ACL
            Codec supported over BR/EDR SCO and eSCO
        Number of vendor codecs: 0
......
< HCI Command: Read Local Suppor.. (0x04|0x000e) plen 7
        Codec: mSBC (0x05)
        Logical Transport Type: 0x00
        Direction: Input (Host to Controller) (0x00)
> HCI Event: Command Complete (0x0e) plen 12
      Read Local Supported Codec Capabilities (0x04|0x000e) ncmd 1
        Status: Success (0x00)
        Number of codec capabilities: 1
         Capabilities #0:
        00 00 11 15 02 33

Signed-off-by: Kiran K <kiran.k@intel.com>
Signed-off-by: Chethan T N <chethan.tumkur.narayan@intel.com>
Signed-off-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
---

Notes:
    * changes in v14:
     - No changes
    
    * changes in v13:
     - No changes
    
    * changes in v12:
     - Refactor code related to reading codec capabilities
    
    * changes in v11:
      - Remove Kconfig related changes
      - Move codec related functions to hci_codec.c
    
    * changes in v10:
      no changes
    
    * changes in v9:
      use vnd as shortcut name for vendor instead of ven
    
    * changes in v8:
      no changes
    
    * changes in v7:
      call codec enumeration code in hci_init instead of having it in a separate
      function
    
    * changes in v6
      no changes
    
    * changes in v5:
      fix review comments
    
    * changes in v4:
      converts codec read capabilities calls from async to sync
    
    * changes in v3:
      No changes
    
    * changes in v2:
      add length check for event data before accessing

 include/net/bluetooth/hci.h | 29 ++++++++++++++++
 net/bluetooth/hci_codec.c   | 66 +++++++++++++++++++++++++++++++++++++
 net/bluetooth/hci_codec.h   |  1 +
 net/bluetooth/hci_core.c    |  4 ++-
 4 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 13a93da6b76c..ad88e5d44d7c 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -1338,6 +1338,35 @@ struct hci_rp_read_local_pairing_opts {
 	__u8     max_key_size;
 } __packed;
 
+#define HCI_OP_READ_LOCAL_CODECS_V2	0x100d
+struct hci_std_codec_v2 {
+	__u8	id;
+	__u8	transport;
+} __packed;
+
+struct hci_std_codecs_v2 {
+	__u8	num;
+	struct hci_std_codec_v2 codec[];
+} __packed;
+
+struct hci_vnd_codec_v2 {
+	__u8	id;
+	__le16	cid;
+	__le16	vid;
+	__u8	transport;
+} __packed;
+
+struct hci_vnd_codecs_v2 {
+	__u8	num;
+	struct hci_vnd_codec_v2 codec[];
+} __packed;
+
+struct hci_rp_read_local_supported_codecs_v2 {
+	__u8	status;
+	struct hci_std_codecs_v2 std_codecs;
+	struct hci_vnd_codecs_v2 vendor_codecs;
+} __packed;
+
 #define HCI_OP_READ_LOCAL_CODEC_CAPS	0x100e
 struct hci_op_read_local_codec_caps {
 	__u8	id;
diff --git a/net/bluetooth/hci_codec.c b/net/bluetooth/hci_codec.c
index f86ca6ba5814..f0421d0edaa3 100644
--- a/net/bluetooth/hci_codec.c
+++ b/net/bluetooth/hci_codec.c
@@ -170,3 +170,69 @@ void hci_read_supported_codecs(struct hci_dev *hdev)
 error:
 	kfree_skb(skb);
 }
+
+void hci_read_supported_codecs_v2(struct hci_dev *hdev)
+{
+	struct sk_buff *skb;
+	struct hci_rp_read_local_supported_codecs_v2 *rp;
+	struct hci_std_codecs_v2 *std_codecs;
+	struct hci_vnd_codecs_v2 *vnd_codecs;
+	struct hci_op_read_local_codec_caps caps;
+	__u8 i;
+
+	skb = __hci_cmd_sync(hdev, HCI_OP_READ_LOCAL_CODECS_V2, 0, NULL,
+			     HCI_CMD_TIMEOUT);
+
+	if (IS_ERR(skb)) {
+		bt_dev_err(hdev, "Failed to read local supported codecs (%ld)",
+			   PTR_ERR(skb));
+		return;
+	}
+
+	if (skb->len < sizeof(*rp))
+		goto error;
+
+	rp = (void *)skb->data;
+
+	if (rp->status)
+		goto error;
+
+	skb_pull(skb, sizeof(rp->status));
+
+	std_codecs = (void *)skb->data;
+
+	/* check for payload data length before accessing */
+	if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
+	    + sizeof(std_codecs->num))
+		goto error;
+
+	memset(&caps, 0, sizeof(caps));
+
+	for (i = 0; i < std_codecs->num; i++) {
+		caps.id = std_codecs->codec[i].id;
+		hci_read_codec_capabilities(hdev, std_codecs->codec[i].transport,
+					    &caps);
+	}
+
+	skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
+		 + sizeof(std_codecs->num));
+
+	vnd_codecs = (void *)skb->data;
+
+	/* check for payload data length before accessing */
+	if (skb->len <
+	    flex_array_size(vnd_codecs, codec, vnd_codecs->num)
+	    + sizeof(vnd_codecs->num))
+		goto error;
+
+	for (i = 0; i < vnd_codecs->num; i++) {
+		caps.id = 0xFF;
+		caps.cid = vnd_codecs->codec[i].cid;
+		caps.vid = vnd_codecs->codec[i].vid;
+		hci_read_codec_capabilities(hdev, vnd_codecs->codec[i].transport,
+					    &caps);
+	}
+
+error:
+	kfree_skb(skb);
+}
diff --git a/net/bluetooth/hci_codec.h b/net/bluetooth/hci_codec.h
index efb0df634ac6..a2751930f123 100644
--- a/net/bluetooth/hci_codec.h
+++ b/net/bluetooth/hci_codec.h
@@ -3,4 +3,5 @@
 /* Copyright (C) 2014 Intel Corporation */
 
 void hci_read_supported_codecs(struct hci_dev *hdev);
+void hci_read_supported_codecs_v2(struct hci_dev *hdev);
 void hci_codec_list_clear(struct list_head *codec_list);
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index a80d813ef743..5236faa397fa 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -935,7 +935,9 @@ static int __hci_init(struct hci_dev *hdev)
 		return err;
 
 	/* Read local codec list if the HCI command is supported */
-	if (hdev->commands[29] & 0x20)
+	if (hdev->commands[45] & 0x04)
+		hci_read_supported_codecs_v2(hdev);
+	else if (hdev->commands[29] & 0x20)
 		hci_read_supported_codecs(hdev);
 
 	/* This function is only called when the controller is actually in
-- 
2.17.1

