Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D28F67C5F15
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Oct 2023 23:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233422AbjJKV0b (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 Oct 2023 17:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233133AbjJKV03 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 Oct 2023 17:26:29 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 086F090
        for <linux-bluetooth@vger.kernel.org>; Wed, 11 Oct 2023 14:26:28 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7a2bfd584f0so15597139f.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 11 Oct 2023 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697059586; x=1697664386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GQP4S0701LkVQmy8Vsye3pGYUy0BPpONQ30xQX4mf+4=;
        b=cbG1hmJI3h7NcLDnzI77YUkRCKKp2AGuUzh2sWbnsnvk+6FW0EVb5gsFWOZB6tDHj7
         EBEoXrZBin9LhO8L9WihusQwyARZ3RcvNF64OzTo/Z5jaJcADXle5ZvweNjIbyeSnYcP
         7MRHh+gA/7DmGxOAEFBJ0Bt3MfSTpCsgFSDgeUEA/rUxN3JkG1rmFguUv9kyXifNSSI0
         StHvxU3kSFpGJM8deNxThDjiNTaB9OTaFXaJCbEFYUgGqFPOuI0TfRXif3JYqQ4D/MY7
         Je6p4lpbZpMG7Rpo6oeRqFR+x0ncos3T9vO5607gH3QCpmY1jUAg7LVYutcXnMZhScpG
         ifYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697059586; x=1697664386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQP4S0701LkVQmy8Vsye3pGYUy0BPpONQ30xQX4mf+4=;
        b=H+wIvZA98lUNfMqc0jCBSGuwNvRlqMxhaznMffTCJ5pMyltoxC9yx55fnxTlu/9Wge
         NIULQe+Vc4UMB5wok8TGLU5rmeNQwMdra7OKJfgQrVa5DHlH4fwF/cA9q/rRelBiAlzk
         h55N/7yOmHeWIPGElBr7ZQ+kT52xrJQ3kVcLooipLD2QexzpXkA4vmiDe0noqiRAfCUa
         cbjqcUpJtIGYUVNvSKmZMu8e0+gpGijFCZBMXrcR3bTiL7qLugkdqT0uSQDgOWpqP6fN
         zZ1TZVxHALGnTUE0hRJOcsKgr5trRx+WbVkRAmZP/0PwwBt+mTK7K/ztZESGWwoCylra
         lyqw==
X-Gm-Message-State: AOJu0Yw34rRi91FOTN/sEUBCNozhezHzRjkJViLmGtAssDhmGMwaNaKF
        bxSg2GuRxgdlJ3UtK/HphZO/g2ynKpw86oujat0=
X-Google-Smtp-Source: AGHT+IHhHC9Hlx/5N6svrax+4/B+kqW1bAiUqY88LNVzG/B5KKFT0+vxHFWry08eHfySJlv+4ZbWEA==
X-Received: by 2002:a5e:8d18:0:b0:79f:d671:c732 with SMTP id m24-20020a5e8d18000000b0079fd671c732mr27267555ioj.10.1697059586276;
        Wed, 11 Oct 2023 14:26:26 -0700 (PDT)
Received: from lvondent-mobl4.. (c-98-232-221-87.hsd1.or.comcast.net. [98.232.221.87])
        by smtp.gmail.com with ESMTPSA id c25-20020a5ea919000000b007871aa2f144sm3674043iod.16.2023.10.11.14.26.25
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:26:25 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2] Bluetooth: Make handle of hci_conn be unique
Date:   Wed, 11 Oct 2023 14:26:24 -0700
Message-ID: <20231011212624.1206326-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Ziyang Xuan <william.xuanziyang@huawei.com>

The handle of new hci_conn is always HCI_CONN_HANDLE_MAX + 1 if
the handle of the first hci_conn entry in hci_dev->conn_hash->list
is not HCI_CONN_HANDLE_MAX + 1. Use ida to manage the allocation of
hci_conn->handle to make it be unique.

Fixes: 9f78191cc9f1 ("Bluetooth: hci_conn: Always allocate unique handles")
Signed-off-by: Ziyang Xuan <william.xuanziyang@huawei.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/hci_core.h |  6 +++-
 net/bluetooth/amp.c              |  3 +-
 net/bluetooth/hci_conn.c         | 57 ++++++++++++++++++--------------
 net/bluetooth/hci_core.c         |  3 ++
 net/bluetooth/hci_event.c        | 38 +++++++++------------
 5 files changed, 56 insertions(+), 51 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 99865c23e461..20988623c5cc 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -350,6 +350,8 @@ struct hci_dev {
 	struct list_head list;
 	struct mutex	lock;
 
+	struct ida	unset_handle_ida;
+
 	const char	*name;
 	unsigned long	flags;
 	__u16		id;
@@ -1446,7 +1448,9 @@ int hci_le_create_cis_pending(struct hci_dev *hdev);
 int hci_conn_check_create_cis(struct hci_conn *conn);
 
 struct hci_conn *hci_conn_add(struct hci_dev *hdev, int type, bdaddr_t *dst,
-			      u8 role);
+			      u8 role, u16 handle);
+struct hci_conn *hci_conn_add_unset(struct hci_dev *hdev, int type,
+				    bdaddr_t *dst, u8 role);
 void hci_conn_del(struct hci_conn *conn);
 void hci_conn_hash_flush(struct hci_dev *hdev);
 void hci_conn_check_pending(struct hci_dev *hdev);
diff --git a/net/bluetooth/amp.c b/net/bluetooth/amp.c
index 2134f92bd7ac..5d698f19868c 100644
--- a/net/bluetooth/amp.c
+++ b/net/bluetooth/amp.c
@@ -109,7 +109,7 @@ struct hci_conn *phylink_add(struct hci_dev *hdev, struct amp_mgr *mgr,
 	struct hci_conn *hcon;
 	u8 role = out ? HCI_ROLE_MASTER : HCI_ROLE_SLAVE;
 
-	hcon = hci_conn_add(hdev, AMP_LINK, dst, role);
+	hcon = hci_conn_add(hdev, AMP_LINK, dst, role, __next_handle(mgr));
 	if (!hcon)
 		return NULL;
 
@@ -117,7 +117,6 @@ struct hci_conn *phylink_add(struct hci_dev *hdev, struct amp_mgr *mgr,
 
 	hcon->state = BT_CONNECT;
 	hcon->attempt++;
-	hcon->handle = __next_handle(mgr);
 	hcon->remote_id = remote_id;
 	hcon->amp_mgr = amp_mgr_get(mgr);
 
diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index 7727fe30e5c3..3735764b3169 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -153,6 +153,9 @@ static void hci_conn_cleanup(struct hci_conn *conn)
 
 	hci_conn_hash_del(hdev, conn);
 
+	if (HCI_CONN_HANDLE_UNSET(conn->handle))
+		ida_free(&hdev->unset_handle_ida, conn->handle);
+
 	if (conn->cleanup)
 		conn->cleanup(conn);
 
@@ -951,31 +954,18 @@ static void cis_cleanup(struct hci_conn *conn)
 	hci_le_remove_cig(hdev, conn->iso_qos.ucast.cig);
 }
 
-static u16 hci_conn_hash_alloc_unset(struct hci_dev *hdev)
+static int hci_conn_hash_alloc_unset(struct hci_dev *hdev)
 {
-	struct hci_conn_hash *h = &hdev->conn_hash;
-	struct hci_conn  *c;
-	u16 handle = HCI_CONN_HANDLE_MAX + 1;
-
-	rcu_read_lock();
-
-	list_for_each_entry_rcu(c, &h->list, list) {
-		/* Find the first unused handle */
-		if (handle == 0xffff || c->handle != handle)
-			break;
-		handle++;
-	}
-	rcu_read_unlock();
-
-	return handle;
+	return ida_alloc_range(&hdev->unset_handle_ida, HCI_CONN_HANDLE_MAX + 1,
+			       U16_MAX, GFP_ATOMIC);
 }
 
 struct hci_conn *hci_conn_add(struct hci_dev *hdev, int type, bdaddr_t *dst,
-			      u8 role)
+			      u8 role, u16 handle)
 {
 	struct hci_conn *conn;
 
-	BT_DBG("%s dst %pMR", hdev->name, dst);
+	bt_dev_dbg(hdev, "dst %pMR handle 0x%4.4x", dst, handle);
 
 	conn = kzalloc(sizeof(*conn), GFP_KERNEL);
 	if (!conn)
@@ -983,7 +973,7 @@ struct hci_conn *hci_conn_add(struct hci_dev *hdev, int type, bdaddr_t *dst,
 
 	bacpy(&conn->dst, dst);
 	bacpy(&conn->src, &hdev->bdaddr);
-	conn->handle = hci_conn_hash_alloc_unset(hdev);
+	conn->handle = handle;
 	conn->hdev  = hdev;
 	conn->type  = type;
 	conn->role  = role;
@@ -1068,6 +1058,20 @@ struct hci_conn *hci_conn_add(struct hci_dev *hdev, int type, bdaddr_t *dst,
 	return conn;
 }
 
+struct hci_conn *hci_conn_add_unset(struct hci_dev *hdev, int type,
+				    bdaddr_t *dst, u8 role)
+{
+	int handle;
+
+	bt_dev_dbg(hdev, "dst %pMR", dst);
+
+	handle = hci_conn_hash_alloc_unset(hdev);
+	if (unlikely(handle < 0))
+		return NULL;
+
+	return hci_conn_add(hdev, type, dst, role, handle);
+}
+
 static void hci_conn_cleanup_child(struct hci_conn *conn, u8 reason)
 {
 	if (!reason)
@@ -1304,6 +1308,9 @@ u8 hci_conn_set_handle(struct hci_conn *conn, u16 handle)
 	if (conn->abort_reason)
 		return conn->abort_reason;
 
+	if (HCI_CONN_HANDLE_UNSET(conn->handle))
+		ida_free(&hdev->unset_handle_ida, conn->handle);
+
 	conn->handle = handle;
 
 	return 0;
@@ -1411,7 +1418,7 @@ struct hci_conn *hci_connect_le(struct hci_dev *hdev, bdaddr_t *dst,
 	if (conn) {
 		bacpy(&conn->dst, dst);
 	} else {
-		conn = hci_conn_add(hdev, LE_LINK, dst, role);
+		conn = hci_conn_add_unset(hdev, LE_LINK, dst, role);
 		if (!conn)
 			return ERR_PTR(-ENOMEM);
 		hci_conn_hold(conn);
@@ -1588,7 +1595,7 @@ static struct hci_conn *hci_add_bis(struct hci_dev *hdev, bdaddr_t *dst,
 		     memcmp(conn->le_per_adv_data, base, base_len)))
 		return ERR_PTR(-EADDRINUSE);
 
-	conn = hci_conn_add(hdev, ISO_LINK, dst, HCI_ROLE_MASTER);
+	conn = hci_conn_add_unset(hdev, ISO_LINK, dst, HCI_ROLE_MASTER);
 	if (!conn)
 		return ERR_PTR(-ENOMEM);
 
@@ -1632,7 +1639,7 @@ struct hci_conn *hci_connect_le_scan(struct hci_dev *hdev, bdaddr_t *dst,
 
 	BT_DBG("requesting refresh of dst_addr");
 
-	conn = hci_conn_add(hdev, LE_LINK, dst, HCI_ROLE_MASTER);
+	conn = hci_conn_add_unset(hdev, LE_LINK, dst, HCI_ROLE_MASTER);
 	if (!conn)
 		return ERR_PTR(-ENOMEM);
 
@@ -1680,7 +1687,7 @@ struct hci_conn *hci_connect_acl(struct hci_dev *hdev, bdaddr_t *dst,
 
 	acl = hci_conn_hash_lookup_ba(hdev, ACL_LINK, dst);
 	if (!acl) {
-		acl = hci_conn_add(hdev, ACL_LINK, dst, HCI_ROLE_MASTER);
+		acl = hci_conn_add_unset(hdev, ACL_LINK, dst, HCI_ROLE_MASTER);
 		if (!acl)
 			return ERR_PTR(-ENOMEM);
 	}
@@ -1740,7 +1747,7 @@ struct hci_conn *hci_connect_sco(struct hci_dev *hdev, int type, bdaddr_t *dst,
 
 	sco = hci_conn_hash_lookup_ba(hdev, type, dst);
 	if (!sco) {
-		sco = hci_conn_add(hdev, type, dst, HCI_ROLE_MASTER);
+		sco = hci_conn_add_unset(hdev, type, dst, HCI_ROLE_MASTER);
 		if (!sco) {
 			hci_conn_drop(acl);
 			return ERR_PTR(-ENOMEM);
@@ -1932,7 +1939,7 @@ struct hci_conn *hci_bind_cis(struct hci_dev *hdev, bdaddr_t *dst,
 	cis = hci_conn_hash_lookup_cis(hdev, dst, dst_type, qos->ucast.cig,
 				       qos->ucast.cis);
 	if (!cis) {
-		cis = hci_conn_add(hdev, ISO_LINK, dst, HCI_ROLE_MASTER);
+		cis = hci_conn_add_unset(hdev, ISO_LINK, dst, HCI_ROLE_MASTER);
 		if (!cis)
 			return ERR_PTR(-ENOMEM);
 		cis->cleanup = cis_cleanup;
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 195aea2198a9..65601aa52e0d 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -2535,6 +2535,8 @@ struct hci_dev *hci_alloc_dev_priv(int sizeof_priv)
 	mutex_init(&hdev->lock);
 	mutex_init(&hdev->req_lock);
 
+	ida_init(&hdev->unset_handle_ida);
+
 	INIT_LIST_HEAD(&hdev->mesh_pending);
 	INIT_LIST_HEAD(&hdev->mgmt_pending);
 	INIT_LIST_HEAD(&hdev->reject_list);
@@ -2789,6 +2791,7 @@ void hci_release_dev(struct hci_dev *hdev)
 	hci_codec_list_clear(&hdev->local_codecs);
 	hci_dev_unlock(hdev);
 
+	ida_destroy(&hdev->unset_handle_ida);
 	ida_simple_remove(&hci_index_ida, hdev->id);
 	kfree_skb(hdev->sent_cmd);
 	kfree_skb(hdev->recv_event);
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 32fb2f102a12..0849e0dafa95 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -2335,8 +2335,8 @@ static void hci_cs_create_conn(struct hci_dev *hdev, __u8 status)
 		}
 	} else {
 		if (!conn) {
-			conn = hci_conn_add(hdev, ACL_LINK, &cp->bdaddr,
-					    HCI_ROLE_MASTER);
+			conn = hci_conn_add_unset(hdev, ACL_LINK, &cp->bdaddr,
+						  HCI_ROLE_MASTER);
 			if (!conn)
 				bt_dev_err(hdev, "no memory for new connection");
 		}
@@ -3151,8 +3151,8 @@ static void hci_conn_complete_evt(struct hci_dev *hdev, void *data,
 		    hci_bdaddr_list_lookup_with_flags(&hdev->accept_list,
 						      &ev->bdaddr,
 						      BDADDR_BREDR)) {
-			conn = hci_conn_add(hdev, ev->link_type, &ev->bdaddr,
-					    HCI_ROLE_SLAVE);
+			conn = hci_conn_add_unset(hdev, ev->link_type,
+						  &ev->bdaddr, HCI_ROLE_SLAVE);
 			if (!conn) {
 				bt_dev_err(hdev, "no memory for new conn");
 				goto unlock;
@@ -3317,8 +3317,8 @@ static void hci_conn_request_evt(struct hci_dev *hdev, void *data,
 	conn = hci_conn_hash_lookup_ba(hdev, ev->link_type,
 			&ev->bdaddr);
 	if (!conn) {
-		conn = hci_conn_add(hdev, ev->link_type, &ev->bdaddr,
-				    HCI_ROLE_SLAVE);
+		conn = hci_conn_add_unset(hdev, ev->link_type, &ev->bdaddr,
+					  HCI_ROLE_SLAVE);
 		if (!conn) {
 			bt_dev_err(hdev, "no memory for new connection");
 			goto unlock;
@@ -5890,7 +5890,7 @@ static void le_conn_complete_evt(struct hci_dev *hdev, u8 status,
 		if (status)
 			goto unlock;
 
-		conn = hci_conn_add(hdev, LE_LINK, bdaddr, role);
+		conn = hci_conn_add_unset(hdev, LE_LINK, bdaddr, role);
 		if (!conn) {
 			bt_dev_err(hdev, "no memory for new connection");
 			goto unlock;
@@ -5952,17 +5952,11 @@ static void le_conn_complete_evt(struct hci_dev *hdev, u8 status,
 
 	conn->dst_type = ev_bdaddr_type(hdev, conn->dst_type, NULL);
 
-	if (handle > HCI_CONN_HANDLE_MAX) {
-		bt_dev_err(hdev, "Invalid handle: 0x%4.4x > 0x%4.4x", handle,
-			   HCI_CONN_HANDLE_MAX);
-		status = HCI_ERROR_INVALID_PARAMETERS;
-	}
-
 	/* All connection failure handling is taken care of by the
 	 * hci_conn_failed function which is triggered by the HCI
 	 * request completion callbacks used for connecting.
 	 */
-	if (status)
+	if (status || hci_conn_set_handle(conn, handle))
 		goto unlock;
 
 	/* Drop the connection if it has been aborted */
@@ -5986,7 +5980,6 @@ static void le_conn_complete_evt(struct hci_dev *hdev, u8 status,
 		mgmt_device_connected(hdev, conn, NULL, 0);
 
 	conn->sec_level = BT_SECURITY_LOW;
-	conn->handle = handle;
 	conn->state = BT_CONFIG;
 
 	/* Store current advertising instance as connection advertising instance
@@ -6622,8 +6615,8 @@ static void hci_le_pa_sync_estabilished_evt(struct hci_dev *hdev, void *data,
 
 	if (ev->status) {
 		/* Add connection to indicate the failed PA sync event */
-		pa_sync = hci_conn_add(hdev, ISO_LINK, BDADDR_ANY,
-				       HCI_ROLE_SLAVE);
+		pa_sync = hci_conn_add_unset(hdev, ISO_LINK, BDADDR_ANY,
+					     HCI_ROLE_SLAVE);
 
 		if (!pa_sync)
 			goto unlock;
@@ -7019,12 +7012,12 @@ static void hci_le_cis_req_evt(struct hci_dev *hdev, void *data,
 
 	cis = hci_conn_hash_lookup_handle(hdev, cis_handle);
 	if (!cis) {
-		cis = hci_conn_add(hdev, ISO_LINK, &acl->dst, HCI_ROLE_SLAVE);
+		cis = hci_conn_add(hdev, ISO_LINK, &acl->dst, HCI_ROLE_SLAVE,
+				   cis_handle);
 		if (!cis) {
 			hci_le_reject_cis(hdev, ev->cis_handle);
 			goto unlock;
 		}
-		cis->handle = cis_handle;
 	}
 
 	cis->iso_qos.ucast.cig = ev->cig_id;
@@ -7129,10 +7122,9 @@ static void hci_le_big_sync_established_evt(struct hci_dev *hdev, void *data,
 		bis = hci_conn_hash_lookup_handle(hdev, handle);
 		if (!bis) {
 			bis = hci_conn_add(hdev, ISO_LINK, BDADDR_ANY,
-					   HCI_ROLE_SLAVE);
+					   HCI_ROLE_SLAVE, handle);
 			if (!bis)
 				continue;
-			bis->handle = handle;
 		}
 
 		if (ev->status != 0x42)
@@ -7198,8 +7190,8 @@ static void hci_le_big_info_adv_report_evt(struct hci_dev *hdev, void *data,
 		goto unlock;
 
 	/* Add connection to indicate the PA sync event */
-	pa_sync = hci_conn_add(hdev, ISO_LINK, BDADDR_ANY,
-			       HCI_ROLE_SLAVE);
+	pa_sync = hci_conn_add_unset(hdev, ISO_LINK, BDADDR_ANY,
+				     HCI_ROLE_SLAVE);
 
 	if (!pa_sync)
 		goto unlock;
-- 
2.41.0

