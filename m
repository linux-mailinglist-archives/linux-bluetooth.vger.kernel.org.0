Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0928C456B7B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 19 Nov 2021 09:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234192AbhKSISY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 19 Nov 2021 03:18:24 -0500
Received: from mga04.intel.com ([192.55.52.120]:1535 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234345AbhKSISW (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 19 Nov 2021 03:18:22 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="233098431"
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; 
   d="scan'208";a="233098431"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2021 00:15:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; 
   d="scan'208";a="473468841"
Received: from intel-lenovo-legion-y540-15irh-pg0.iind.intel.com ([10.224.186.95])
  by orsmga002.jf.intel.com with ESMTP; 19 Nov 2021 00:15:19 -0800
From:   Kiran K <kiran.k@intel.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
        luiz.von.dentz@intel.com, Kiran K <kiran.k@intel.com>
Subject: [PATCH v4 12/14] Bluetooth: Implment MSFT avdtp suspend command
Date:   Fri, 19 Nov 2021 13:50:25 +0530
Message-Id: <20211119082027.12809-12-kiran.k@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211119082027.12809-1-kiran.k@intel.com>
References: <20211119082027.12809-1-kiran.k@intel.com>
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

In a2dp offload use case, to suspend streaming,
controller needs to sent MSFT avdtp suspend command. Allow BlueZ
daemon to send MSFT avdtp suspend command via setsockopt.

Signed-off-by: Kiran K <kiran.k@intel.com>
Reviewed-by: Chethan T N <chethan.tumkur.narayan@intel.com>
Reviewed-by: Srivatsa Ravishankar <ravishankar.srivatsa@intel.com>
---
 net/bluetooth/msft.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/net/bluetooth/msft.c b/net/bluetooth/msft.c
index e3f7503070a6..b505b32289f8 100644
--- a/net/bluetooth/msft.c
+++ b/net/bluetooth/msft.c
@@ -133,6 +133,12 @@ struct msft_cp_avdtp_start {
 	__le16	avdtp_handle;
 } __packed;
 
+#define MSFT_OP_AVDTP_SUSPEND			0x0A
+struct msft_cp_avdtp_suspend {
+	u8	sub_opcode;
+	__le16	avdtp_handle;
+} __packed;
+
 static int __msft_add_monitor_pattern(struct hci_dev *hdev,
 				      struct adv_monitor *monitor);
 static int __msft_remove_monitor(struct hci_dev *hdev,
@@ -903,6 +909,19 @@ static int msft_avdtp_start(struct hci_dev *hdev, struct sock *sk)
 	return hci_send_cmd(hdev, MSFT_OP_AVDTP, sizeof(cmd), &cmd);
 }
 
+static int msft_avdtp_suspend(struct hci_dev *hdev, struct sock *sk)
+{
+	struct msft_cp_avdtp_suspend cmd;
+
+	if (!bt_sk(sk)->avdtp_handle)
+		return -EBADFD;
+
+	cmd.sub_opcode = MSFT_OP_AVDTP_SUSPEND;
+	cmd.avdtp_handle = cpu_to_le16(bt_sk(sk)->avdtp_handle);
+
+	return hci_send_cmd(hdev, MSFT_OP_AVDTP, sizeof(cmd), &cmd);
+}
+
 int msft_avdtp_cmd(struct hci_dev *hdev, struct l2cap_chan *chan,
 		   sockptr_t optval, int optlen,
 		   struct sock *sk)
@@ -941,6 +960,10 @@ int msft_avdtp_cmd(struct hci_dev *hdev, struct l2cap_chan *chan,
 		err = msft_avdtp_start(hdev, sk);
 		break;
 
+	case MSFT_OP_AVDTP_SUSPEND:
+		err = msft_avdtp_suspend(hdev, sk);
+		break;
+
 	default:
 		err = -EINVAL;
 		bt_dev_err(hdev, "Invalid MSFT avdtp sub opcode = 0x%2.2x",
@@ -999,6 +1022,7 @@ void msft_cc_avdtp(struct hci_dev *hdev, struct sk_buff *skb)
 		break;
 
 	case MSFT_OP_AVDTP_START:
+	case MSFT_OP_AVDTP_SUSPEND:
 		break;
 
 	default:
-- 
2.17.1

