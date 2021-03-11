Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE56C33810D
	for <lists+linux-bluetooth@lfdr.de>; Fri, 12 Mar 2021 00:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbhCKXCv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 11 Mar 2021 18:02:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhCKXC1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 11 Mar 2021 18:02:27 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD064C061574
        for <linux-bluetooth@vger.kernel.org>; Thu, 11 Mar 2021 15:02:26 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id y67so575843pfb.2
        for <linux-bluetooth@vger.kernel.org>; Thu, 11 Mar 2021 15:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a7icICTJs0Fuhesm3i5CbQxdpSgea5J5bsIRCrkj9sg=;
        b=bZvJ8A/cIMluUJAMUcpHEa5RhGAohfhi2oY09UyHW52ZkkgAyX4wj1sOe8hL966WBX
         meAK5CBQj7XDnQLKoXMgVkmbtW9D7bwLfzuiGa1XwhePhjfE2bupo9wAMSbXwvWIRVBS
         2PCUkMSW8YfD0TBXWBRl4aeEg1DYlZP3T0KRVHLg5aUgXE0y/0UOF7exFmM4j10WDhfo
         hPhGpTIT82Obh76mc1SiZ9gp79dlsdBh545veG0VXrAWWsu8ruGmH/boe8vHUbTWyP4L
         S1By96kjl9R3pjOdt12YNFl3IdR6igcaBZE2r8ZeFH5q5oIJeN/2s+Nhdfy6vqDGeY/G
         1xsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a7icICTJs0Fuhesm3i5CbQxdpSgea5J5bsIRCrkj9sg=;
        b=qUgVPKx7JhFLEPIz4JM17QREY3Pjp0swjxxPohun7RbdYbLX1NiPSQa+NUwIv+cgam
         V3up89VtquxADR2EuKgBl/2XkklSPCP/ifuWEYA6uN68Y/BaHsHVw9ZtJt9HUZYAWsG7
         TlkL5DxlQ/lDtLFK8TPo1pT601jbT2eoNPabyeOnKsYgp5Tr3HjnJ1LBfTBzad68OGGN
         IbK0lEXOPuvrhUmb4aRKrt4uBp5kKl7ApkWwrW6JUgpCrqfdqt2ijPNvWMj+CIe1/tuy
         zS0BmtjgugNeSJ9pf1OW1D+wBDAbltek3kRqbrznLj+tGVlU0yS5R/ZF3oAWwi1wd9nO
         PBjg==
X-Gm-Message-State: AOAM53148gPtcvHMe/dSOv3pat5+dwBy/aIoHHKnaf0sY6zl5R7J7KNP
        ehJ+8EezJGTd0vBDtcBeDECoPp4ltfADHg==
X-Google-Smtp-Source: ABdhPJwvWdkPN8E9ejD7GajBV2bNfrrRBN13Q3+K10oz5NEPESrQiPPSuNv/lRdMhWoP7fAdGuwt6w==
X-Received: by 2002:a62:dd89:0:b029:1fd:d370:7a5e with SMTP id w131-20020a62dd890000b02901fdd3707a5emr7815560pff.61.1615503745513;
        Thu, 11 Mar 2021 15:02:25 -0800 (PST)
Received: from localhost.localdomain (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id q205sm3517467pfc.126.2021.03.11.15.02.24
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 15:02:25 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v2] Bluetooth: SMP: Convert BT_ERR/BT_DBG to bt_dev_err/bt_dev_dbg
Date:   Thu, 11 Mar 2021 15:02:22 -0800
Message-Id: <20210311230222.1079239-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This converts instances of BT_ERR and BT_DBG to bt_dev_err and
bt_dev_dbg which can be enabled at runtime when BT_FEATURE_DEBUG is
enabled.

Note: Not all instances could be converted as some are exercised by
selftest.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
v2: Fix issues found by CI

 net/bluetooth/smp.c | 98 ++++++++++++++++++++++++---------------------
 1 file changed, 52 insertions(+), 46 deletions(-)

diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index e03cc284161c..3cc1ad042edf 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -595,7 +595,7 @@ static void smp_send_cmd(struct l2cap_conn *conn, u8 code, u16 len, void *data)
 	if (!chan)
 		return;
 
-	BT_DBG("code 0x%2.2x", code);
+	bt_dev_dbg(conn->hcon->hdev, "code 0x%2.2x", code);
 
 	iv[0].iov_base = &code;
 	iv[0].iov_len = 1;
@@ -859,7 +859,8 @@ static int tk_request(struct l2cap_conn *conn, u8 remote_oob, u8 auth,
 	memset(smp->tk, 0, sizeof(smp->tk));
 	clear_bit(SMP_FLAG_TK_VALID, &smp->flags);
 
-	BT_DBG("tk_request: auth:%d lcl:%d rem:%d", auth, local_io, remote_io);
+	bt_dev_dbg(hcon->hdev, "auth:%d lcl:%d rem:%d", auth, local_io,
+		   remote_io);
 
 	/* If neither side wants MITM, either "just" confirm an incoming
 	 * request or use just-works for outgoing ones. The JUST_CFM
@@ -924,7 +925,7 @@ static int tk_request(struct l2cap_conn *conn, u8 remote_oob, u8 auth,
 		get_random_bytes(&passkey, sizeof(passkey));
 		passkey %= 1000000;
 		put_unaligned_le32(passkey, smp->tk);
-		BT_DBG("PassKey: %d", passkey);
+		bt_dev_dbg(hcon->hdev, "PassKey: %d", passkey);
 		set_bit(SMP_FLAG_TK_VALID, &smp->flags);
 	}
 
@@ -949,7 +950,7 @@ static u8 smp_confirm(struct smp_chan *smp)
 	struct smp_cmd_pairing_confirm cp;
 	int ret;
 
-	BT_DBG("conn %p", conn);
+	bt_dev_dbg(conn->hcon->hdev, "conn %p", conn);
 
 	ret = smp_c1(smp->tk, smp->prnd, smp->preq, smp->prsp,
 		     conn->hcon->init_addr_type, &conn->hcon->init_addr,
@@ -977,7 +978,8 @@ static u8 smp_random(struct smp_chan *smp)
 	u8 confirm[16];
 	int ret;
 
-	BT_DBG("conn %p %s", conn, conn->hcon->out ? "master" : "slave");
+	bt_dev_dbg(conn->hcon->hdev, "conn %p %s", conn,
+		   conn->hcon->out ? "master" : "slave");
 
 	ret = smp_c1(smp->tk, smp->rrnd, smp->preq, smp->prsp,
 		     hcon->init_addr_type, &hcon->init_addr,
@@ -1236,7 +1238,7 @@ static void smp_distribute_keys(struct smp_chan *smp)
 	struct hci_dev *hdev = hcon->hdev;
 	__u8 *keydist;
 
-	BT_DBG("conn %p", conn);
+	bt_dev_dbg(hdev, "conn %p", conn);
 
 	rsp = (void *) &smp->prsp[1];
 
@@ -1266,7 +1268,7 @@ static void smp_distribute_keys(struct smp_chan *smp)
 		*keydist &= ~SMP_SC_NO_DIST;
 	}
 
-	BT_DBG("keydist 0x%x", *keydist);
+	bt_dev_dbg(hdev, "keydist 0x%x", *keydist);
 
 	if (*keydist & SMP_DIST_ENC_KEY) {
 		struct smp_cmd_encrypt_info enc;
@@ -1366,13 +1368,14 @@ static void smp_timeout(struct work_struct *work)
 					    security_timer.work);
 	struct l2cap_conn *conn = smp->conn;
 
-	BT_DBG("conn %p", conn);
+	bt_dev_dbg(conn->hcon->hdev, "conn %p", conn);
 
 	hci_disconnect(conn->hcon, HCI_ERROR_REMOTE_USER_TERM);
 }
 
 static struct smp_chan *smp_chan_create(struct l2cap_conn *conn)
 {
+	struct hci_conn *hcon = conn->hcon;
 	struct l2cap_chan *chan = conn->smp;
 	struct smp_chan *smp;
 
@@ -1382,13 +1385,13 @@ static struct smp_chan *smp_chan_create(struct l2cap_conn *conn)
 
 	smp->tfm_cmac = crypto_alloc_shash("cmac(aes)", 0, 0);
 	if (IS_ERR(smp->tfm_cmac)) {
-		BT_ERR("Unable to create CMAC crypto context");
+		bt_dev_err(hcon->hdev, "Unable to create CMAC crypto context");
 		goto zfree_smp;
 	}
 
 	smp->tfm_ecdh = crypto_alloc_kpp("ecdh", 0, 0);
 	if (IS_ERR(smp->tfm_ecdh)) {
-		BT_ERR("Unable to create ECDH crypto context");
+		bt_dev_err(hcon->hdev, "Unable to create ECDH crypto context");
 		goto free_shash;
 	}
 
@@ -1399,7 +1402,7 @@ static struct smp_chan *smp_chan_create(struct l2cap_conn *conn)
 
 	INIT_DELAYED_WORK(&smp->security_timer, smp_timeout);
 
-	hci_conn_hold(conn->hcon);
+	hci_conn_hold(hcon);
 
 	return smp;
 
@@ -1564,8 +1567,8 @@ static u8 sc_passkey_round(struct smp_chan *smp, u8 smp_op)
 		if (!hcon->out)
 			return 0;
 
-		BT_DBG("%s Starting passkey round %u", hdev->name,
-		       smp->passkey_round + 1);
+		bt_dev_dbg(hdev, "%s Starting passkey round %u", hdev->name,
+			   smp->passkey_round + 1);
 
 		SMP_ALLOW_CMD(smp, SMP_CMD_PAIRING_CONFIRM);
 
@@ -1625,7 +1628,7 @@ int smp_user_confirm_reply(struct hci_conn *hcon, u16 mgmt_op, __le32 passkey)
 	u32 value;
 	int err;
 
-	BT_DBG("");
+	bt_dev_dbg(conn->hcon->hdev, "");
 
 	if (!conn)
 		return -ENOTCONN;
@@ -1651,7 +1654,7 @@ int smp_user_confirm_reply(struct hci_conn *hcon, u16 mgmt_op, __le32 passkey)
 	case MGMT_OP_USER_PASSKEY_REPLY:
 		value = le32_to_cpu(passkey);
 		memset(smp->tk, 0, sizeof(smp->tk));
-		BT_DBG("PassKey: %d", value);
+		bt_dev_dbg(conn->hcon->hdev, "PassKey: %d", value);
 		put_unaligned_le32(value, smp->tk);
 		fallthrough;
 	case MGMT_OP_USER_CONFIRM_REPLY:
@@ -1733,7 +1736,7 @@ static u8 smp_cmd_pairing_req(struct l2cap_conn *conn, struct sk_buff *skb)
 	u8 key_size, auth, sec_level;
 	int ret;
 
-	BT_DBG("conn %p", conn);
+	bt_dev_dbg(hdev, "conn %p", conn);
 
 	if (skb->len < sizeof(*req))
 		return SMP_INVALID_PARAMS;
@@ -1887,7 +1890,7 @@ static u8 sc_send_public_key(struct smp_chan *smp)
 	}
 
 	if (hci_dev_test_flag(hdev, HCI_USE_DEBUG_KEYS)) {
-		BT_DBG("Using debug keys");
+		bt_dev_dbg(hdev, "Using debug keys");
 		if (set_ecdh_privkey(smp->tfm_ecdh, debug_sk))
 			return SMP_UNSPECIFIED;
 		memcpy(smp->local_pk, debug_pk, 64);
@@ -1924,7 +1927,7 @@ static u8 smp_cmd_pairing_rsp(struct l2cap_conn *conn, struct sk_buff *skb)
 	u8 key_size, auth;
 	int ret;
 
-	BT_DBG("conn %p", conn);
+	bt_dev_dbg(hdev, "conn %p", conn);
 
 	if (skb->len < sizeof(*rsp))
 		return SMP_INVALID_PARAMS;
@@ -2019,7 +2022,7 @@ static u8 sc_check_confirm(struct smp_chan *smp)
 {
 	struct l2cap_conn *conn = smp->conn;
 
-	BT_DBG("");
+	bt_dev_dbg(conn->hcon->hdev, "");
 
 	if (smp->method == REQ_PASSKEY || smp->method == DSP_PASSKEY)
 		return sc_passkey_round(smp, SMP_CMD_PAIRING_CONFIRM);
@@ -2078,8 +2081,10 @@ static u8 smp_cmd_pairing_confirm(struct l2cap_conn *conn, struct sk_buff *skb)
 {
 	struct l2cap_chan *chan = conn->smp;
 	struct smp_chan *smp = chan->data;
+	struct hci_conn *hcon = conn->hcon;
+	struct hci_dev *hdev = hcon->hdev;
 
-	BT_DBG("conn %p %s", conn, conn->hcon->out ? "master" : "slave");
+	bt_dev_dbg(hdev, "conn %p %s", conn, hcon->out ? "master" : "slave");
 
 	if (skb->len < sizeof(smp->pcnf))
 		return SMP_INVALID_PARAMS;
@@ -2094,7 +2099,7 @@ static u8 smp_cmd_pairing_confirm(struct l2cap_conn *conn, struct sk_buff *skb)
 		if (test_bit(SMP_FLAG_REMOTE_PK, &smp->flags))
 			return sc_check_confirm(smp);
 
-		BT_ERR("Unexpected SMP Pairing Confirm");
+		bt_dev_err(hdev, "Unexpected SMP Pairing Confirm");
 
 		ret = fixup_sc_false_positive(smp);
 		if (ret)
@@ -2125,7 +2130,7 @@ static u8 smp_cmd_pairing_random(struct l2cap_conn *conn, struct sk_buff *skb)
 	u32 passkey;
 	int err;
 
-	BT_DBG("conn %p", conn);
+	bt_dev_dbg(hcon->hdev, "conn %p", conn);
 
 	if (skb->len < sizeof(smp->rrnd))
 		return SMP_INVALID_PARAMS;
@@ -2284,7 +2289,7 @@ static u8 smp_cmd_security_req(struct l2cap_conn *conn, struct sk_buff *skb)
 	struct smp_chan *smp;
 	u8 sec_level, auth;
 
-	BT_DBG("conn %p", conn);
+	bt_dev_dbg(hdev, "conn %p", conn);
 
 	if (skb->len < sizeof(*rp))
 		return SMP_INVALID_PARAMS;
@@ -2347,7 +2352,8 @@ int smp_conn_security(struct hci_conn *hcon, __u8 sec_level)
 	__u8 authreq;
 	int ret;
 
-	BT_DBG("conn %p hcon %p level 0x%2.2x", conn, hcon, sec_level);
+	bt_dev_dbg(hcon->hdev, "conn %p hcon %p level 0x%2.2x", conn, hcon,
+		   sec_level);
 
 	/* This may be NULL if there's an unexpected disconnection */
 	if (!conn)
@@ -2483,7 +2489,7 @@ static int smp_cmd_encrypt_info(struct l2cap_conn *conn, struct sk_buff *skb)
 	struct l2cap_chan *chan = conn->smp;
 	struct smp_chan *smp = chan->data;
 
-	BT_DBG("conn %p", conn);
+	bt_dev_dbg(conn->hcon->hdev, "conn %p", conn);
 
 	if (skb->len < sizeof(*rp))
 		return SMP_INVALID_PARAMS;
@@ -2516,7 +2522,7 @@ static int smp_cmd_master_ident(struct l2cap_conn *conn, struct sk_buff *skb)
 	struct smp_ltk *ltk;
 	u8 authenticated;
 
-	BT_DBG("conn %p", conn);
+	bt_dev_dbg(hdev, "conn %p", conn);
 
 	if (skb->len < sizeof(*rp))
 		return SMP_INVALID_PARAMS;
@@ -2548,7 +2554,7 @@ static int smp_cmd_ident_info(struct l2cap_conn *conn, struct sk_buff *skb)
 	struct l2cap_chan *chan = conn->smp;
 	struct smp_chan *smp = chan->data;
 
-	BT_DBG("");
+	bt_dev_dbg(conn->hcon->hdev, "");
 
 	if (skb->len < sizeof(*info))
 		return SMP_INVALID_PARAMS;
@@ -2580,7 +2586,7 @@ static int smp_cmd_ident_addr_info(struct l2cap_conn *conn,
 	struct hci_conn *hcon = conn->hcon;
 	bdaddr_t rpa;
 
-	BT_DBG("");
+	bt_dev_dbg(hcon->hdev, "");
 
 	if (skb->len < sizeof(*info))
 		return SMP_INVALID_PARAMS;
@@ -2647,7 +2653,7 @@ static int smp_cmd_sign_info(struct l2cap_conn *conn, struct sk_buff *skb)
 	struct smp_chan *smp = chan->data;
 	struct smp_csrk *csrk;
 
-	BT_DBG("conn %p", conn);
+	bt_dev_dbg(conn->hcon->hdev, "conn %p", conn);
 
 	if (skb->len < sizeof(*rp))
 		return SMP_INVALID_PARAMS;
@@ -2727,7 +2733,7 @@ static int smp_cmd_public_key(struct l2cap_conn *conn, struct sk_buff *skb)
 	struct smp_cmd_pairing_confirm cfm;
 	int err;
 
-	BT_DBG("conn %p", conn);
+	bt_dev_dbg(hdev, "conn %p", conn);
 
 	if (skb->len < sizeof(*key))
 		return SMP_INVALID_PARAMS;
@@ -2791,7 +2797,7 @@ static int smp_cmd_public_key(struct l2cap_conn *conn, struct sk_buff *skb)
 
 	smp->method = sc_select_method(smp);
 
-	BT_DBG("%s selected method 0x%02x", hdev->name, smp->method);
+	bt_dev_dbg(hdev, "%s selected method 0x%02x", hdev->name, smp->method);
 
 	/* JUST_WORKS and JUST_CFM result in an unauthenticated key */
 	if (smp->method == JUST_WORKS || smp->method == JUST_CFM)
@@ -2866,7 +2872,7 @@ static int smp_cmd_dhkey_check(struct l2cap_conn *conn, struct sk_buff *skb)
 	u8 io_cap[3], r[16], e[16];
 	int err;
 
-	BT_DBG("conn %p", conn);
+	bt_dev_dbg(hcon->hdev, "conn %p", conn);
 
 	if (skb->len < sizeof(*check))
 		return SMP_INVALID_PARAMS;
@@ -2926,7 +2932,7 @@ static int smp_cmd_keypress_notify(struct l2cap_conn *conn,
 {
 	struct smp_cmd_keypress_notify *kp = (void *) skb->data;
 
-	BT_DBG("value 0x%02x", kp->value);
+	bt_dev_dbg(conn->hcon->hdev, "value 0x%02x", kp->value);
 
 	return 0;
 }
@@ -3023,7 +3029,7 @@ static int smp_sig_channel(struct l2cap_chan *chan, struct sk_buff *skb)
 		break;
 
 	default:
-		BT_DBG("Unknown command code 0x%2.2x", code);
+		bt_dev_dbg(hcon->hdev, "Unknown command code 0x%2.2x", code);
 		reason = SMP_CMD_NOTSUPP;
 		goto done;
 	}
@@ -3048,7 +3054,7 @@ static void smp_teardown_cb(struct l2cap_chan *chan, int err)
 {
 	struct l2cap_conn *conn = chan->conn;
 
-	BT_DBG("chan %p", chan);
+	bt_dev_dbg(conn->hcon->hdev, "chan %p", chan);
 
 	if (chan->data)
 		smp_chan_destroy(conn);
@@ -3065,7 +3071,7 @@ static void bredr_pairing(struct l2cap_chan *chan)
 	struct smp_cmd_pairing req;
 	struct smp_chan *smp;
 
-	BT_DBG("chan %p", chan);
+	bt_dev_dbg(hdev, "chan %p", chan);
 
 	/* Only new pairings are interesting */
 	if (!test_bit(HCI_CONN_NEW_LINK_KEY, &hcon->flags))
@@ -3112,7 +3118,7 @@ static void bredr_pairing(struct l2cap_chan *chan)
 
 	set_bit(SMP_FLAG_SC, &smp->flags);
 
-	BT_DBG("%s starting SMP over BR/EDR", hdev->name);
+	bt_dev_dbg(hdev, "%s starting SMP over BR/EDR", hdev->name);
 
 	/* Prepare and send the BR/EDR SMP Pairing Request */
 	build_bredr_pairing_cmd(smp, &req, NULL);
@@ -3130,7 +3136,7 @@ static void smp_resume_cb(struct l2cap_chan *chan)
 	struct l2cap_conn *conn = chan->conn;
 	struct hci_conn *hcon = conn->hcon;
 
-	BT_DBG("chan %p", chan);
+	bt_dev_dbg(hcon->hdev, "chan %p", chan);
 
 	if (hcon->type == ACL_LINK) {
 		bredr_pairing(chan);
@@ -3153,7 +3159,7 @@ static void smp_ready_cb(struct l2cap_chan *chan)
 	struct l2cap_conn *conn = chan->conn;
 	struct hci_conn *hcon = conn->hcon;
 
-	BT_DBG("chan %p", chan);
+	bt_dev_dbg(hcon->hdev, "chan %p", chan);
 
 	/* No need to call l2cap_chan_hold() here since we already own
 	 * the reference taken in smp_new_conn_cb(). This is just the
@@ -3171,7 +3177,7 @@ static int smp_recv_cb(struct l2cap_chan *chan, struct sk_buff *skb)
 {
 	int err;
 
-	BT_DBG("chan %p", chan);
+	bt_dev_dbg(chan->conn->hcon->hdev, "chan %p", chan);
 
 	err = smp_sig_channel(chan, skb);
 	if (err) {
@@ -3223,7 +3229,7 @@ static inline struct l2cap_chan *smp_new_conn_cb(struct l2cap_chan *pchan)
 {
 	struct l2cap_chan *chan;
 
-	BT_DBG("pchan %p", pchan);
+	bt_dev_dbg(pchan->conn->hcon->hdev, "pchan %p", pchan);
 
 	chan = l2cap_chan_create();
 	if (!chan)
@@ -3244,7 +3250,7 @@ static inline struct l2cap_chan *smp_new_conn_cb(struct l2cap_chan *pchan)
 	 */
 	atomic_set(&chan->nesting, L2CAP_NESTING_SMP);
 
-	BT_DBG("created chan %p", chan);
+	bt_dev_dbg(pchan->conn->hcon->hdev, "created chan %p", chan);
 
 	return chan;
 }
@@ -3285,14 +3291,14 @@ static struct l2cap_chan *smp_add_cid(struct hci_dev *hdev, u16 cid)
 
 	tfm_cmac = crypto_alloc_shash("cmac(aes)", 0, 0);
 	if (IS_ERR(tfm_cmac)) {
-		BT_ERR("Unable to create CMAC crypto context");
+		bt_dev_err(hdev, "Unable to create CMAC crypto context");
 		kfree_sensitive(smp);
 		return ERR_CAST(tfm_cmac);
 	}
 
 	tfm_ecdh = crypto_alloc_kpp("ecdh", 0, 0);
 	if (IS_ERR(tfm_ecdh)) {
-		BT_ERR("Unable to create ECDH crypto context");
+		bt_dev_err(hdev, "Unable to create ECDH crypto context");
 		crypto_free_shash(tfm_cmac);
 		kfree_sensitive(smp);
 		return ERR_CAST(tfm_ecdh);
@@ -3348,7 +3354,7 @@ static void smp_del_chan(struct l2cap_chan *chan)
 {
 	struct smp_dev *smp;
 
-	BT_DBG("chan %p", chan);
+	bt_dev_dbg(chan->conn->hcon->hdev, "chan %p", chan);
 
 	smp = chan->data;
 	if (smp) {
@@ -3391,7 +3397,7 @@ int smp_register(struct hci_dev *hdev)
 {
 	struct l2cap_chan *chan;
 
-	BT_DBG("%s", hdev->name);
+	bt_dev_dbg(hdev, "%s", hdev->name);
 
 	/* If the controller does not support Low Energy operation, then
 	 * there is also no need to register any SMP channel.
-- 
2.29.2

