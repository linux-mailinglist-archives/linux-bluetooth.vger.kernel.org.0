Return-Path: <linux-bluetooth+bounces-18300-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOlbFX1EcWn2fgAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18300-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 22:26:21 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CD45E046
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 22:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9402EB431C2
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 21:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FA933C19A;
	Wed, 21 Jan 2026 21:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQyvdgqe"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6736426EB5
	for <linux-bluetooth@vger.kernel.org>; Wed, 21 Jan 2026 21:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769030348; cv=none; b=eWNz31rVhko8hDyiOKPaNT5wGq/BiPMhCXgykmhwz3XxWGV8Dg9qsHWeZpt9rdeHUd6eAbE66UnrM5oGq1kaGlwft1UIOcno9dUQvWUb15A0xkjLSC9Gtifsmx71ZIsdKrmHYxfToLaFFAj4v0G6dXgllvk5OxjwhiyrDdZfIS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769030348; c=relaxed/simple;
	bh=a9UO9xKK9T09zShgU8/AvMiIJ59iO6lwz66RVvFBJlg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=AUrNYcTUNrsG+wvQv/ccaIllu33a0NQFqjegcJhJUU3x2Oz2yBD0U6zVNA5H9YUbiZQHlIWKVTIuxCysYEeNgIf41vvY8ad3qrai4BOhSPAy70jvy27i6PXBT6Pz0Wk5y7HQwflMKB7UD+7kEzcsjdRoKBEsb77IjPv8WbOT/W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQyvdgqe; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64931bbf70cso369757d50.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 21 Jan 2026 13:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769030345; x=1769635145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zHYs5n6PnbX/BYZAE99RsDw5ytggWdw9PH/AX4izVhM=;
        b=JQyvdgqebHeR4bSi6xOrKzHGFL1gv6DqGDLGdxa/qdtSitHczVoIfVQXb+jjdomu9q
         /AK8/gGTKtCocxZ9FDNJ8Tdv95HLeBzeQB/bBGJ+xXT3It8tm+bgdbE8WTlPTSfr3owD
         S9u1QOElkVIxNMVS7oQVbFLeN3+Rl90b7rQgGqzDmcH1AvmcM/CLIZsrdU8sEYihKHUl
         stEkqRzj+PiJA6yJwjmTAKSnu80iGup+NkXbdEownUeOQ0/OU+MNLXBguDAuGgSvdNPj
         xiPwdjqa0vOYDUX4Eup86CErfDv6gG0+XGQofSF28rZKMKOpovJ1RUrGg1tPTAYuj9Vj
         zCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769030345; x=1769635145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHYs5n6PnbX/BYZAE99RsDw5ytggWdw9PH/AX4izVhM=;
        b=wD2XyBAZy1lNDeeWHaxvq3jfaC940rApxT6MbTLElPJZG7UrwlEqu4i06Io/Ob8kvd
         WlpPyGM3SDeZ2Cvr5qVSPjIWWQjNZbS2BDQ3NqXxq7VvyAvFbNkqD9O3geRrZvGwhMaD
         aS+JY/msrUHmJMtlY1t4tOPPqkNt7nS48SNKqz97a4j9Qset1OG+8yko2/Go9kB6N1WS
         i6ZLK0LPVJ7Ai6lQFwxSLenpeHT42VEnsKKeg/tLr3RH+EK2rQRXynkYyynulx7dMs5N
         8ZkqpTruARDhXMu4FAuIRy2Qbt9tOSbca2PfD4UhSMHUV6JzmxCt3lW3HR7HuiQQn0mB
         1m1A==
X-Gm-Message-State: AOJu0Yyd8DHvLeCiZO+GopEPbUI0lAFqSKziHL+VRSmwIGjj/KVl/rOS
	XHDwAzigTID+yj/XRfyvh+VREC8aYQPqciRU854Qhv2KnYzqHZ+vg+A+oZ8FFxNv
X-Gm-Gg: AZuq6aKHDeltL7IWUbdXhpF9hmF9AWXP9SbWyGPfjY9+4Cys6yTGm7ocUgnF1U0Pol3
	pVbMDCCOvFNUZJarnFmbytFYBghCZstcR9q2Z/oWnhPWL8kroovRyinM55EXcl1zdk6tvtf5Dau
	LP/dDF+dpjMpg862ba/qZNRLlTJC/RwnrNmDlE022vlmeBj7Ro0FPW0sJbC3TFttPE9gtrhbMzg
	bA+0thn5/xikEXp7sNQu2XZMJL2RJChbSR7+iOYY5vY/vdgcPcQJN0IMbyKaDCiNg7pwJK1QV5l
	McDJJMAJsFZ9iE1e5gSUGNlU5Lt7EBypo42NN/t03eMqxpVv0wmyYX2lJ5DE4eZ3oscwyNN/lU7
	myYKSEOwkTWC0EEFpCTJqfZ/dRxtyJ2jwBtl1SJExeWKl2HGQ0QlVUD/Kd2h/qP1A0brXt4n7/j
	kYzFHGm0n5WFoGaXyO1KFbdYTrb0AFFh+HlrdR5CZthtPEL23ZqE0zFH7lguyKlM09X3KMekoRQ
	MiHPA==
X-Received: by 2002:a05:690c:ec2:b0:792:6980:36df with SMTP id 00721157ae682-7940a0e6fdcmr131853507b3.6.1769030345290;
        Wed, 21 Jan 2026 13:19:05 -0800 (PST)
Received: from lvondent-mobl5 ([72.188.211.115])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66fed6fsm70411817b3.23.2026.01.21.13.19.04
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 13:19:04 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH v1] Bluetooth: L2CAP: Fix not tracking outstanding TX ident
Date: Wed, 21 Jan 2026 16:18:56 -0500
Message-ID: <20260121211856.2658795-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-18300-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-bluetooth@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,intel.com:email]
X-Rspamd-Queue-Id: C8CD45E046
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This attempts to proper track outstanding request by using struct ida
and allocating from it in l2cap_get_ident using ida_alloc_range which
would reuse ids as they are free, then upon completion release
the id using ida_free.

Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
---
 include/net/bluetooth/l2cap.h |  3 +--
 net/bluetooth/l2cap_core.c    | 44 +++++++++++++++++++++++------------
 2 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
index 00e182a22720..ec3af01e4db9 100644
--- a/include/net/bluetooth/l2cap.h
+++ b/include/net/bluetooth/l2cap.h
@@ -655,8 +655,7 @@ struct l2cap_conn {
 
 	struct sk_buff		*rx_skb;
 	__u32			rx_len;
-	__u8			tx_ident;
-	struct mutex		ident_lock;
+	struct ida		tx_ida;
 
 	struct sk_buff_head	pending_rx;
 	struct work_struct	pending_rx_work;
diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 07b493331fd7..7719e1e1aa1b 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -924,26 +924,14 @@ int l2cap_chan_check_security(struct l2cap_chan *chan, bool initiator)
 				 initiator);
 }
 
-static u8 l2cap_get_ident(struct l2cap_conn *conn)
+static int l2cap_get_ident(struct l2cap_conn *conn)
 {
-	u8 id;
-
 	/* Get next available identificator.
 	 *    1 - 128 are used by kernel.
 	 *  129 - 199 are reserved.
 	 *  200 - 254 are used by utilities like l2ping, etc.
 	 */
-
-	mutex_lock(&conn->ident_lock);
-
-	if (++conn->tx_ident > 128)
-		conn->tx_ident = 1;
-
-	id = conn->tx_ident;
-
-	mutex_unlock(&conn->ident_lock);
-
-	return id;
+	return ida_alloc_range(&conn->tx_ida, 1, 128, GFP_ATOMIC);
 }
 
 static void l2cap_send_acl(struct l2cap_conn *conn, struct sk_buff *skb,
@@ -1773,6 +1761,8 @@ static void l2cap_conn_del(struct hci_conn *hcon, int err)
 	if (work_pending(&conn->pending_rx_work))
 		cancel_work_sync(&conn->pending_rx_work);
 
+	ida_destroy(&conn->tx_ida);
+
 	cancel_delayed_work_sync(&conn->id_addr_timer);
 
 	l2cap_unregister_all_users(conn);
@@ -4782,12 +4772,34 @@ static int l2cap_le_connect_rsp(struct l2cap_conn *conn,
 	return err;
 }
 
+static void l2cap_put_ident(struct l2cap_conn *conn, u8 code, u8 id)
+{
+	switch (code) {
+	case L2CAP_COMMAND_REJ:
+	case L2CAP_CONN_RSP:
+	case L2CAP_CONF_RSP:
+	case L2CAP_DISCONN_RSP:
+	case L2CAP_ECHO_RSP:
+	case L2CAP_INFO_RSP:
+	case L2CAP_CONN_PARAM_UPDATE_RSP:
+	case L2CAP_ECRED_CONN_RSP:
+	case L2CAP_ECRED_RECONF_RSP:
+		/* First do a lookup since the remote may send bogus ids that
+		 * would make ida_free to generate warnings.
+		 */
+		if (ida_find_first_range(&conn->tx_ida, id, id) >= 0)
+			ida_free(&conn->tx_ida, id);
+	}
+}
+
 static inline int l2cap_bredr_sig_cmd(struct l2cap_conn *conn,
 				      struct l2cap_cmd_hdr *cmd, u16 cmd_len,
 				      u8 *data)
 {
 	int err = 0;
 
+	l2cap_put_ident(conn, cmd->code, cmd->ident);
+
 	switch (cmd->code) {
 	case L2CAP_COMMAND_REJ:
 		l2cap_command_rej(conn, cmd, cmd_len, data);
@@ -5419,6 +5431,8 @@ static inline int l2cap_le_sig_cmd(struct l2cap_conn *conn,
 {
 	int err = 0;
 
+	l2cap_put_ident(conn, cmd->code, cmd->ident);
+
 	switch (cmd->code) {
 	case L2CAP_COMMAND_REJ:
 		l2cap_le_command_rej(conn, cmd, cmd_len, data);
@@ -6907,13 +6921,13 @@ static struct l2cap_conn *l2cap_conn_add(struct hci_conn *hcon)
 	     hci_dev_test_flag(hcon->hdev, HCI_FORCE_BREDR_SMP)))
 		conn->local_fixed_chan |= L2CAP_FC_SMP_BREDR;
 
-	mutex_init(&conn->ident_lock);
 	mutex_init(&conn->lock);
 
 	INIT_LIST_HEAD(&conn->chan_l);
 	INIT_LIST_HEAD(&conn->users);
 
 	INIT_DELAYED_WORK(&conn->info_timer, l2cap_info_timeout);
+	ida_init(&conn->tx_ida);
 
 	skb_queue_head_init(&conn->pending_rx);
 	INIT_WORK(&conn->pending_rx_work, process_pending_rx);
-- 
2.52.0


