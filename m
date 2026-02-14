Return-Path: <linux-bluetooth+bounces-19045-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id voU6LhQykGkpWwEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19045-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sat, 14 Feb 2026 09:28:04 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A38113B64B
	for <lists+linux-bluetooth@lfdr.de>; Sat, 14 Feb 2026 09:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0497E30158BB
	for <lists+linux-bluetooth@lfdr.de>; Sat, 14 Feb 2026 08:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B682D780E;
	Sat, 14 Feb 2026 08:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDKrXcX7"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE4078F3A
	for <linux-bluetooth@vger.kernel.org>; Sat, 14 Feb 2026 08:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771057677; cv=none; b=EmLM8k3mQ20lqOXZEV9+Y+kSnGHDT+dewPqVH6SLwnfY6viBEp5SeG4gxAgDj7GVj33c/V8sqrcQrW11XHznUjcSp84sSG7foYtCqmVHmp6dknwYObWIaLPo3HmraiTnJYZvIRi9BhleWa+LoUtNuu2mSshbxoZGhE6HX+OQ9Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771057677; c=relaxed/simple;
	bh=Si3em+nvzCIs0LBRP1SCMieVS7G4H5XtyBUi/QahG0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPR9eNcTaW+pJ4N+J1+9PFH2ph2IXg28eYQJya2BU8JP2B+DjGT+toXlUB7t+pRcOeEJ0NERJQZ5YTMIrpRcSPqPLrnFNq5FX/4n6ef5SuDnSWyuaSXK3hpgOa+PodmW1S2CRj79rrVcjFCmKwLcfRX8bPP4WWau9vt6cPcB2nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDKrXcX7; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a7b47a5460so21029805ad.1
        for <linux-bluetooth@vger.kernel.org>; Sat, 14 Feb 2026 00:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771057675; x=1771662475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OJhZ6X3qHQLlGKjG9LB5k56TNXFVKGNDz+IqQMuGJ24=;
        b=BDKrXcX74OZ27/EAbApVhz3yL8yyCtgTuN8iwY83FZk9zmGEPtrKbe4PVvMiiSNJyQ
         tvNQtA9+nan4Nkr1hZ3HJ0nCL6IXc5xC9CZxByMmZ8yDBLp2xKKyhVM9IMKBphVyz0Zl
         b5brSA6KKs3bMxB6vEtVE6Ut/6oKZ5EPpyNIeHpKnwLVEjpCIhQCJJyUhFU7lRrv1uIm
         63RQnDaN2diYhM21oSBzqjMLk770zY5XH44yueLRsBuNO8MM9xUXHeiwmXMb8pt+sN9d
         le5UcrtkMgVYLPxz85rv0W3W5UbKUCD3zs9XaT/pWvJcVwFi4+xHjZ/SrTTBxlzB+5ay
         appg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771057675; x=1771662475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJhZ6X3qHQLlGKjG9LB5k56TNXFVKGNDz+IqQMuGJ24=;
        b=cPaEGNXu86jQ9814LMWmCjhCai7wLCaOS7pCxHgZpR8Au2q9/Jq6Xn2KnCfk6fmxLn
         EoS/aQKzhgAs+lVsewfWnu2RRm0vhz0LwtRzjCQx7aPIz1KCpaSD6kDZOFwYus61kIvt
         Qyf6VAEy9a9wspe9Kzgyr2URLE1ci4YbAEElGZdAesY+wxSSBIF0omX2j41bW/HqSulw
         Ag0blfj33OqYEl/KbqFQmT0cQ67J/yIse039Ow5Ru1iKBEE3szDaQP8qV4HVNvDcaQiI
         M9ox99XUKSUCyhC51/vlttpPFyWHvdG7CbF2lsZzcJiAhZjZ6C3QZQQmhD26MSNqkns8
         sVdw==
X-Forwarded-Encrypted: i=1; AJvYcCXX+piGOmK61cpJQlQFEJQAte+Ufpn6sdGf7vRith/SnhYgognSUaWJZ6zWA2Lrsf0bIxyc5541fo/cpiGtvQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6jD11r6iaQQmxZgX4/n5viY0I4jmqUgLxYk7HyKyowGPj/srD
	R+ygQv74FRiZbNVtHQTMw9QWzY5qGyCUdQKuGuagrAe7PqOftYyI2k6J
X-Gm-Gg: AZuq6aIamC5tY+sV2pa3uHmEdIDf+QMXvRQeEBEUXpYxzy5IEJ78oJ+SXktoB2F6rI6
	0vb08WmcqJza5pcL7vo81fObbyHogsl7mr+dc4t9yMDDhR7MwHaoLP7wonItcI9B/RuVvkPEu+D
	1YgtZPDB3Awja6MIB2dJweqgSVm4eGhJcjDaTB58+v8JTKCWGXRnOESYeAA9o19p9kkOZJagyOj
	5MnjzxqP/9K0rg3vbExtCJ6WHmeGGB8mryfLpWbY/mP4WpkcQkxb2vLNlSYxglwRzkiCSvGeXg5
	VllygLT0YFjGQ8qGIevd1nqgp96c/noxmdURnNy/BnHyfRIYvTDWz0DpnG1ASaaoaG8vr7HVFRX
	BRwOUl/bXxto+9boDNreuX/NuUan2646JAnzQLBOMZ9dHxGAxjCbCIkKJHXixEXwKx+3Qws5CMI
	RU66Qitufa1MPAECeAw6/bHJssewbKU93vgERP/wejDQC9edNs
X-Received: by 2002:a17:902:f547:b0:2aa:d5b1:194f with SMTP id d9443c01a7336-2acba495a44mr28702715ad.30.1771057675271;
        Sat, 14 Feb 2026 00:27:55 -0800 (PST)
Received: from kush-pc.lan ([157.48.94.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5d3asm13412975ad.51.2026.02.14.00.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 00:27:54 -0800 (PST)
From: OnlineLearningTutorials <kush.kulshrestha5@gmail.com>
X-Google-Original-From: OnlineLearningTutorials <kush.kulshrestha.5@gmail.com>
To: luiz.dentz@gmail.com,
	marcel@holtmann.org
Cc: kush.kulshrestha.5@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Bluetooth: btusb: Add support for MediaTek MT7902
Date: Sat, 14 Feb 2026 13:57:38 +0530
Message-ID: <20260214082738.139047-1-kush.kulshrestha.5@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19045-lists,linux-bluetooth=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_TO(0.00)[gmail.com,holtmann.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[kushkulshrestha5@gmail.com,linux-bluetooth@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2A38113B64B
X-Rspamd-Action: no action

This patch adds USB IDs for the AzureWave/MediaTek MT7902 Bluetooth
module.
The device IDs included are:
- 13d3:3579
- 13d3:3580
- 13d3:3594
- 13d3:3596

Signed-off-by: OnlineLearningTutorials <kush.kulshrestha.5@gmail.com>
---
 drivers/bluetooth/btmtk.c |  1 +
 drivers/bluetooth/btusb.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index a8c520dc09e1..b793947dd920 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1323,6 +1323,7 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 	case 0x7668:
 		fwname = FIRMWARE_MT7668;
 		break;
+	case 0x7902:
 	case 0x7922:
 	case 0x7925:
 	case 0x7961:
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index fcec8e589e81..13a2aa13b9f4 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -629,6 +629,16 @@ static const struct usb_device_id quirks_table[] = {
 	/* Additional MediaTek MT7668 Bluetooth devices */
 	{ USB_DEVICE(0x043e, 0x3109), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+
+	/* Additional MediaTek MT7902 Bluetooth devices */
+	{ USB_DEVICE(0x13d3, 0x3579), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3580), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3594), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3596), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 
 	/* Additional MediaTek MT7920 Bluetooth devices */
 	{ USB_DEVICE(0x0489, 0xe134), .driver_info = BTUSB_MEDIATEK |
-- 
2.51.0


