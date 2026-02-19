Return-Path: <linux-bluetooth+bounces-19210-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPIOB9mZl2mK2QIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19210-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 00:16:41 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 300F61637D2
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 00:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B9F633007A6F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 23:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC732E7648;
	Thu, 19 Feb 2026 23:16:35 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FFC72631
	for <linux-bluetooth@vger.kernel.org>; Thu, 19 Feb 2026 23:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771542995; cv=none; b=Ai+yK7bgzakD/Ko5gsJ3jmAPYLzjnG7t39X23oqn1KwEkdpVgvjA36AsPbTDQHfYccJL06xPj0FEnYUp+USCKqlTMGiIQoAZz7ZSs1smVQUXVWMLA1mWbk4hT2LKQLouxVq2Sxg3v2DYlrfG+hHdvExk1df/zE130Z17do9GEps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771542995; c=relaxed/simple;
	bh=4EJuWggC5ynHFxILfFhxbh5SNzmvaoGDjGWGAhL/olg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WvIvGZDcCCoJoMo2Jz/6PCR6BSZ12pXtRFCrrVFrse/u6TZLR+L6Uo/gBVCJpGsJrzCpqAfRjnTb9kCYIziKTlOd9a1Rxs4syid3uJ77zAiblVxV2kMBRKP21PeGAAntnfd2punWCZ/dxrtHitBARNmVRVRM83D+alqrRZvWjaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-40427db1300so880278fac.0
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 Feb 2026 15:16:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771542993; x=1772147793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOpRViDdy95oUvtjIbD1yNnLGcXCFi8ZfYmxd9/IW/Q=;
        b=mmDKjrTFd4DWqSiEEtqv1bhLEU0RKDgEBfm05SU55wDUN0+W2kbDbHdU7WqNEhk/56
         6C0yI7Fla/pc4GHMUEURMDYiwMZhv6a2lL8SHtAwJua94k2AmPSaK9abydGFpLWHvhDd
         4CMYLV1du1KNJEhn1nyzZb+nFNQF7d6/0mzstepfcgvJNgFbIQyseqIgVNN05/d+1jND
         vUWPlfMDvBmH3XUS0rbGxMhKAlWDFctKyr49+INOMz6g0EzODWgUbNVoxZVfkvTD7vFW
         mz1z8Ee9QhTM1GEkEXKOBdOC2p/3UJZjrpnZcTCoOoscjT8HPhbKHRnMczfNIBuY4hTe
         LGTQ==
X-Gm-Message-State: AOJu0YxeEEIDQc0jot7nkF5SinypWHRw15rdDkWSI73VwDlXWBDj5n4d
	bhEU1iPGNzMB5+HuUJObDUJDpaYaLvGXtjaIo5sS9qUpUMydIOVPVKy1
X-Gm-Gg: AZuq6aInzVdLGAyB/QUKGUIcFGjnD4gfDMKo9j1qFMOS9KQQ/qehDBuOqZkqPorVZn2
	qAjc7JNx7UCHzYTCfNC1TVXTvi96DZMRmiZpXGixsq95CnuzrbitsoLAWDTGZdr0hvuFUZL4CEM
	zSxalE55MvhNuGuht7El4GIZbIQDhA7HwOSjC7j7SMELzJR1ItBxPNs63NsbkbuBXIUm/HLYi46
	0oPu/1QSZj73NhO7UIy0dl9X1tzVp+TmAWUhT84uSul5Jm/+H9z9B6nu0JQpCdd6ks77xwVfc4v
	+D+tN+Lzxpt2rTw0mYGBJZ6mWX163Q5oa/7kprvNBtzOAHuh8SGr4sQMInLHA+pNX4gBPfH+D5W
	BYl4lShPCPJ+gccvhhMeAgIWIanwOrqRGSh9iC0MVrQ01mbZ8iB7Lv/AyNRrr+LuEh/1gs8INZd
	CBjRdhqUsH/yoRrkTawvoGsmCa0Xc6C5Tfmdp72VJ+xr1xxJ8=
X-Received: by 2002:a05:6870:1405:b0:40e:9550:3242 with SMTP id 586e51a60fabf-40eeea800famr13275159fac.16.1771542992946;
        Thu, 19 Feb 2026 15:16:32 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm26719644fac.1.2026.02.19.15.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 15:16:32 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 1/4] mmc: sdio: add MediaTek MT7902 SDIO device ID
Date: Thu, 19 Feb 2026 17:16:21 -0600
Message-ID: <20260219231624.8226-1-sean.wang@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[holtmann.org,gmail.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-19210-lists,linux-bluetooth=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean.wang@kernel.org,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.933];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mediatek.com:email]
X-Rspamd-Queue-Id: 300F61637D2
X-Rspamd-Action: no action

From: Sean Wang <sean.wang@mediatek.com>

Add SDIO device ID (0x790a) for MediaTek MT7902 to sdio_ids.h.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 include/linux/mmc/sdio_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mmc/sdio_ids.h b/include/linux/mmc/sdio_ids.h
index 673cbdf43453..97cc834fb3d5 100644
--- a/include/linux/mmc/sdio_ids.h
+++ b/include/linux/mmc/sdio_ids.h
@@ -112,6 +112,7 @@
 #define SDIO_DEVICE_ID_MEDIATEK_MT7663		0x7663
 #define SDIO_DEVICE_ID_MEDIATEK_MT7668		0x7668
 #define SDIO_DEVICE_ID_MEDIATEK_MT7961		0x7961
+#define SDIO_DEVICE_ID_MEDIATEK_MT7902		0x790a
 
 #define SDIO_VENDOR_ID_MICROCHIP_WILC		0x0296
 #define SDIO_DEVICE_ID_MICROCHIP_WILC1000	0x5347
-- 
2.43.0


