Return-Path: <linux-bluetooth+bounces-19245-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCu8ComamGkTKAMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19245-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 18:31:53 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 13776169B7D
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 18:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDB53302408B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 17:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6D335FF55;
	Fri, 20 Feb 2026 17:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/a4YClo"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F8C35F8C1
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 17:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771608705; cv=none; b=Y9xBY0iqkRD4rMJpRCZD9UgMZKvjZrjrWx+TooAyNz5ANkyQJeFhFeXytDWcpwtuZEJO1p3J7pP3z8XxlxMt3p5AhOWLrWgonELNSoJrVAszu4OGUpiOm2KQI554FqrKxLQfPzLnW7wgjdI9uu+iGS0RXwiHrZAiessyAJ/wli4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771608705; c=relaxed/simple;
	bh=H4zjT+BLKCBWcQS02Fi3hrtt6oqjnk/2YIkK+PPQUB4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JKqGsXo5nCR13Y6+IxK+FwUMjCXHnLuo+fwwwVNdif4WqxPTlbmgA9raQltyJK8ar9zpfYPRl9ux2KnU1bdR8CKHzkbk8bLXgqdiVNYWzw/9LmLKduZgsyalMFZkY4belwbV/fYCSexvx+DhK4ghZJfs9vhnR8apcnHNKCj/sLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/a4YClo; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5673fd077b4so1120664e0c.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 09:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771608703; x=1772213503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2rIh0SOIfZLLJEFPvUCOVpLnOusiQsVKVkKXhuxsaY=;
        b=S/a4YClodykAi5v8H4guWLLvcFvuZWXjXb0Z68kJWF5ne3mHddZ94eSbuWf2g9+Rjj
         CtVkB7UXADnMOVaq/RJ/1Cr7bZd0fSEyna961M6CkHKvUg8EUeO79Ew8tJ1hCR5lUyme
         VyJau8QAQollZo6hPPxgfazvbIZoo72CGtF0fdjN1f3rVoQ1Uejxgg7e8d2QH/myjmCu
         CbuuE4HheKUnx6k1Tjv3OdrO8A6dkK1R0/1gFUViTQOZqdCbI7L0WR7ymw2OpDO5Kth5
         eH+HsS0O/3yEj9uaYGGs29qCd2oCe2o4L/jsjvtXggpqwPIHTHPV5a+31b2iuMs+Mom/
         JPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771608703; x=1772213503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A2rIh0SOIfZLLJEFPvUCOVpLnOusiQsVKVkKXhuxsaY=;
        b=bh9icxhHu/sZUYPihaE6fokss4DaYlBA283XZcI97JGm8gX0CD7qEmYqOzyE6Aw2vx
         /uX33wijDCel9k+DxkNB3iYqLgrs/PxciChSQNBUD7nwJFdW0alXsLIT/IP5WdFt7x7L
         le+Xl9zNDsHklKEteRRjEKaz1Ol76fnaIBnHwATIANymiXJ8DF4b/JLih1XeRir9lDjb
         SToPCkajIRqnDKF9aJMHpC5ud+FO9pVs02haert+wUCzYWZGqj+NWwZ3GpCcM75+38pP
         8PpMZmgInqn9LsGuVZyTBR09x72NqvNfeXiq4EMeZ0lqiBjxhYRLrRbev6gy/mDVtxI6
         mVlA==
X-Gm-Message-State: AOJu0YzjGttnNCXi70GgstjxnHX7qFvdeTgOgjHRWxQoyU1c3B1ggiW9
	FWsviu3syY72kEq9cUZ9TNyaLsbNT9YUVAYPXS+1QlfICo4qYd8omGGcE6S3LQ==
X-Gm-Gg: AZuq6aIYB1AZxiEgA6tv8ojhJUinDHf3nelo3wr8i1zKTYdka6hMp7R2x2x8jQBnKE2
	ns/d+bCFSKiSADKJwE0a7RNhGJXOHLo+jxMaOonyAM/VIVoz+obp2C3FfwrFbMJUyTx2DeOz+sH
	WVEqDKrpdQ5ah6aFucyRVGbWGKJHVWUCZlY/1Kbc7eSIhuxrx6kDRkW4EZdvckSh+Oz6wTwnsYU
	XZQBnFe8BqCT9SpMMyoL53mUuA9I1Uu9IWWmvlRMIt6Rr5cjcJbCHsrS2TbNJl82um4f8vEwSFn
	DpvvKoKgFQoW56LOIr+9uqQXAd5fNR/EMxIh/ol1lsW/qMDzJsYbx1NcHuH5HNyC81RxfF7tGBe
	gHEheqnSre0+eg+TcejUWLzJbAQNbPvvn5uysFV7ng0DLEgVmDv9cF6RkVvWTtXy6bFODOsfT3i
	1PAceGp77LhCDxWnPh3RoHXYDQJrcPxfsgu9SMXDb8KZWMXxABdQIrq//xAWABrLjG3YB2uHjrj
	BwEzC3qpb9Dx89Gxg==
X-Received: by 2002:a05:6122:459a:b0:566:7d83:dfdc with SMTP id 71dfb90a1353d-568e48800ebmr248675e0c.9.1771608699713;
        Fri, 20 Feb 2026 09:31:39 -0800 (PST)
Received: from lvondent-mobl5 ([72.188.211.115])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94da8b3eefdsm77864241.9.2026.02.20.09.31.38
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 09:31:39 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v2 11/12] monitor: Prefix data packets with proper type
Date: Fri, 20 Feb 2026 12:31:15 -0500
Message-ID: <20260220173120.3418666-11-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220173120.3418666-1-luiz.dentz@gmail.com>
References: <20260220173120.3418666-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-19245-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 13776169B7D
X-Rspamd-Action: no action

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This attemps to prefix data packets using conn_type_str so it
properly differentiate BR and LE bearers and CIS from BIS and also
eliminate "Data TX/RX" labels as they are implicit from the direction
marker:

< LE-CIS: Handle 2304 [8/8] SN 15 ...
> LE-ACL: Handle 2048 ...
---
 monitor/packet.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/monitor/packet.c b/monitor/packet.c
index a4930c855144..fbe773ffbdfe 100644
--- a/monitor/packet.c
+++ b/monitor/packet.c
@@ -14155,6 +14155,7 @@ void packet_hci_acldata(struct timeval *tv, struct ucred *cred, uint16_t index,
 	uint16_t handle = le16_to_cpu(hdr->handle);
 	uint16_t dlen = le16_to_cpu(hdr->dlen);
 	uint8_t flags = acl_flags(handle);
+	char label[8];
 	char handle_str[58], extra_str[32];
 	struct packet_conn_data *conn;
 	struct index_buf_pool *pool = &index_list[index].acl;
@@ -14194,9 +14195,13 @@ void packet_hci_acldata(struct timeval *tv, struct ucred *cred, uint16_t index,
 
 	sprintf(extra_str, "flags 0x%2.2x dlen %d", flags, dlen);
 
+	if (conn)
+		sprintf(label, "%s", conn_type_str(conn->type));
+	else
+		sprintf(label, "ACL");
+
 	print_packet(tv, cred, in ? '>' : '<', index, NULL, COLOR_HCI_ACLDATA,
-				in ? "ACL Data RX" : "ACL Data TX",
-						handle_str, extra_str);
+				label, handle_str, extra_str);
 
 	if (!in)
 		packet_enqueue_tx(tv, acl_handle(handle),
@@ -14221,6 +14226,7 @@ void packet_hci_scodata(struct timeval *tv, struct ucred *cred, uint16_t index,
 	const hci_sco_hdr *hdr = data;
 	uint16_t handle = le16_to_cpu(hdr->handle);
 	uint8_t flags = acl_flags(handle);
+	char label[8];
 	char handle_str[42], extra_str[32];
 	struct packet_conn_data *conn;
 
@@ -14256,9 +14262,13 @@ void packet_hci_scodata(struct timeval *tv, struct ucred *cred, uint16_t index,
 
 	sprintf(extra_str, "flags 0x%2.2x dlen %d", flags, hdr->dlen);
 
+	if (conn)
+		sprintf(label, "%s", conn_type_str(conn->type));
+	else
+		sprintf(label, "SCO");
+
 	print_packet(tv, cred, in ? '>' : '<', index, NULL, COLOR_HCI_SCODATA,
-				in ? "SCO Data RX" : "SCO Data TX",
-						handle_str, extra_str);
+				label, handle_str, extra_str);
 
 	if (!in)
 		packet_enqueue_tx(tv, acl_handle(handle),
@@ -14282,6 +14292,7 @@ void packet_hci_isodata(struct timeval *tv, struct ucred *cred, uint16_t index,
 	const struct bt_hci_iso_data_start *start;
 	uint16_t handle = le16_to_cpu(hdr->handle);
 	uint8_t flags = acl_flags(handle);
+	char label[8];
 	char handle_str[56], extra_str[50], ts_str[16] = { 0 };
 	struct index_buf_pool *pool = &index_list[index].iso;
 	struct packet_conn_data *conn;
@@ -14328,9 +14339,13 @@ void packet_hci_isodata(struct timeval *tv, struct ucred *cred, uint16_t index,
 	sprintf(extra_str, "flags 0x%2.2x dlen %u slen %u%s", flags, hdr->dlen,
 							start->slen, ts_str);
 
+	if (conn)
+		sprintf(label, "%s", conn_type_str(conn->type));
+	else
+		sprintf(label, "ISO");
+
 	print_packet(tv, cred, in ? '>' : '<', index, NULL, COLOR_HCI_ISODATA,
-				in ? "ISO Data RX" : "ISO Data TX",
-						handle_str, extra_str);
+				label, handle_str, extra_str);
 
 	if (!in)
 		packet_enqueue_tx(tv, acl_handle(handle),
-- 
2.52.0


