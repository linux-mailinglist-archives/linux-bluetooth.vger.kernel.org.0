Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF593EE8CA
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Aug 2021 10:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235135AbhHQIpx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 17 Aug 2021 04:45:53 -0400
Received: from mga14.intel.com ([192.55.52.115]:12889 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235078AbhHQIpx (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 17 Aug 2021 04:45:53 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="215749643"
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; 
   d="scan'208";a="215749643"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2021 01:45:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; 
   d="scan'208";a="680218547"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by fmsmga005.fm.intel.com with ESMTP; 17 Aug 2021 01:45:18 -0700
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, Kiran K <kiran.k@intel.com>
Subject: [PATCH v2] emulator: Add support enhanced SCO connection
Date:   Tue, 17 Aug 2021 14:19:41 +0530
Message-Id: <20210817084941.22484-1-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Add support for enhanced_setup_synchronous_connection command
in btdev
---
changes in v2:
 - Remove signoff line from commmit message
 - fix checkpatch warnings

 emulator/btdev.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/emulator/btdev.c b/emulator/btdev.c
index f8daf4587cd9..86c9b475098e 100644
--- a/emulator/btdev.c
+++ b/emulator/btdev.c
@@ -2488,6 +2488,59 @@ static void set_common_commands_bredr20(struct btdev *btdev)
 	btdev->commands[16] |= 0x04;	/* Enable Device Under Test Mode */
 }
 
+static int cmd_enhanced_setup_sync_conn(struct btdev *dev, const void *data,
+					uint8_t len)
+{
+	const struct bt_hci_cmd_enhanced_setup_sync_conn *cmd = data;
+	uint8_t status =  BT_HCI_ERR_SUCCESS;
+
+	if (cmd->tx_coding_format[0] > 5)
+		status = BT_HCI_ERR_INVALID_PARAMETERS;
+
+	cmd_status(dev, status, BT_HCI_EVT_SYNC_CONN_COMPLETE);
+
+	return 0;
+}
+
+static int cmd_enhanced_setup_sync_conn_complete(struct btdev *dev,
+						 const void *data, uint8_t len)
+{
+	const struct bt_hci_cmd_enhanced_setup_sync_conn *cmd = data;
+	struct bt_hci_evt_sync_conn_complete cc;
+	struct btdev_conn *conn;
+
+	memset(&cc, 0, sizeof(cc));
+
+	conn = queue_find(dev->conns, match_handle,
+				UINT_TO_PTR(le16_to_cpu(cmd->handle)));
+	if (!conn) {
+		cc.status = BT_HCI_ERR_UNKNOWN_CONN_ID;
+		goto done;
+	}
+
+	conn = conn_add_sco(conn);
+	if (!conn) {
+		cc.status = BT_HCI_ERR_MEM_CAPACITY_EXCEEDED;
+		goto done;
+	}
+
+	cc.status = BT_HCI_ERR_SUCCESS;
+	memcpy(cc.bdaddr, conn->link->dev->bdaddr, 6);
+
+	cc.handle = cpu_to_le16(conn->handle);
+	cc.link_type = 0x02;
+	cc.tx_interval = 0x000c;
+	cc.retrans_window = 0x06;
+	cc.rx_pkt_len = 60;
+	cc.tx_pkt_len = 60;
+	cc.air_mode = cmd->tx_coding_format[0];
+
+done:
+	send_event(dev, BT_HCI_EVT_SYNC_CONN_COMPLETE, &cc, sizeof(cc));
+
+	return 0;
+}
+
 static int cmd_setup_sync_conn(struct btdev *dev, const void *data, uint8_t len)
 {
 	cmd_status(dev, BT_HCI_ERR_SUCCESS, BT_HCI_EVT_SYNC_CONN_COMPLETE);
@@ -2886,7 +2939,9 @@ static int cmd_get_mws_transport_config(struct btdev *dev, const void *data,
 	CMD(BT_HCI_CMD_READ_DATA_BLOCK_SIZE, cmd_read_data_block_size, NULL), \
 	CMD(BT_HCI_CMD_READ_LOCAL_CODECS, cmd_read_local_codecs, NULL), \
 	CMD(BT_HCI_CMD_GET_MWS_TRANSPORT_CONFIG, cmd_get_mws_transport_config, \
-					NULL)
+					NULL), \
+	CMD(BT_HCI_CMD_ENHANCED_SETUP_SYNC_CONN, cmd_enhanced_setup_sync_conn, \
+					cmd_enhanced_setup_sync_conn_complete)
 
 static const struct btdev_cmd cmd_bredr[] = {
 	CMD_COMMON_ALL,
@@ -2919,6 +2974,7 @@ static void set_bredr_commands(struct btdev *btdev)
 	btdev->commands[20] |= 0x10;	/* Read Encryption Key Size */
 	btdev->commands[23] |= 0x04;	/* Read Data Block Size */
 	btdev->commands[29] |= 0x20;	/* Read Local Supported Codecs */
+	btdev->commands[29] |= 0x08;	/* Enhanced Setup Synchronous Conn */
 	btdev->commands[30] |= 0x08;	/* Get MWS Transport Layer Config */
 	btdev->cmds = cmd_bredr;
 }
-- 
2.17.1

