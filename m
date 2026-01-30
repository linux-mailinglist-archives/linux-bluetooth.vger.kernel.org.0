Return-Path: <linux-bluetooth+bounces-18762-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IRrGqkqfWlcQgIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18762-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 23:03:21 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3CFBEF7B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 23:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 342BC301D4D7
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 22:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E323542E1;
	Fri, 30 Jan 2026 22:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoqAzmdv"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C62354AD2
	for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jan 2026 22:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769810595; cv=none; b=JPtZLyLtmnw9GorwcRRPJ4+ttSYO6/YdrMXbQ2Qs0J9I+/M9f86hIH6UGonO3OuskGE8ImLbQTx+CSMvSKuo/9W2lpZVexR7taVcTIOqYHSSlRmInmIggQVlZ/2RlZiMKRKl27abOQ/NVV6oZtBKtDcxmOs5e6BYTqoMj3ap4Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769810595; c=relaxed/simple;
	bh=SJ3L9suWDavgyRPVmbE0X05M7jLQssFGkVvY8S1rgxY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rz5O0g8TG23CKps2NOOodofv3ZbaZelYt0ccH4gBTsAKrFDsWlPeqI5GAg55BsDlsPLnIAURWcWCctwA3Fj3WFirKvBUwbcg3VevwtFUlL5mQfIn54d94twZUuCL245Iy0xvSjrAk2Nca3WEGUFCG1MCEtn7IrENSrGq8qBFGk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoqAzmdv; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5634feea416so1279473e0c.2
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jan 2026 14:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769810593; x=1770415393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQqX4PlbvX3MdjlYM/n+PoOQhvWQyd4gwNUyg52wW9g=;
        b=EoqAzmdvC9ffA0Hdfcb7baFBKNhsqmnRipgGbRSx+A7FxczExPwwQySjOVTEHCVuJw
         Lq0oqtL+dXqyMIgD6Sd7LWgx/twcX/7M1zmK6Gcd0Xo2546dUpFWEeSYGEChWJE7YAD9
         NQINPrEsYufm//7BCQAYlzHOCEHpoXhBkt70U442VqK05CKg0yftYaN5CV4Yo4bocIuS
         LNQstdmMZlOJ9G8MBeLbKo/L2qUNWOc7HM1ejhN6JQIOh3OJxQl+mHMP7X/BqOlnL7r/
         n8K9Jpv5SOM3jyEsxoxW3+bK2nGW55yjGD2CMSPSHwPwKmidJrKRCf+2liDysMfLbKel
         EUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769810593; x=1770415393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nQqX4PlbvX3MdjlYM/n+PoOQhvWQyd4gwNUyg52wW9g=;
        b=C6FGzQadK5X2H91JBxruxGmpc4TmbUBCbS7ua90W+5f/DWTJA8Oyw2vuWSs9B9nZBS
         SFBMmBz1LzK8XUEr9QNr7sqiHha0cYd8MfBvEIVDkxtazt4YEwvtzMapKXw9mKD3juUv
         rLD/012C4tOS66yFN/R9tG/10C1LbL6yPpDcj0V0Dw3+ymaLQ7Df5vM/VLUGx4d0U2Tr
         vWn4VIfJ6Y3y3rawt6Pd0dRVJvo+BxHXP0eKUjpekq5EW4/3P8B4hKPwA2Lpgfp9Yet1
         RUFxqdFjzidjgKqz36Zy8zLWRvF83zOEE+sudFFAE9bdTgzt4nudL0GA7k9ExWT4186q
         TkUA==
X-Gm-Message-State: AOJu0YyG1sDJi+dIq8J/ExXYbtcOd+UzyPIq/Hi0yusfe+cD7MOs4rTl
	oL336bO8dL4AdMUdMFEanHFX9+ykPdNQxNWkCp1qp5aRlyCD1ad6ii2ss1qd/Q==
X-Gm-Gg: AZuq6aKsA5pgzQ3NEaPi+p3rmGZ2LFX8AVTfoan5tte9oBhkznal7aJ5QyytaQV7GZD
	bGsqiBNwjiVR6RluxIZSXfIJxljF3Bttce5p+rn0QSjqLcWScYZAt6prRqQdnDuq9CMse02BS2a
	AOtvTThy+CUwbKbwB492SAF43kPNDboZe7GconfkepW0cdlZNAhfAlvAKftwTBwip+EMoEKHwsN
	FhBZSwH6AtfkBb4vNeQcGmI+lW/k2RzfAnAmDsUmKYuUToDLjx5iMZdAzFod5z6+uGyjIs/lx0a
	qleP8R4MapZM+hMau4qrYQ8uGxNS/fvsm3rDsnKu5+MP9bLcmmNLJFIt3YeCAqt4CvT1BcDH+DX
	fdsmb99W3APYMuVmSzd2mAA66AkDpXupXvWTQYswj/9PHYGP8RuvLULkhh7iWBDYInPKXHANcno
	dczYenX8EzergDAY2Z87IMoj7pHlXP9NnQWq0LX7oNsUWHJTlSrsbqilELJPyTasjR5h/hZie+j
	biVRg==
X-Received: by 2002:a05:6122:e18a:b0:55b:305b:4e31 with SMTP id 71dfb90a1353d-566a00e40c9mr1415053e0c.17.1769810593018;
        Fri, 30 Jan 2026 14:03:13 -0800 (PST)
Received: from lvondent-mobl5 ([72.188.211.115])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-948723adb7csm2404052241.2.2026.01.30.14.03.12
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 14:03:12 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v3 27/37] doc/org.bluez.GattService: Add Used by reference
Date: Fri, 30 Jan 2026 17:02:18 -0500
Message-ID: <20260130220229.1346261-28-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130220229.1346261-1-luiz.dentz@gmail.com>
References: <20260130220229.1346261-1-luiz.dentz@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-18762-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B3CFBEF7B
X-Rspamd-Action: no action

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Add :Used by: field linking to bluetoothctl-gatt for this interface
exposing GATT service properties.
---
 doc/org.bluez.GattService.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/doc/org.bluez.GattService.rst b/doc/org.bluez.GattService.rst
index 9aba1c166f74..04228b9b3665 100644
--- a/doc/org.bluez.GattService.rst
+++ b/doc/org.bluez.GattService.rst
@@ -31,6 +31,7 @@ Client
 :Service:	org.bluez
 :Interface:	org.bluez.GattService1
 :Object path:	[variable prefix]/{hci0,hci1,...}/dev_{BDADDR}/service#
+:Used by:	**bluetoothctl-gatt(1)**
 
 Server
 ------
-- 
2.52.0


