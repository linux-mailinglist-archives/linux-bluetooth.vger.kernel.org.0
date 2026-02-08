Return-Path: <linux-bluetooth+bounces-18857-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJK/AbMyiGnTkwQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18857-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sun, 08 Feb 2026 07:52:35 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DCF1080A6
	for <lists+linux-bluetooth@lfdr.de>; Sun, 08 Feb 2026 07:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D23A301727D
	for <lists+linux-bluetooth@lfdr.de>; Sun,  8 Feb 2026 06:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09471F0991;
	Sun,  8 Feb 2026 06:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxRCvF2f"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3402C0296
	for <linux-bluetooth@vger.kernel.org>; Sun,  8 Feb 2026 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770533540; cv=none; b=sf419rpp9G2lMb4Y+CGEdwDUTyaTmdGcyoG0nW9ctVe3Th+iwpOAhMcW/d920TpTqlsS5AaER4WTeZpdAEnv3zvXPfofJtb/iRavFZKQ5HW7TATPgNID1MvbZY9wMG6ohLLjt1KGjMi5U9LkFr7qxZXNVWo9EBfpssQWzECna3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770533540; c=relaxed/simple;
	bh=9VFIjPBxwoGRGSoXqSlyljliNegIdwkaX2nY9SFEty4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1bKPF1z4n/knwAde2IrjL/+9U33zwRZ6oD3XNcWFqInife+7k547/BHb8ajucLdF8gnAOIk7m/6AlnZpk7nYBTnAjiKmdiXYDKWSc05yDIGxJZ8CKffvFwQ4fddbf1xMj8SHysINDqpwoc+fzypqsx35r8za9pDOeq6AunM9eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxRCvF2f; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b81ebac5d6so3998220eec.1
        for <linux-bluetooth@vger.kernel.org>; Sat, 07 Feb 2026 22:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770533539; x=1771138339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dReEHVsMABf9Kt8QZMUjOuTlIWBQGFjQqBnTmgC5NHI=;
        b=mxRCvF2frkEhm5B2vnRto+de6ugUr2wR5kWWQWF6mDVI1cbpr4rV2zGUxceHeGnOHn
         NVzv/uM37Ag1CT8o2DfWo1a9mCNQ9vFLoCbB7DzPS3tWXPZ2/62N3ZRubdFCu/8XDkPB
         h4d3WXqzFLrgKuladSLOCDg0BcPMFNOfnc33o1GMpuqs4V8iQGWtK9Rm+5wj0bedus6x
         r1yiSvvdjDAL4n35Y+b91ndOjB5DfPeXNfd73Hi7ekkGJIUXo1liKSyvdh3/ZOg+1GHJ
         atPHuEADBJsRSYtZ8EUgnAgQBB8D8TR7n/MjYMi07K0tPfbTApb0SyIft7XT4c9I6XXY
         HhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770533539; x=1771138339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dReEHVsMABf9Kt8QZMUjOuTlIWBQGFjQqBnTmgC5NHI=;
        b=J8cA3DbDNh0l4/ZLTTKVXP7HnPzOmAzON1Ap7wXLbk3ZThJbgBt46ImELpiCFHN6n1
         T+yEb+ngYwyvXHMNPdmK1bc0qkwsCTCNO6MoKaG/n0HHKynTkFwzcc8XsDAWvgyqbXIa
         YhU+Kvm5aM6C8LEICnaR45PFaLYPdVTWnYgESOEVvdz6UilYP7e74a8h5VsfVlM50qAy
         A7lL5TKsdxiDkMhObM357f/kflTF+4gAYo/ruK2RxyvXkeLZal5wA9HGojG/dgbdqeur
         xRKdAXlEFpL1r8sNBB10v4HWEN88zqSYMUib8fS7zRe6Q9ZcFS3c6sG8M3V3ujya3lE2
         tmcQ==
X-Gm-Message-State: AOJu0YwuPQhtzYD2seLEV20HB+1QFPmegtE9bQ0SkPwwlA2jbq7DfjGG
	JA4yQJlSCjKjzunN6NqJCgvrj8cnyN31Qt6zx3uVSvqqFt3qcz00WbxQOdDlfw==
X-Gm-Gg: AZuq6aL9WxZXLpWta0y1/BZlwXDzV4tVXSRPUR/QRspMMlElIG40LjTORNVM8DgCcNg
	TkZ/5F4mF9j0kNU//++8If+joRJ/2hRhI8Pz91iwG8YrrZXHtxLcy2EalOxbaDcD7+3XedBgyrx
	T4XRu6g6tfqiqfiOylCG1qcU1X8DbV2p3fTcDPYhDvTZoAh6Nj8a9x6gbK0pOFKZ0WZ9MGluchi
	KyZdFLjc0KUBy9cDFRv32lRPrCYKTe7a5F/5tNTooT/Rf+pih9AtZoV1FFZq27pSHzuMvf+OuKL
	J3InL1X/Y5adQt7VNdohjrAM0eS3YlNSNJ9YA4STxBV/9Bpl7QtWjIG8m5nanHeYB1l9mxRKKmM
	ymmdN9shdde67Ry0nBZWUaHqQkhO+JfmyK5PzPO21cGU0u4GuWy6ViVZK/Du7NVUF9zjbC+Ao73
	dL1RvcidyIv8eOlkCQ/ra0QEk9R0i74LpJXzmZfnisV92scQlAriuvTt+3MUO7RmhogyWP
X-Received: by 2002:a05:7022:6293:b0:11f:2c69:2d with SMTP id a92af1059eb24-127040740e6mr3812571c88.45.1770533539112;
        Sat, 07 Feb 2026 22:52:19 -0800 (PST)
Received: from binary.. ([177.39.58.68])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e5460sm5673025c88.6.2026.02.07.22.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 22:52:18 -0800 (PST)
From: Maiquel Paiva <maiquelpaiva@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: luiz.dentz@gmail.com,
	gregkh@linuxfoundation.org,
	marcel@holtmann.org,
	Maiquel Paiva <maiquelpaiva@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] Bluetooth: mgmt: Fix race conditions in mesh handling
Date: Sun,  8 Feb 2026 06:49:50 +0000
Message-ID: <20260208064951.41392-3-maiquelpaiva@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260208064951.41392-1-maiquelpaiva@gmail.com>
References: <20260208064951.41392-1-maiquelpaiva@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,holtmann.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-18857-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maiquelpaiva@gmail.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 98DCF1080A6
X-Rspamd-Action: no action

The functions mgmt_mesh_add and mgmt_mesh_find modify or traverse the
mesh_pending list without locking, leading to potential race conditions
and list corruption.

Use guard(mutex) with hdev->mgmt_pending_lock to protect the critical
sections. This ensures atomic access to the list and reference counter,
preventing the race conditions.

Fixes: b338d91703fa ("Bluetooth: Implement support for Mesh")
Cc: stable@vger.kernel.org
Signed-off-by: Maiquel Paiva <maiquelpaiva@gmail.com>
---
 net/bluetooth/mgmt_util.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/mgmt_util.c b/net/bluetooth/mgmt_util.c
index bdce52363332..3c822d5e1f8b 100644
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
@@ -420,6 +419,8 @@ struct mgmt_mesh_tx *mgmt_mesh_add(struct sock *sk, struct hci_dev *hdev,
 	if (!mesh_tx)
 		return NULL;
 
+	guard(mutex)(&hdev->mgmt_pending_lock);
+
 	hdev->mesh_send_ref++;
 	if (!hdev->mesh_send_ref)
 		hdev->mesh_send_ref++;
-- 
2.43.0


