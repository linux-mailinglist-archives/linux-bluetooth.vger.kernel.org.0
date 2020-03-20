Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D4418D993
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Mar 2020 21:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgCTUkc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 20 Mar 2020 16:40:32 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46360 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbgCTUkb (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 20 Mar 2020 16:40:31 -0400
Received: by mail-pl1-f196.google.com with SMTP id r3so2984227pls.13
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 Mar 2020 13:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ax6LJvZifxs+Jz4PFhlO8B8liSrqW0rQiTisJ5Q7W3U=;
        b=TcUwwa1Znb7bXLElra4QUed/8QCtlUHGCippcD3EBdxJzWmqlmN2dne4IGl/XHRj3t
         mvykCC3IkDZzrIrhW8DxrcED+hIdzApS/WIP8+ViYLBlJMzFPQ/iBbYyR3EUxffkCUIE
         27Q9lDqNbTNt1lF18jzeFsLZ4x24PvUDK5DgxB705QXcP9sOiMI9MDzqNR3K+XooSXvz
         qNGazZH2yPzaG8//TiaKHvuDbYlJtV9PK7LOQUxIPVBCNvXOXKKVbGeWjlBmy4xUIZ/N
         PmIOekOvFA4xi0OhjJo8XwnIOWnp1tZqinBviCR2gxmnxSw27Fov7hXIyWA20ZV/Yikr
         ZKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ax6LJvZifxs+Jz4PFhlO8B8liSrqW0rQiTisJ5Q7W3U=;
        b=f4vBkJHi51XCOmSVRpFZiscxWx4Z4Ega8tDLj7RmggPiOgzaUC9C16SL70zfsVd2V4
         o4o7DAXYhl+S1xLr8hywT3dRzUYDYUZKzctMXKNDA/4H8m+hEQDyPauRtNvadQ0tq4In
         fOf8A7KK3eV/STqHqIcOuTBVqrcrA3/Xny1FFRSJ4SNt/J6Yv3Nd9vQVsqorb6aY/Nq/
         kmpSTJEPaD64VHrqH9FVnJT6CkcuG9oxN8+H04xlb1d3aktP0p8sbmI4A/JAnu9kwiZ6
         ky9Q/QpBxQbRPGxz1xuhc/Xo04k5T7LxXH8qNFNKbX3liGt6nDGM4Kzw9V5qfpOHiofP
         XZ1w==
X-Gm-Message-State: ANhLgQ2iS/bGmC2CUzOviiCPNs7AEkFdqmO+m6j08OUvoxACDTvU+aTv
        2UEBdVkEjZ3gvIMPpi+jht+OjX2D
X-Google-Smtp-Source: ADFU+vvgWqHxGFwKJ7gELI8IwmjMNAa+laf1jJguhBhNKqcoIiAVx2TsMNkgpKlG5n1hWXoHmcA4SA==
X-Received: by 2002:a17:902:7c0c:: with SMTP id x12mr7831116pll.196.1584736829592;
        Fri, 20 Mar 2020 13:40:29 -0700 (PDT)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id e187sm6048744pfe.143.2020.03.20.13.40.28
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 13:40:28 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v4 2/3] Bluetooth: L2CAP: Use DEFER_SETUP to group ECRED connections
Date:   Fri, 20 Mar 2020 13:40:25 -0700
Message-Id: <20200320204026.11680-3-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320204026.11680-1-luiz.dentz@gmail.com>
References: <20200320204026.11680-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This uses the DEFER_SETUP flag to group channels with
L2CAP_CREDIT_BASED_CONNECTION_REQ.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/l2cap.h |   4 +
 net/bluetooth/l2cap_core.c    | 136 +++++++++++++++++++++++++++++++---
 2 files changed, 130 insertions(+), 10 deletions(-)

diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
index 2d7d28474d34..dada14d0622c 100644
--- a/include/net/bluetooth/l2cap.h
+++ b/include/net/bluetooth/l2cap.h
@@ -47,6 +47,7 @@
 #define L2CAP_DEFAULT_ACC_LAT		0xFFFFFFFF
 #define L2CAP_BREDR_MAX_PAYLOAD		1019    /* 3-DH5 packet */
 #define L2CAP_LE_MIN_MTU		23
+#define L2CAP_ECRED_CONN_SCID_MAX	5
 
 #define L2CAP_DISC_TIMEOUT		msecs_to_jiffies(100)
 #define L2CAP_DISC_REJ_TIMEOUT		msecs_to_jiffies(5000)
@@ -984,6 +985,9 @@ void l2cap_chan_set_defaults(struct l2cap_chan *chan);
 int l2cap_ertm_init(struct l2cap_chan *chan);
 void l2cap_chan_add(struct l2cap_conn *conn, struct l2cap_chan *chan);
 void __l2cap_chan_add(struct l2cap_conn *conn, struct l2cap_chan *chan);
+typedef void (*l2cap_chan_func_t)(struct l2cap_chan *chan, void *data);
+void l2cap_chan_list(struct l2cap_conn *conn, l2cap_chan_func_t func,
+		     void *data);
 void l2cap_chan_del(struct l2cap_chan *chan, int err);
 void l2cap_send_conn_req(struct l2cap_chan *chan);
 void l2cap_move_start(struct l2cap_chan *chan);
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 5e6e35ab44dd..9f699d09d973 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -678,6 +678,29 @@ void l2cap_chan_del(struct l2cap_chan *chan, int err)
 }
 EXPORT_SYMBOL_GPL(l2cap_chan_del);
 
+static void __l2cap_chan_list(struct l2cap_conn *conn, l2cap_chan_func_t func,
+			      void *data)
+{
+	struct l2cap_chan *chan;
+
+	list_for_each_entry(chan, &conn->chan_l, list) {
+		func(chan, data);
+	}
+}
+
+void l2cap_chan_list(struct l2cap_conn *conn, l2cap_chan_func_t func,
+		     void *data)
+{
+	if (!conn)
+		return;
+
+	mutex_lock(&conn->chan_lock);
+	__l2cap_chan_list(conn, func, data);
+	mutex_unlock(&conn->chan_lock);
+}
+
+EXPORT_SYMBOL_GPL(l2cap_chan_list);
+
 static void l2cap_conn_update_id_addr(struct work_struct *work)
 {
 	struct l2cap_conn *conn = container_of(work, struct l2cap_conn,
@@ -1356,29 +1379,79 @@ static void l2cap_le_connect(struct l2cap_chan *chan)
 		       sizeof(req), &req);
 }
 
-static void l2cap_ecred_connect(struct l2cap_chan *chan)
-{
-	struct l2cap_conn *conn = chan->conn;
+struct l2cap_ecred_conn_data {
 	struct {
 		struct l2cap_ecred_conn_req req;
-		__le16 scid;
+		__le16 scid[5];
 	} __packed pdu;
+	struct l2cap_chan *chan;
+	struct pid *pid;
+	int count;
+};
+
+static void l2cap_ecred_defer_connect(struct l2cap_chan *chan, void *data)
+{
+	struct l2cap_ecred_conn_data *conn = data;
+	struct pid *pid;
+
+	if (chan == conn->chan)
+		return;
+
+	if (!test_and_clear_bit(FLAG_DEFER_SETUP, &chan->flags))
+		return;
+
+	pid = chan->ops->get_peer_pid(chan);
+
+	/* Only add deferred channels with the same PID/PSM */
+	if (conn->pid != pid || chan->psm != conn->chan->psm || chan->ident ||
+	    chan->mode != L2CAP_MODE_EXT_FLOWCTL || chan->state != BT_CONNECT)
+		return;
+
+	if (test_and_set_bit(FLAG_ECRED_CONN_REQ_SENT, &chan->flags))
+		return;
+
+	l2cap_ecred_init(chan, 0);
+
+	/* Set the same ident so we can match on the rsp */
+	chan->ident = conn->chan->ident;
+
+	/* Include all channels deferred */
+	conn->pdu.scid[conn->count] = cpu_to_le16(chan->scid);
+
+	conn->count++;
+}
+
+static void l2cap_ecred_connect(struct l2cap_chan *chan)
+{
+	struct l2cap_conn *conn = chan->conn;
+	struct l2cap_ecred_conn_data data;
+
+	if (test_bit(FLAG_DEFER_SETUP, &chan->flags))
+		return;
 
 	if (test_and_set_bit(FLAG_ECRED_CONN_REQ_SENT, &chan->flags))
 		return;
 
 	l2cap_ecred_init(chan, 0);
 
-	pdu.req.psm     = chan->psm;
-	pdu.req.mtu     = cpu_to_le16(chan->imtu);
-	pdu.req.mps     = cpu_to_le16(chan->mps);
-	pdu.req.credits = cpu_to_le16(chan->rx_credits);
-	pdu.scid        = cpu_to_le16(chan->scid);
+	data.pdu.req.psm     = chan->psm;
+	data.pdu.req.mtu     = cpu_to_le16(chan->imtu);
+	data.pdu.req.mps     = cpu_to_le16(chan->mps);
+	data.pdu.req.credits = cpu_to_le16(chan->rx_credits);
+	data.pdu.scid[0]     = cpu_to_le16(chan->scid);
 
 	chan->ident = l2cap_get_ident(conn);
+	data.pid = chan->ops->get_peer_pid(chan);
+
+	data.count = 1;
+	data.chan = chan;
+	data.pid = chan->ops->get_peer_pid(chan);
+
+	__l2cap_chan_list(conn, l2cap_ecred_defer_connect, &data);
 
 	l2cap_send_cmd(conn, chan->ident, L2CAP_ECRED_CONN_REQ,
-		       sizeof(pdu), &pdu);
+		       sizeof(data.pdu.req) + data.count * sizeof(__le16),
+		       &data.pdu);
 }
 
 static void l2cap_le_start(struct l2cap_chan *chan)
@@ -7694,6 +7767,33 @@ static bool is_valid_psm(u16 psm, u8 dst_type) {
 	return ((psm & 0x0101) == 0x0001);
 }
 
+struct l2cap_chan_data {
+	struct l2cap_chan *chan;
+	struct pid *pid;
+	int count;
+};
+
+static void l2cap_chan_by_pid(struct l2cap_chan *chan, void *data)
+{
+	struct l2cap_chan_data *d = data;
+	struct pid *pid;
+
+	if (chan == d->chan)
+		return;
+
+	if (!test_bit(FLAG_DEFER_SETUP, &chan->flags))
+		return;
+
+	pid = chan->ops->get_peer_pid(chan);
+
+	/* Only count deferred channels with the same PID/PSM */
+	if (d->pid != pid || chan->psm != d->chan->psm || chan->ident ||
+	    chan->mode != L2CAP_MODE_EXT_FLOWCTL || chan->state != BT_CONNECT)
+		return;
+
+	d->count++;
+}
+
 int l2cap_chan_connect(struct l2cap_chan *chan, __le16 psm, u16 cid,
 		       bdaddr_t *dst, u8 dst_type)
 {
@@ -7813,6 +7913,22 @@ int l2cap_chan_connect(struct l2cap_chan *chan, __le16 psm, u16 cid,
 		goto done;
 	}
 
+	if (chan->mode == L2CAP_MODE_EXT_FLOWCTL) {
+		struct l2cap_chan_data data;
+
+		data.chan = chan;
+		data.pid = chan->ops->get_peer_pid(chan);
+		data.count = 0;
+
+		l2cap_chan_list(conn, l2cap_chan_by_pid, &data);
+		/* Check if there isn't too many channels being connected */
+		if (!(data.count < L2CAP_ECRED_CONN_SCID_MAX - 1)) {
+			hci_conn_drop(hcon);
+			err = -EPROTO;
+			goto done;
+		}
+	}
+
 	mutex_lock(&conn->chan_lock);
 	l2cap_chan_lock(chan);
 
-- 
2.21.1

