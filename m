Return-Path: <linux-bluetooth+bounces-19316-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G2VM7xBnWkMOAQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19316-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Feb 2026 07:14:20 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C03F18250E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Feb 2026 07:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E41E030927F2
	for <lists+linux-bluetooth@lfdr.de>; Tue, 24 Feb 2026 06:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0007E27587D;
	Tue, 24 Feb 2026 06:13:47 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6B42356BE
	for <linux-bluetooth@vger.kernel.org>; Tue, 24 Feb 2026 06:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771913627; cv=none; b=RwHkvGJ0BKWjQELxnTgtDnfyEZQ47A7/cousZ0OvTezOIz6frofAvinp4CL/Sbgr78SnS8sxCxcQWIbOsl+BSVzf5b4UNB0wFNMEtIbrLKiKuDaOJqlaEfPDpITqV0067Ci7mtlWn6iomIk7Henl5CEHfLTGL1BoHbB3siEIw5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771913627; c=relaxed/simple;
	bh=UP66ZAAJa6BHp/aVMJvzMBc3hktO+sAwJ59yXee9e+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fPPa8K+MyPq5n+6A978AM+j4Y0t3s/lhEauCTezCvFweTpPW2UIJFOlLbJ5xtiRVf0ilFUpGillMslrBTZSVKmKyfAy3oZGhh2Fm8rKPywtv3zC0R8IGt5lrr1mx0ObWCEpQaWtpQ7Y2Elw8O3okUyuRN7PSUkCtxBqICfLU+ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6780761b665so2963106eaf.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 23 Feb 2026 22:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771913625; x=1772518425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfopHsfGlEfdUUn+Z5Ob2uv5rH6VmacISxBMgn7zNc4=;
        b=QIUeXXm2iWs1pG5Qt56KolnnHZNKSYlFjUD+vvLdTl/2UDuuA2rZaFpwbLwkCpa/CV
         xYw9RAwNSKw782WAb8th7gNriFBR56ZR7V+9LJ/Tb3qFKcGbTbhY9tUWba//HxVYYL+4
         4w6Cq/jpAeDExkEo6poS9FWuGnX7CwCAoxLykblez1/Pqu/A8R8wAc1R422A/PfR1eTw
         Cp+zKpGi16/5to+YziexsdUJ2me3msPUOYe2kbdJoGB1K1rgOuymxx3OZo9fttyMCpk9
         RN3DI8bTxTcgulxZFcqIbdNeBdDXj4gFrXMCK/g2hvxWPpwrG/aFaI/YgQyDX4W4zP5J
         eiuQ==
X-Gm-Message-State: AOJu0YxB5sUq2VbLUtMiRm411y4KDdHzvSj1QGsonFiXlivCQTKduyEP
	lrEvE5KeFFcIrNR7GZbfB8UtJUY4LEON4d3suk/CjoOu5ehegkkXKN+U
X-Gm-Gg: AZuq6aLkSsTjBeE7GKUZ5wBBu9G6mmgTPLWFq6l7DxTl3/piQnBbsNvZTGFEQr3c5MY
	MQusMC8lrODIPInu2/R4FfyndCo+psrETglTMZg11Cn3miQHaEl2X13/URf4XzBQSRZ33f2XMjl
	ITijOBGEzTJfbXwf6nw5Ih7+yIPZfgMkGHvSMgdBYOGMqSkOUdIepnap4EKV/Mna7BOHyKW/+o7
	MoC8DUpVGS4IYT/HbHoz51sbW3akg7/xIzJ6kmx0PUGRjyBPaxlw/+evoRiZKffc0pKPcqn7u3q
	i0j9mcHr+RAQBmXSy0hfFRkaN+w77+Xnm39BdOblZumOzS2bBsFnEnP/H1BGZd6JVvfDYBU609u
	JoDON3nPizbgv8u9R2erSGh6U4D0ecQNESoOaLSEaFYdMOo9R7LCWMdOr0wmxFo32Y5NiKWNUeH
	WPD0FtmL3Rn25+gVvUOnS4Js3jZca0P6HxSf20Fe3kLIoYqjazlK9Mly8VbfBYDcI=
X-Received: by 2002:a05:6820:61d:b0:679:95da:9752 with SMTP id 006d021491bc7-679c464670dmr6311208eaf.11.1771913625371;
        Mon, 23 Feb 2026 22:13:45 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:8ac2:4fdd:a742:61b8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679c56dbde9sm7895306eaf.11.2026.02.23.22.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:13:43 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 1/8] mmc: sdio: add MediaTek MT7902 SDIO device ID
Date: Tue, 24 Feb 2026 00:13:18 -0600
Message-ID: <20260224061325.20189-1-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-19316-lists,linux-bluetooth=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean.wang@kernel.org,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.928];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:email]
X-Rspamd-Queue-Id: 7C03F18250E
X-Rspamd-Action: no action

From: Sean Wang <sean.wang@mediatek.com>

Add SDIO device ID (0x790a) for MediaTek MT7902 to sdio_ids.h.

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2:
1. Sort the MT7902 SDIO ID definitions.
2. Add Acked-by from Ulf. Ulf mentioned this should go along with the other
patches, so Ulf not picking this via the mmc tree.
---
 include/linux/mmc/sdio_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mmc/sdio_ids.h b/include/linux/mmc/sdio_ids.h
index 673cbdf43453..dce89c110691 100644
--- a/include/linux/mmc/sdio_ids.h
+++ b/include/linux/mmc/sdio_ids.h
@@ -111,6 +111,7 @@
 #define SDIO_VENDOR_ID_MEDIATEK			0x037a
 #define SDIO_DEVICE_ID_MEDIATEK_MT7663		0x7663
 #define SDIO_DEVICE_ID_MEDIATEK_MT7668		0x7668
+#define SDIO_DEVICE_ID_MEDIATEK_MT7902		0x790a
 #define SDIO_DEVICE_ID_MEDIATEK_MT7961		0x7961
 
 #define SDIO_VENDOR_ID_MICROCHIP_WILC		0x0296
-- 
2.43.0


