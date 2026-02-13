Return-Path: <linux-bluetooth+bounces-19014-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aH+jM4HRjmnJFAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19014-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 08:23:45 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3561337F8
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 08:23:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3416304EABD
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 07:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60A42874FF;
	Fri, 13 Feb 2026 07:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO8olS4E"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7918829BD80
	for <linux-bluetooth@vger.kernel.org>; Fri, 13 Feb 2026 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770967363; cv=none; b=So4DJf1XpAc3wpu2+lV/oosxkpanGlmyLoWfLojWXkJnQWU7SdRtPXuSr7G1T5BgoyplOcbJHJRPISx5g+VZvZ1JyLWUbYeTDiaFCuJomFeTOeWyzC405WfxYOTzHT4z2ZpbQ7uP26Nr+CZfLvXpfQmqm+U8YUCmELTh2hdG7Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770967363; c=relaxed/simple;
	bh=vQxdkryUEJ+pArY5kJMAR+7YlXlMsv2XI7L1MiRhw0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nP2l8BRwpvNZXtJMHTliyG/wAvp+Ehs+1Y4wuSzHg9WSgfg81psMvK4I6R5DP+gabKKtHhZQQb7Arr/+18w877tAG+sgXDK2bRqfyFrGPnfMREIoLl1K/pRCimH6oIa9HuSl9VNHmQ+Xm35ZJ40FYKrYhEBfm4Qz0ApwHJyJ1ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO8olS4E; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2baa098ffc6so557036eec.0
        for <linux-bluetooth@vger.kernel.org>; Thu, 12 Feb 2026 23:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770967361; x=1771572161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbsk2agQ8f3m0QH5WZrAhx9x+dI3Pqe/kCYQZSQSePA=;
        b=iO8olS4Egzz5d/LXwrbzV/MvyXGAoOe/CSN3jLD6Qo17e7arkMePTsWghpEOC429l1
         2ojmlPkb/buD6ZssJqAXfb2A+r23eK8p4TpEPGmwTTm5jingzuetoD7Zg0qgoxalCqSy
         tl1RR9Le51ogklDomT+c0XI4MuQnZbQ3A02dnkfJmAcN7W99qm3x6RSy8Pif8n4rWvWd
         nIk048blXiNE3snHIPSSHBPwX10rxkn1TBtcEIZVjdsZrO3rpxjEz3SyjlI2xpkzYog8
         alN1hv+YLHyJ7iD3tJzCQvPe0d8fLiEc6P9ozzgcyE64Aw87Q/3n7ejbzOdUFGw60vP1
         FP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770967361; x=1771572161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nbsk2agQ8f3m0QH5WZrAhx9x+dI3Pqe/kCYQZSQSePA=;
        b=h5QMWhkZSZfqltQthSnKlvHmQ2qKNsFX4g629j7i1x4Es9T9uURgwuSf5dZMdqrZB6
         fi/ZVsrCS+2Oah0DUS/ma7ASCF1wpMb9ZwoeiLXbp+EkxNVXY0eKgHL4nSCYZbefTI3h
         quxhDDZjkUxeYnI9XL6vdUu9evqnPDzHGoa/MA3Cwt6bGcVM0h8d6IOgmR0FIhTl13nK
         fkfK6nkh/rY1WP5JHFbIMxBzKcAigZJB3Ekyy8XQkpegc5MPDK04PQpBuWIBKwrM1r8g
         lm3FbVsg5AlicBMykFfXlHm4dNEEMY1eXqbA8r5FR+0u2DDvnCiQ3QcxtZJRh82wlBAR
         r5Xw==
X-Gm-Message-State: AOJu0YxYn4XVjCauoDREA68Wbbs7QeOKmII24LEMFyVBFMX6o8uiH9c8
	YIe56SBtfkfMy3AvO6rupXingz//7u90kwnR10g25AIWlBtKkSuQsnjvVtprBA==
X-Gm-Gg: AZuq6aJxmd+OuMU8sUf3b018WdMIzdarITwRp+f8/rcla1aEPtUjzDh6lv4/NJtC2+8
	bWEwgYcA6CuIUvOylOExuzf6jyfrV6H2NYtp4DO4cEv+qx5x45VqL0VCK9IpbiqvAcBBcTwzdj5
	/eEDRoPEl4pg9Rxe5+hPCYF0sAVoa+8cCxP5lr4dN6XSVWLhSTO7WWUTVhX9fT9QCWOn1G8Hl53
	Jp+08T8laKkA9VP/JuO9roe0jq+kFWC8Pske3eLlyeVVLvtTysezaOpV8kgPsi7e+awSJbHZjtg
	Pw4HYUwzGUc7aAom6qYR1iYTmIE0q3dJ7ik6C3Y+yYDH4WSCTWFa/H4g8nMu4ufkwQBUVLao+9Z
	IEQkc39g62ckm4CbWqLnD7PPV0hCTA7GuCN+7xhp3iu7cXqtixlJoOBbE4uwy45pDLVQCb/Njkz
	iuafxvkaoXdC+wCK63/ixGdfuZBieukunAWJlerr7lm6znjThTBqk0Y12a4cIGV2Qn1hBrJ4e92
	GHSosZ/9vGqlr12nzb00r7J/Q==
X-Received: by 2002:a05:7300:aca4:b0:2ba:7d5a:a817 with SMTP id 5a478bee46e88-2baba0df10amr535163eec.26.1770967360517;
        Thu, 12 Feb 2026 23:22:40 -0800 (PST)
Received: from kernel.. ([45.232.185.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dcfe6b7sm5898148eec.29.2026.02.12.23.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 23:22:39 -0800 (PST)
From: Maiquel Paiva <maiquelpaiva@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: luiz.dentz@gmail.com,
	gregkh@linuxfoundation.org,
	marcel@holtmann.org,
	stable@vger.kernel.org,
	Maiquel Paiva <maiquelpaiva@gmail.com>
Subject: [PATCH v8 1/1] Bluetooth: mgmt: Fix heap overflow and race condition in mesh handling
Date: Fri, 13 Feb 2026 07:22:05 +0000
Message-ID: <20260213072205.18404-2-maiquelpaiva@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213072205.18404-1-maiquelpaiva@gmail.com>
References: <20260213072205.18404-1-maiquelpaiva@gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,holtmann.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-19014-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maiquelpaiva@gmail.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7C3561337F8
X-Rspamd-Action: no action

This patch addresses two issues in mesh handling:

1. Heap buffer overflow in mgmt_mesh_add:
   The 'len' parameter wasn't being validated against the 'param' size,
   potentially leading to an overflow. Added a check to validate user
   input.

2. Race conditions in mgmt_mesh_add and mgmt_mesh_find:
   These functions modify or traverse the mesh_pending list without
   locking. Used guard(mutex) with the existing mgmt_pending_lock to
   protect the critical sections, as suggested by maintainers.

Fixes: b338d91703fa ("Bluetooth: Implement support for Mesh")
Cc: stable@vger.kernel.org
Signed-off-by: Maiquel Paiva <maiquelpaiva@gmail.com>
---
 net/bluetooth/mgmt_util.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/mgmt_util.c b/net/bluetooth/mgmt_util.c
index aa7b5585cb26..eee4bc05f6e5 100644
--- a/net/bluetooth/mgmt_util.c
+++ b/net/bluetooth/mgmt_util.c
@@ -397,8 +397,7 @@ struct mgmt_mesh_tx *mgmt_mesh_find(struct hci_dev *hdev, u8 handle)
 {
 	struct mgmt_mesh_tx *mesh_tx;
 
-	if (list_empty(&hdev->mesh_pending))
-		return NULL;
+	guard(mutex)(&hdev->mgmt_pending_lock);
 
 	list_for_each_entry(mesh_tx, &hdev->mesh_pending, list) {
 		if (mesh_tx->handle == handle)
@@ -413,10 +412,15 @@ struct mgmt_mesh_tx *mgmt_mesh_add(struct sock *sk, struct hci_dev *hdev,
 {
 	struct mgmt_mesh_tx *mesh_tx;
 
+	if (len > sizeof(mesh_tx->param))
+		return NULL;
+
 	mesh_tx = kzalloc(sizeof(*mesh_tx), GFP_KERNEL);
 	if (!mesh_tx)
 		return NULL;
 
+	guard(mutex)(&hdev->mgmt_pending_lock);
+
 	hdev->mesh_send_ref++;
 	if (!hdev->mesh_send_ref)
 		hdev->mesh_send_ref++;
-- 
2.43.0


