Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC0F351E180
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 May 2022 23:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444630AbiEFWBh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 6 May 2022 18:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233009AbiEFWBg (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 6 May 2022 18:01:36 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FDC624BD8
        for <linux-bluetooth@vger.kernel.org>; Fri,  6 May 2022 14:57:49 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id e194so9472567iof.11
        for <linux-bluetooth@vger.kernel.org>; Fri, 06 May 2022 14:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zZqqgt/V+QH+NQQq7v52jnZ8mCFItyAwrxIKoyxiQrk=;
        b=C3c+Exdg7xoI2aNVd++feS1hd+u7xd2I4MT3vKN6T5ZxnS1feH5ZuYiceRdXCV10Lc
         Do0ftL9FPFXjrrdLQh9wrBXkVqeAmRwTBFWgvWSy3TwZHVm2rjpyYVQN0Yi6bReM2vvo
         OpIFySHpk5DIE0z95+gvZlRpjNeYRsSSDsISU9OmO/gZgS5BVVJ5J/lO9bqAsU+2wm9h
         O/OYVYIN40fE7Iqk/CTArNBfNS/3JIAYXmZ+m8V5xNapHurhfwp0Z+LZBRYrFhtYdTNE
         D+mWZScA/YRAVlOX82odjhrQ3dORjk6NMIl4FxeIZJumhi6YDbmznB3bpwmVCnpjTYVF
         SrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zZqqgt/V+QH+NQQq7v52jnZ8mCFItyAwrxIKoyxiQrk=;
        b=rR3NyzVZQ1Qjt6ytSmZZdRs9h8nggiYAPn32FBTqNbYsJuuyflbJ3n9t7py8M+la6N
         BSI/73vo1aJdOM8S3E5Y8GTmqytqs/MFVxagdSAT6dBn8A8VLa9QYyc9Gfpg9YXAAkYR
         xOrWsGBRU5gJUmDerr6CQEvKL7g3ewp6qt2TfCvc5xpnkAWWFs7lrdDUwNAltx+xIJIh
         DNU25yaXswU/9Ou9LFRLBS1k26FP0ZYLv2jGwGs3WH6X8mr0VFb6C0ZyW/Ic0KugPpYR
         rAlG/pio9AE9kQL247NxfHkBfd+zgG57gLJNzxeFzEbgW5IvwNo41vyKvI97gQos8nJa
         zEeA==
X-Gm-Message-State: AOAM5335sSvhLInw4ddjUhhC32Fbiiz0W3bNaagVB2zDrS6dqBM0N6wx
        TjtaIegB3qf7NtrD1bh+ucy45JTAwHI=
X-Google-Smtp-Source: ABdhPJyQvcnhmvBnHqXUXc99EqQxzNJ7D/GPvI10BZry7Ls2By32HLImsRr6BXaClNUXAEjH+Ln/+w==
X-Received: by 2002:a05:6638:12c5:b0:32b:7559:44d9 with SMTP id v5-20020a05663812c500b0032b755944d9mr2265350jas.196.1651874267937;
        Fri, 06 May 2022 14:57:47 -0700 (PDT)
Received: from lvondent-mobl4.. (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id s14-20020a5e980e000000b0065aab053448sm1572281ioj.21.2022.05.06.14.57.47
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 14:57:47 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 3/8] Bluetooth: Add initial implementation of CIS connections
Date:   Fri,  6 May 2022 14:57:38 -0700
Message-Id: <20220506215743.3870212-3-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220506215743.3870212-1-luiz.dentz@gmail.com>
References: <20220506215743.3870212-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This adds the initial implementation of CIS connections and introduces
the ISO packets/links.

== Central: Set CIG Parameters, create a CIS and Setup Data Path ==

> tools/isotest -s <address>

< HCI Command: LE Extended Create... (0x08|0x0043) plen 26
...
> HCI Event: Command Status (0x0f) plen 4
      LE Extended Create Connection (0x08|0x0043) ncmd 1
        Status: Success (0x00)
> HCI Event: LE Meta Event (0x3e) plen 31
      LE Enhanced Connection Complete (0x0a)
      ...
< HCI Command: LE Create Connected... (0x08|0x0064) plen 5
...
> HCI Event: Command Status (0x0f) plen 4
      LE Create Connected Isochronous Stream (0x08|0x0064) ncmd 1
        Status: Success (0x00)
> HCI Event: LE Meta Event (0x3e) plen 29
      LE Connected Isochronous Stream Established (0x19)
      ...
< HCI Command: LE Setup Isochronou.. (0x08|0x006e) plen 13
...
> HCI Event: Command Complete (0x0e) plen 6
      LE Setup Isochronous Data Path (0x08|0x006e) ncmd 1
        Status: Success (0x00)
        Handle: 257
< HCI Command: LE Setup Isochronou.. (0x08|0x006e) plen 13
...
> HCI Event: Command Complete (0x0e) plen 6
      LE Setup Isochronous Data Path (0x08|0x006e) ncmd 1
        Status: Success (0x00)
        Handle: 257

== Peripheral: Accept CIS and Setup Data Path ==

> tools/isotest -d

 HCI Event: LE Meta Event (0x3e) plen 7
      LE Connected Isochronous Stream Request (0x1a)
...
< HCI Command: LE Accept Co.. (0x08|0x0066) plen 2
...
> HCI Event: LE Meta Event (0x3e) plen 29
      LE Connected Isochronous Stream Established (0x19)
...
< HCI Command: LE Setup Is.. (0x08|0x006e) plen 13
...
> HCI Event: Command Complete (0x0e) plen 6
      LE Setup Isochronous Data Path (0x08|0x006e) ncmd 1
        Status: Success (0x00)
        Handle: 257
< HCI Command: LE Setup Is.. (0x08|0x006e) plen 13
...
> HCI Event: Command Complete (0x0e) plen 6
      LE Setup Isochronous Data Path (0x08|0x006e) ncmd 1
        Status: Success (0x00)
        Handle: 257

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/bluetooth.h |  33 ++-
 include/net/bluetooth/hci.h       |  28 +-
 include/net/bluetooth/hci_core.h  | 107 +++++++-
 include/net/bluetooth/hci_sock.h  |   2 +
 include/net/bluetooth/hci_sync.h  |   3 +
 net/bluetooth/Kconfig             |   1 +
 net/bluetooth/hci_conn.c          | 434 ++++++++++++++++++++++++++++++
 net/bluetooth/hci_core.c          | 230 ++++++++++++----
 net/bluetooth/hci_event.c         | 307 ++++++++++++++++++++-
 net/bluetooth/hci_sync.c          |  49 +++-
 10 files changed, 1139 insertions(+), 55 deletions(-)

diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bluetooth.h
index 6b48d9e2aab9..e69555e422e4 100644
--- a/include/net/bluetooth/bluetooth.h
+++ b/include/net/bluetooth/bluetooth.h
@@ -55,6 +55,8 @@
 #define BTPROTO_CMTP	5
 #define BTPROTO_HIDP	6
 #define BTPROTO_AVDTP	7
+#define BTPROTO_ISO	8
+#define BTPROTO_LAST	BTPROTO_ISO
 
 #define SOL_HCI		0
 #define SOL_L2CAP	6
@@ -149,10 +151,39 @@ struct bt_voice {
 #define BT_MODE_LE_FLOWCTL	0x03
 #define BT_MODE_EXT_FLOWCTL	0x04
 
-#define BT_PKT_STATUS          16
+#define BT_PKT_STATUS           16
 
 #define BT_SCM_PKT_STATUS	0x03
 
+#define BT_ISO_QOS		17
+
+#define BT_ISO_QOS_CIG_UNSET	0xff
+#define BT_ISO_QOS_CIS_UNSET	0xff
+
+struct bt_iso_io_qos {
+	__u32 interval;
+	__u16 latency;
+	__u16 sdu;
+	__u8  phy;
+	__u8  rtn;
+};
+
+struct bt_iso_qos {
+	__u8  cig;
+	__u8  cis;
+	__u8  sca;
+	__u8  packing;
+	__u8  framing;
+	struct bt_iso_io_qos in;
+	struct bt_iso_io_qos out;
+};
+
+#define BT_ISO_PHY_1M		0x01
+#define BT_ISO_PHY_2M		0x02
+#define BT_ISO_PHY_CODED	0x04
+#define BT_ISO_PHY_ANY		(BT_ISO_PHY_1M | BT_ISO_PHY_2M | \
+				 BT_ISO_PHY_CODED)
+
 #define BT_CODEC	19
 
 struct	bt_codec_caps {
diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index fe7935be7dc4..749b304b4953 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -1998,7 +1998,7 @@ struct hci_rp_le_read_iso_tx_sync {
 struct hci_cis_params {
 	__u8    cis_id;
 	__le16  c_sdu;
-	__le16  p_pdu;
+	__le16  p_sdu;
 	__u8    c_phy;
 	__u8    p_phy;
 	__u8    c_rtn;
@@ -2009,7 +2009,7 @@ struct hci_cp_le_set_cig_params {
 	__u8    cig_id;
 	__u8    c_interval[3];
 	__u8    p_interval[3];
-	__u8    wc_sca;
+	__u8    sca;
 	__u8    packing;
 	__u8    framing;
 	__le16  c_latency;
@@ -2052,6 +2052,30 @@ struct hci_cp_le_reject_cis {
 	__u8    reason;
 } __packed;
 
+#define HCI_OP_LE_SETUP_ISO_PATH		0x206e
+struct hci_cp_le_setup_iso_path {
+	__le16  handle;
+	__u8    direction;
+	__u8    path;
+	__u8    codec;
+	__le16  codec_cid;
+	__le16  codec_vid;
+	__u8    delay[3];
+	__u8    codec_cfg_len;
+	__u8    codec_cfg[0];
+} __packed;
+
+struct hci_rp_le_setup_iso_path {
+	__u8    status;
+	__le16  handle;
+} __packed;
+
+#define HCI_OP_LE_SET_HOST_FEATURE		0x2074
+struct hci_cp_le_set_host_feature {
+	__u8     bit_number;
+	__u8     bit_value;
+} __packed;
+
 /* ---- HCI Events ---- */
 struct hci_ev_status {
 	__u8    status;
diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 8838aa2cd594..e2924a79aded 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -123,6 +123,7 @@ struct hci_conn_hash {
 	unsigned int     acl_num;
 	unsigned int     amp_num;
 	unsigned int     sco_num;
+	unsigned int     iso_num;
 	unsigned int     le_num;
 	unsigned int     le_num_peripheral;
 };
@@ -463,13 +464,16 @@ struct hci_dev {
 	unsigned int	acl_cnt;
 	unsigned int	sco_cnt;
 	unsigned int	le_cnt;
+	unsigned int	iso_cnt;
 
 	unsigned int	acl_mtu;
 	unsigned int	sco_mtu;
 	unsigned int	le_mtu;
+	unsigned int	iso_mtu;
 	unsigned int	acl_pkts;
 	unsigned int	sco_pkts;
 	unsigned int	le_pkts;
+	unsigned int	iso_pkts;
 
 	__u16		block_len;
 	__u16		block_mtu;
@@ -648,6 +652,7 @@ enum conn_reasons {
 	CONN_REASON_PAIR_DEVICE,
 	CONN_REASON_L2CAP_CHAN,
 	CONN_REASON_SCO_CONNECT,
+	CONN_REASON_ISO_CONNECT,
 };
 
 struct hci_conn {
@@ -700,6 +705,7 @@ struct hci_conn {
 	__s8		rssi;
 	__s8		tx_power;
 	__s8		max_tx_power;
+	struct bt_iso_qos iso_qos;
 	unsigned long	flags;
 
 	enum conn_reasons conn_reason;
@@ -730,6 +736,7 @@ struct hci_conn {
 	struct hci_dev	*hdev;
 	void		*l2cap_data;
 	void		*sco_data;
+	void		*iso_data;
 	struct amp_mgr	*amp_mgr;
 
 	struct hci_conn	*link;
@@ -738,6 +745,8 @@ struct hci_conn {
 	void (*connect_cfm_cb)	(struct hci_conn *conn, u8 status);
 	void (*security_cfm_cb)	(struct hci_conn *conn, u8 status);
 	void (*disconn_cfm_cb)	(struct hci_conn *conn, u8 reason);
+
+	void (*cleanup)(struct hci_conn *conn);
 };
 
 struct hci_chan {
@@ -945,6 +954,9 @@ static inline void hci_conn_hash_add(struct hci_dev *hdev, struct hci_conn *c)
 	case ESCO_LINK:
 		h->sco_num++;
 		break;
+	case ISO_LINK:
+		h->iso_num++;
+		break;
 	}
 }
 
@@ -971,6 +983,9 @@ static inline void hci_conn_hash_del(struct hci_dev *hdev, struct hci_conn *c)
 	case ESCO_LINK:
 		h->sco_num--;
 		break;
+	case ISO_LINK:
+		h->iso_num--;
+		break;
 	}
 }
 
@@ -987,6 +1002,8 @@ static inline unsigned int hci_conn_num(struct hci_dev *hdev, __u8 type)
 	case SCO_LINK:
 	case ESCO_LINK:
 		return h->sco_num;
+	case ISO_LINK:
+		return h->iso_num;
 	default:
 		return 0;
 	}
@@ -996,7 +1013,7 @@ static inline unsigned int hci_conn_count(struct hci_dev *hdev)
 {
 	struct hci_conn_hash *c = &hdev->conn_hash;
 
-	return c->acl_num + c->amp_num + c->sco_num + c->le_num;
+	return c->acl_num + c->amp_num + c->sco_num + c->le_num + c->iso_num;
 }
 
 static inline __u8 hci_conn_lookup_type(struct hci_dev *hdev, __u16 handle)
@@ -1082,6 +1099,53 @@ static inline struct hci_conn *hci_conn_hash_lookup_le(struct hci_dev *hdev,
 	return NULL;
 }
 
+static inline struct hci_conn *hci_conn_hash_lookup_cis(struct hci_dev *hdev,
+							bdaddr_t *ba,
+							__u8 ba_type)
+{
+	struct hci_conn_hash *h = &hdev->conn_hash;
+	struct hci_conn  *c;
+
+	rcu_read_lock();
+
+	list_for_each_entry_rcu(c, &h->list, list) {
+		if (c->type != ISO_LINK)
+			continue;
+
+		if (ba_type == c->dst_type && !bacmp(&c->dst, ba)) {
+			rcu_read_unlock();
+			return c;
+		}
+	}
+
+	rcu_read_unlock();
+
+	return NULL;
+}
+
+static inline struct hci_conn *hci_conn_hash_lookup_cig(struct hci_dev *hdev,
+							__u8 handle)
+{
+	struct hci_conn_hash *h = &hdev->conn_hash;
+	struct hci_conn  *c;
+
+	rcu_read_lock();
+
+	list_for_each_entry_rcu(c, &h->list, list) {
+		if (c->type != ISO_LINK)
+			continue;
+
+		if (handle == c->iso_qos.cig) {
+			rcu_read_unlock();
+			return c;
+		}
+	}
+
+	rcu_read_unlock();
+
+	return NULL;
+}
+
 static inline struct hci_conn *hci_conn_hash_lookup_state(struct hci_dev *hdev,
 							__u8 type, __u16 state)
 {
@@ -1102,6 +1166,27 @@ static inline struct hci_conn *hci_conn_hash_lookup_state(struct hci_dev *hdev,
 	return NULL;
 }
 
+typedef void (*hci_conn_func_t)(struct hci_conn *conn, void *data);
+static inline void hci_conn_hash_list_state(struct hci_dev *hdev,
+					    hci_conn_func_t func, __u8 type,
+					    __u16 state, void *data)
+{
+	struct hci_conn_hash *h = &hdev->conn_hash;
+	struct hci_conn  *c;
+
+	if (!func)
+		return;
+
+	rcu_read_lock();
+
+	list_for_each_entry_rcu(c, &h->list, list) {
+		if (c->type == type && c->state == state)
+			func(c, data);
+	}
+
+	rcu_read_unlock();
+}
+
 static inline struct hci_conn *hci_lookup_le_connect(struct hci_dev *hdev)
 {
 	struct hci_conn_hash *h = &hdev->conn_hash;
@@ -1125,6 +1210,8 @@ static inline struct hci_conn *hci_lookup_le_connect(struct hci_dev *hdev)
 int hci_disconnect(struct hci_conn *conn, __u8 reason);
 bool hci_setup_sync(struct hci_conn *conn, __u16 handle);
 void hci_sco_setup(struct hci_conn *conn, __u8 status);
+bool hci_iso_setup_path(struct hci_conn *conn);
+int hci_le_create_cis(struct hci_conn *conn);
 
 struct hci_conn *hci_conn_add(struct hci_dev *hdev, int type, bdaddr_t *dst,
 			      u8 role);
@@ -1149,6 +1236,10 @@ struct hci_conn *hci_connect_acl(struct hci_dev *hdev, bdaddr_t *dst,
 				 enum conn_reasons conn_reason);
 struct hci_conn *hci_connect_sco(struct hci_dev *hdev, int type, bdaddr_t *dst,
 				 __u16 setting, struct bt_codec *codec);
+struct hci_conn *hci_bind_cis(struct hci_dev *hdev, bdaddr_t *dst,
+			      __u8 dst_type, struct bt_iso_qos *qos);
+struct hci_conn *hci_connect_cis(struct hci_dev *hdev, bdaddr_t *dst,
+				 __u8 dst_type, struct bt_iso_qos *qos);
 int hci_conn_check_link_mode(struct hci_conn *conn);
 int hci_conn_check_secure(struct hci_conn *conn, __u8 sec_level);
 int hci_conn_security(struct hci_conn *conn, __u8 sec_level, __u8 auth_type,
@@ -1517,6 +1608,15 @@ void hci_conn_del_sysfs(struct hci_conn *conn);
 #define use_enhanced_conn_complete(dev) (ll_privacy_capable(dev) || \
 					 ext_adv_capable(dev))
 
+/* CIS Master/Slave support */
+#define iso_capable(dev) (cis_capable(dev))
+#define cis_capable(dev) \
+	(cis_central_capable(dev) || cis_peripheral_capable(dev))
+#define cis_central_capable(dev) \
+	((dev)->le_features[3] & HCI_LE_CIS_CENTRAL)
+#define cis_peripheral_capable(dev) \
+	((dev)->le_features[3] & HCI_LE_CIS_PERIPHERAL)
+
 /* ----- HCI protocols ----- */
 #define HCI_PROTO_DEFER             0x01
 
@@ -1531,6 +1631,10 @@ static inline int hci_proto_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr,
 	case ESCO_LINK:
 		return sco_connect_ind(hdev, bdaddr, flags);
 
+	case ISO_LINK:
+		/* TODO: Handle connection indication */
+		return -EINVAL;
+
 	default:
 		BT_ERR("unknown link type %d", type);
 		return -EINVAL;
@@ -1738,6 +1842,7 @@ int hci_send_cmd(struct hci_dev *hdev, __u16 opcode, __u32 plen,
 		 const void *param);
 void hci_send_acl(struct hci_chan *chan, struct sk_buff *skb, __u16 flags);
 void hci_send_sco(struct hci_conn *conn, struct sk_buff *skb);
+void hci_send_iso(struct hci_conn *conn, struct sk_buff *skb);
 
 void *hci_sent_cmd_data(struct hci_dev *hdev, __u16 opcode);
 void *hci_recv_event_data(struct hci_dev *hdev, __u8 event);
diff --git a/include/net/bluetooth/hci_sock.h b/include/net/bluetooth/hci_sock.h
index 9949870f7d78..0520e21ab698 100644
--- a/include/net/bluetooth/hci_sock.h
+++ b/include/net/bluetooth/hci_sock.h
@@ -124,6 +124,8 @@ struct hci_dev_info {
 	__u16 acl_pkts;
 	__u16 sco_mtu;
 	__u16 sco_pkts;
+	__u16 iso_mtu;
+	__u16 iso_pkts;
 
 	struct hci_dev_stats stat;
 };
diff --git a/include/net/bluetooth/hci_sync.h b/include/net/bluetooth/hci_sync.h
index 2492e3b46a8f..a32678c69135 100644
--- a/include/net/bluetooth/hci_sync.h
+++ b/include/net/bluetooth/hci_sync.h
@@ -106,3 +106,6 @@ int hci_resume_sync(struct hci_dev *hdev);
 struct hci_conn;
 
 int hci_le_create_conn_sync(struct hci_dev *hdev, struct hci_conn *conn);
+
+int hci_le_remove_cig_sync(struct hci_dev *hdev, u8 handle);
+int hci_le_remove_cig(struct hci_dev *hdev, u8 handle);
diff --git a/net/bluetooth/Kconfig b/net/bluetooth/Kconfig
index e0ab4cd7afc3..ae3bdc6dfc92 100644
--- a/net/bluetooth/Kconfig
+++ b/net/bluetooth/Kconfig
@@ -29,6 +29,7 @@ menuconfig BT
 		SCO audio links
 		L2CAP (Logical Link Control and Adaptation Protocol)
 		SMP (Security Manager Protocol) on LE (Low Energy) links
+		ISO isochronous links
 	     HCI Device drivers (Interface to the hardware)
 	     RFCOMM Module (RFCOMM Protocol)  
 	     BNEP Module (Bluetooth Network Encapsulation Protocol)
diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index 882a7df13005..a719a2e18d24 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -122,6 +122,9 @@ static void hci_conn_cleanup(struct hci_conn *conn)
 
 	hci_conn_hash_del(hdev, conn);
 
+	if (conn->cleanup)
+		conn->cleanup(conn);
+
 	if (conn->type == SCO_LINK || conn->type == ESCO_LINK) {
 		switch (conn->setting & SCO_AIRMODE_MASK) {
 		case SCO_AIRMODE_CVSD:
@@ -719,6 +722,7 @@ struct hci_conn *hci_conn_add(struct hci_dev *hdev, int type, bdaddr_t *dst,
 		conn->pkt_type = hdev->pkt_type & ACL_PTYPE_MASK;
 		break;
 	case LE_LINK:
+	case ISO_LINK:
 		/* conn->src should reflect the local identity address */
 		hci_copy_identity_address(hdev, &conn->src, &conn->src_type);
 		break;
@@ -1228,6 +1232,436 @@ struct hci_conn *hci_connect_sco(struct hci_dev *hdev, int type, bdaddr_t *dst,
 	return sco;
 }
 
+struct iso_list_data {
+	u8  cig;
+	u8  cis;
+	int count;
+	struct {
+		struct hci_cp_le_set_cig_params cp;
+		struct hci_cis_params cis[0x11];
+	} pdu;
+};
+
+static void cis_add(struct iso_list_data *d, struct bt_iso_qos *qos)
+{
+	struct hci_cis_params *cis = &d->pdu.cis[d->pdu.cp.num_cis];
+
+	cis->cis_id = qos->cis;
+	cis->c_sdu  = cpu_to_le16(qos->out.sdu);
+	cis->p_sdu  = cpu_to_le16(qos->in.sdu);
+	cis->c_phy  = qos->out.phy;
+	cis->p_phy  = qos->in.phy;
+	cis->c_rtn  = qos->out.rtn;
+	cis->p_rtn  = qos->in.rtn;
+
+	d->pdu.cp.num_cis++;
+}
+
+static void cis_list(struct hci_conn *conn, void *data)
+{
+	struct iso_list_data *d = data;
+
+	if (d->cig != conn->iso_qos.cig || d->cis == BT_ISO_QOS_CIS_UNSET ||
+	    d->cis != conn->iso_qos.cis)
+		return;
+
+	d->count++;
+
+	if (d->pdu.cp.cig_id == BT_ISO_QOS_CIG_UNSET ||
+	    d->count >= ARRAY_SIZE(d->pdu.cis))
+		return;
+
+	cis_add(d, &conn->iso_qos);
+}
+
+static bool hci_le_set_cig_params(struct hci_conn *conn, struct bt_iso_qos *qos)
+{
+	struct hci_dev *hdev = conn->hdev;
+	struct iso_list_data data;
+
+	memset(&data, 0, sizeof(data));
+
+	/* Allocate a CIG if not set */
+	if (qos->cig == BT_ISO_QOS_CIG_UNSET) {
+		for (data.cig = 0x00; data.cig < 0xff; data.cig++) {
+			data.count = 0;
+			data.cis = 0xff;
+
+			hci_conn_hash_list_state(hdev, cis_list, ISO_LINK,
+						 BT_BOUND, &data);
+			if (data.count)
+				continue;
+
+			hci_conn_hash_list_state(hdev, cis_list, ISO_LINK,
+						 BT_CONNECTED, &data);
+			if (!data.count)
+				break;
+		}
+
+		if (data.cig == 0xff)
+			return false;
+
+		/* Update CIG */
+		qos->cig = data.cig;
+	}
+
+	data.pdu.cp.cig_id = qos->cig;
+	hci_cpu_to_le24(qos->out.interval, data.pdu.cp.c_interval);
+	hci_cpu_to_le24(qos->in.interval, data.pdu.cp.p_interval);
+	data.pdu.cp.sca = qos->sca;
+	data.pdu.cp.packing = qos->packing;
+	data.pdu.cp.framing = qos->framing;
+	data.pdu.cp.c_latency = cpu_to_le16(qos->out.latency);
+	data.pdu.cp.p_latency = cpu_to_le16(qos->in.latency);
+
+	if (qos->cis != BT_ISO_QOS_CIS_UNSET) {
+		data.count = 0;
+		data.cig = qos->cig;
+		data.cis = qos->cis;
+
+		hci_conn_hash_list_state(hdev, cis_list, ISO_LINK, BT_BOUND,
+					 &data);
+		if (data.count)
+			return false;
+
+		cis_add(&data, qos);
+	}
+
+	/* Reprogram all CIS(s) with the same CIG */
+	for (data.cig = qos->cig, data.cis = 0x00; data.cis < 0x11;
+	     data.cis++) {
+		data.count = 0;
+
+		hci_conn_hash_list_state(hdev, cis_list, ISO_LINK, BT_BOUND,
+					 &data);
+		if (data.count)
+			continue;
+
+		/* Allocate a CIS if not set */
+		if (qos->cis == BT_ISO_QOS_CIS_UNSET) {
+			/* Update CIS */
+			qos->cis = data.cis;
+			cis_add(&data, qos);
+		}
+	}
+
+	if (qos->cis == BT_ISO_QOS_CIS_UNSET || !data.pdu.cp.num_cis)
+		return false;
+
+	if (hci_send_cmd(hdev, HCI_OP_LE_SET_CIG_PARAMS,
+			 sizeof(data.pdu.cp) +
+			 (data.pdu.cp.num_cis * sizeof(*data.pdu.cis)),
+			 &data.pdu) < 0)
+		return false;
+
+	return true;
+}
+
+static void find_cis(struct hci_conn *conn, void *data)
+{
+	struct iso_list_data *d = data;
+
+	/* Ignore broadcast */
+	if (!bacmp(&conn->dst, BDADDR_ANY))
+		return;
+
+	d->count++;
+}
+
+static int remove_cig_sync(struct hci_dev *hdev, void *data)
+{
+	u8 handle = PTR_ERR(data);
+
+	return hci_le_remove_cig_sync(hdev, handle);
+}
+
+int hci_le_remove_cig(struct hci_dev *hdev, u8 handle)
+{
+	bt_dev_dbg(hdev, "handle 0x%2.2x", handle);
+
+	return hci_cmd_sync_queue(hdev, remove_cig_sync, ERR_PTR(handle), NULL);
+}
+
+static void cis_cleanup(struct hci_conn *conn)
+{
+	struct hci_dev *hdev = conn->hdev;
+	struct iso_list_data d;
+
+	memset(&d, 0, sizeof(d));
+	d.cig = conn->iso_qos.cig;
+
+	/* Check if ISO connection is a CIS and remove CIG if there are
+	 * no other connections using it.
+	 */
+	hci_conn_hash_list_state(hdev, find_cis, ISO_LINK, BT_CONNECTED, &d);
+	if (d.count)
+		return;
+
+	hci_le_remove_cig(hdev, conn->iso_qos.cig);
+}
+
+struct hci_conn *hci_bind_cis(struct hci_dev *hdev, bdaddr_t *dst,
+			      __u8 dst_type, struct bt_iso_qos *qos)
+{
+	struct hci_conn *cis;
+
+	cis = hci_conn_hash_lookup_cis(hdev, dst, dst_type);
+	if (!cis) {
+		cis = hci_conn_add(hdev, ISO_LINK, dst, HCI_ROLE_MASTER);
+		if (!cis)
+			return ERR_PTR(-ENOMEM);
+		cis->cleanup = cis_cleanup;
+	}
+
+	if (cis->state == BT_CONNECTED)
+		return cis;
+
+	/* Check if CIS has been set and the settings matches */
+	if (cis->state == BT_BOUND &&
+	    !memcmp(&cis->iso_qos, qos, sizeof(*qos)))
+		return cis;
+
+	/* Update LINK PHYs according to QoS preference */
+	cis->le_tx_phy = qos->out.phy;
+	cis->le_rx_phy = qos->in.phy;
+
+	/* Mirror PHYs that are disabled as SDU will be set to 0 */
+	if (!qos->in.phy)
+		qos->in.phy = qos->out.phy;
+
+	if (!qos->out.phy)
+		qos->out.phy = qos->in.phy;
+
+	if (!hci_le_set_cig_params(cis, qos)) {
+		hci_conn_drop(cis);
+		return NULL;
+	}
+
+	cis->iso_qos = *qos;
+	cis->state = BT_BOUND;
+
+	return cis;
+}
+
+bool hci_iso_setup_path(struct hci_conn *conn)
+{
+	struct hci_dev *hdev = conn->hdev;
+	struct hci_cp_le_setup_iso_path cmd;
+
+	memset(&cmd, 0, sizeof(cmd));
+
+	if (conn->iso_qos.out.sdu) {
+		cmd.handle = cpu_to_le16(conn->handle);
+		cmd.direction = 0x00; /* Input (Host to Controller) */
+		cmd.path = 0x00; /* HCI path if enabled */
+		cmd.codec = 0x03; /* Transparent Data */
+
+		if (hci_send_cmd(hdev, HCI_OP_LE_SETUP_ISO_PATH, sizeof(cmd),
+				 &cmd) < 0)
+			return false;
+	}
+
+	if (conn->iso_qos.in.sdu) {
+		cmd.handle = cpu_to_le16(conn->handle);
+		cmd.direction = 0x01; /* Output (Controller to Host) */
+		cmd.path = 0x00; /* HCI path if enabled */
+		cmd.codec = 0x03; /* Transparent Data */
+
+		if (hci_send_cmd(hdev, HCI_OP_LE_SETUP_ISO_PATH, sizeof(cmd),
+				 &cmd) < 0)
+			return false;
+	}
+
+	return true;
+}
+
+static int hci_create_cis_sync(struct hci_dev *hdev, void *data)
+{
+	struct {
+		struct hci_cp_le_create_cis cp;
+		struct hci_cis cis[0x1f];
+	} cmd;
+	struct hci_conn *conn = data;
+	u8 cig;
+
+	memset(&cmd, 0, sizeof(cmd));
+	cmd.cis[0].acl_handle = cpu_to_le16(conn->link->handle);
+	cmd.cis[0].cis_handle = cpu_to_le16(conn->handle);
+	cmd.cp.num_cis++;
+	cig = conn->iso_qos.cig;
+
+	hci_dev_lock(hdev);
+
+	rcu_read_lock();
+
+	list_for_each_entry_rcu(conn, &hdev->conn_hash.list, list) {
+		struct hci_cis *cis = &cmd.cis[cmd.cp.num_cis];
+
+		if (conn == data || conn->type != ISO_LINK ||
+		    conn->state == BT_CONNECTED || conn->iso_qos.cig != cig)
+			continue;
+
+		/* Check if all CIS(s) belonging to a CIG are ready */
+		if (conn->link->state != BT_CONNECTED ||
+		    conn->state != BT_CONNECT) {
+			cmd.cp.num_cis = 0;
+			break;
+		}
+
+		/* Group all CIS with state BT_CONNECT since the spec don't
+		 * allow to send them individually:
+		 *
+		 * BLUETOOTH CORE SPECIFICATION Version 5.3 | Vol 4, Part E
+		 * page 2566:
+		 *
+		 * If the Host issues this command before all the
+		 * HCI_LE_CIS_Established events from the previous use of the
+		 * command have been generated, the Controller shall return the
+		 * error code Command Disallowed (0x0C).
+		 */
+		cis->acl_handle = cpu_to_le16(conn->link->handle);
+		cis->cis_handle = cpu_to_le16(conn->handle);
+		cmd.cp.num_cis++;
+	}
+
+	rcu_read_unlock();
+
+	hci_dev_unlock(hdev);
+
+	if (!cmd.cp.num_cis)
+		return 0;
+
+	return hci_send_cmd(hdev, HCI_OP_LE_CREATE_CIS, sizeof(cmd.cp) +
+			    sizeof(cmd.cis[0]) * cmd.cp.num_cis, &cmd);
+}
+
+int hci_le_create_cis(struct hci_conn *conn)
+{
+	struct hci_conn *cis;
+	struct hci_dev *hdev = conn->hdev;
+	int err;
+
+	switch (conn->type) {
+	case LE_LINK:
+		if (!conn->link || conn->state != BT_CONNECTED)
+			return -EINVAL;
+		cis = conn->link;
+		break;
+	case ISO_LINK:
+		cis = conn;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (cis->state == BT_CONNECT)
+		return 0;
+
+	/* Queue Create CIS */
+	err = hci_cmd_sync_queue(hdev, hci_create_cis_sync, cis, NULL);
+	if (err)
+		return err;
+
+	cis->state = BT_CONNECT;
+
+	return 0;
+}
+
+static void hci_iso_qos_setup(struct hci_dev *hdev, struct hci_conn *conn,
+			      struct bt_iso_io_qos *qos, __u8 phy)
+{
+	/* Only set MTU if PHY is enabled */
+	if (!qos->sdu && qos->phy) {
+		if (hdev->iso_mtu > 0)
+			qos->sdu = hdev->iso_mtu;
+		else if (hdev->le_mtu > 0)
+			qos->sdu = hdev->le_mtu;
+		else
+			qos->sdu = hdev->acl_mtu;
+	}
+
+	/* Use the same PHY as ACL if set to any */
+	if (qos->phy == BT_ISO_PHY_ANY)
+		qos->phy = phy;
+
+	/* Use LE ACL connection interval if not set */
+	if (!qos->interval)
+		/* ACL interval unit in 1.25 ms to us */
+		qos->interval = conn->le_conn_interval * 1250;
+
+	/* Use LE ACL connection latency if not set */
+	if (!qos->latency)
+		qos->latency = conn->le_conn_latency;
+}
+
+struct hci_conn *hci_connect_cis(struct hci_dev *hdev, bdaddr_t *dst,
+				 __u8 dst_type, struct bt_iso_qos *qos)
+{
+	struct hci_conn *le;
+	struct hci_conn *cis;
+
+	/* Convert from ISO socket address type to HCI address type  */
+	if (dst_type == BDADDR_LE_PUBLIC)
+		dst_type = ADDR_LE_DEV_PUBLIC;
+	else
+		dst_type = ADDR_LE_DEV_RANDOM;
+
+	if (hci_dev_test_flag(hdev, HCI_ADVERTISING))
+		le = hci_connect_le(hdev, dst, dst_type, false,
+				    BT_SECURITY_LOW,
+				    HCI_LE_CONN_TIMEOUT,
+				    HCI_ROLE_SLAVE);
+	else
+		le = hci_connect_le_scan(hdev, dst, dst_type,
+					 BT_SECURITY_LOW,
+					 HCI_LE_CONN_TIMEOUT,
+					 CONN_REASON_ISO_CONNECT);
+	if (IS_ERR(le))
+		return le;
+
+	/* If output interval is not set use the input interval as it cannot be
+	 * 0x000000.
+	 */
+	if (!qos->out.interval)
+		qos->out.interval = qos->in.interval;
+
+	/* If input interval is not set use the output interval as it cannot be
+	 * 0x000000.
+	 */
+	if (!qos->in.interval)
+		qos->in.interval = qos->out.interval;
+
+	/* If output latency is not set use the input latency as it cannot be
+	 * 0x0000.
+	 */
+	if (!qos->out.latency)
+		qos->out.latency = qos->in.latency;
+
+	/* If input latency is not set use the output latency as it cannot be
+	 * 0x0000.
+	 */
+	if (!qos->in.latency)
+		qos->in.latency = qos->out.latency;
+
+	hci_iso_qos_setup(hdev, le, &qos->out,
+			  le->le_tx_phy ? le->le_tx_phy : hdev->le_tx_def_phys);
+	hci_iso_qos_setup(hdev, le, &qos->in,
+			  le->le_rx_phy ? le->le_rx_phy : hdev->le_rx_def_phys);
+
+	cis = hci_bind_cis(hdev, dst, dst_type, qos);
+	if (!cis) {
+		hci_conn_drop(le);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	le->link = cis;
+	cis->link = le;
+
+	hci_conn_hold(cis);
+
+	return cis;
+}
+
 /* Check link security requirement */
 int hci_conn_check_link_mode(struct hci_conn *conn)
 {
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 377c0712bf3b..bdb5d42b5e6d 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -607,7 +607,10 @@ static int hci_dev_do_reset(struct hci_dev *hdev)
 		hdev->flush(hdev);
 
 	atomic_set(&hdev->cmd_cnt, 1);
-	hdev->acl_cnt = 0; hdev->sco_cnt = 0; hdev->le_cnt = 0;
+	hdev->acl_cnt = 0;
+	hdev->sco_cnt = 0;
+	hdev->le_cnt = 0;
+	hdev->iso_cnt = 0;
 
 	ret = hci_reset_sync(hdev);
 
@@ -3161,9 +3164,117 @@ void hci_send_sco(struct hci_conn *conn, struct sk_buff *skb)
 	queue_work(hdev->workqueue, &hdev->tx_work);
 }
 
+/* Send ISO data */
+static void hci_add_iso_hdr(struct sk_buff *skb, __u16 handle, __u8 flags)
+{
+	struct hci_iso_hdr *hdr;
+	int len = skb->len;
+
+	skb_push(skb, HCI_ISO_HDR_SIZE);
+	skb_reset_transport_header(skb);
+	hdr = (struct hci_iso_hdr *)skb_transport_header(skb);
+	hdr->handle = cpu_to_le16(hci_handle_pack(handle, flags));
+	hdr->dlen   = cpu_to_le16(len);
+}
+
+static void hci_queue_iso(struct hci_conn *conn, struct sk_buff_head *queue,
+			  struct sk_buff *skb)
+{
+	struct hci_dev *hdev = conn->hdev;
+	struct sk_buff *list;
+	__u16 flags;
+
+	skb->len = skb_headlen(skb);
+	skb->data_len = 0;
+
+	hci_skb_pkt_type(skb) = HCI_ISODATA_PKT;
+
+	list = skb_shinfo(skb)->frag_list;
+
+	flags = hci_iso_flags_pack(list ? ISO_START : ISO_SINGLE, 0x00);
+	hci_add_iso_hdr(skb, conn->handle, flags);
+
+	if (!list) {
+		/* Non fragmented */
+		BT_DBG("%s nonfrag skb %p len %d", hdev->name, skb, skb->len);
+
+		skb_queue_tail(queue, skb);
+	} else {
+		/* Fragmented */
+		BT_DBG("%s frag %p len %d", hdev->name, skb, skb->len);
+
+		skb_shinfo(skb)->frag_list = NULL;
+
+		__skb_queue_tail(queue, skb);
+
+		do {
+			skb = list; list = list->next;
+
+			hci_skb_pkt_type(skb) = HCI_ISODATA_PKT;
+			flags = hci_iso_flags_pack(list ? ISO_CONT : ISO_END,
+						   0x00);
+			hci_add_iso_hdr(skb, conn->handle, flags);
+
+			BT_DBG("%s frag %p len %d", hdev->name, skb, skb->len);
+
+			__skb_queue_tail(queue, skb);
+		} while (list);
+	}
+}
+
+void hci_send_iso(struct hci_conn *conn, struct sk_buff *skb)
+{
+	struct hci_dev *hdev = conn->hdev;
+
+	BT_DBG("%s len %d", hdev->name, skb->len);
+
+	hci_queue_iso(conn, &conn->data_q, skb);
+
+	queue_work(hdev->workqueue, &hdev->tx_work);
+}
+
 /* ---- HCI TX task (outgoing data) ---- */
 
 /* HCI Connection scheduler */
+static inline void hci_quote_sent(struct hci_conn *conn, int num, int *quote)
+{
+	struct hci_dev *hdev;
+	int cnt, q;
+
+	if (!conn) {
+		*quote = 0;
+		return;
+	}
+
+	hdev = conn->hdev;
+
+	switch (conn->type) {
+	case ACL_LINK:
+		cnt = hdev->acl_cnt;
+		break;
+	case AMP_LINK:
+		cnt = hdev->block_cnt;
+		break;
+	case SCO_LINK:
+	case ESCO_LINK:
+		cnt = hdev->sco_cnt;
+		break;
+	case LE_LINK:
+		cnt = hdev->le_mtu ? hdev->le_cnt : hdev->acl_cnt;
+		break;
+	case ISO_LINK:
+		cnt = hdev->iso_mtu ? hdev->iso_cnt :
+			hdev->le_mtu ? hdev->le_cnt : hdev->acl_cnt;
+		break;
+	default:
+		cnt = 0;
+		bt_dev_err(hdev, "unknown link type %d", conn->type);
+	}
+
+	q = cnt / num;
+	*quote = q ? q : 1;
+}
+
 static struct hci_conn *hci_low_sent(struct hci_dev *hdev, __u8 type,
 				     int *quote)
 {
@@ -3196,29 +3307,7 @@ static struct hci_conn *hci_low_sent(struct hci_dev *hdev, __u8 type,
 
 	rcu_read_unlock();
 
-	if (conn) {
-		int cnt, q;
-
-		switch (conn->type) {
-		case ACL_LINK:
-			cnt = hdev->acl_cnt;
-			break;
-		case SCO_LINK:
-		case ESCO_LINK:
-			cnt = hdev->sco_cnt;
-			break;
-		case LE_LINK:
-			cnt = hdev->le_mtu ? hdev->le_cnt : hdev->acl_cnt;
-			break;
-		default:
-			cnt = 0;
-			bt_dev_err(hdev, "unknown link type %d", conn->type);
-		}
-
-		q = cnt / num;
-		*quote = q ? q : 1;
-	} else
-		*quote = 0;
+	hci_quote_sent(conn, num, quote);
 
 	BT_DBG("conn %p quote %d", conn, *quote);
 	return conn;
@@ -3252,7 +3341,7 @@ static struct hci_chan *hci_chan_sent(struct hci_dev *hdev, __u8 type,
 	struct hci_chan *chan = NULL;
 	unsigned int num = 0, min = ~0, cur_prio = 0;
 	struct hci_conn *conn;
-	int cnt, q, conn_num = 0;
+	int conn_num = 0;
 
 	BT_DBG("%s", hdev->name);
 
@@ -3302,27 +3391,8 @@ static struct hci_chan *hci_chan_sent(struct hci_dev *hdev, __u8 type,
 	if (!chan)
 		return NULL;
 
-	switch (chan->conn->type) {
-	case ACL_LINK:
-		cnt = hdev->acl_cnt;
-		break;
-	case AMP_LINK:
-		cnt = hdev->block_cnt;
-		break;
-	case SCO_LINK:
-	case ESCO_LINK:
-		cnt = hdev->sco_cnt;
-		break;
-	case LE_LINK:
-		cnt = hdev->le_mtu ? hdev->le_cnt : hdev->acl_cnt;
-		break;
-	default:
-		cnt = 0;
-		bt_dev_err(hdev, "unknown link type %d", chan->conn->type);
-	}
+	hci_quote_sent(chan->conn, num, quote);
 
-	q = cnt / num;
-	*quote = q ? q : 1;
 	BT_DBG("chan %p quote %d", chan, *quote);
 	return chan;
 }
@@ -3611,18 +3681,46 @@ static void hci_sched_le(struct hci_dev *hdev)
 		hci_prio_recalculate(hdev, LE_LINK);
 }
 
+/* Schedule CIS */
+static void hci_sched_iso(struct hci_dev *hdev)
+{
+	struct hci_conn *conn;
+	struct sk_buff *skb;
+	int quote, *cnt;
+
+	BT_DBG("%s", hdev->name);
+
+	if (!hci_conn_num(hdev, ISO_LINK))
+		return;
+
+	cnt = hdev->iso_pkts ? &hdev->iso_cnt :
+		hdev->le_pkts ? &hdev->le_cnt : &hdev->acl_cnt;
+	while (*cnt && (conn = hci_low_sent(hdev, ISO_LINK, &quote))) {
+		while (quote-- && (skb = skb_dequeue(&conn->data_q))) {
+			BT_DBG("skb %p len %d", skb, skb->len);
+			hci_send_frame(hdev, skb);
+
+			conn->sent++;
+			if (conn->sent == ~0)
+				conn->sent = 0;
+			(*cnt)--;
+		}
+	}
+}
+
 static void hci_tx_work(struct work_struct *work)
 {
 	struct hci_dev *hdev = container_of(work, struct hci_dev, tx_work);
 	struct sk_buff *skb;
 
-	BT_DBG("%s acl %d sco %d le %d", hdev->name, hdev->acl_cnt,
-	       hdev->sco_cnt, hdev->le_cnt);
+	BT_DBG("%s acl %d sco %d le %d iso %d", hdev->name, hdev->acl_cnt,
+	       hdev->sco_cnt, hdev->le_cnt, hdev->iso_cnt);
 
 	if (!hci_dev_test_flag(hdev, HCI_USER_CHANNEL)) {
 		/* Schedule queues and send stuff to HCI driver */
 		hci_sched_sco(hdev);
 		hci_sched_esco(hdev);
+		hci_sched_iso(hdev);
 		hci_sched_acl(hdev);
 		hci_sched_le(hdev);
 	}
@@ -3705,6 +3803,39 @@ static void hci_scodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
 	kfree_skb(skb);
 }
 
+static void hci_isodata_packet(struct hci_dev *hdev, struct sk_buff *skb)
+{
+	struct hci_iso_hdr *hdr;
+	struct hci_conn *conn;
+	__u16 handle, flags;
+
+	hdr = skb_pull_data(skb, sizeof(*hdr));
+	if (!hdr) {
+		bt_dev_err(hdev, "ISO packet too small");
+		goto drop;
+	}
+
+	handle = __le16_to_cpu(hdr->handle);
+	flags  = hci_flags(handle);
+	handle = hci_handle(handle);
+
+	bt_dev_dbg(hdev, "len %d handle 0x%4.4x flags 0x%4.4x", skb->len,
+		   handle, flags);
+
+	hci_dev_lock(hdev);
+	conn = hci_conn_hash_lookup_handle(hdev, handle);
+	hci_dev_unlock(hdev);
+
+	/* TODO: Send to upper protocol */
+	if (!conn) {
+		bt_dev_err(hdev, "ISO packet for unknown connection handle %d",
+			   handle);
+	}
+
+drop:
+	kfree_skb(skb);
+}
+
 static bool hci_req_is_complete(struct hci_dev *hdev)
 {
 	struct sk_buff *skb;
@@ -3859,6 +3990,11 @@ static void hci_rx_work(struct work_struct *work)
 			hci_scodata_packet(hdev, skb);
 			break;
 
+		case HCI_ISODATA_PKT:
+			BT_DBG("%s ISO data packet", hdev->name);
+			hci_isodata_packet(hdev, skb);
+			break;
+
 		default:
 			kfree_skb(skb);
 			break;
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 8b39b9d31879..01c45e399b98 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -3774,6 +3774,124 @@ static inline void handle_cmd_cnt_and_timer(struct hci_dev *hdev, u8 ncmd)
 	}
 }
 
+static u8 hci_cc_le_read_buffer_size_v2(struct hci_dev *hdev, void *data,
+					struct sk_buff *skb)
+{
+	struct hci_rp_le_read_buffer_size_v2 *rp = data;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
+		return rp->status;
+
+	hdev->le_mtu   = __le16_to_cpu(rp->acl_mtu);
+	hdev->le_pkts  = __le16_to_cpu(rp->acl_max_pkt);
+	hdev->iso_mtu  = __le16_to_cpu(rp->iso_mtu);
+	hdev->iso_pkts = __le16_to_cpu(rp->iso_max_pkt);
+
+	hdev->le_cnt  = hdev->le_pkts;
+	hdev->iso_cnt = hdev->iso_pkts;
+
+	BT_DBG("%s acl mtu %d:%d iso mtu %d:%d", hdev->name, hdev->acl_mtu,
+	       hdev->acl_pkts, hdev->iso_mtu, hdev->iso_pkts);
+
+	return rp->status;
+}
+
+static u8 hci_cc_le_set_cig_params(struct hci_dev *hdev, void *data,
+				   struct sk_buff *skb)
+{
+	struct hci_rp_le_set_cig_params *rp = data;
+	struct hci_conn *conn;
+	int i = 0;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	hci_dev_lock(hdev);
+
+	if (rp->status) {
+		while ((conn = hci_conn_hash_lookup_cig(hdev, rp->cig_id))) {
+			conn->state = BT_CLOSED;
+			hci_connect_cfm(conn, rp->status);
+			hci_conn_del(conn);
+		}
+		goto unlock;
+	}
+
+	rcu_read_lock();
+
+	list_for_each_entry_rcu(conn, &hdev->conn_hash.list, list) {
+		if (conn->type != ISO_LINK || conn->iso_qos.cig != rp->cig_id ||
+		    conn->state == BT_CONNECTED)
+			continue;
+
+		conn->handle = __le16_to_cpu(rp->handle[i++]);
+
+		BT_DBG("%p handle 0x%4.4x link %p state %u", conn, conn->handle,
+		       conn->link, conn->link->state);
+
+		/* Create CIS if LE is already connected */
+		if (conn->link->state == BT_CONNECTED)
+			hci_le_create_cis(conn->link);
+
+		if (i == rp->num_handles)
+			break;
+	}
+
+	rcu_read_unlock();
+
+unlock:
+	hci_dev_unlock(hdev);
+
+	return rp->status;
+}
+
+static u8 hci_cc_le_setup_iso_path(struct hci_dev *hdev, void *data,
+				   struct sk_buff *skb)
+{
+	struct hci_rp_le_setup_iso_path *rp = data;
+	struct hci_cp_le_setup_iso_path *cp;
+	struct hci_conn *conn;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SETUP_ISO_PATH);
+	if (!cp)
+		return rp->status;
+
+	hci_dev_lock(hdev);
+
+	conn = hci_conn_hash_lookup_handle(hdev, __le16_to_cpu(cp->handle));
+	if (!conn)
+		goto unlock;
+
+	if (rp->status) {
+		hci_connect_cfm(conn, rp->status);
+		hci_conn_del(conn);
+		goto unlock;
+	}
+
+	switch (cp->direction) {
+	/* Input (Host to Controller) */
+	case 0x00:
+		/* Only confirm connection if output only */
+		if (conn->iso_qos.out.sdu && !conn->iso_qos.in.sdu)
+			hci_connect_cfm(conn, rp->status);
+		break;
+	/* Output (Controller to Host) */
+	case 0x01:
+		/* Confirm connection since conn->iso_qos is always configured
+		 * last.
+		 */
+		hci_connect_cfm(conn, rp->status);
+		break;
+	}
+
+unlock:
+	hci_dev_unlock(hdev);
+	return rp->status;
+}
+
 #define HCI_CC_VL(_op, _func, _min, _max) \
 { \
 	.op = _op, \
@@ -3949,7 +4067,13 @@ static const struct hci_cc {
 	HCI_CC_STATUS(HCI_OP_LE_CLEAR_ADV_SETS, hci_cc_le_clear_adv_sets),
 	HCI_CC(HCI_OP_LE_READ_TRANSMIT_POWER, hci_cc_le_read_transmit_power,
 	       sizeof(struct hci_rp_le_read_transmit_power)),
-	HCI_CC_STATUS(HCI_OP_LE_SET_PRIVACY_MODE, hci_cc_le_set_privacy_mode)
+	HCI_CC_STATUS(HCI_OP_LE_SET_PRIVACY_MODE, hci_cc_le_set_privacy_mode),
+	HCI_CC(HCI_OP_LE_READ_BUFFER_SIZE_V2, hci_cc_le_read_buffer_size_v2,
+	       sizeof(struct hci_rp_le_read_buffer_size_v2)),
+	HCI_CC_VL(HCI_OP_LE_SET_CIG_PARAMS, hci_cc_le_set_cig_params,
+		  sizeof(struct hci_rp_le_set_cig_params), HCI_MAX_EVENT_SIZE),
+	HCI_CC(HCI_OP_LE_SETUP_ISO_PATH, hci_cc_le_setup_iso_path,
+	       sizeof(struct hci_rp_le_setup_iso_path)),
 };
 
 static u8 hci_cc_func(struct hci_dev *hdev, const struct hci_cc *cc,
@@ -4012,6 +4136,40 @@ static void hci_cmd_complete_evt(struct hci_dev *hdev, void *data,
 		queue_work(hdev->workqueue, &hdev->cmd_work);
 }
 
+static void hci_cs_le_create_cis(struct hci_dev *hdev, u8 status)
+{
+	struct hci_cp_le_create_cis *cp;
+	int i;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", status);
+
+	if (!status)
+		return;
+
+	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_CREATE_CIS);
+	if (!cp)
+		return;
+
+	hci_dev_lock(hdev);
+
+	/* Remove connection if command failed */
+	for (i = 0; cp->num_cis; cp->num_cis--, i++) {
+		struct hci_conn *conn;
+		u16 handle;
+
+		handle = __le16_to_cpu(cp->cis[i].cis_handle);
+
+		conn = hci_conn_hash_lookup_handle(hdev, handle);
+		if (conn) {
+			conn->state = BT_CLOSED;
+			hci_connect_cfm(conn, status);
+			hci_conn_del(conn);
+		}
+	}
+
+	hci_dev_unlock(hdev);
+}
+
 #define HCI_CS(_op, _func) \
 { \
 	.op = _op, \
@@ -4041,7 +4199,8 @@ static const struct hci_cs {
 	HCI_CS(HCI_OP_LE_CREATE_CONN, hci_cs_le_create_conn),
 	HCI_CS(HCI_OP_LE_READ_REMOTE_FEATURES, hci_cs_le_read_remote_features),
 	HCI_CS(HCI_OP_LE_START_ENC, hci_cs_le_start_enc),
-	HCI_CS(HCI_OP_LE_EXT_CREATE_CONN, hci_cs_le_ext_create_conn)
+	HCI_CS(HCI_OP_LE_EXT_CREATE_CONN, hci_cs_le_ext_create_conn),
+	HCI_CS(HCI_OP_LE_CREATE_CIS, hci_cs_le_create_cis),
 };
 
 static void hci_cmd_status_evt(struct hci_dev *hdev, void *data,
@@ -4177,6 +4336,22 @@ static void hci_num_comp_pkts_evt(struct hci_dev *hdev, void *data,
 				hdev->sco_cnt = hdev->sco_pkts;
 			break;
 
+		case ISO_LINK:
+			if (hdev->iso_pkts) {
+				hdev->iso_cnt += count;
+				if (hdev->iso_cnt > hdev->iso_pkts)
+					hdev->iso_cnt = hdev->iso_pkts;
+			} else if (hdev->le_pkts) {
+				hdev->le_cnt += count;
+				if (hdev->le_cnt > hdev->le_pkts)
+					hdev->le_cnt = hdev->le_pkts;
+			} else {
+				hdev->acl_cnt += count;
+				if (hdev->acl_cnt > hdev->acl_pkts)
+					hdev->acl_cnt = hdev->acl_pkts;
+			}
+			break;
+
 		default:
 			bt_dev_err(hdev, "unknown type %d conn %p",
 				   conn->type, conn);
@@ -6477,6 +6652,127 @@ static void hci_le_phy_update_evt(struct hci_dev *hdev, void *data,
 	hci_dev_unlock(hdev);
 }
 
+static void hci_le_cis_estabilished_evt(struct hci_dev *hdev, void *data,
+					struct sk_buff *skb)
+{
+	struct hci_evt_le_cis_established *ev = data;
+	struct hci_conn *conn;
+	u16 handle = __le16_to_cpu(ev->handle);
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", ev->status);
+
+	hci_dev_lock(hdev);
+
+	conn = hci_conn_hash_lookup_handle(hdev, handle);
+	if (!conn) {
+		bt_dev_err(hdev,
+			   "Unable to find connection with handle 0x%4.4x",
+			   handle);
+		goto unlock;
+	}
+
+	if (conn->role == HCI_ROLE_SLAVE) {
+		__le32 interval;
+
+		memset(&interval, 0, sizeof(interval));
+
+		memcpy(&interval, ev->c_latency, sizeof(ev->c_latency));
+		conn->iso_qos.in.interval = le32_to_cpu(interval);
+		memcpy(&interval, ev->p_latency, sizeof(ev->p_latency));
+		conn->iso_qos.out.interval = le32_to_cpu(interval);
+		conn->iso_qos.in.latency = le16_to_cpu(ev->interval);
+		conn->iso_qos.out.latency = le16_to_cpu(ev->interval);
+		conn->iso_qos.in.sdu = le16_to_cpu(ev->c_mtu);
+		conn->iso_qos.out.sdu = le16_to_cpu(ev->p_mtu);
+		conn->iso_qos.in.phy = ev->c_phy;
+		conn->iso_qos.out.phy = ev->p_phy;
+	}
+
+	if (!ev->status) {
+		conn->state = BT_CONNECTED;
+		hci_debugfs_create_conn(conn);
+		hci_conn_add_sysfs(conn);
+		hci_iso_setup_path(conn);
+		goto unlock;
+	}
+
+	hci_connect_cfm(conn, ev->status);
+	hci_conn_del(conn);
+
+unlock:
+	hci_dev_unlock(hdev);
+}
+
+static void hci_le_reject_cis(struct hci_dev *hdev, __le16 handle)
+{
+	struct hci_cp_le_reject_cis cp;
+
+	memset(&cp, 0, sizeof(cp));
+	cp.handle = handle;
+	cp.reason = HCI_ERROR_REJ_BAD_ADDR;
+	hci_send_cmd(hdev, HCI_OP_LE_REJECT_CIS, sizeof(cp), &cp);
+}
+
+static void hci_le_accept_cis(struct hci_dev *hdev, __le16 handle)
+{
+	struct hci_cp_le_accept_cis cp;
+
+	memset(&cp, 0, sizeof(cp));
+	cp.handle = handle;
+	hci_send_cmd(hdev, HCI_OP_LE_ACCEPT_CIS, sizeof(cp), &cp);
+}
+
+static void hci_le_cis_req_evt(struct hci_dev *hdev, void *data,
+			       struct sk_buff *skb)
+{
+	struct hci_evt_le_cis_req *ev = data;
+	u16 acl_handle, cis_handle;
+	struct hci_conn *acl, *cis;
+	int mask;
+	__u8 flags = 0;
+
+	acl_handle = __le16_to_cpu(ev->acl_handle);
+	cis_handle = __le16_to_cpu(ev->cis_handle);
+
+	bt_dev_dbg(hdev, "acl 0x%4.4x handle 0x%4.4x cig 0x%2.2x cis 0x%2.2x",
+		   acl_handle, cis_handle, ev->cig_id, ev->cis_id);
+
+	hci_dev_lock(hdev);
+
+	acl = hci_conn_hash_lookup_handle(hdev, acl_handle);
+	if (!acl)
+		goto unlock;
+
+	mask = hci_proto_connect_ind(hdev, &acl->dst, ISO_LINK, &flags);
+	if (!(mask & HCI_LM_ACCEPT)) {
+		hci_le_reject_cis(hdev, ev->cis_handle);
+		goto unlock;
+	}
+
+	cis = hci_conn_hash_lookup_handle(hdev, cis_handle);
+	if (!cis) {
+		cis = hci_conn_add(hdev, ISO_LINK, &acl->dst, HCI_ROLE_SLAVE);
+		if (!cis) {
+			hci_le_reject_cis(hdev, ev->cis_handle);
+			goto unlock;
+		}
+		cis->handle = cis_handle;
+	}
+
+	cis->iso_qos.cig = ev->cig_id;
+	cis->iso_qos.cis = ev->cis_id;
+
+	if (!(flags & HCI_PROTO_DEFER)) {
+		hci_le_accept_cis(hdev, ev->cis_handle);
+	} else {
+		cis->state = BT_CONNECT2;
+		hci_connect_cfm(cis, 0);
+	}
+
+unlock:
+	hci_dev_unlock(hdev);
+}
+
 #define HCI_LE_EV_VL(_op, _func, _min_len, _max_len) \
 [_op] = { \
 	.func = _func, \
@@ -6540,6 +6836,12 @@ static const struct hci_le_ev {
 	/* [0x12 = HCI_EV_LE_EXT_ADV_SET_TERM] */
 	HCI_LE_EV(HCI_EV_LE_EXT_ADV_SET_TERM, hci_le_ext_adv_term_evt,
 		  sizeof(struct hci_evt_le_ext_adv_set_term)),
+	/* [0x19 = HCI_EVT_LE_CIS_ESTABLISHED] */
+	HCI_LE_EV(HCI_EVT_LE_CIS_ESTABLISHED, hci_le_cis_estabilished_evt,
+		  sizeof(struct hci_evt_le_cis_established)),
+	/* [0x1a = HCI_EVT_LE_CIS_REQ] */
+	HCI_LE_EV(HCI_EVT_LE_CIS_REQ, hci_le_cis_req_evt,
+		  sizeof(struct hci_evt_le_cis_req)),
 };
 
 static void hci_le_meta_evt(struct hci_dev *hdev, void *data,
@@ -6578,7 +6880,6 @@ static void hci_le_meta_evt(struct hci_dev *hdev, void *data,
 	if (skb->len > subev->max_len)
 		bt_dev_warn(hdev, "unexpected subevent 0x%2.2x length: %u > %u",
 			    ev->subevent, skb->len, subev->max_len);
-
 	data = hci_le_ev_skb_pull(hdev, skb, ev->subevent, subev->min_len);
 	if (!data)
 		return;
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index a6ada9dcede5..e8c27f65a371 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -2761,6 +2761,12 @@ static const struct hci_init_stage amp_init2[] = {
 /* Read Buffer Size (ACL mtu, max pkt, etc.) */
 static int hci_read_buffer_size_sync(struct hci_dev *hdev)
 {
+	/* Use Read LE Buffer Size V2 if supported */
+	if (hdev->commands[41] & 0x20)
+		return __hci_cmd_sync_status(hdev,
+					     HCI_OP_LE_READ_BUFFER_SIZE_V2,
+					     0, NULL, HCI_CMD_TIMEOUT);
+
 	return __hci_cmd_sync_status(hdev, HCI_OP_READ_BUFFER_SIZE,
 				     0, NULL, HCI_CMD_TIMEOUT);
 }
@@ -3012,6 +3018,10 @@ static int hci_init2_sync(struct hci_dev *hdev)
 	if (hdev->dev_type == HCI_AMP)
 		return hci_init_stage_sync(hdev, amp_init2);
 
+	err = hci_init_stage_sync(hdev, hci_init2);
+	if (err)
+		return err;
+
 	if (lmp_bredr_capable(hdev)) {
 		err = hci_init_stage_sync(hdev, br_init2);
 		if (err)
@@ -3029,7 +3039,7 @@ static int hci_init2_sync(struct hci_dev *hdev)
 			hci_dev_set_flag(hdev, HCI_LE_ENABLED);
 	}
 
-	return hci_init_stage_sync(hdev, hci_init2);
+	return 0;
 }
 
 static int hci_set_event_mask_sync(struct hci_dev *hdev)
@@ -3350,6 +3360,12 @@ static int hci_le_set_event_mask_sync(struct hci_dev *hdev)
 	if (ext_adv_capable(hdev))
 		events[2] |= 0x02;	/* LE Advertising Set Terminated */
 
+	if (cis_capable(hdev)) {
+		events[3] |= 0x01;	/* LE CIS Established */
+		if (cis_peripheral_capable(hdev))
+			events[3] |= 0x02; /* LE CIS Request */
+	}
+
 	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_EVENT_MASK,
 				     sizeof(events), events, HCI_CMD_TIMEOUT);
 }
@@ -3490,6 +3506,24 @@ static int hci_set_le_support_sync(struct hci_dev *hdev)
 				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
 }
 
+/* LE Set Host Feature */
+static int hci_le_set_host_feature_sync(struct hci_dev *hdev)
+{
+	struct hci_cp_le_set_host_feature cp;
+
+	if (!iso_capable(hdev))
+		return 0;
+
+	memset(&cp, 0, sizeof(cp));
+
+	/* Isochronous Channels (Host Support) */
+	cp.bit_number = 32;
+	cp.bit_value = 1;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_HOST_FEATURE,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
 /* LE Controller init stage 3 command sequence */
 static const struct hci_init_stage le_init3[] = {
 	/* HCI_OP_LE_SET_EVENT_MASK */
@@ -3516,6 +3550,8 @@ static const struct hci_init_stage le_init3[] = {
 	HCI_INIT(hci_le_read_num_support_adv_sets_sync),
 	/* HCI_OP_WRITE_LE_HOST_SUPPORTED */
 	HCI_INIT(hci_set_le_support_sync),
+	/* HCI_OP_LE_SET_HOST_FEATURE */
+	HCI_INIT(hci_le_set_host_feature_sync),
 	{}
 };
 
@@ -5348,3 +5384,14 @@ int hci_le_create_conn_sync(struct hci_dev *hdev, struct hci_conn *conn)
 	hci_resume_advertising_sync(hdev);
 	return err;
 }
+
+int hci_le_remove_cig_sync(struct hci_dev *hdev, u8 handle)
+{
+	struct hci_cp_le_remove_cig cp;
+
+	memset(&cp, 0, sizeof(cp));
+	cp.cig_id = handle;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_REMOVE_CIG, sizeof(cp),
+				     &cp, HCI_CMD_TIMEOUT);
+}
-- 
2.35.1

