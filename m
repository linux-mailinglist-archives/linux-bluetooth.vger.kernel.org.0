Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E06D8370B87
	for <lists+linux-bluetooth@lfdr.de>; Sun,  2 May 2021 14:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbhEBMbe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 2 May 2021 08:31:34 -0400
Received: from mga04.intel.com ([192.55.52.120]:30094 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230255AbhEBMbe (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 2 May 2021 08:31:34 -0400
IronPort-SDR: uySOAWwx1WthjZbfHF7A4aEXjnYB5laz4eGPBiGItTzM5lTwQIXzKZepduHVM+PdQ2brAWTGOu
 6GdNjlRDalrQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9972"; a="195509153"
X-IronPort-AV: E=Sophos;i="5.82,267,1613462400"; 
   d="scan'208";a="195509153"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2021 05:30:42 -0700
IronPort-SDR: ZBHlE1M0e0+72d8q62mTyokXpMwmZ19t13N60qeWUxAproM+T2CKcswdaWcxbmbibQyW3QIOBa
 jcIkgsGqFS+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,267,1613462400"; 
   d="scan'208";a="538367133"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by orsmga004.jf.intel.com with ESMTP; 02 May 2021 05:30:40 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Kiran K <kiran.k@intel.com>,
        Chethan T N <chethan.tumkur.narayan@intel.com>,
        Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
Subject: [PATCH v6 2/2] Bluetooth: Add support for Read Local Supported Codecs V2
Date:   Sun,  2 May 2021 18:04:42 +0530
Message-Id: <20210502123442.19483-2-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210502123442.19483-1-kiran.k@intel.com>
References: <20210502123442.19483-1-kiran.k@intel.com>
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

 include/net/bluetooth/hci.h | 28 ++++++++++++++
 net/bluetooth/hci_core.c    | 76 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index c03afb77071d..91bf48258f6f 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -1334,6 +1334,34 @@ struct hci_rp_read_local_pairing_opts {
 	__u8     max_key_size;
 } __packed;
 
+#define HCI_OP_READ_LOCAL_CODECS_V2	0x100d
+struct hci_standard_codec_v2 {
+	__u8	codec_id;
+	__u8	transport;
+} __packed;
+
+struct hci_standard_codecs_v2 {
+	__u8	num;
+	struct hci_standard_codec_v2 codec[];
+} __packed;
+
+struct hci_vendor_codec_v2 {
+	__le16	company_id;
+	__le16	vendor_id;
+	__u8	transport;
+} __packed;
+
+struct hci_vendor_codecs_v2 {
+	__u8	num;
+	struct hci_vendor_codec_v2 codec[];
+} __packed;
+
+struct hci_rp_read_local_supported_codecs_v2 {
+	__u8	status;
+	struct hci_standard_codecs_v2 std_codecs;
+	struct hci_vendor_codecs_v2 vendor_codecs;
+} __packed;
+
 #define HCI_OP_READ_LOCAL_CODEC_CAPS	0x100e
 struct hci_op_read_local_codec_caps {
 	__u8	codec_id[5];
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index d0439f6b2d6a..7d663c91ba30 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -1006,6 +1006,28 @@ static void hci_codec_list_parse(struct hci_dev *hdev, __u8 num_codecs,
 	}
 }
 
+static void hci_codec_list_parse_v2(struct hci_dev *hdev, __u8 num_codecs,
+				    void *codec_list, bool is_vendor_codec)
+{
+	__u8 i;
+
+	for (i = 0; i < num_codecs; i++) {
+		if (!is_vendor_codec) {
+			struct hci_standard_codecs_v2 *codecs = codec_list;
+
+			hci_read_codec_capabilities(hdev, &codecs->codec[i],
+						    codecs->codec[i].transport,
+						    is_vendor_codec);
+		} else {
+			struct hci_vendor_codecs_v2 *codecs = codec_list;
+
+			hci_read_codec_capabilities(hdev, &codecs->codec[i],
+						    codecs->codec[i].transport,
+						    is_vendor_codec);
+		}
+	}
+}
+
 static void hci_read_supported_codecs(struct hci_dev *hdev)
 {
 	struct sk_buff *skb;
@@ -1056,10 +1078,62 @@ static void hci_read_supported_codecs(struct hci_dev *hdev)
 	kfree_skb(skb);
 }
 
+static void hci_read_supported_codecs_v2(struct hci_dev *hdev)
+{
+	struct sk_buff *skb;
+	struct hci_rp_read_local_supported_codecs_v2 *rp;
+	struct hci_standard_codecs_v2 *std_codecs;
+	struct hci_vendor_codecs_v2 *vendor_codecs;
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
+	if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
+	    + sizeof(std_codecs->num))
+		goto error;
+
+	hci_codec_list_parse_v2(hdev, std_codecs->num, std_codecs, false);
+
+	skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
+		 + sizeof(std_codecs->num));
+
+	vendor_codecs = (void *)skb->data;
+
+	if (skb->len <
+	    flex_array_size(vendor_codecs, codec, vendor_codecs->num)
+	    + sizeof(vendor_codecs->num))
+		goto error;
+
+	hci_codec_list_parse_v2(hdev, vendor_codecs->num, vendor_codecs, true);
+
+error:
+	kfree_skb(skb);
+}
+
 static void hci_init5_req(struct hci_dev *hdev)
 {
 	/* Read local codec list if the HCI command is supported */
-	if (hdev->commands[29] & 0x20)
+	if (hdev->commands[45] & 0x04)
+		hci_read_supported_codecs_v2(hdev);
+	else if (hdev->commands[29] & 0x20)
 		hci_read_supported_codecs(hdev);
 }
 
-- 
2.17.1

