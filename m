Return-Path: <linux-bluetooth+bounces-19064-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mbEkAz3wkGmRdwEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19064-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sat, 14 Feb 2026 22:59:25 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BEF13DACD
	for <lists+linux-bluetooth@lfdr.de>; Sat, 14 Feb 2026 22:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5807300EF9F
	for <lists+linux-bluetooth@lfdr.de>; Sat, 14 Feb 2026 21:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0712F310764;
	Sat, 14 Feb 2026 21:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=akse-cloud.20230601.gappssmtp.com header.i=@akse-cloud.20230601.gappssmtp.com header.b="Pv9q8ZhZ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3007881AA8
	for <linux-bluetooth@vger.kernel.org>; Sat, 14 Feb 2026 21:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771106359; cv=none; b=fi8mbEdiDDVWcUQS5eX2jOaftrwgQZaPIbvCdzEFbKLq6vfJE7rYvrzyXvTyta2HxQ0Nxs2bCqNkZ2am/tGx9NuISqGE4wpzmH9aaAuh4sE5vvyoDwrgUqQQpdfANcqQSNFnOM8cfwoofrVvVobGbBUR3d+6ULsCqqDDBjEB1e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771106359; c=relaxed/simple;
	bh=il1JW1isX3bcJh/hUsTqZtXKF617LzKy9DS42ZdVadk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iyiuBpfdqbCaHuwzyL/+hacw8/JVvaXkLqwzhxKBOd+1aAvNQSNT+QEnn/2+d3mylxhdnOcN4rhwi0mqTui3MhyrBXCFU0s3Yf9OzalVQIvaiyUfDYDcyfvPAJFx5OqViJFYAHkuzEzeMfuVZH6uC7l9614k+mlHJtAs3GEKwSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=akse.cloud; spf=fail smtp.mailfrom=akse.cloud; dkim=pass (2048-bit key) header.d=akse-cloud.20230601.gappssmtp.com header.i=@akse-cloud.20230601.gappssmtp.com header.b=Pv9q8ZhZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=akse.cloud
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=akse.cloud
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48378e60742so1813375e9.1
        for <linux-bluetooth@vger.kernel.org>; Sat, 14 Feb 2026 13:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=akse-cloud.20230601.gappssmtp.com; s=20230601; t=1771106356; x=1771711156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcRf8oaEbLETHBnqbA5osBetv3j1T02lvrF9O6kZXEg=;
        b=Pv9q8ZhZuCwKm0710i6LZ/gfa1gdhDzwBPbD+nRGxY3jX8E6mYHLeY7n52WyuVwUyG
         2Lg7BXyAGRGke3hk/K1gGtgFO8/+lA1CtFziGZ1z6/5qAQbc5I0550HaTUMRyNHzUOhs
         3PLL3rJoQCv4oUBNVee767ODrqcYBe1bCpzo9ph99fENWmoHyiIEwZ5iNZvP2WkblHkf
         O6KTv6kwaLGF1K0le1adsFoOD4i0/eSXJAMpYgPPHSrqnnM+rrAJXgHbdCov6s8wbXiZ
         twiFW63EckCnPxPAneg3s82g5Fb4UBBm1ea+H3AsrYy4oDeruS2d/RcY0v0yF41/sHwi
         YDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771106356; x=1771711156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcRf8oaEbLETHBnqbA5osBetv3j1T02lvrF9O6kZXEg=;
        b=pOvCEJePQWulVu5W9HEtOrd7tKyNuoMIEXBIAdfp8XjPR77Jomm37Dk1hig9nUg1Me
         lAll7MAMfLUwsZCpcy5lMiZPZSwtZjLQ+NEPJUcEKZx6C6WabahB+W2IzvLGawbA5E7Y
         RlDhzXPhJtX83hcXHsy2kjKlDbjKgdPB6kFCuM7+zQZVW0MPff4eCgC2TCsdwB96T0UO
         Ebv2yWRAtzKqx4FWfRlZ4mpEKocl1Y9P+rOqcKOhcfRDOfjqfzNEGAF8xI7NWniexiyp
         Yovm6W19pilqlF/f+0K7XK1YnBWNMaSm3bKA8Dk1bV6AHhx970CMixDA7zc3EiNjxboA
         JekA==
X-Gm-Message-State: AOJu0Yyi7B4hnoG3AXhji5qu+7oaA1KTjsQBecN1rnu0089ailWmJIvk
	/4KnhWK36Ubs7UOorKalOCx/Go65Trlb8DjM1AdZkmHIH5rs0tREK2QTltxI+dcq4dyzycoOG7j
	uSHXI
X-Gm-Gg: AZuq6aKprZEpaCk2pILl4RZ+CJtYDOjebp4Hghm/bGztWQASfc30H1kRWA2N08/9t2n
	Pa+7jmmwQeqf5pYJjocKPouEqNAlKd8IL6x493TJNFNduO1lCQxQzcF6YBCQDtPTyeZ9o8Q7wS0
	iiy52tgnnc15xzlub+z1BsHLenD7Zwa0YKdtkPXuEJKiTB33JQEWMXqIeYxFdNza+vDuhVFKB5X
	GLubl6vcSPs9fNA/SKCjghniTTfhSMl2vgfVToJyf43eg/4QHoNqzSAdeDzUhb9rr9G0tuRHwpC
	xJgKYkWtNjJRgD9Mw0WZ0/gTOG2JhFTSlhD4e88ZEolks/ClFwGQiDmsGubWGBW6UgLa3i7uZzK
	dEzPW/19P89lh6wBzmncreOfyXCJtFeK37e+2vhQpUNPLN/3M+mDH2xXsBf3CpMAZrGHe0izOgZ
	qaSKIFNQnp
X-Received: by 2002:a05:600c:4746:b0:483:887:6e32 with SMTP id 5b1f17b1804b1-483710519e6mr72634685e9.8.1771106356228;
        Sat, 14 Feb 2026 13:59:16 -0800 (PST)
Received: from coolio ([93.176.190.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4afsm630693895e9.11.2026.02.14.13.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 13:59:15 -0800 (PST)
From: Edo Akse <edo@akse.cloud>
To: linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	Edo Akse <edo@akse.cloud>
Subject: [PATCH] Bluetooth: btusb: Add support for 2c4e:0115 (Mercusys MA530)
Date: Sat, 14 Feb 2026 22:57:39 +0100
Message-ID: <20260214215815.26248-1-edo@akse.cloud>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[akse-cloud.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-19064-lists,linux-bluetooth=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[akse.cloud];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,akse.cloud];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edo@akse.cloud,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[akse-cloud.20230601.gappssmtp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,akse-cloud.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 40BEF13DACD
X-Rspamd-Action: no action

Add USB ID 2c4e:0115 for the Mercusys MA530 which is a
Realtek RTL8761BU-based Bluetooth adapter.

Signed-off-by: Edo Akse <edo@akse.cloud>
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index fcec8e589e81..a52e05062199 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -802,6 +802,8 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x2b89, 0x6275), .driver_info = BTUSB_REALTEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x2c4e, 0x0115), .driver_info = BTUSB_REALTEK |
+						     BTUSB_WIDEBAND_SPEECH },
 
 	/* Additional Realtek 8821AE Bluetooth devices */
 	{ USB_DEVICE(0x0b05, 0x17dc), .driver_info = BTUSB_REALTEK },
-- 
2.51.0


