Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5AA4586F60
	for <lists+linux-bluetooth@lfdr.de>; Mon,  1 Aug 2022 19:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbiHARPg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 1 Aug 2022 13:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233304AbiHARP0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 1 Aug 2022 13:15:26 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE11E0E
        for <linux-bluetooth@vger.kernel.org>; Mon,  1 Aug 2022 10:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659374119; x=1690910119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+HEywQc3yltAlIL/OLIHdsJrxElUdqoajwkwIQzJEM4=;
  b=nF9x8iB8MDeeM1KUi03JIhc7AlBn4g0p1Ms/M5elhkZz7uvMHXPCj3X2
   pE32qTSqMR6ihfVXIsqn6DbEapupYjRrh/nsmW5tdEmDvoMOI6LHwkdC0
   HOOAEQbRnfDzb1BZXsL7fLsrVAPXGG0RxXLxqwIiD29Y0DrXhBryo7mRM
   njomKA+tt2IFggawjFw/TDpOwfDtlsu6qfNGm6oW3ka0/rcgEg0vnv2hR
   A2RxYoLIUFFdh88gtatojBmZt1RN5qW1nj9OCUgmB2J7K1iM8bC0XpWFJ
   Tplx/HnoEYIr74YlxBYjpZm9uefvuWlCKrU0xkV6gLOLfZPjiGLyC0WYQ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="276104770"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="276104770"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 10:15:16 -0700
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="847899626"
Received: from gestarne-mobl.amr.corp.intel.com (HELO bgi1-mobl2.amr.corp.intel.com) ([10.212.120.49])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 10:15:16 -0700
From:   Brian Gix <brian.gix@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     marcel@holtmann.org, luiz.dentz@gmail.com, brian.gix@intel.com
Subject: [PATCH v6 04/10] Bluetooth: Convert SCO configure_datapath to hci_sync
Date:   Mon,  1 Aug 2022 10:14:59 -0700
Message-Id: <20220801171505.1271059-5-brian.gix@intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220801171505.1271059-1-brian.gix@intel.com>
References: <20220801171505.1271059-1-brian.gix@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Recoding HCI cmds to offload SCO codec to use hci_sync mechanism rather
than deprecated hci_request mechanism.

Signed-off-by: Brian Gix <brian.gix@intel.com>
---
 net/bluetooth/hci_conn.c    | 86 ++++++++++++++++++++++++++++++++-----
 net/bluetooth/hci_request.c | 47 --------------------
 net/bluetooth/hci_request.h |  2 -
 3 files changed, 75 insertions(+), 60 deletions(-)

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index f54864e19866..2bda50d9e3ab 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -44,6 +44,11 @@ struct sco_param {
 	u8  retrans_effort;
 };
 
+struct conn_handle_t {
+	struct hci_conn *conn;
+	__u16 handle;
+};
+
 static const struct sco_param esco_param_cvsd[] = {
 	{ EDR_ESCO_MASK & ~ESCO_2EV3, 0x000a,	0x01 }, /* S3 */
 	{ EDR_ESCO_MASK & ~ESCO_2EV3, 0x0007,	0x01 }, /* S2 */
@@ -316,17 +321,60 @@ static bool find_next_esco_param(struct hci_conn *conn,
 	return conn->attempt <= size;
 }
 
-static bool hci_enhanced_setup_sync_conn(struct hci_conn *conn, __u16 handle)
+static int configure_datapath_sync(struct hci_dev *hdev, struct bt_codec *codec)
 {
-	struct hci_dev *hdev = conn->hdev;
+	int err;
+	__u8 vnd_len, *vnd_data = NULL;
+	struct hci_op_configure_data_path *cmd = NULL;
+
+	err = hdev->get_codec_config_data(hdev, ESCO_LINK, codec, &vnd_len,
+					  &vnd_data);
+	if (err < 0)
+		goto error;
+
+	cmd = kzalloc(sizeof(*cmd) + vnd_len, GFP_KERNEL);
+	if (!cmd) {
+		err = -ENOMEM;
+		goto error;
+	}
+
+	err = hdev->get_data_path_id(hdev, &cmd->data_path_id);
+	if (err < 0)
+		goto error;
+
+	cmd->vnd_len = vnd_len;
+	memcpy(cmd->vnd_data, vnd_data, vnd_len);
+
+	cmd->direction = 0x00;
+	__hci_cmd_sync_status(hdev, HCI_CONFIGURE_DATA_PATH,
+			      sizeof(*cmd) + vnd_len, cmd, HCI_CMD_TIMEOUT);
+
+	cmd->direction = 0x01;
+	err = __hci_cmd_sync_status(hdev, HCI_CONFIGURE_DATA_PATH,
+				    sizeof(*cmd) + vnd_len, cmd,
+				    HCI_CMD_TIMEOUT);
+error:
+
+	kfree(cmd);
+	kfree(vnd_data);
+	return err;
+}
+
+static int hci_enhanced_setup_sync(struct hci_dev *hdev, void *data)
+{
+	struct conn_handle_t *conn_handle = data;
+	struct hci_conn *conn = conn_handle->conn;
+	__u16 handle = conn_handle->handle;
 	struct hci_cp_enhanced_setup_sync_conn cp;
 	const struct sco_param *param;
 
+	kfree(conn_handle);
+
 	bt_dev_dbg(hdev, "hcon %p", conn);
 
 	/* for offload use case, codec needs to configured before opening SCO */
 	if (conn->codec.data_path)
-		hci_req_configure_datapath(hdev, &conn->codec);
+		configure_datapath_sync(hdev, &conn->codec);
 
 	conn->state = BT_CONNECT;
 	conn->out = true;
@@ -344,7 +392,7 @@ static bool hci_enhanced_setup_sync_conn(struct hci_conn *conn, __u16 handle)
 	case BT_CODEC_MSBC:
 		if (!find_next_esco_param(conn, esco_param_msbc,
 					  ARRAY_SIZE(esco_param_msbc)))
-			return false;
+			return -EINVAL;
 
 		param = &esco_param_msbc[conn->attempt - 1];
 		cp.tx_coding_format.id = 0x05;
@@ -396,11 +444,11 @@ static bool hci_enhanced_setup_sync_conn(struct hci_conn *conn, __u16 handle)
 		if (lmp_esco_capable(conn->link)) {
 			if (!find_next_esco_param(conn, esco_param_cvsd,
 						  ARRAY_SIZE(esco_param_cvsd)))
-				return false;
+				return -EINVAL;
 			param = &esco_param_cvsd[conn->attempt - 1];
 		} else {
 			if (conn->attempt > ARRAY_SIZE(sco_param_cvsd))
-				return false;
+				return -EINVAL;
 			param = &sco_param_cvsd[conn->attempt - 1];
 		}
 		cp.tx_coding_format.id = 2;
@@ -423,7 +471,7 @@ static bool hci_enhanced_setup_sync_conn(struct hci_conn *conn, __u16 handle)
 		cp.out_transport_unit_size = 16;
 		break;
 	default:
-		return false;
+		return -EINVAL;
 	}
 
 	cp.retrans_effort = param->retrans_effort;
@@ -431,9 +479,9 @@ static bool hci_enhanced_setup_sync_conn(struct hci_conn *conn, __u16 handle)
 	cp.max_latency = __cpu_to_le16(param->max_latency);
 
 	if (hci_send_cmd(hdev, HCI_OP_ENHANCED_SETUP_SYNC_CONN, sizeof(cp), &cp) < 0)
-		return false;
+		return -EIO;
 
-	return true;
+	return 0;
 }
 
 static bool hci_setup_sync_conn(struct hci_conn *conn, __u16 handle)
@@ -490,8 +538,24 @@ static bool hci_setup_sync_conn(struct hci_conn *conn, __u16 handle)
 
 bool hci_setup_sync(struct hci_conn *conn, __u16 handle)
 {
-	if (enhanced_sync_conn_capable(conn->hdev))
-		return hci_enhanced_setup_sync_conn(conn, handle);
+	int result;
+	struct conn_handle_t *conn_handle;
+
+	if (enhanced_sync_conn_capable(conn->hdev)) {
+		conn_handle = kzalloc(sizeof(*conn_handle), GFP_KERNEL);
+
+		if (!conn_handle)
+			return false;
+
+		conn_handle->conn = conn;
+		conn_handle->handle = handle;
+		result = hci_cmd_sync_queue(conn->hdev, hci_enhanced_setup_sync,
+					    conn_handle, NULL);
+		if (result < 0)
+			kfree(conn_handle);
+
+		return result == 0;
+	}
 
 	return hci_setup_sync_conn(conn, handle);
 }
diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index ef0a5ec067b6..d14e50951aec 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -1975,53 +1975,6 @@ int hci_abort_conn(struct hci_conn *conn, u8 reason)
 	return 0;
 }
 
-static void config_data_path_complete(struct hci_dev *hdev, u8 status,
-				      u16 opcode)
-{
-	bt_dev_dbg(hdev, "status %u", status);
-}
-
-int hci_req_configure_datapath(struct hci_dev *hdev, struct bt_codec *codec)
-{
-	struct hci_request req;
-	int err;
-	__u8 vnd_len, *vnd_data = NULL;
-	struct hci_op_configure_data_path *cmd = NULL;
-
-	hci_req_init(&req, hdev);
-
-	err = hdev->get_codec_config_data(hdev, ESCO_LINK, codec, &vnd_len,
-					  &vnd_data);
-	if (err < 0)
-		goto error;
-
-	cmd = kzalloc(sizeof(*cmd) + vnd_len, GFP_KERNEL);
-	if (!cmd) {
-		err = -ENOMEM;
-		goto error;
-	}
-
-	err = hdev->get_data_path_id(hdev, &cmd->data_path_id);
-	if (err < 0)
-		goto error;
-
-	cmd->vnd_len = vnd_len;
-	memcpy(cmd->vnd_data, vnd_data, vnd_len);
-
-	cmd->direction = 0x00;
-	hci_req_add(&req, HCI_CONFIGURE_DATA_PATH, sizeof(*cmd) + vnd_len, cmd);
-
-	cmd->direction = 0x01;
-	hci_req_add(&req, HCI_CONFIGURE_DATA_PATH, sizeof(*cmd) + vnd_len, cmd);
-
-	err = hci_req_run(&req, config_data_path_complete);
-error:
-
-	kfree(cmd);
-	kfree(vnd_data);
-	return err;
-}
-
 void hci_request_setup(struct hci_dev *hdev)
 {
 	INIT_DELAYED_WORK(&hdev->adv_instance_expire, adv_timeout_expire);
diff --git a/net/bluetooth/hci_request.h b/net/bluetooth/hci_request.h
index faf6d9a51a91..41e0b84f2042 100644
--- a/net/bluetooth/hci_request.h
+++ b/net/bluetooth/hci_request.h
@@ -113,8 +113,6 @@ int hci_get_random_address(struct hci_dev *hdev, bool require_privacy,
 void __hci_req_update_class(struct hci_request *req);
 
 /* Returns true if HCI commands were queued */
-int hci_req_configure_datapath(struct hci_dev *hdev, struct bt_codec *codec);
-
 void __hci_req_update_scan(struct hci_request *req);
 
 int hci_update_random_address(struct hci_request *req, bool require_privacy,
-- 
2.37.1

