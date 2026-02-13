Return-Path: <linux-bluetooth+bounces-19005-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBoANLOVjmm8DAEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19005-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 04:08:35 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B581328EC
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 04:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D815F3033FC9
	for <lists+linux-bluetooth@lfdr.de>; Fri, 13 Feb 2026 03:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B500239E6C;
	Fri, 13 Feb 2026 03:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtSCZ9DA"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B76C26299
	for <linux-bluetooth@vger.kernel.org>; Fri, 13 Feb 2026 03:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770952111; cv=none; b=D8oI8NnieoPva73EwWKqZkTzL3uOWV7eD71rpcQjQC9vBjwRJYTppCahmCrkyZ1tOe+lVT+ZJtC5T1txwLl9Q1D7U3HhWosOUqtjjeeiRvnvODZ4wQHQwNJ95V0xQwzp7QCjq7cVE3utXMp0l63ZKJA55BaTZhvPRRylmu0AFxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770952111; c=relaxed/simple;
	bh=vQxdkryUEJ+pArY5kJMAR+7YlXlMsv2XI7L1MiRhw0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvqaWgVvfNp2b6/F/7ELG66grujx7AVsHduT5Qz1MOoBKfUJeVYg5l4QBPl+A3SRvqKtDnUtBFpcW/ZSAIuVgUA5ji5e/gJuY/omR+dU73SdajyLIQdBllVj4Z7AsgdE9Wx8Xpy+cT8yRZymvcVmSBNp81XiT3p+8CImrmBlRFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtSCZ9DA; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b7da62b487so909080eec.1
        for <linux-bluetooth@vger.kernel.org>; Thu, 12 Feb 2026 19:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770952108; x=1771556908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbsk2agQ8f3m0QH5WZrAhx9x+dI3Pqe/kCYQZSQSePA=;
        b=YtSCZ9DA045THMGepf7V28Fp+wDm/QerM22NuPI7igCAcuj5khUC+EfN7x05pXM3yE
         H1R/SqzNa4bM1Kh2IW1bitfhCZVOoRtuY9u+3YuTFUIxryGYTFzWKCGV0oHiq1rAv5Ic
         z9JtjAdVIUouEEqhDSwBgVBZffj6fdMzp4coHrdIcD2ifi9Zhv1cc1yHsD8tPhGgl+kB
         GN9ZX9iuJfVGBWR3tCJ6aVjdyZKHK1qa4uXwctWb638qWBHdVYKEGNmkt1wPFR3IPQJo
         vJNzWjgfpXVqDnoVpj/LTarNMHwsKhEfzpBTID2sr9hgP+bzwdeLIXxYrMZSanX/6oU9
         IYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770952108; x=1771556908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nbsk2agQ8f3m0QH5WZrAhx9x+dI3Pqe/kCYQZSQSePA=;
        b=xCNA0WOCqhozQfZ9EhrGMh+nPeMvRx81+PbnEHqfEvugSB/F247XMkRzBjVAUynIhB
         e5ZSdLVTHJG7kYYA5B2cZQEySjXCrJRKCzouJTcE2T5cbU1MPqndmImoi+au30kJnFyA
         YzFuASgOci0m94d3maDiGRPmfle8977bunDcT/3HSx6YxUmTLEj4FWfIHxRmtWpnmqpD
         I4JG+r6QNJMezT7aXZ01oi194hWSD+uo4uwWAyhGlI2pLPaJde9t4frHToCcTV2MlhJG
         kzRx9y+I+lD8EuYvOyaM/1BO71quuowBvqBsGZOFfuW42PHSw3VN+W+STMaxi/8uFgsh
         mdvg==
X-Gm-Message-State: AOJu0YyaVZi9Sh0LjMgqdPU/8omeRz4sRAEXgvtIK7Oz3MUa49pMxndp
	MSL1OHhx78TrfyBS9OT60k4nyD568YbwkQ5JrqJP3HAxjVe16tFb5GRb/FUoKw==
X-Gm-Gg: AZuq6aLHZWmRST4PcO+D97rH8ZXjXP9QjaN5cjZmEHwNLRzr9wLJb+SxuMcOl1DNshj
	Qj3vpx4kmTV2FKMo5kXchjxq4JisQDYrmfxaGuKgCdHo1ONGOQHTS1MI1Lo9FCsXNEmsHDcj8lW
	vYme+KreHxlIk0zevMSaO8SPo58a+jZ9qgpKI8ppr74gM1uamYm4Ni7Mu9kNhCG8gqZSrbtuc7v
	2vuD6lzpfe8W/AVAfu+WN6fKJBHrA+v73CpeUgcIOjgOTxc8YKXNEUUipbXrpWTM1syzo/YLRMg
	+lo9as0pA5SiTnwMNWh5l/F3SyCKLH/F1fQDQZd4zeg+d/qDJVY6jMCtBfv1IS5C3iARsyuRAuX
	YdvndlbVkI2kkhC3k56jeNGufKlVlf242ti3FpNZiOwyf7jWothnBN6IlG5HhwoyCcH/SjFpdwO
	+pUjG0n/geVXH5XD5SA2IcrwRNhu7xlNhUBOw95but6geDKXlnLwOp00gNvH6N6K6mWeMMiH6K4
	oLsQ5VDhlHjGE1Cx8Ce5YofVw==
X-Received: by 2002:a05:7300:a984:b0:2b7:b41:bbeb with SMTP id 5a478bee46e88-2babc596a9amr119468eec.43.1770952108127;
        Thu, 12 Feb 2026 19:08:28 -0800 (PST)
Received: from ubuntu.. ([45.232.185.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dcea9b7sm4639377eec.25.2026.02.12.19.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 19:08:27 -0800 (PST)
From: Maiquel Paiva <maiquelpaiva@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: luiz.dentz@gmail.com,
	gregkh@linuxfoundation.org,
	marcel@holtmann.org,
	Maiquel Paiva <maiquelpaiva@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 1/1] Bluetooth: mgmt: Fix heap overflow and race condition in mesh handling
Date: Fri, 13 Feb 2026 03:01:36 +0000
Message-ID: <20260213030136.5997-2-maiquelpaiva@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213030136.5997-1-maiquelpaiva@gmail.com>
References: <20260213030136.5997-1-maiquelpaiva@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,holtmann.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-19005-lists,linux-bluetooth=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 60B581328EC
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


