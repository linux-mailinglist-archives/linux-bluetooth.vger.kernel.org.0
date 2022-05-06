Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF0D51E17B
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 May 2022 23:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444639AbiEFWBl (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 6 May 2022 18:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444635AbiEFWBi (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 6 May 2022 18:01:38 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DDC37BE3
        for <linux-bluetooth@vger.kernel.org>; Fri,  6 May 2022 14:57:52 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id z26so9483773iot.8
        for <linux-bluetooth@vger.kernel.org>; Fri, 06 May 2022 14:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aFcTPlzX+w/h7OP6YaYWG2DDA3kQgyxHNzMBClniweA=;
        b=UCPwGJZ6ddNUk+vgVfuZfF3NhGihAMj4niWDEXZW//ZJDimjZqTjikwefmq+HhOGHS
         8XrqAm5T3jMB5GXD0GMZDE6Gb2TS299c2SfX+fNJZu8f6n2bCu8Wc+ZP4aGYUWzQnRi3
         MdsSR3YE0tKsTXj9jTJIcN6Wg94K+41Uh7Koh9FfwNc6Z6RQsHj1GPMReFmzh7xY1SVt
         UfhhoOQvf4Tw5XIxy9kSg9fWf0mkfs7/8jogDlsV4nUHdlnzg0J+Ckniesy5hrZEnxhw
         AvhG5e1ndvgNTLAei6uD8gUqjsnOcdNVdxwiC+UNT9NqV7GTS3wRALMdb0GSldEtOm3P
         Kw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aFcTPlzX+w/h7OP6YaYWG2DDA3kQgyxHNzMBClniweA=;
        b=lp3w7qlCOSDejb1/3Cg8KrMWwRmQe7eomBFicJOJORoCf+Ykbo4L4X30XC+tIJCXTf
         2sHAn3cW3rYWaCv+heOyTtBBXGED0lXWomEK4XJZnLo4r1myO11h6vsy2NQk7cgk6XF3
         kK5paahak8Jjfol9+VC/dMCM7qVOD1NumIE3JVn6LDLKB//5smvlQMkUUMMmjP85Zio8
         We9UPmEZqW88fuuHlm8unkzOAOey6rSBjJnuI4UMo3XujfCekeNJaLEcJ8PQLlBguD2/
         cz0KlTRx1V1BRbStgDM+yZzLOBkn3mfhorTKGS3lMggJBxX70b5Ai4ZK9c1oRYHZxvZx
         dbqQ==
X-Gm-Message-State: AOAM530xb/un3vpAs3gejPs4TbZLd31WzoAoMnT3DTvCoPki9UxWsyLk
        LZvPUuIv6uF3eNmRmxMsvw2WQ9TPi+Y=
X-Google-Smtp-Source: ABdhPJwz03YDo+1H2f9CYHIpQRVnAjetezFT4RI8RBb1HARy0eeED/by9USsnDDKjS3N/f4DGqSQwQ==
X-Received: by 2002:a5d:8504:0:b0:657:724e:5420 with SMTP id q4-20020a5d8504000000b00657724e5420mr2066897ion.147.1651874270459;
        Fri, 06 May 2022 14:57:50 -0700 (PDT)
Received: from lvondent-mobl4.. (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id s14-20020a5e980e000000b0065aab053448sm1572281ioj.21.2022.05.06.14.57.49
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 14:57:49 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2 5/8] Bluetooth: Add initial implementation of BIS connections
Date:   Fri,  6 May 2022 14:57:40 -0700
Message-Id: <20220506215743.3870212-5-luiz.dentz@gmail.com>
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

This adds initial support for BIS/BIG which includes:

== Broadcaster role: Setup a periodic advertising and create a BIG ==

> tools/isotest -s 00:00:00:00:00:00
isotest[63]: Connected [00:00:00:00:00:00]
isotest[63]: QoS BIG 0x00 BIS 0x00 Packing 0x00 Framing 0x00]
isotest[63]: Output QoS [Interval 10000 us Latency 10 ms SDU 40 PHY 0x02
RTN 2]
isotest[63]: Sending ...
isotest[63]: Number of packets: 1
isotest[63]: Socket jitter buffer: 80 buffer
< HCI Command: LE Set Perio.. (0x08|0x003e) plen 7
...
> HCI Event: Command Complete (0x0e) plen 4
      LE Set Periodic Advertising Parameters (0x08|0x003e) ncmd 1
        Status: Success (0x00)
< HCI Command: LE Set Perio.. (0x08|0x003f) plen 7
...
> HCI Event: Command Complete (0x0e) plen 4
      LE Set Periodic Advertising Data (0x08|0x003f) ncmd 1
        Status: Success (0x00)
< HCI Command: LE Set Perio.. (0x08|0x0040) plen 2
...
> HCI Event: Command Complete (0x0e) plen 4
      LE Set Periodic Advertising Enable (0x08|0x0040) ncmd 1
        Status: Success (0x00)
< HCI Command: LE Create B.. (0x08|0x0068) plen 31
...
> HCI Event: Command Status (0x0f) plen 4
      LE Create Broadcast Isochronous Group (0x08|0x0068) ncmd 1
        Status: Success (0x00)
> HCI Event: LE Meta Event (0x3e) plen 21
      LE Broadcast Isochronous Group Complete (0x1b)
      ...

== Broadcast Receiver role: Create a PA Sync and BIG Sync ==

> tools/isotest -i hci1 -d 00:AA:01:00:00:00
isotest[66]: Waiting for connection 00:AA:01:00:00:00...
< HCI Command: LE Periodic Advert.. (0x08|0x0044) plen 14
...
> HCI Event: Command Status (0x0f) plen 4
      LE Periodic Advertising Create Sync (0x08|0x0044) ncmd 1
        Status: Success (0x00)
< HCI Command: LE Set Extended Sca.. (0x08|0x0041) plen 8
...
> HCI Event: Command Complete (0x0e) plen 4
      LE Set Extended Scan Parameters (0x08|0x0041) ncmd 1
        Status: Success (0x00)
< HCI Command: LE Set Extended Sca.. (0x08|0x0042) plen 6
...
> HCI Event: Command Complete (0x0e) plen 4
      LE Set Extended Scan Enable (0x08|0x0042) ncmd 1
        Status: Success (0x00)
> HCI Event: LE Meta Event (0x3e) plen 29
      LE Extended Advertising Report (0x0d)
      ...
> HCI Event: LE Meta Event (0x3e) plen 16
      LE Periodic Advertising Sync Established (0x0e)
      ...
< HCI Command: LE Broadcast Isoch.. (0x08|0x006b) plen 25
...
> HCI Event: Command Status (0x0f) plen 4
      LE Broadcast Isochronous Group Create Sync (0x08|0x006b) ncmd 1
        Status: Success (0x00)
> HCI Event: LE Meta Event (0x3e) plen 17
      LE Broadcast Isochronous Group Sync Estabilished (0x1d)
      ...

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/bluetooth.h |  18 +-
 include/net/bluetooth/hci.h       | 162 ++++++++-
 include/net/bluetooth/hci_core.h  |  89 ++++-
 include/net/bluetooth/hci_sync.h  |  12 +-
 net/bluetooth/eir.c               |  21 ++
 net/bluetooth/eir.h               |   1 +
 net/bluetooth/hci_conn.c          | 560 +++++++++++++++++++++++++++---
 net/bluetooth/hci_core.c          |  89 +++--
 net/bluetooth/hci_event.c         | 206 +++++++++++
 net/bluetooth/hci_request.c       |  36 +-
 net/bluetooth/hci_request.h       |   9 +
 net/bluetooth/hci_sync.c          | 250 ++++++++++++-
 net/bluetooth/mgmt.c              |  15 +-
 13 files changed, 1337 insertions(+), 131 deletions(-)

diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bluetooth.h
index 0acf20a1ad6c..50fe81712511 100644
--- a/include/net/bluetooth/bluetooth.h
+++ b/include/net/bluetooth/bluetooth.h
@@ -160,6 +160,9 @@ struct bt_voice {
 #define BT_ISO_QOS_CIG_UNSET	0xff
 #define BT_ISO_QOS_CIS_UNSET	0xff
 
+#define BT_ISO_QOS_BIG_UNSET	0xff
+#define BT_ISO_QOS_BIS_UNSET	0xff
+
 struct bt_iso_io_qos {
 	__u32 interval;
 	__u16 latency;
@@ -169,9 +172,18 @@ struct bt_iso_io_qos {
 };
 
 struct bt_iso_qos {
-	__u8  cig;
-	__u8  cis;
-	__u8  sca;
+	union {
+		__u8  cig;
+		__u8  big;
+	};
+	union {
+		__u8  cis;
+		__u8  bis;
+	};
+	union {
+		__u8  sca;
+		__u8  sync_interval;
+	};
 	__u8  packing;
 	__u8  framing;
 	struct bt_iso_io_qos in;
diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 749b304b4953..e00e2bd973b6 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -327,6 +327,7 @@ enum {
 	HCI_USER_CHANNEL,
 	HCI_EXT_CONFIGURED,
 	HCI_LE_ADV,
+	HCI_LE_PER_ADV,
 	HCI_LE_SCAN,
 	HCI_SSP_ENABLED,
 	HCI_SC_ENABLED,
@@ -349,6 +350,7 @@ enum {
 	HCI_LE_SCAN_INTERRUPTED,
 	HCI_WIDEBAND_SPEECH_ENABLED,
 	HCI_EVENT_FILTER_CONFIGURED,
+	HCI_PA_SYNC,
 
 	HCI_DUT_MODE,
 	HCI_VENDOR_DIAG,
@@ -528,9 +530,11 @@ enum {
 #define HCI_LE_PHY_2M			0x01
 #define HCI_LE_PHY_CODED		0x08
 #define HCI_LE_EXT_ADV			0x10
+#define HCI_LE_PERIODIC_ADV		0x20
 #define HCI_LE_CHAN_SEL_ALG2		0x40
 #define HCI_LE_CIS_CENTRAL		0x10
 #define HCI_LE_CIS_PERIPHERAL		0x20
+#define HCI_LE_ISO_BROADCASTER		0x40
 
 /* Connection modes */
 #define HCI_CM_ACTIVE	0x0000
@@ -1874,6 +1878,22 @@ struct hci_cp_le_ext_conn_param {
 	__le16 max_ce_len;
 } __packed;
 
+#define HCI_OP_LE_PA_CREATE_SYNC	0x2044
+struct hci_cp_le_pa_create_sync {
+	__u8      options;
+	__u8      sid;
+	__u8      addr_type;
+	bdaddr_t  addr;
+	__le16    skip;
+	__le16    sync_timeout;
+	__u8      sync_cte_type;
+} __packed;
+
+#define HCI_OP_LE_PA_TERM_SYNC		0x2046
+struct hci_cp_le_pa_term_sync {
+	__le16    handle;
+} __packed;
+
 #define HCI_OP_LE_READ_NUM_SUPPORTED_ADV_SETS	0x203b
 struct hci_rp_le_read_num_supported_adv_sets {
 	__u8  status;
@@ -1908,13 +1928,6 @@ struct hci_rp_le_set_ext_adv_params {
 	__u8  tx_power;
 } __packed;
 
-#define HCI_OP_LE_SET_EXT_ADV_ENABLE		0x2039
-struct hci_cp_le_set_ext_adv_enable {
-	__u8  enable;
-	__u8  num_of_sets;
-	__u8  data[];
-} __packed;
-
 struct hci_cp_ext_adv_set {
 	__u8  handle;
 	__le16 duration;
@@ -1941,6 +1954,37 @@ struct hci_cp_le_set_ext_scan_rsp_data {
 	__u8  data[];
 } __packed;
 
+#define HCI_OP_LE_SET_EXT_ADV_ENABLE		0x2039
+struct hci_cp_le_set_ext_adv_enable {
+	__u8  enable;
+	__u8  num_of_sets;
+	__u8  data[];
+} __packed;
+
+#define HCI_OP_LE_SET_PER_ADV_PARAMS		0x203e
+struct hci_cp_le_set_per_adv_params {
+	__u8      handle;
+	__le16    min_interval;
+	__le16    max_interval;
+	__le16    periodic_properties;
+} __packed;
+
+#define HCI_MAX_PER_AD_LENGTH	252
+
+#define HCI_OP_LE_SET_PER_ADV_DATA		0x203f
+struct hci_cp_le_set_per_adv_data {
+	__u8  handle;
+	__u8  operation;
+	__u8  length;
+	__u8  data[];
+} __packed;
+
+#define HCI_OP_LE_SET_PER_ADV_ENABLE		0x2040
+struct hci_cp_le_set_per_adv_enable {
+	__u8  enable;
+	__u8  handle;
+} __packed;
+
 #define LE_SET_ADV_DATA_OP_COMPLETE	0x03
 
 #define LE_SET_ADV_DATA_NO_FRAG		0x01
@@ -2052,6 +2096,49 @@ struct hci_cp_le_reject_cis {
 	__u8    reason;
 } __packed;
 
+#define HCI_OP_LE_CREATE_BIG			0x2068
+struct hci_bis {
+	__u8    sdu_interval[3];
+	__u16   sdu;
+	__u16   latency;
+	__u8    rtn;
+	__u8    phy;
+	__u8    packing;
+	__u8    framing;
+	__u8    encryption;
+	__u8    bcode[16];
+} __packed;
+
+struct hci_cp_le_create_big {
+	__u8    handle;
+	__u8    adv_handle;
+	__u8    num_bis;
+	struct hci_bis bis;
+} __packed;
+
+#define HCI_OP_LE_TERM_BIG			0x206a
+struct hci_cp_le_term_big {
+	__u8    handle;
+	__u8    reason;
+} __packed;
+
+#define HCI_OP_LE_BIG_CREATE_SYNC		0x206b
+struct hci_cp_le_big_create_sync {
+	__u8    handle;
+	__le16  sync_handle;
+	__u8    encryption;
+	__u8    bcode[16];
+	__u8    mse;
+	__le16  timeout;
+	__u8    num_bis;
+	__u8    bis[0];
+} __packed;
+
+#define HCI_OP_LE_BIG_TERM_SYNC			0x206c
+struct hci_cp_le_big_term_sync {
+	__u8    handle;
+} __packed;
+
 #define HCI_OP_LE_SETUP_ISO_PATH		0x206e
 struct hci_cp_le_setup_iso_path {
 	__le16  handle;
@@ -2604,6 +2691,18 @@ struct hci_ev_le_ext_adv_report {
 	struct hci_ev_le_ext_adv_info info[];
 } __packed;
 
+#define HCI_EV_LE_PA_SYNC_ESTABLISHED	0x0e
+struct hci_ev_le_pa_sync_established {
+	__u8      status;
+	__le16    handle;
+	__u8      sid;
+	__u8      bdaddr_type;
+	bdaddr_t  bdaddr;
+	__u8      phy;
+	__le16    interval;
+	__u8      clock_accuracy;
+} __packed;
+
 #define HCI_EV_LE_ENHANCED_CONN_COMPLETE    0x0a
 struct hci_ev_le_enh_conn_complete {
 	__u8      status;
@@ -2655,6 +2754,55 @@ struct hci_evt_le_cis_req {
 	__u8  cis_id;
 } __packed;
 
+#define HCI_EVT_LE_CREATE_BIG_COMPLETE	0x1b
+struct hci_evt_le_create_big_complete {
+	__u8    status;
+	__u8    handle;
+	__u8    sync_delay[3];
+	__u8    transport_delay[3];
+	__u8    phy;
+	__u8    nse;
+	__u8    bn;
+	__u8    pto;
+	__u8    irc;
+	__le16  max_pdu;
+	__le16  interval;
+	__u8    num_bis;
+	__le16  bis_handle[];
+} __packed;
+
+#define HCI_EVT_LE_BIG_SYNC_ESTABILISHED 0x1d
+struct hci_evt_le_big_sync_estabilished {
+	__u8    status;
+	__u8    handle;
+	__u8    latency[3];
+	__u8    nse;
+	__u8    bn;
+	__u8    pto;
+	__u8    irc;
+	__le16  max_pdu;
+	__le16  interval;
+	__u8    num_bis;
+	__le16  bis[];
+} __packed;
+
+#define HCI_EVT_LE_BIG_INFO_ADV_REPORT	0x22
+struct hci_evt_le_big_info_adv_report {
+	__le16  sync_handle;
+	__u8    num_bis;
+	__u8    nse;
+	__le16  iso_interval;
+	__u8    bn;
+	__u8    pto;
+	__u8    irc;
+	__le16  max_pdu;
+	__u8    sdu_interval[3];
+	__le16  max_sdu;
+	__u8    phy;
+	__u8    framing;
+	__u8    encryption;
+} __packed;
+
 #define HCI_EV_VENDOR			0xff
 
 /* Internal events generated by Bluetooth stack */
diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 0e2621b46d57..ca4eb4715977 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -235,8 +235,9 @@ struct oob_data {
 
 struct adv_info {
 	struct list_head list;
-	bool enabled;
-	bool pending;
+	bool	enabled;
+	bool	pending;
+	bool	periodic;
 	__u8	instance;
 	__u32	flags;
 	__u16	timeout;
@@ -246,6 +247,8 @@ struct adv_info {
 	__u8	adv_data[HCI_MAX_EXT_AD_LENGTH];
 	__u16	scan_rsp_len;
 	__u8	scan_rsp_data[HCI_MAX_EXT_AD_LENGTH];
+	__u16	per_adv_data_len;
+	__u8	per_adv_data[HCI_MAX_PER_AD_LENGTH];
 	__s8	tx_power;
 	__u32   min_interval;
 	__u32   max_interval;
@@ -585,6 +588,8 @@ struct hci_dev {
 	__u8			adv_data_len;
 	__u8			scan_rsp_data[HCI_MAX_EXT_AD_LENGTH];
 	__u8			scan_rsp_data_len;
+	__u8			per_adv_data[HCI_MAX_PER_AD_LENGTH];
+	__u8			per_adv_data_len;
 
 	struct list_head	adv_instances;
 	unsigned int		adv_instance_cnt;
@@ -670,6 +675,7 @@ struct hci_conn {
 	__u8		resp_addr_type;
 	__u8		adv_instance;
 	__u16		handle;
+	__u16		sync_handle;
 	__u16		state;
 	__u8		mode;
 	__u8		type;
@@ -700,6 +706,8 @@ struct hci_conn {
 	__u16		le_supv_timeout;
 	__u8		le_adv_data[HCI_MAX_AD_LENGTH];
 	__u8		le_adv_data_len;
+	__u8		le_per_adv_data[HCI_MAX_PER_AD_LENGTH];
+	__u8		le_per_adv_data_len;
 	__u8		le_tx_phy;
 	__u8		le_rx_phy;
 	__s8		rssi;
@@ -933,6 +941,7 @@ enum {
 	HCI_CONN_NEW_LINK_KEY,
 	HCI_CONN_SCANNING,
 	HCI_CONN_AUTH_FAILURE,
+	HCI_CONN_PER_ADV,
 };
 
 static inline bool hci_conn_ssp_enabled(struct hci_conn *conn)
@@ -1051,6 +1060,29 @@ static inline __u8 hci_conn_lookup_type(struct hci_dev *hdev, __u16 handle)
 	return type;
 }
 
+static inline struct hci_conn *hci_conn_hash_lookup_bis(struct hci_dev *hdev,
+							bdaddr_t *ba,
+							__u8 big, __u8 bis)
+{
+	struct hci_conn_hash *h = &hdev->conn_hash;
+	struct hci_conn  *c;
+
+	rcu_read_lock();
+
+	list_for_each_entry_rcu(c, &h->list, list) {
+		if (bacmp(&c->dst, ba) || c->type != ISO_LINK)
+			continue;
+
+		if (c->iso_qos.big == big && c->iso_qos.bis == bis) {
+			rcu_read_unlock();
+			return c;
+		}
+	}
+	rcu_read_unlock();
+
+	return NULL;
+}
+
 static inline struct hci_conn *hci_conn_hash_lookup_handle(struct hci_dev *hdev,
 								__u16 handle)
 {
@@ -1161,6 +1193,29 @@ static inline struct hci_conn *hci_conn_hash_lookup_cig(struct hci_dev *hdev,
 	return NULL;
 }
 
+static inline struct hci_conn *hci_conn_hash_lookup_big(struct hci_dev *hdev,
+							__u8 handle)
+{
+	struct hci_conn_hash *h = &hdev->conn_hash;
+	struct hci_conn  *c;
+
+	rcu_read_lock();
+
+	list_for_each_entry_rcu(c, &h->list, list) {
+		if (bacmp(&c->dst, BDADDR_ANY) || c->type != ISO_LINK)
+			continue;
+
+		if (handle == c->iso_qos.big) {
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
@@ -1255,6 +1310,13 @@ struct hci_conn *hci_bind_cis(struct hci_dev *hdev, bdaddr_t *dst,
 			      __u8 dst_type, struct bt_iso_qos *qos);
 struct hci_conn *hci_connect_cis(struct hci_dev *hdev, bdaddr_t *dst,
 				 __u8 dst_type, struct bt_iso_qos *qos);
+struct hci_conn *hci_connect_bis(struct hci_dev *hdev, bdaddr_t *dst,
+				 __u8 dst_type, struct bt_iso_qos *qos,
+				 __u8 data_len, __u8 *data);
+int hci_pa_create_sync(struct hci_dev *hdev, bdaddr_t *dst, __u8 dst_type,
+		       __u8 sid);
+int hci_le_big_create_sync(struct hci_dev *hdev, struct bt_iso_qos *qos,
+			   __u16 sync_handle, __u8 num_bis, __u8 bis[]);
 int hci_conn_check_link_mode(struct hci_conn *conn);
 int hci_conn_check_secure(struct hci_conn *conn, __u8 sec_level);
 int hci_conn_security(struct hci_conn *conn, __u8 sec_level, __u8 auth_type,
@@ -1499,11 +1561,14 @@ int hci_remove_remote_oob_data(struct hci_dev *hdev, bdaddr_t *bdaddr,
 void hci_adv_instances_clear(struct hci_dev *hdev);
 struct adv_info *hci_find_adv_instance(struct hci_dev *hdev, u8 instance);
 struct adv_info *hci_get_next_instance(struct hci_dev *hdev, u8 instance);
-int hci_add_adv_instance(struct hci_dev *hdev, u8 instance, u32 flags,
-			 u16 adv_data_len, u8 *adv_data,
-			 u16 scan_rsp_len, u8 *scan_rsp_data,
-			 u16 timeout, u16 duration, s8 tx_power,
-			 u32 min_interval, u32 max_interval);
+struct adv_info *hci_add_adv_instance(struct hci_dev *hdev, u8 instance,
+				      u32 flags, u16 adv_data_len, u8 *adv_data,
+				      u16 scan_rsp_len, u8 *scan_rsp_data,
+				      u16 timeout, u16 duration, s8 tx_power,
+				      u32 min_interval, u32 max_interval);
+struct adv_info *hci_add_per_instance(struct hci_dev *hdev, u8 instance,
+				      u32 flags, u8 data_len, u8 *data,
+				      u32 min_interval, u32 max_interval);
 int hci_set_adv_instance_data(struct hci_dev *hdev, u8 instance,
 			 u16 adv_data_len, u8 *adv_data,
 			 u16 scan_rsp_len, u8 *scan_rsp_data);
@@ -1623,14 +1688,18 @@ void hci_conn_del_sysfs(struct hci_conn *conn);
 #define use_enhanced_conn_complete(dev) (ll_privacy_capable(dev) || \
 					 ext_adv_capable(dev))
 
-/* CIS Master/Slave support */
-#define iso_capable(dev) (cis_capable(dev))
+/* Periodic advertising support */
+#define per_adv_capable(dev) (((dev)->le_features[1] & HCI_LE_PERIODIC_ADV))
+
+/* CIS Master/Slave and BIS support */
+#define iso_capable(dev) (cis_capable(dev) || bis_capable(dev))
 #define cis_capable(dev) \
 	(cis_central_capable(dev) || cis_peripheral_capable(dev))
 #define cis_central_capable(dev) \
 	((dev)->le_features[3] & HCI_LE_CIS_CENTRAL)
 #define cis_peripheral_capable(dev) \
 	((dev)->le_features[3] & HCI_LE_CIS_PERIPHERAL)
+#define bis_capable(dev) ((dev)->le_features[3] & HCI_LE_ISO_BROADCASTER)
 
 /* ----- HCI protocols ----- */
 #define HCI_PROTO_DEFER             0x01
@@ -1918,6 +1987,8 @@ void hci_mgmt_chan_unregister(struct hci_mgmt_chan *c);
 #define DISCOV_LE_RESTART_DELAY		msecs_to_jiffies(200)	/* msec */
 #define DISCOV_LE_FAST_ADV_INT_MIN	0x00A0	/* 100 msec */
 #define DISCOV_LE_FAST_ADV_INT_MAX	0x00F0	/* 150 msec */
+#define DISCOV_LE_PER_ADV_INT_MIN	0x00A0	/* 200 msec */
+#define DISCOV_LE_PER_ADV_INT_MAX	0x00A0	/* 200 msec */
 
 #define NAME_RESOLVE_DURATION		msecs_to_jiffies(10240)	/* 10.24 sec */
 
diff --git a/include/net/bluetooth/hci_sync.h b/include/net/bluetooth/hci_sync.h
index a32678c69135..bf45133ee82c 100644
--- a/include/net/bluetooth/hci_sync.h
+++ b/include/net/bluetooth/hci_sync.h
@@ -65,6 +65,10 @@ int hci_enable_ext_advertising_sync(struct hci_dev *hdev, u8 instance);
 int hci_enable_advertising_sync(struct hci_dev *hdev);
 int hci_enable_advertising(struct hci_dev *hdev);
 
+int hci_start_per_adv_sync(struct hci_dev *hdev, u8 instance, u8 data_len,
+			   u8 *data, u32 flags, u16 min_interval,
+			   u16 max_interval, u16 sync_interval);
+
 int hci_remove_advertising_sync(struct hci_dev *hdev, struct sock *sk,
 				u8 instance, bool force);
 int hci_disable_advertising_sync(struct hci_dev *hdev);
@@ -82,6 +86,7 @@ int hci_update_scan_sync(struct hci_dev *hdev);
 int hci_write_le_host_supported_sync(struct hci_dev *hdev, u8 le, u8 simul);
 int hci_remove_ext_adv_instance_sync(struct hci_dev *hdev, u8 instance,
 				     struct sock *sk);
+int hci_remove_ext_adv_instance(struct hci_dev *hdev, u8 instance);
 struct sk_buff *hci_read_local_oob_data_sync(struct hci_dev *hdev, bool ext,
 					     struct sock *sk);
 
@@ -108,4 +113,9 @@ struct hci_conn;
 int hci_le_create_conn_sync(struct hci_dev *hdev, struct hci_conn *conn);
 
 int hci_le_remove_cig_sync(struct hci_dev *hdev, u8 handle);
-int hci_le_remove_cig(struct hci_dev *hdev, u8 handle);
+
+int hci_le_terminate_big_sync(struct hci_dev *hdev, u8 handle, u8 reason);
+
+int hci_le_big_terminate_sync(struct hci_dev *hdev, u8 handle);
+
+int hci_le_pa_terminate_sync(struct hci_dev *hdev, u16 handle);
diff --git a/net/bluetooth/eir.c b/net/bluetooth/eir.c
index 7d77fb00c2bf..478b9feca3c1 100644
--- a/net/bluetooth/eir.c
+++ b/net/bluetooth/eir.c
@@ -225,6 +225,27 @@ void eir_create(struct hci_dev *hdev, u8 *data)
 	ptr = create_uuid128_list(hdev, ptr, HCI_MAX_EIR_LENGTH - (ptr - data));
 }
 
+u8 eir_create_per_adv_data(struct hci_dev *hdev, u8 instance, u8 *ptr)
+{
+	struct adv_info *adv = NULL;
+	u8 ad_len = 0;
+
+	/* Return 0 when the current instance identifier is invalid. */
+	if (instance) {
+		adv = hci_find_adv_instance(hdev, instance);
+		if (!adv)
+			return 0;
+	}
+
+	if (adv) {
+		memcpy(ptr, adv->per_adv_data, adv->per_adv_data_len);
+		ad_len += adv->per_adv_data_len;
+		ptr += adv->per_adv_data_len;
+	}
+
+	return ad_len;
+}
+
 u8 eir_create_adv_data(struct hci_dev *hdev, u8 instance, u8 *ptr)
 {
 	struct adv_info *adv = NULL;
diff --git a/net/bluetooth/eir.h b/net/bluetooth/eir.h
index 62f2374078f2..0df19f2f4af9 100644
--- a/net/bluetooth/eir.h
+++ b/net/bluetooth/eir.h
@@ -11,6 +11,7 @@ void eir_create(struct hci_dev *hdev, u8 *data);
 
 u8 eir_create_adv_data(struct hci_dev *hdev, u8 instance, u8 *ptr);
 u8 eir_create_scan_rsp(struct hci_dev *hdev, u8 instance, u8 *ptr);
+u8 eir_create_per_adv_data(struct hci_dev *hdev, u8 instance, u8 *ptr);
 
 u8 eir_append_local_name(struct hci_dev *hdev, u8 *eir, u8 ad_len);
 u8 eir_append_appearance(struct hci_dev *hdev, u8 *ptr, u8 ad_len);
diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index a719a2e18d24..82cd2414ee86 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -30,10 +30,13 @@
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
 #include <net/bluetooth/l2cap.h>
+#include <net/bluetooth/iso.h>
+#include <net/bluetooth/mgmt.h>
 
 #include "hci_request.h"
 #include "smp.h"
 #include "a2mp.h"
+#include "eir.h"
 
 struct sco_param {
 	u16 pkt_type;
@@ -681,6 +684,199 @@ static void le_conn_timeout(struct work_struct *work)
 	hci_abort_conn(conn, HCI_ERROR_REMOTE_USER_TERM);
 }
 
+struct iso_list_data {
+	union {
+		u8  cig;
+		u8  big;
+	};
+	union {
+		u8  cis;
+		u8  bis;
+		u16 sync_handle;
+	};
+	int count;
+	struct {
+		struct hci_cp_le_set_cig_params cp;
+		struct hci_cis_params cis[0x11];
+	} pdu;
+};
+
+static void bis_list(struct hci_conn *conn, void *data)
+{
+	struct iso_list_data *d = data;
+
+	/* Skip if not broadcast/ANY address */
+	if (bacmp(&conn->dst, BDADDR_ANY))
+		return;
+
+	if (d->big != conn->iso_qos.big || d->bis == BT_ISO_QOS_BIS_UNSET ||
+	    d->bis != conn->iso_qos.bis)
+		return;
+
+	d->count++;
+}
+
+static void find_bis(struct hci_conn *conn, void *data)
+{
+	struct iso_list_data *d = data;
+
+	/* Ignore unicast */
+	if (bacmp(&conn->dst, BDADDR_ANY))
+		return;
+
+	d->count++;
+}
+
+static int terminate_big_sync(struct hci_dev *hdev, void *data)
+{
+	struct iso_list_data *d = data;
+
+	bt_dev_dbg(hdev, "big 0x%2.2x bis 0x%2.2x", d->big, d->bis);
+
+	hci_remove_ext_adv_instance_sync(hdev, d->bis, NULL);
+
+	/* Check if ISO connection is a BIS and terminate BIG if there are
+	 * no other connections using it.
+	 */
+	hci_conn_hash_list_state(hdev, find_bis, ISO_LINK, BT_CONNECTED, d);
+	if (d->count)
+		return 0;
+
+	return hci_le_terminate_big_sync(hdev, d->big,
+					 HCI_ERROR_LOCAL_HOST_TERM);
+}
+
+static void terminate_big_destroy(struct hci_dev *hdev, void *data, int err)
+{
+	kfree(data);
+}
+
+static int hci_le_terminate_big(struct hci_dev *hdev, u8 big, u8 bis)
+{
+	struct iso_list_data *d;
+
+	bt_dev_dbg(hdev, "big 0x%2.2x bis 0x%2.2x", big, bis);
+
+	d = kmalloc(sizeof(*d), GFP_KERNEL);
+	if (!d)
+		return -ENOMEM;
+
+	memset(d, 0, sizeof(*d));
+	d->big = big;
+	d->bis = bis;
+
+	return hci_cmd_sync_queue(hdev, terminate_big_sync, d,
+				  terminate_big_destroy);
+}
+
+static int big_terminate_sync(struct hci_dev *hdev, void *data)
+{
+	struct iso_list_data *d = data;
+
+	bt_dev_dbg(hdev, "big 0x%2.2x sync_handle 0x%4.4x", d->big,
+		   d->sync_handle);
+
+	/* Check if ISO connection is a BIS and terminate BIG if there are
+	 * no other connections using it.
+	 */
+	hci_conn_hash_list_state(hdev, find_bis, ISO_LINK, BT_CONNECTED, d);
+	if (d->count)
+		return 0;
+
+	hci_le_big_terminate_sync(hdev, d->big);
+
+	return hci_le_pa_terminate_sync(hdev, d->sync_handle);
+}
+
+static int hci_le_big_terminate(struct hci_dev *hdev, u8 big, u16 sync_handle)
+{
+	struct iso_list_data *d;
+
+	bt_dev_dbg(hdev, "big 0x%2.2x sync_handle 0x%4.4x", big, sync_handle);
+
+	d = kmalloc(sizeof(*d), GFP_KERNEL);
+	if (!d)
+		return -ENOMEM;
+
+	memset(d, 0, sizeof(*d));
+	d->big = big;
+	d->sync_handle = sync_handle;
+
+	return hci_cmd_sync_queue(hdev, big_terminate_sync, d,
+				  terminate_big_destroy);
+}
+
+/* Cleanup BIS connection
+ *
+ * Detects if there any BIS left connected in a BIG
+ * broadcaster: Remove advertising instance and terminate BIG.
+ * broadcaster receiver: Teminate BIG sync and terminate PA sync.
+ * */
+static void bis_cleanup(struct hci_conn *conn)
+{
+	struct hci_dev *hdev = conn->hdev;
+
+	bt_dev_dbg(hdev, "conn %p", conn);
+
+	if (conn->role == HCI_ROLE_MASTER) {
+		if (!test_and_clear_bit(HCI_CONN_PER_ADV, &conn->flags))
+			return;
+
+		hci_le_terminate_big(hdev, conn->iso_qos.big,
+				     conn->iso_qos.bis);
+	} else {
+		hci_le_big_terminate(hdev, conn->iso_qos.big,
+				     conn->sync_handle);
+	}
+}
+
+static int remove_cig_sync(struct hci_dev *hdev, void *data)
+{
+	u8 handle = PTR_ERR(data);
+
+	return hci_le_remove_cig_sync(hdev, handle);
+}
+
+static int hci_le_remove_cig(struct hci_dev *hdev, u8 handle)
+{
+	bt_dev_dbg(hdev, "handle 0x%2.2x", handle);
+
+	return hci_cmd_sync_queue(hdev, remove_cig_sync, ERR_PTR(handle), NULL);
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
+/* Cleanup CIS connection:
+ *
+ * Detects if there any CIS left connected in a CIG and remove it.
+ */
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
 struct hci_conn *hci_conn_add(struct hci_dev *hdev, int type, bdaddr_t *dst,
 			      u8 role)
 {
@@ -722,9 +918,19 @@ struct hci_conn *hci_conn_add(struct hci_dev *hdev, int type, bdaddr_t *dst,
 		conn->pkt_type = hdev->pkt_type & ACL_PTYPE_MASK;
 		break;
 	case LE_LINK:
+		/* conn->src should reflect the local identity address */
+		hci_copy_identity_address(hdev, &conn->src, &conn->src_type);
+		break;
 	case ISO_LINK:
 		/* conn->src should reflect the local identity address */
 		hci_copy_identity_address(hdev, &conn->src, &conn->src_type);
+
+		/* set proper cleanup function */
+		if (!bacmp(dst, BDADDR_ANY))
+			conn->cleanup = bis_cleanup;
+		else if (conn->role == HCI_ROLE_MASTER)
+			conn->cleanup = cis_cleanup;
+
 		break;
 	case SCO_LINK:
 		if (lmp_esco_capable(hdev))
@@ -1096,6 +1302,108 @@ static int hci_explicit_conn_params_set(struct hci_dev *hdev,
 	return 0;
 }
 
+static int qos_set_big(struct hci_dev *hdev, struct bt_iso_qos *qos)
+{
+	struct iso_list_data data;
+
+	/* Allocate a BIG if not set */
+	if (qos->big == BT_ISO_QOS_BIG_UNSET) {
+		for (data.big = 0x00; data.big < 0xef; data.big++) {
+			data.count = 0;
+			data.bis = 0xff;
+
+			hci_conn_hash_list_state(hdev, bis_list, ISO_LINK,
+						 BT_BOUND, &data);
+			if (!data.count)
+				break;
+		}
+
+		if (data.big == 0xef)
+			return -EADDRNOTAVAIL;
+
+		/* Update BIG */
+		qos->big = data.big;
+	}
+
+	return 0;
+}
+
+static int qos_set_bis(struct hci_dev *hdev, struct bt_iso_qos *qos)
+{
+	struct iso_list_data data;
+
+	/* Allocate BIS if not set */
+	if (qos->bis == BT_ISO_QOS_BIS_UNSET) {
+		/* Find an unused adv set to advertise BIS, skip instance 0x00
+		 * since it is reserved as general purpose set.
+		 */
+		for (data.bis = 0x01; data.bis < hdev->le_num_of_adv_sets;
+		     data.bis++) {
+			data.count = 0;
+
+			hci_conn_hash_list_state(hdev, bis_list, ISO_LINK,
+						 BT_BOUND, &data);
+			if (!data.count)
+				break;
+		}
+
+		if (data.bis == hdev->le_num_of_adv_sets)
+			return -EADDRNOTAVAIL;
+
+		/* Update BIS */
+		qos->bis = data.bis;
+	}
+
+	return 0;
+}
+
+/* This function requires the caller holds hdev->lock */
+struct hci_conn *hci_add_bis(struct hci_dev *hdev, bdaddr_t *dst,
+			     struct bt_iso_qos *qos)
+{
+	struct hci_conn *conn;
+	struct iso_list_data data;
+	int err;
+
+	/* Let's make sure that le is enabled.*/
+	if (!hci_dev_test_flag(hdev, HCI_LE_ENABLED)) {
+		if (lmp_le_capable(hdev))
+			return ERR_PTR(-ECONNREFUSED);
+		return ERR_PTR(-EOPNOTSUPP);
+	}
+
+	err = qos_set_big(hdev, qos);
+	if (err)
+		return ERR_PTR(err);
+
+	err = qos_set_bis(hdev, qos);
+	if (err)
+		return ERR_PTR(err);
+
+	data.big = qos->big;
+	data.bis = qos->bis;
+	data.count = 0;
+
+	/* Check if there is already a matching BIG/BIS */
+	hci_conn_hash_list_state(hdev, bis_list, ISO_LINK, BT_BOUND, &data);
+	if (data.count)
+		return ERR_PTR(-EADDRINUSE);
+
+	conn = hci_conn_hash_lookup_bis(hdev, dst, qos->big, qos->bis);
+	if (conn)
+		return ERR_PTR(-EADDRINUSE);
+
+	conn = hci_conn_add(hdev, ISO_LINK, dst, HCI_ROLE_MASTER);
+	if (!conn)
+		return ERR_PTR(-ENOMEM);
+
+	set_bit(HCI_CONN_PER_ADV, &conn->flags);
+	conn->state = BT_CONNECT;
+
+	hci_conn_hold(conn);
+	return conn;
+}
+
 /* This function requires the caller holds hdev->lock */
 struct hci_conn *hci_connect_le_scan(struct hci_dev *hdev, bdaddr_t *dst,
 				     u8 dst_type, u8 sec_level,
@@ -1232,16 +1540,6 @@ struct hci_conn *hci_connect_sco(struct hci_dev *hdev, int type, bdaddr_t *dst,
 	return sco;
 }
 
-struct iso_list_data {
-	u8  cig;
-	u8  cis;
-	int count;
-	struct {
-		struct hci_cp_le_set_cig_params cp;
-		struct hci_cis_params cis[0x11];
-	} pdu;
-};
-
 static void cis_add(struct iso_list_data *d, struct bt_iso_qos *qos)
 {
 	struct hci_cis_params *cis = &d->pdu.cis[d->pdu.cp.num_cis];
@@ -1261,6 +1559,10 @@ static void cis_list(struct hci_conn *conn, void *data)
 {
 	struct iso_list_data *d = data;
 
+	/* Skip if broadcast/ANY address */
+	if (!bacmp(&conn->dst, BDADDR_ANY))
+		return;
+
 	if (d->cig != conn->iso_qos.cig || d->cis == BT_ISO_QOS_CIS_UNSET ||
 	    d->cis != conn->iso_qos.cis)
 		return;
@@ -1274,6 +1576,29 @@ static void cis_list(struct hci_conn *conn, void *data)
 	cis_add(d, &conn->iso_qos);
 }
 
+static int hci_le_create_big(struct hci_conn *conn, struct bt_iso_qos *qos)
+{
+	struct hci_dev *hdev = conn->hdev;
+	struct hci_cp_le_create_big cp;
+
+	memset(&cp, 0, sizeof(cp));
+
+	cp.handle = qos->big;
+	cp.adv_handle = qos->bis;
+	cp.num_bis  = 0x01;
+	hci_cpu_to_le24(qos->out.interval, cp.bis.sdu_interval);
+	cp.bis.sdu = qos->out.sdu;
+	cp.bis.latency =  cpu_to_le16(qos->out.latency);
+	cp.bis.rtn  = qos->out.rtn;
+	cp.bis.phy  = qos->out.phy;
+	cp.bis.packing = qos->packing;
+	cp.bis.framing = qos->framing;
+	cp.bis.encryption = 0x00;
+	memset(&cp.bis.bcode, 0, sizeof(cp.bis.bcode));
+
+	return hci_send_cmd(hdev, HCI_OP_LE_CREATE_BIG, sizeof(cp), &cp);
+}
+
 static bool hci_le_set_cig_params(struct hci_conn *conn, struct bt_iso_qos *qos)
 {
 	struct hci_dev *hdev = conn->hdev;
@@ -1357,49 +1682,6 @@ static bool hci_le_set_cig_params(struct hci_conn *conn, struct bt_iso_qos *qos)
 	return true;
 }
 
-static void find_cis(struct hci_conn *conn, void *data)
-{
-	struct iso_list_data *d = data;
-
-	/* Ignore broadcast */
-	if (!bacmp(&conn->dst, BDADDR_ANY))
-		return;
-
-	d->count++;
-}
-
-static int remove_cig_sync(struct hci_dev *hdev, void *data)
-{
-	u8 handle = PTR_ERR(data);
-
-	return hci_le_remove_cig_sync(hdev, handle);
-}
-
-int hci_le_remove_cig(struct hci_dev *hdev, u8 handle)
-{
-	bt_dev_dbg(hdev, "handle 0x%2.2x", handle);
-
-	return hci_cmd_sync_queue(hdev, remove_cig_sync, ERR_PTR(handle), NULL);
-}
-
-static void cis_cleanup(struct hci_conn *conn)
-{
-	struct hci_dev *hdev = conn->hdev;
-	struct iso_list_data d;
-
-	memset(&d, 0, sizeof(d));
-	d.cig = conn->iso_qos.cig;
-
-	/* Check if ISO connection is a CIS and remove CIG if there are
-	 * no other connections using it.
-	 */
-	hci_conn_hash_list_state(hdev, find_cis, ISO_LINK, BT_CONNECTED, &d);
-	if (d.count)
-		return;
-
-	hci_le_remove_cig(hdev, conn->iso_qos.cig);
-}
-
 struct hci_conn *hci_bind_cis(struct hci_dev *hdev, bdaddr_t *dst,
 			      __u8 dst_type, struct bt_iso_qos *qos)
 {
@@ -1594,6 +1876,178 @@ static void hci_iso_qos_setup(struct hci_dev *hdev, struct hci_conn *conn,
 		qos->latency = conn->le_conn_latency;
 }
 
+struct hci_conn *hci_bind_bis(struct hci_conn *conn, struct bt_iso_qos *qos)
+{
+	/* Update LINK PHYs according to QoS preference */
+	conn->le_tx_phy = qos->out.phy;
+	conn->le_tx_phy = qos->out.phy;
+	conn->iso_qos = *qos;
+	conn->state = BT_BOUND;
+
+	return conn;
+}
+
+static int create_big_sync(struct hci_dev *hdev, void *data)
+{
+	struct hci_conn *conn = data;
+	struct bt_iso_qos *qos = &conn->iso_qos;
+	u16 interval, sync_interval = 0;
+	u32 flags = 0;
+	int err;
+
+	if (qos->out.phy == 0x02)
+		flags |= MGMT_ADV_FLAG_SEC_2M;
+
+	/* Align intervals */
+	interval = qos->out.interval / 1250;
+
+	if (qos->bis)
+		sync_interval = qos->sync_interval * 1600;
+
+	err = hci_start_per_adv_sync(hdev, qos->bis, conn->le_per_adv_data_len,
+				     conn->le_per_adv_data, flags, interval,
+				     interval, sync_interval);
+	if (err)
+		return err;
+
+	return hci_le_create_big(conn, &conn->iso_qos);
+}
+
+static void create_pa_complete(struct hci_dev *hdev, void *data, int err)
+{
+	struct hci_cp_le_pa_create_sync *cp = data;
+
+	bt_dev_dbg(hdev, "");
+
+	if (err)
+		bt_dev_err(hdev, "Unable to create PA: %d", err);
+
+	kfree(cp);
+}
+
+static int create_pa_sync(struct hci_dev *hdev, void *data)
+{
+	struct hci_cp_le_pa_create_sync *cp = data;
+	int err;
+
+	err = __hci_cmd_sync_status(hdev, HCI_OP_LE_PA_CREATE_SYNC,
+				    sizeof(*cp), cp, HCI_CMD_TIMEOUT);
+	if (err) {
+		hci_dev_clear_flag(hdev, HCI_PA_SYNC);
+		return err;
+	}
+
+	return hci_update_passive_scan_sync(hdev);
+}
+
+int hci_pa_create_sync(struct hci_dev *hdev, bdaddr_t *dst, __u8 dst_type,
+		       __u8 sid)
+{
+	struct hci_cp_le_pa_create_sync *cp;
+
+	if (hci_dev_test_and_set_flag(hdev, HCI_PA_SYNC))
+		return -EBUSY;
+
+	cp = kmalloc(sizeof(*cp), GFP_KERNEL);
+	if (!cp) {
+		hci_dev_clear_flag(hdev, HCI_PA_SYNC);
+		return -ENOMEM;
+	}
+
+	/* Convert from ISO socket address type to HCI address type  */
+	if (dst_type == BDADDR_LE_PUBLIC)
+		dst_type = ADDR_LE_DEV_PUBLIC;
+	else
+		dst_type = ADDR_LE_DEV_RANDOM;
+
+	memset(cp, 0, sizeof(*cp));
+	cp->sid = sid;
+	cp->addr_type = dst_type;
+	bacpy(&cp->addr, dst);
+
+	/* Queue start pa_create_sync and scan */
+	return hci_cmd_sync_queue(hdev, create_pa_sync, cp, create_pa_complete);
+}
+
+int hci_le_big_create_sync(struct hci_dev *hdev, struct bt_iso_qos *qos,
+			   __u16 sync_handle, __u8 num_bis, __u8 bis[])
+{
+	struct _packed {
+		struct hci_cp_le_big_create_sync cp;
+		__u8  bis[0x11];
+	} pdu;
+	int err;
+
+	if (num_bis > sizeof(pdu.bis))
+		return -EINVAL;
+
+	err = qos_set_big(hdev, qos);
+	if (err)
+		return err;
+
+	memset(&pdu, 0, sizeof(pdu));
+	pdu.cp.handle = qos->big;
+	pdu.cp.sync_handle = cpu_to_le16(sync_handle);
+	pdu.cp.num_bis = num_bis;
+	memcpy(pdu.bis, bis, num_bis);
+
+	return hci_send_cmd(hdev, HCI_OP_LE_BIG_CREATE_SYNC,
+			    sizeof(pdu.cp) + num_bis, &pdu);
+}
+
+static void create_big_complete(struct hci_dev *hdev, void *data, int err)
+{
+	struct hci_conn *conn = data;
+
+	bt_dev_dbg(hdev, "conn %p", conn);
+
+	if (err) {
+		bt_dev_err(hdev, "Unable to create BIG: %d", err);
+		hci_connect_cfm(conn, err);
+		hci_conn_del(conn);
+	}
+}
+
+struct hci_conn *hci_connect_bis(struct hci_dev *hdev, bdaddr_t *dst,
+				 __u8 dst_type, struct bt_iso_qos *qos,
+				 __u8 base_len, __u8 *base)
+{
+	struct hci_conn *conn;
+	int err;
+
+	/* We need hci_conn object using the BDADDR_ANY as dst */
+	conn = hci_add_bis(hdev, dst, qos);
+	if (IS_ERR(conn))
+		return conn;
+
+	conn = hci_bind_bis(conn, qos);
+	if (!conn) {
+		hci_conn_drop(conn);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/* Add Basic Announcement into Peridic Adv Data if BASE is set */
+	if (base_len && base) {
+		base_len = eir_append_service_data(conn->le_per_adv_data, 0,
+						   0x1851, base, base_len);
+		conn->le_per_adv_data_len = base_len;
+	}
+
+	/* Queue start periodic advertising and create BIG */
+	err = hci_cmd_sync_queue(hdev, create_big_sync, conn,
+				 create_big_complete);
+	if (err < 0) {
+		hci_conn_drop(conn);
+		return ERR_PTR(err);
+	}
+
+	hci_iso_qos_setup(hdev, conn, &qos->out,
+			  conn->le_tx_phy ? conn->le_tx_phy :
+			  hdev->le_tx_def_phys);
+
+	return conn;
+}
+
 struct hci_conn *hci_connect_cis(struct hci_dev *hdev, bdaddr_t *dst,
 				 __u8 dst_type, struct bt_iso_qos *qos)
 {
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index bee2ab56114a..c678aa54c821 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -1693,63 +1693,82 @@ static void adv_instance_rpa_expired(struct work_struct *work)
 }
 
 /* This function requires the caller holds hdev->lock */
-int hci_add_adv_instance(struct hci_dev *hdev, u8 instance, u32 flags,
-			 u16 adv_data_len, u8 *adv_data,
-			 u16 scan_rsp_len, u8 *scan_rsp_data,
-			 u16 timeout, u16 duration, s8 tx_power,
-			 u32 min_interval, u32 max_interval)
+struct adv_info *hci_add_adv_instance(struct hci_dev *hdev, u8 instance,
+				      u32 flags, u16 adv_data_len, u8 *adv_data,
+				      u16 scan_rsp_len, u8 *scan_rsp_data,
+				      u16 timeout, u16 duration, s8 tx_power,
+				      u32 min_interval, u32 max_interval)
 {
-	struct adv_info *adv_instance;
+	struct adv_info *adv;
 
-	adv_instance = hci_find_adv_instance(hdev, instance);
-	if (adv_instance) {
-		memset(adv_instance->adv_data, 0,
-		       sizeof(adv_instance->adv_data));
-		memset(adv_instance->scan_rsp_data, 0,
-		       sizeof(adv_instance->scan_rsp_data));
+	adv = hci_find_adv_instance(hdev, instance);
+	if (adv) {
+		memset(adv->adv_data, 0, sizeof(adv->adv_data));
+		memset(adv->scan_rsp_data, 0, sizeof(adv->scan_rsp_data));
+		memset(adv->per_adv_data, 0, sizeof(adv->per_adv_data));
 	} else {
 		if (hdev->adv_instance_cnt >= hdev->le_num_of_adv_sets ||
 		    instance < 1 || instance > hdev->le_num_of_adv_sets)
-			return -EOVERFLOW;
+			return ERR_PTR(-EOVERFLOW);
 
-		adv_instance = kzalloc(sizeof(*adv_instance), GFP_KERNEL);
-		if (!adv_instance)
-			return -ENOMEM;
+		adv = kzalloc(sizeof(*adv), GFP_KERNEL);
+		if (!adv)
+			return ERR_PTR(-ENOMEM);
 
-		adv_instance->pending = true;
-		adv_instance->instance = instance;
-		list_add(&adv_instance->list, &hdev->adv_instances);
+		adv->pending = true;
+		adv->instance = instance;
+		list_add(&adv->list, &hdev->adv_instances);
 		hdev->adv_instance_cnt++;
 	}
 
-	adv_instance->flags = flags;
-	adv_instance->adv_data_len = adv_data_len;
-	adv_instance->scan_rsp_len = scan_rsp_len;
-	adv_instance->min_interval = min_interval;
-	adv_instance->max_interval = max_interval;
-	adv_instance->tx_power = tx_power;
+	adv->flags = flags;
+	adv->adv_data_len = adv_data_len;
+	adv->scan_rsp_len = scan_rsp_len;
+	adv->min_interval = min_interval;
+	adv->max_interval = max_interval;
+	adv->tx_power = tx_power;
 
 	if (adv_data_len)
-		memcpy(adv_instance->adv_data, adv_data, adv_data_len);
+		memcpy(adv->adv_data, adv_data, adv_data_len);
 
 	if (scan_rsp_len)
-		memcpy(adv_instance->scan_rsp_data,
-		       scan_rsp_data, scan_rsp_len);
+		memcpy(adv->scan_rsp_data, scan_rsp_data, scan_rsp_len);
 
-	adv_instance->timeout = timeout;
-	adv_instance->remaining_time = timeout;
+	adv->timeout = timeout;
+	adv->remaining_time = timeout;
 
 	if (duration == 0)
-		adv_instance->duration = hdev->def_multi_adv_rotation_duration;
+		adv->duration = hdev->def_multi_adv_rotation_duration;
 	else
-		adv_instance->duration = duration;
+		adv->duration = duration;
 
-	INIT_DELAYED_WORK(&adv_instance->rpa_expired_cb,
-			  adv_instance_rpa_expired);
+	INIT_DELAYED_WORK(&adv->rpa_expired_cb, adv_instance_rpa_expired);
 
 	BT_DBG("%s for %dMR", hdev->name, instance);
 
-	return 0;
+	return adv;
+}
+
+/* This function requires the caller holds hdev->lock */
+struct adv_info *hci_add_per_instance(struct hci_dev *hdev, u8 instance,
+				      u32 flags, u8 data_len, u8 *data,
+				      u32 min_interval, u32 max_interval)
+{
+	struct adv_info *adv;
+
+	adv = hci_add_adv_instance(hdev, instance, flags, 0, NULL, 0, NULL,
+				   0, 0, HCI_ADV_TX_POWER_NO_PREFERENCE,
+				   min_interval, max_interval);
+	if (IS_ERR_OR_NULL(adv))
+		return adv;
+
+	adv->periodic = true;
+	adv->per_adv_data_len = data_len;
+
+	if (data)
+		memcpy(adv->per_adv_data, data, data_len);
+
+	return adv;
 }
 
 /* This function requires the caller holds hdev->lock */
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index bb6213fc8dc7..1dcc7d799b45 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -3892,6 +3892,57 @@ static u8 hci_cc_le_setup_iso_path(struct hci_dev *hdev, void *data,
 	return rp->status;
 }
 
+static void hci_cs_le_create_big(struct hci_dev *hdev, u8 status)
+{
+	bt_dev_dbg(hdev, "status 0x%2.2x", status);
+}
+
+static u8 hci_cc_set_per_adv_param(struct hci_dev *hdev, void *data,
+				   struct sk_buff *skb)
+{
+	struct hci_ev_status *rp = data;
+	struct hci_cp_le_set_per_adv_params *cp;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
+		return rp->status;
+
+	cp = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_PER_ADV_PARAMS);
+	if (!cp)
+		return rp->status;
+
+	/* TODO: set the conn state */
+	return rp->status;
+}
+
+static u8 hci_cc_le_set_per_adv_enable(struct hci_dev *hdev, void *data,
+				       struct sk_buff *skb)
+{
+	struct hci_ev_status *rp = data;
+	__u8 *sent;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
+
+	if (rp->status)
+		return rp->status;
+
+	sent = hci_sent_cmd_data(hdev, HCI_OP_LE_SET_PER_ADV_ENABLE);
+	if (!sent)
+		return rp->status;
+
+	hci_dev_lock(hdev);
+
+	if (*sent)
+		hci_dev_set_flag(hdev, HCI_LE_PER_ADV);
+	else
+		hci_dev_clear_flag(hdev, HCI_LE_PER_ADV);
+
+	hci_dev_unlock(hdev);
+
+	return rp->status;
+}
+
 #define HCI_CC_VL(_op, _func, _min, _max) \
 { \
 	.op = _op, \
@@ -4065,6 +4116,9 @@ static const struct hci_cc {
 		      hci_cc_le_set_adv_set_random_addr),
 	HCI_CC_STATUS(HCI_OP_LE_REMOVE_ADV_SET, hci_cc_le_remove_adv_set),
 	HCI_CC_STATUS(HCI_OP_LE_CLEAR_ADV_SETS, hci_cc_le_clear_adv_sets),
+	HCI_CC_STATUS(HCI_OP_LE_SET_PER_ADV_PARAMS, hci_cc_set_per_adv_param),
+	HCI_CC_STATUS(HCI_OP_LE_SET_PER_ADV_ENABLE,
+		      hci_cc_le_set_per_adv_enable),
 	HCI_CC(HCI_OP_LE_READ_TRANSMIT_POWER, hci_cc_le_read_transmit_power,
 	       sizeof(struct hci_rp_le_read_transmit_power)),
 	HCI_CC_STATUS(HCI_OP_LE_SET_PRIVACY_MODE, hci_cc_le_set_privacy_mode),
@@ -4201,6 +4255,7 @@ static const struct hci_cs {
 	HCI_CS(HCI_OP_LE_START_ENC, hci_cs_le_start_enc),
 	HCI_CS(HCI_OP_LE_EXT_CREATE_CONN, hci_cs_le_ext_create_conn),
 	HCI_CS(HCI_OP_LE_CREATE_CIS, hci_cs_le_create_cis),
+	HCI_CS(HCI_OP_LE_CREATE_BIG, hci_cs_le_create_big),
 };
 
 static void hci_cmd_status_evt(struct hci_dev *hdev, void *data,
@@ -6422,6 +6477,39 @@ static void hci_le_ext_adv_report_evt(struct hci_dev *hdev, void *data,
 	hci_dev_unlock(hdev);
 }
 
+static int hci_le_pa_term_sync(struct hci_dev *hdev, __le16 handle)
+{
+	struct hci_cp_le_pa_term_sync cp;
+
+	memset(&cp, 0, sizeof(cp));
+	cp.handle = handle;
+
+	return hci_send_cmd(hdev, HCI_OP_LE_PA_TERM_SYNC, sizeof(cp), &cp);
+}
+
+static void hci_le_pa_sync_estabilished_evt(struct hci_dev *hdev, void *data,
+					    struct sk_buff *skb)
+{
+	struct hci_ev_le_pa_sync_established *ev = data;
+	int mask = hdev->link_mode;
+	__u8 flags = 0;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", ev->status);
+
+	if (ev->status)
+		return;
+
+	hci_dev_lock(hdev);
+
+	hci_dev_clear_flag(hdev, HCI_PA_SYNC);
+
+	mask |= hci_proto_connect_ind(hdev, &ev->bdaddr, ISO_LINK, &flags);
+	if (!(mask & HCI_LM_ACCEPT))
+		hci_le_pa_term_sync(hdev, ev->handle);
+
+	hci_dev_unlock(hdev);
+}
+
 static void hci_le_remote_feat_complete_evt(struct hci_dev *hdev, void *data,
 					    struct sk_buff *skb)
 {
@@ -6773,6 +6861,105 @@ static void hci_le_cis_req_evt(struct hci_dev *hdev, void *data,
 	hci_dev_unlock(hdev);
 }
 
+static void hci_le_create_big_complete_evt(struct hci_dev *hdev, void *data,
+					   struct sk_buff *skb)
+{
+	struct hci_evt_le_create_big_complete *ev = data;
+	struct hci_conn *conn;
+
+	BT_DBG("%s status 0x%2.2x", hdev->name, ev->status);
+
+	if (!hci_le_ev_skb_pull(hdev, skb, HCI_EVT_LE_CREATE_BIG_COMPLETE,
+				flex_array_size(ev, bis_handle, ev->num_bis)))
+		return;
+
+	hci_dev_lock(hdev);
+
+	conn = hci_conn_hash_lookup_big(hdev, ev->handle);
+	if (!conn)
+		goto unlock;
+
+	if (ev->num_bis)
+		conn->handle = __le16_to_cpu(ev->bis_handle[0]);
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
+static void hci_le_big_sync_established_evt(struct hci_dev *hdev, void *data,
+					    struct sk_buff *skb)
+{
+	struct hci_evt_le_big_sync_estabilished *ev = data;
+	struct hci_conn *bis;
+	int i;
+
+	bt_dev_dbg(hdev, "status 0x%2.2x", ev->status);
+
+	if (!hci_le_ev_skb_pull(hdev, skb, HCI_EVT_LE_BIG_SYNC_ESTABILISHED,
+				flex_array_size(ev, bis, ev->num_bis)))
+		return;
+
+	if (ev->status)
+		return;
+
+	hci_dev_lock(hdev);
+
+	for (i = 0; i < ev->num_bis; i++) {
+		u16 handle = le16_to_cpu(ev->bis[i]);
+		__le32 interval;
+
+		bis = hci_conn_hash_lookup_handle(hdev, handle);
+		if (!bis) {
+			bis = hci_conn_add(hdev, ISO_LINK, BDADDR_ANY,
+					   HCI_ROLE_SLAVE);
+			if (!bis)
+				continue;
+			bis->handle = handle;
+		}
+
+		bis->iso_qos.big = ev->handle;
+		memset(&interval, 0, sizeof(interval));
+		memcpy(&interval, ev->latency, sizeof(ev->latency));
+		bis->iso_qos.in.interval = le32_to_cpu(interval);
+		/* Convert ISO Interval (1.25 ms slots) to latency (ms) */
+		bis->iso_qos.in.latency = le16_to_cpu(ev->interval) * 125 / 100;
+		bis->iso_qos.in.sdu = le16_to_cpu(ev->max_pdu);
+
+		hci_connect_cfm(bis, ev->status);
+	}
+
+	hci_dev_unlock(hdev);
+}
+
+static void hci_le_big_info_adv_report_evt(struct hci_dev *hdev, void *data,
+					   struct sk_buff *skb)
+{
+	struct hci_evt_le_big_info_adv_report *ev = data;
+	int mask = hdev->link_mode;
+	__u8 flags = 0;
+
+	bt_dev_dbg(hdev, "sync_handle 0x%4.4x", le16_to_cpu(ev->sync_handle));
+
+	hci_dev_lock(hdev);
+
+	mask |= hci_proto_connect_ind(hdev, BDADDR_ANY, ISO_LINK, &flags);
+	if (!(mask & HCI_LM_ACCEPT))
+		hci_le_pa_term_sync(hdev, ev->sync_handle);
+
+	hci_dev_unlock(hdev);
+}
+
 #define HCI_LE_EV_VL(_op, _func, _min_len, _max_len) \
 [_op] = { \
 	.func = _func, \
@@ -6833,6 +7020,10 @@ static const struct hci_le_ev {
 	HCI_LE_EV_VL(HCI_EV_LE_EXT_ADV_REPORT, hci_le_ext_adv_report_evt,
 		     sizeof(struct hci_ev_le_ext_adv_report),
 		     HCI_MAX_EVENT_SIZE),
+	/* [0x0e = HCI_EV_LE_PA_SYNC_ESTABLISHED] */
+	HCI_LE_EV(HCI_EV_LE_PA_SYNC_ESTABLISHED,
+		  hci_le_pa_sync_estabilished_evt,
+		  sizeof(struct hci_ev_le_pa_sync_established)),
 	/* [0x12 = HCI_EV_LE_EXT_ADV_SET_TERM] */
 	HCI_LE_EV(HCI_EV_LE_EXT_ADV_SET_TERM, hci_le_ext_adv_term_evt,
 		  sizeof(struct hci_evt_le_ext_adv_set_term)),
@@ -6842,6 +7033,21 @@ static const struct hci_le_ev {
 	/* [0x1a = HCI_EVT_LE_CIS_REQ] */
 	HCI_LE_EV(HCI_EVT_LE_CIS_REQ, hci_le_cis_req_evt,
 		  sizeof(struct hci_evt_le_cis_req)),
+	/* [0x1b = HCI_EVT_LE_CREATE_BIG_COMPLETE] */
+	HCI_LE_EV_VL(HCI_EVT_LE_CREATE_BIG_COMPLETE,
+		     hci_le_create_big_complete_evt,
+		     sizeof(struct hci_evt_le_create_big_complete),
+		     HCI_MAX_EVENT_SIZE),
+	/* [0x1d = HCI_EV_LE_BIG_SYNC_ESTABILISHED] */
+	HCI_LE_EV_VL(HCI_EVT_LE_BIG_SYNC_ESTABILISHED,
+		     hci_le_big_sync_established_evt,
+		     sizeof(struct hci_evt_le_big_sync_estabilished),
+		     HCI_MAX_EVENT_SIZE),
+	/* [0x22 = HCI_EVT_LE_BIG_INFO_ADV_REPORT] */
+	HCI_LE_EV_VL(HCI_EVT_LE_BIG_INFO_ADV_REPORT,
+		     hci_le_big_info_adv_report_evt,
+		     sizeof(struct hci_evt_le_big_info_adv_report),
+		     HCI_MAX_EVENT_SIZE),
 };
 
 static void hci_le_meta_evt(struct hci_dev *hdev, void *data,
diff --git a/net/bluetooth/hci_request.c b/net/bluetooth/hci_request.c
index f4afe482e300..0f464a6e5fa6 100644
--- a/net/bluetooth/hci_request.c
+++ b/net/bluetooth/hci_request.c
@@ -827,7 +827,6 @@ void __hci_req_disable_advertising(struct hci_request *req)
 {
 	if (ext_adv_capable(req->hdev)) {
 		__hci_req_disable_ext_adv_instance(req, 0x00);
-
 	} else {
 		u8 enable = 0x00;
 
@@ -1338,15 +1337,15 @@ int __hci_req_setup_ext_adv_instance(struct hci_request *req, u8 instance)
 	bdaddr_t random_addr;
 	u8 own_addr_type;
 	int err;
-	struct adv_info *adv_instance;
-	bool secondary_adv;
+	struct adv_info *adv;
+	bool secondary_adv, require_privacy;
 
 	if (instance > 0) {
-		adv_instance = hci_find_adv_instance(hdev, instance);
-		if (!adv_instance)
+		adv = hci_find_adv_instance(hdev, instance);
+		if (!adv)
 			return -EINVAL;
 	} else {
-		adv_instance = NULL;
+		adv = NULL;
 	}
 
 	flags = hci_adv_instance_flags(hdev, instance);
@@ -1364,18 +1363,24 @@ int __hci_req_setup_ext_adv_instance(struct hci_request *req, u8 instance)
 	 * advertising is used. In that case it is fine to use a
 	 * non-resolvable private address.
 	 */
-	err = hci_get_random_address(hdev, !connectable,
-				     adv_use_rpa(hdev, flags), adv_instance,
+	require_privacy = !connectable;
+
+	/* Don't require privacy for periodic adv? */
+	if (adv && adv->periodic)
+		require_privacy = false;
+
+	err = hci_get_random_address(hdev, require_privacy,
+				     adv_use_rpa(hdev, flags), adv,
 				     &own_addr_type, &random_addr);
 	if (err < 0)
 		return err;
 
 	memset(&cp, 0, sizeof(cp));
 
-	if (adv_instance) {
-		hci_cpu_to_le24(adv_instance->min_interval, cp.min_interval);
-		hci_cpu_to_le24(adv_instance->max_interval, cp.max_interval);
-		cp.tx_power = adv_instance->tx_power;
+	if (adv) {
+		hci_cpu_to_le24(adv->min_interval, cp.min_interval);
+		hci_cpu_to_le24(adv->max_interval, cp.max_interval);
+		cp.tx_power = adv->tx_power;
 	} else {
 		hci_cpu_to_le24(hdev->le_adv_min_interval, cp.min_interval);
 		hci_cpu_to_le24(hdev->le_adv_max_interval, cp.max_interval);
@@ -1396,7 +1401,8 @@ int __hci_req_setup_ext_adv_instance(struct hci_request *req, u8 instance)
 		else
 			cp.evt_properties = cpu_to_le16(LE_LEGACY_ADV_SCAN_IND);
 	} else {
-		if (secondary_adv)
+		/* Secondary and periodic cannot use legacy PDUs */
+		if (secondary_adv || (adv && adv->periodic))
 			cp.evt_properties = cpu_to_le16(LE_EXT_ADV_NON_CONN_IND);
 		else
 			cp.evt_properties = cpu_to_le16(LE_LEGACY_NONCONN_IND);
@@ -1426,8 +1432,8 @@ int __hci_req_setup_ext_adv_instance(struct hci_request *req, u8 instance)
 		struct hci_cp_le_set_adv_set_rand_addr cp;
 
 		/* Check if random address need to be updated */
-		if (adv_instance) {
-			if (!bacmp(&random_addr, &adv_instance->random_addr))
+		if (adv) {
+			if (!bacmp(&random_addr, &adv->random_addr))
 				return 0;
 		} else {
 			if (!bacmp(&random_addr, &hdev->random_addr))
diff --git a/net/bluetooth/hci_request.h b/net/bluetooth/hci_request.h
index 7f8df258e295..2c47dac3bf83 100644
--- a/net/bluetooth/hci_request.h
+++ b/net/bluetooth/hci_request.h
@@ -85,6 +85,9 @@ void __hci_req_enable_advertising(struct hci_request *req);
 void __hci_req_disable_advertising(struct hci_request *req);
 void __hci_req_update_adv_data(struct hci_request *req, u8 instance);
 int hci_req_update_adv_data(struct hci_dev *hdev, u8 instance);
+int hci_req_start_per_adv(struct hci_dev *hdev, u8 instance, u32 flags,
+			  u16 min_interval, u16 max_interval,
+			  u16 sync_interval);
 void __hci_req_update_scan_rsp_data(struct hci_request *req, u8 instance);
 
 int __hci_req_schedule_adv_instance(struct hci_request *req, u8 instance,
@@ -94,8 +97,14 @@ void hci_req_clear_adv_instance(struct hci_dev *hdev, struct sock *sk,
 				bool force);
 
 int __hci_req_setup_ext_adv_instance(struct hci_request *req, u8 instance);
+int __hci_req_setup_per_adv_instance(struct hci_request *req, u8 instance,
+				     u16 min_interval, u16 max_interval);
 int __hci_req_start_ext_adv(struct hci_request *req, u8 instance);
+int __hci_req_start_per_adv(struct hci_request *req, u8 instance, u32 flags,
+			    u16 min_interval, u16 max_interval,
+			    u16 sync_interval);
 int __hci_req_enable_ext_advertising(struct hci_request *req, u8 instance);
+int __hci_req_enable_per_advertising(struct hci_request *req, u8 instance);
 int __hci_req_disable_ext_adv_instance(struct hci_request *req, u8 instance);
 int __hci_req_remove_ext_adv_instance(struct hci_request *req, u8 instance);
 void __hci_req_clear_ext_adv_sets(struct hci_request *req);
diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
index e8c27f65a371..1b8080d05646 100644
--- a/net/bluetooth/hci_sync.c
+++ b/net/bluetooth/hci_sync.c
@@ -965,6 +965,188 @@ int hci_start_ext_adv_sync(struct hci_dev *hdev, u8 instance)
 	return hci_enable_ext_advertising_sync(hdev, instance);
 }
 
+static int hci_disable_per_advertising_sync(struct hci_dev *hdev, u8 instance)
+{
+	struct hci_cp_le_set_per_adv_enable cp;
+
+	/* If periodic advertising already disabled there is nothing to do. */
+	if (!hci_dev_test_flag(hdev, HCI_LE_PER_ADV))
+		return 0;
+
+	memset(&cp, 0, sizeof(cp));
+
+	cp.enable = 0x00;
+	cp.handle = instance;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_PER_ADV_ENABLE,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_set_per_adv_params_sync(struct hci_dev *hdev, u8 instance,
+				       u16 min_interval, u16 max_interval)
+{
+	struct hci_cp_le_set_per_adv_params cp;
+
+	memset(&cp, 0, sizeof(cp));
+
+	if (!min_interval)
+		min_interval = DISCOV_LE_PER_ADV_INT_MIN;
+
+	if (!max_interval)
+		max_interval = DISCOV_LE_PER_ADV_INT_MAX;
+
+	cp.handle = instance;
+	cp.min_interval = cpu_to_le16(min_interval);
+	cp.max_interval = cpu_to_le16(max_interval);
+	cp.periodic_properties = 0x0000;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_PER_ADV_PARAMS,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+static int hci_set_per_adv_data_sync(struct hci_dev *hdev, u8 instance)
+{
+	struct {
+		struct hci_cp_le_set_per_adv_data cp;
+		u8 data[HCI_MAX_PER_AD_LENGTH];
+	} pdu;
+	u8 len;
+
+	memset(&pdu, 0, sizeof(pdu));
+
+	len = eir_create_per_adv_data(hdev, instance, pdu.data);
+
+	/* There's nothing to do if the data hasn't changed */
+	if (hdev->per_adv_data_len == len &&
+	    memcmp(pdu.data, hdev->per_adv_data, len) == 0)
+		return 0;
+
+	memcpy(hdev->per_adv_data, pdu.data, len);
+	hdev->per_adv_data_len = len;
+
+	pdu.cp.length = len;
+	pdu.cp.handle = instance;
+	pdu.cp.operation = LE_SET_ADV_DATA_OP_COMPLETE;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_PER_ADV_DATA,
+				     sizeof(pdu.cp) + len, &pdu,
+				     HCI_CMD_TIMEOUT);
+}
+
+static int hci_enable_per_advertising_sync(struct hci_dev *hdev, u8 instance)
+{
+	struct hci_cp_le_set_per_adv_enable cp;
+
+	/* If periodic advertising already enabled there is nothing to do. */
+	if (hci_dev_test_flag(hdev, HCI_LE_PER_ADV))
+		return 0;
+
+	memset(&cp, 0, sizeof(cp));
+
+	cp.enable = 0x01;
+	cp.handle = instance;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_PER_ADV_ENABLE,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+/* Checks if periodic advertising data contains a Basic Announcement and if it
+ * does generates a Broadcast ID and add Broadcast Announcement.
+ */
+int hci_adv_bcast_annoucement(struct hci_dev *hdev, struct adv_info *adv)
+{
+	u8 bid[3];
+	u8 ad[4 + 3];
+
+	/* Skip if NULL adv as instance 0x00 is used for general purpose
+	 * advertising so it cannot used for the likes of Broadcast Announcement
+	 * as it can be overwritten at any point.
+	 */
+	if (!adv)
+		return 0;
+
+	/* Check if PA data doesn't contains a Basic Audio Announcement then
+	 * there is nothing to do.
+	 */
+	if (!eir_get_service_data(adv->per_adv_data, adv->per_adv_data_len,
+				  0x1851, NULL))
+		return 0;
+
+	/* Check if advertising data already has a Broadcast Announcement since
+	 * the process may want to control the Broadcast ID directly and in that
+	 * case the kernel shall no interfere.
+	 */
+	if (eir_get_service_data(adv->adv_data, adv->adv_data_len, 0x1852,
+				 NULL))
+		return 0;
+
+	/* Generate Broadcast ID */
+	get_random_bytes(bid, sizeof(bid));
+	eir_append_service_data(ad, 0, 0x1852, bid, sizeof(bid));
+	hci_set_adv_instance_data(hdev, adv->instance, sizeof(ad), ad, 0, NULL);
+
+	return hci_update_adv_data_sync(hdev, adv->instance);
+}
+
+int hci_start_per_adv_sync(struct hci_dev *hdev, u8 instance, u8 data_len,
+			   u8 *data, u32 flags, u16 min_interval,
+			   u16 max_interval, u16 sync_interval)
+{
+	struct adv_info *adv = NULL;
+	int err;
+	bool added = false;
+
+	hci_disable_per_advertising_sync(hdev, instance);
+
+	if (instance) {
+		adv = hci_find_adv_instance(hdev, instance);
+		/* Create an instance if that could not be found */
+		if (!adv) {
+			adv = hci_add_per_instance(hdev, instance, flags,
+						   data_len, data,
+						   sync_interval,
+						   sync_interval);
+			if (IS_ERR_OR_NULL(adv))
+				return PTR_ERR(adv);
+			added = true;
+		}
+	}
+
+	/* Only start advertising if instance 0 or if a dedicated instance has
+	 * been added.
+	 */
+	if (!adv || added) {
+		err = hci_start_ext_adv_sync(hdev, instance);
+		if (err < 0)
+			goto fail;
+
+		err = hci_adv_bcast_annoucement(hdev, adv);
+		if (err < 0)
+			goto fail;
+	}
+
+	err = hci_set_per_adv_params_sync(hdev, instance, min_interval,
+					  max_interval);
+	if (err < 0)
+		goto fail;
+
+	err = hci_set_per_adv_data_sync(hdev, instance);
+	if (err < 0)
+		goto fail;
+
+	err = hci_enable_per_advertising_sync(hdev, instance);
+	if (err < 0)
+		goto fail;
+
+	return 0;
+
+fail:
+	if (added)
+		hci_remove_adv_instance(hdev, instance);
+
+	return err;
+}
+
 static int hci_start_adv_sync(struct hci_dev *hdev, u8 instance)
 {
 	int err;
@@ -1104,6 +1286,42 @@ int hci_remove_ext_adv_instance_sync(struct hci_dev *hdev, u8 instance,
 					HCI_CMD_TIMEOUT, sk);
 }
 
+static int remove_ext_adv_sync(struct hci_dev *hdev, void *data)
+{
+	struct adv_info *adv = data;
+	u8 instance = 0;
+
+	if (adv)
+		instance = adv->instance;
+
+	return hci_remove_ext_adv_instance_sync(hdev, instance, NULL);
+}
+
+int hci_remove_ext_adv_instance(struct hci_dev *hdev, u8 instance)
+{
+	struct adv_info *adv = NULL;
+
+	if (instance) {
+		adv = hci_find_adv_instance(hdev, instance);
+		if (!adv)
+			return -EINVAL;
+	}
+
+	return hci_cmd_sync_queue(hdev, remove_ext_adv_sync, adv, NULL);
+}
+
+int hci_le_terminate_big_sync(struct hci_dev *hdev, u8 handle, u8 reason)
+{
+	struct hci_cp_le_term_big cp;
+
+	memset(&cp, 0, sizeof(cp));
+	cp.handle = handle;
+	cp.reason = reason;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_TERM_BIG,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
 static void cancel_adv_timeout(struct hci_dev *hdev)
 {
 	if (hdev->adv_instance_timeout) {
@@ -2172,7 +2390,8 @@ int hci_update_passive_scan_sync(struct hci_dev *hdev)
 
 	if (list_empty(&hdev->pend_le_conns) &&
 	    list_empty(&hdev->pend_le_reports) &&
-	    !hci_is_adv_monitoring(hdev)) {
+	    !hci_is_adv_monitoring(hdev) &&
+	    !hci_dev_test_flag(hdev, HCI_PA_SYNC)) {
 		/* If there is no pending LE connections or devices
 		 * to be scanned for or no ADV monitors, we should stop the
 		 * background scanning.
@@ -3366,6 +3585,13 @@ static int hci_le_set_event_mask_sync(struct hci_dev *hdev)
 			events[3] |= 0x02; /* LE CIS Request */
 	}
 
+	if (bis_capable(hdev)) {
+		events[3] |= 0x04;	/* LE Create BIG Complete */
+		events[3] |= 0x08;	/* LE Terminate BIG Complete */
+		events[3] |= 0x10;	/* LE BIG Sync Established */
+		events[3] |= 0x20;	/* LE BIG Sync Loss */
+	}
+
 	return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_EVENT_MASK,
 				     sizeof(events), events, HCI_CMD_TIMEOUT);
 }
@@ -5395,3 +5621,25 @@ int hci_le_remove_cig_sync(struct hci_dev *hdev, u8 handle)
 	return __hci_cmd_sync_status(hdev, HCI_OP_LE_REMOVE_CIG, sizeof(cp),
 				     &cp, HCI_CMD_TIMEOUT);
 }
+
+int hci_le_big_terminate_sync(struct hci_dev *hdev, u8 handle)
+{
+	struct hci_cp_le_big_term_sync cp;
+
+	memset(&cp, 0, sizeof(cp));
+	cp.handle = handle;
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_BIG_TERM_SYNC,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
+
+int hci_le_pa_terminate_sync(struct hci_dev *hdev, u16 handle)
+{
+	struct hci_cp_le_big_term_sync cp;
+
+	memset(&cp, 0, sizeof(cp));
+	cp.handle = cpu_to_le16(handle);
+
+	return __hci_cmd_sync_status(hdev, HCI_OP_LE_PA_TERM_SYNC,
+				     sizeof(cp), &cp, HCI_CMD_TIMEOUT);
+}
diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index fa4efc226e6a..6d876ef56766 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -8148,7 +8148,7 @@ static int add_advertising(struct sock *sk, struct hci_dev *hdev,
 	u16 timeout, duration;
 	unsigned int prev_instance_cnt;
 	u8 schedule_instance = 0;
-	struct adv_info *next_instance;
+	struct adv_info *adv, *next_instance;
 	int err;
 	struct mgmt_pending_cmd *cmd;
 
@@ -8199,7 +8199,7 @@ static int add_advertising(struct sock *sk, struct hci_dev *hdev,
 
 	prev_instance_cnt = hdev->adv_instance_cnt;
 
-	err = hci_add_adv_instance(hdev, cp->instance, flags,
+	adv = hci_add_adv_instance(hdev, cp->instance, flags,
 				   cp->adv_data_len, cp->data,
 				   cp->scan_rsp_len,
 				   cp->data + cp->adv_data_len,
@@ -8207,7 +8207,7 @@ static int add_advertising(struct sock *sk, struct hci_dev *hdev,
 				   HCI_ADV_TX_POWER_NO_PREFERENCE,
 				   hdev->le_adv_min_interval,
 				   hdev->le_adv_max_interval);
-	if (err < 0) {
+	if (IS_ERR(adv)) {
 		err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_ADVERTISING,
 				      MGMT_STATUS_FAILED);
 		goto unlock;
@@ -8338,6 +8338,7 @@ static int add_ext_adv_params(struct sock *sk, struct hci_dev *hdev,
 	struct mgmt_cp_add_ext_adv_params *cp = data;
 	struct mgmt_rp_add_ext_adv_params rp;
 	struct mgmt_pending_cmd *cmd = NULL;
+	struct adv_info *adv;
 	u32 flags, min_interval, max_interval;
 	u16 timeout, duration;
 	u8 status;
@@ -8407,11 +8408,11 @@ static int add_ext_adv_params(struct sock *sk, struct hci_dev *hdev,
 		   HCI_ADV_TX_POWER_NO_PREFERENCE;
 
 	/* Create advertising instance with no advertising or response data */
-	err = hci_add_adv_instance(hdev, cp->instance, flags,
-				   0, NULL, 0, NULL, timeout, duration,
-				   tx_power, min_interval, max_interval);
+	adv = hci_add_adv_instance(hdev, cp->instance, flags, 0, NULL, 0, NULL,
+				   timeout, duration, tx_power, min_interval,
+				   max_interval);
 
-	if (err < 0) {
+	if (IS_ERR(adv)) {
 		err = mgmt_cmd_status(sk, hdev->id, MGMT_OP_ADD_EXT_ADV_PARAMS,
 				      MGMT_STATUS_FAILED);
 		goto unlock;
-- 
2.35.1

