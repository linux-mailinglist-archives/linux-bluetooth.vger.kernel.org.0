Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D792669407
	for <lists+linux-bluetooth@lfdr.de>; Mon, 15 Jul 2019 16:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404696AbfGOOst (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 15 Jul 2019 10:48:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:46828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404671AbfGOOss (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 15 Jul 2019 10:48:48 -0400
Received: from sasha-vm.mshome.net (unknown [73.61.17.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C20082067C;
        Mon, 15 Jul 2019 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563202126;
        bh=k3vcteP0xrQrR/GyC8cg3tZoGi+Qo1JFJf7nsk1pg5U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MPPeRPNoBgD0Prqv2NzL0QMmh3c/Qcx+crakRQlubYdWBQBSLkh4WqWIou7pUkdnL
         unRm77wOiamnXfPe94C8+7HC+HASeC+H77h7OeQ0wtnWoZVi1dvQv5aB3yhmHDZUZd
         ARifpmdJXOWRWnHvo6PcwcTrXB+zfk01ptGEKMa8=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     csonsino <csonsino@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Sasha Levin <sashal@kernel.org>,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 53/53] Bluetooth: validate BLE connection interval updates
Date:   Mon, 15 Jul 2019 10:45:35 -0400
Message-Id: <20190715144535.11636-53-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715144535.11636-1-sashal@kernel.org>
References: <20190715144535.11636-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: csonsino <csonsino@gmail.com>

[ Upstream commit c49a8682fc5d298d44e8d911f4fa14690ea9485e ]

Problem: The Linux Bluetooth stack yields complete control over the BLE
connection interval to the remote device.

The Linux Bluetooth stack provides access to the BLE connection interval
min and max values through /sys/kernel/debug/bluetooth/hci0/
conn_min_interval and /sys/kernel/debug/bluetooth/hci0/conn_max_interval.
These values are used for initial BLE connections, but the remote device
has the ability to request a connection parameter update. In the event
that the remote side requests to change the connection interval, the Linux
kernel currently only validates that the desired value is within the
acceptable range in the Bluetooth specification (6 - 3200, corresponding to
7.5ms - 4000ms). There is currently no validation that the desired value
requested by the remote device is within the min/max limits specified in
the conn_min_interval/conn_max_interval configurations. This essentially
leads to Linux yielding complete control over the connection interval to
the remote device.

The proposed patch adds a verification step to the connection parameter
update mechanism, ensuring that the desired value is within the min/max
bounds of the current connection. If the desired value is outside of the
current connection min/max values, then the connection parameter update
request is rejected and the negative response is returned to the remote
device. Recall that the initial connection is established using the local
conn_min_interval/conn_max_interval values, so this allows the Linux
administrator to retain control over the BLE connection interval.

The one downside that I see is that the current default Linux values for
conn_min_interval and conn_max_interval typically correspond to 30ms and
50ms respectively. If this change were accepted, then it is feasible that
some devices would no longer be able to negotiate to their desired
connection interval values. This might be remedied by setting the default
Linux conn_min_interval and conn_max_interval values to the widest
supported range (6 - 3200 / 7.5ms - 4000ms). This could lead to the same
behavior as the current implementation, where the remote device could
request to change the connection interval value to any value that is
permitted by the Bluetooth specification, and Linux would accept the
desired value.

Signed-off-by: Carey Sonsino <csonsino@gmail.com>
Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/bluetooth/hci_event.c  | 5 +++++
 net/bluetooth/l2cap_core.c | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 37fe2b158c2a..c4e94f34d048 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -5062,6 +5062,11 @@ static void hci_le_remote_conn_param_req_evt(struct hci_dev *hdev,
 		return send_conn_param_neg_reply(hdev, handle,
 						 HCI_ERROR_UNKNOWN_CONN_ID);
 
+	if (min < hcon->le_conn_min_interval ||
+	    max > hcon->le_conn_max_interval)
+		return send_conn_param_neg_reply(hdev, handle,
+						 HCI_ERROR_INVALID_LL_PARAMS);
+
 	if (hci_check_conn_params(min, max, latency, timeout))
 		return send_conn_param_neg_reply(hdev, handle,
 						 HCI_ERROR_INVALID_LL_PARAMS);
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index c25f1e4846cd..8cfba78d26f6 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -5266,7 +5266,14 @@ static inline int l2cap_conn_param_update_req(struct l2cap_conn *conn,
 
 	memset(&rsp, 0, sizeof(rsp));
 
-	err = hci_check_conn_params(min, max, latency, to_multiplier);
+	if (min < hcon->le_conn_min_interval ||
+	    max > hcon->le_conn_max_interval) {
+		BT_DBG("requested connection interval exceeds current bounds.");
+		err = -EINVAL;
+	} else {
+		err = hci_check_conn_params(min, max, latency, to_multiplier);
+	}
+
 	if (err)
 		rsp.result = cpu_to_le16(L2CAP_CONN_PARAM_REJECTED);
 	else
-- 
2.20.1

