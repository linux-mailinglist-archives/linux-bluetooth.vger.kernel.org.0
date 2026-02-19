Return-Path: <linux-bluetooth+bounces-19212-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OI75Ie6Zl2mK2QIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19212-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 00:17:02 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EC31637EF
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 00:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48887303E2F2
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 23:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D637D2E6CAB;
	Thu, 19 Feb 2026 23:16:38 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574C82E92BC
	for <linux-bluetooth@vger.kernel.org>; Thu, 19 Feb 2026 23:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771542998; cv=none; b=HGmO+c8Gqgq20KfNHRgMoGdlopSZ9TKvXjmVEBQRR2rQ9RNrUXOzCcqvVJO8fQGVUxj74GiBn2zLP8yLBuQqhru8ET5QOXGZpNGmgOxdETzJWv5zbEhFAlu5kSCb8rtyfodh/3LWbYuTkRsIzU+/j+e+cP0KfyjANrJVcnm+ytQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771542998; c=relaxed/simple;
	bh=gXeQW26jTSQTiyXN17bmGgnqjm5kMoyGJlU5U2LO70w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P2PGkLAaIoC9GVLDb2fevmfVD4FT3MNQtanBts9dOEbYAeq5rec9AATuJWL+a4j7B68loh3jx2P8O/mXexI92w2hxqH7kHw5XM3yRePM8DtmkFQa416WN8gf6YS2kMhHXIUYG9gHPKYYyFAoKwPpG8ZFjOvueB4DcZwzCDFyDh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40f20af93aaso520775fac.1
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 Feb 2026 15:16:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771542996; x=1772147796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2FrHlSkp37yYjUZdmhoLkWWfswktOZSb++6lxqz9IBM=;
        b=oyqcARP0XF5N5JBYU0kujmtAFWz8LGN69yEGFJr5vTSIWR1XCzZbghs6LgZljAlA8p
         inhFWlEuOrfbbaeglaZKW0IiLC0u3wpPMgJ5u7YSOFOETZ5LrMaIZyayZjSLvv0GRrZY
         1ILa3jWNcBdCUZgMa6bA38HANI44WDUyAKtsdwox1SC/bJWnnuk1xAgbeIiEmYEeTav9
         rpj/sazwtM9SQr3/7iAkRIFoyG6CMp+AtMcGIkRoMrjW2lFQpyxR5q5AyKse74w+w186
         EOUPLxXOWc9T6Gle91TA6pQIkIrN3Cz3RT0VpyqL/CCmwPdL4gb2UuSzZhRJcNAhLCpK
         Gvyw==
X-Gm-Message-State: AOJu0YwEtge7cUaE3W2P7pmA6loHP9QFE/Z/weQUlBxlMOVPt5sTaUmT
	7Y02y0rejLBvkW9+wL+yFz/pZtAnBHAY3327/h5Y+FQC6oUIfsDZjSLq
X-Gm-Gg: AZuq6aKQ3skoCReOlVQflGr9lrfJBU7rIyxW/UqJsdGW2CNnBkaYLSJnRa/jGo9ruAd
	0ZvMWV+llG0tkgtlSbLp6vjsi81hz2LUn6/O3b/i3Yiz19rX0NTcdSlRrlU2w4xLiT5beZlKhCu
	nABZD49j02tyaHQ6jFkjwdZNkIRVLbKo+htpyDUdIzOrOJedFPpShAcWFFt1TmfWk9IcGXVKmqj
	WgfzY3Bqb3i06JQGL8Mg4IC4wV7PJVmUyHerWfbldOEWhMzc40yvHRQ8G7/xo7E2Ujxok/70Iu/
	5lVUVIWNL/kswlX0Rx3N6zsZP2Rh/YD4ccS+e6kZIAuR+grfWT4RJFTY8qip5qu9BlQYELFwQVi
	W1gU/96B1pdEbUvBw/9+YoHwP259d6grrLeGnEL7KEHUQo6HI+nXJs1PG5sNQfSNX5pDse+t6NY
	Y6M8MNohVssmfsjQSoiXpbQuyD29+8lNwMhVus49+aU0f4vbA=
X-Received: by 2002:a05:6870:b529:b0:40b:77e0:7cb with SMTP id 586e51a60fabf-40ef3c10326mr11053198fac.19.1771542996041;
        Thu, 19 Feb 2026 15:16:36 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm26719644fac.1.2026.02.19.15.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 15:16:35 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 3/4] Bluetooth: btusb: Add new VID/PID 13d3/3579 for MT7902
Date: Thu, 19 Feb 2026 17:16:23 -0600
Message-ID: <20260219231624.8226-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219231624.8226-1-sean.wang@kernel.org>
References: <20260219231624.8226-1-sean.wang@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-19212-lists,linux-bluetooth=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean.wang@kernel.org,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.942];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mediatek.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 24EC31637EF
X-Rspamd-Action: no action

From: Sean Wang <sean.wang@mediatek.com>

Add VID 13d3 & PID 3633 for MediaTek MT7922 USB Bluetooth chip.

The information in /sys/kernel/debug/usb/devices about the Bluetooth
device is listed as the below.

T:  Bus=01 Lev=01 Prnt=01 Port=09 Cnt=04 Dev#=  7 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=13d3 ProdID=3579 Rev= 1.00
S:  Manufacturer=MediaTek Inc.
S:  Product=Wireless_Device
S:  SerialNumber=000000000
C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
A:  FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
I:  If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us
I:* If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btusb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 247d6aff5e79..c8c50daec967 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -671,7 +671,8 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x13d3, 0x3606), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
-
+	{ USB_DEVICE(0x13d3, 0x3579), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	/* MediaTek MT7922 Bluetooth devices */
 	{ USB_DEVICE(0x13d3, 0x3585), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
-- 
2.43.0


