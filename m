Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9425A13CE86
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Jan 2020 22:02:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729679AbgAOVC0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Jan 2020 16:02:26 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36040 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728905AbgAOVC0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Jan 2020 16:02:26 -0500
Received: by mail-pg1-f195.google.com with SMTP id k3so8775868pgc.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 15 Jan 2020 13:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2KCB/h9YBXo+fU56WvKaGP0YGeZd1duU/568LnZNNI4=;
        b=TVe8l/qe+EIXOIa+ak27vCixAUGjT7DbOSJs2kxw+uH3pUa7qYyN3G+JPeKZpX8HuK
         UHBtq1JCFIGLpRZWE0OKHvIQoEFweuiM/NjjEmNFxj8127lgU0JHDA4yM79XV96CpvT3
         wZ22obVxOu1fB5m5xio/tqI7Uf17opbmFApxCqGmivMI/4YCCfK3u/ljrzWqUYC5iifU
         OTKjM2Puf5BP/rXar7K/t75DNYhDT+iNtFEJvUq2HXMTzQvWuYg9cdBhHJH0TEWn9XVF
         hNfNI2UYaOAUNyEd6NY+NigbUSAwC/oIGHViFrzopL9YB/oB0uwzpxi9eARo6iC8Oa0W
         sgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2KCB/h9YBXo+fU56WvKaGP0YGeZd1duU/568LnZNNI4=;
        b=qfnS6yf0eBxPkRdyAf23BnQmhMTAvh7Hdf/lUdVwtq6Imhe+mM1RulR8iaXx3j+uKV
         sZOLiP1jmv9amDoh6Acf4779gxJowSnkkU+SBaJZKiN2JJetUiLw6Kdb7ZrnBNdzFQoE
         ivBv42nIXtF04dVUeGIvjn0kyHv0K4aSE1AVkkOFbMae+EcZjltD8sEPc51Eeezg2/EG
         Ij7T13QqJ2CghL94g0RggcqrQNAROmjB6CcVXGj+4rcQLEHYuoscbW436zs8o16jhUlD
         AQF8kUnS88q+QVDr0H720hgRg2twgrYgBgSvJP7YrNjzhO8YNlEhcTSXICBz/WnrvpQm
         X7gg==
X-Gm-Message-State: APjAAAUJ2YmXzt43gwiPmSDvtA8LCDhBj9dpSCNQSFii/pLH3j8BGB22
        yYzjgXTaOqvOvFXpV5xGcpglBysSE/E=
X-Google-Smtp-Source: APXvYqxONHJI3c8kwhhChI3XzrClEsp9PZdx68+w+l8OuGHLAO1U7gh8MiF7EB6vUvdysYV/mvOE4g==
X-Received: by 2002:aa7:9115:: with SMTP id 21mr33662940pfh.224.1579122145247;
        Wed, 15 Jan 2020 13:02:25 -0800 (PST)
Received: from localhost.localdomain ([192.102.209.41])
        by smtp.gmail.com with ESMTPSA id s24sm23290976pfd.161.2020.01.15.13.02.23
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 13:02:23 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v5 01/11] Bluetooth: Add definitions for CIS connections
Date:   Wed, 15 Jan 2020 13:02:11 -0800
Message-Id: <20200115210221.13096-2-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200115210221.13096-1-luiz.dentz@gmail.com>
References: <20200115210221.13096-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

These adds the HCI definitions for handling CIS connections along with
ISO data packets.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/hci.h | 159 +++++++++++++++++++++++++++++++++++-
 1 file changed, 158 insertions(+), 1 deletion(-)

diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
index 07b6ecedc6ce..6293bdd7d862 100644
--- a/include/net/bluetooth/hci.h
+++ b/include/net/bluetooth/hci.h
@@ -27,6 +27,7 @@
 
 #define HCI_MAX_ACL_SIZE	1024
 #define HCI_MAX_SCO_SIZE	255
+#define HCI_MAX_ISO_SIZE	251
 #define HCI_MAX_EVENT_SIZE	260
 #define HCI_MAX_FRAME_SIZE	(HCI_MAX_ACL_SIZE + 4)
 
@@ -303,6 +304,7 @@ enum {
 #define HCI_ACLDATA_PKT		0x02
 #define HCI_SCODATA_PKT		0x03
 #define HCI_EVENT_PKT		0x04
+#define HCI_ISODATA_PKT		0x05
 #define HCI_DIAG_PKT		0xf0
 #define HCI_VENDOR_PKT		0xff
 
@@ -352,6 +354,15 @@ enum {
 #define ACL_ACTIVE_BCAST	0x04
 #define ACL_PICO_BCAST		0x08
 
+/* ISO PB flags */
+#define ISO_START		0x00
+#define ISO_CONT		0x01
+#define ISO_SINGLE		0x02
+#define ISO_END			0x03
+
+/* ISO TS flags */
+#define ISO_TS			0x01
+
 /* Baseband links */
 #define SCO_LINK	0x00
 #define ACL_LINK	0x01
@@ -359,6 +370,7 @@ enum {
 /* Low Energy links do not have defined link type. Use invented one */
 #define LE_LINK		0x80
 #define AMP_LINK	0x81
+#define ISO_LINK	0x82
 #define INVALID_LINK	0xff
 
 /* LMP features */
@@ -440,6 +452,8 @@ enum {
 #define HCI_LE_PHY_2M			0x01
 #define HCI_LE_PHY_CODED		0x08
 #define HCI_LE_CHAN_SEL_ALG2		0x40
+#define HCI_LE_CIS_MASTER		0x10
+#define HCI_LE_CIS_SLAVE		0x20
 
 /* Connection modes */
 #define HCI_CM_ACTIVE	0x0000
@@ -1718,6 +1732,86 @@ struct hci_cp_le_set_adv_set_rand_addr {
 	bdaddr_t  bdaddr;
 } __packed;
 
+#define HCI_OP_LE_READ_BUFFER_SIZE_V2	0x2060
+struct hci_rp_le_read_buffer_size_v2 {
+	__u8    status;
+	__le16  acl_mtu;
+	__u8    acl_max_pkt;
+	__le16  iso_mtu;
+	__u8    iso_max_pkt;
+} __packed;
+
+#define HCI_OP_LE_READ_ISO_TX_SYNC		0x2061
+struct hci_cp_le_read_iso_tx_sync {
+	__le16  handle;
+} __packed;
+
+struct hci_rp_le_read_iso_tx_sync {
+	__u8    status;
+	__le16  handle;
+	__le16  seq;
+	__le32  imestamp;
+	__u8    offset[3];
+} __packed;
+
+#define HCI_OP_LE_SET_CIG_PARAMS		0x2062
+struct hci_cis_params {
+	__u8    cis_id;
+	__le16  m_sdu;
+	__le16  s_sdu;
+	__u8    m_phy;
+	__u8    s_phy;
+	__u8    m_rtn;
+	__u8    s_rtn;
+} __packed;
+
+struct hci_cp_le_set_cig_params {
+	__u8    cig_id;
+	__u8    m_interval[3];
+	__u8    s_interval[3];
+	__u8    sca;
+	__u8    packing;
+	__u8    framing;
+	__le16  m_latency;
+	__le16  s_latency;
+	__u8    num_cis;
+	struct hci_cis_params cis[0];
+} __packed;
+
+struct hci_rp_le_set_cig_params {
+	__u8    status;
+	__u8    cig_id;
+	__u8    num_handles;
+	__le16  handle[0];
+} __packed;
+
+#define HCI_OP_LE_CREATE_CIS			0x2064
+struct hci_cis {
+	__le16  cis_handle;
+	__le16  acl_handle;
+} __packed;
+
+struct hci_cp_le_create_cis {
+	__u8    num_cis;
+	struct hci_cis cis[0];
+} __packed;
+
+#define HCI_OP_LE_REMOVE_CIG			0x2065
+struct hci_cp_le_remove_cig {
+	__u8    cig_id;
+} __packed;
+
+#define HCI_OP_LE_ACCEPT_CIS			0x2066
+struct hci_cp_le_accept_cis {
+	__le16  handle;
+} __packed;
+
+#define HCI_OP_LE_REJECT_CIS			0x2067
+struct hci_cp_le_reject_cis {
+	__le16  handle;
+	__u8    reason;
+} __packed;
+
 /* ---- HCI Events ---- */
 #define HCI_EV_INQUIRY_COMPLETE		0x01
 
@@ -2189,7 +2283,7 @@ struct hci_ev_le_direct_adv_info {
 #define HCI_EV_LE_PHY_UPDATE_COMPLETE	0x0c
 struct hci_ev_le_phy_update_complete {
 	__u8  status;
-	__u16 handle;
+	__le16 handle;
 	__u8  tx_phy;
 	__u8  rx_phy;
 } __packed;
@@ -2234,6 +2328,34 @@ struct hci_evt_le_ext_adv_set_term {
 	__u8	num_evts;
 } __packed;
 
+#define HCI_EVT_LE_CIS_ESTABLISHED	0x19
+struct hci_evt_le_cis_established {
+	__u8  status;
+	__le16 handle;
+	__u8  cig_sync_delay[3];
+	__u8  cis_sync_delay[3];
+	__u8  m_latency[3];
+	__u8  s_latency[3];
+	__u8  m_phy;
+	__u8  s_phy;
+	__u8  nse;
+	__u8  m_bn;
+	__u8  s_bn;
+	__u8  m_ft;
+	__u8  s_ft;
+	__le16 m_mtu;
+	__le16 s_mtu;
+	__le16 interval;
+} __packed;
+
+#define HCI_EVT_LE_CIS_REQ		0x1a
+struct hci_evt_le_cis_req {
+	__le16 acl_handle;
+	__le16 cis_handle;
+	__u8  cig_id;
+	__u8  cis_id;
+} __packed;
+
 #define HCI_EV_VENDOR			0xff
 
 /* Internal events generated by Bluetooth stack */
@@ -2262,6 +2384,7 @@ struct hci_ev_si_security {
 #define HCI_EVENT_HDR_SIZE   2
 #define HCI_ACL_HDR_SIZE     4
 #define HCI_SCO_HDR_SIZE     3
+#define HCI_ISO_HDR_SIZE     4
 
 struct hci_command_hdr {
 	__le16	opcode;		/* OCF & OGF */
@@ -2283,6 +2406,30 @@ struct hci_sco_hdr {
 	__u8	dlen;
 } __packed;
 
+struct hci_iso_hdr {
+	__le16	handle;
+	__le16	dlen;
+	__u8	data[0];
+} __packed;
+
+/* ISO data packet status flags */
+#define HCI_ISO_STATUS_VALID	0x00
+#define HCI_ISO_STATUS_INVALID	0x01
+#define HCI_ISO_STATUS_NOP	0x02
+
+#define HCI_ISO_DATA_HDR_SIZE	4
+struct hci_iso_data_hdr {
+	__le16	sn;
+	__le16	slen;
+};
+
+#define HCI_ISO_TS_DATA_HDR_SIZE 8
+struct hci_iso_ts_data_hdr {
+	__le32	ts;
+	__le16	sn;
+	__le16	slen;
+};
+
 static inline struct hci_event_hdr *hci_event_hdr(const struct sk_buff *skb)
 {
 	return (struct hci_event_hdr *) skb->data;
@@ -2308,4 +2455,14 @@ static inline struct hci_sco_hdr *hci_sco_hdr(const struct sk_buff *skb)
 #define hci_handle(h)		(h & 0x0fff)
 #define hci_flags(h)		(h >> 12)
 
+/* ISO handle and flags pack/unpack */
+#define hci_iso_flags_pb(f)		(f & 0x0003)
+#define hci_iso_flags_ts(f)		((f >> 2) & 0x0001)
+#define hci_iso_flags_pack(pb, ts)	((pb & 0x03) | ((ts & 0x01) << 2))
+
+/* ISO data length and flags pack/unpack */
+#define hci_iso_data_len_pack(h, f)	((__u16) ((h) | ((f) << 14)))
+#define hci_iso_data_len(h)		((h) & 0x3fff)
+#define hci_iso_data_flags(h)		((h) >> 14)
+
 #endif /* __HCI_H */
-- 
2.21.0

