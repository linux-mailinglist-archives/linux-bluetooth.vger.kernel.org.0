Return-Path: <linux-bluetooth+bounces-19849-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIcHB3GvqWn/CQEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19849-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 05 Mar 2026 17:29:37 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6452156D8
	for <lists+linux-bluetooth@lfdr.de>; Thu, 05 Mar 2026 17:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B6D330351FB
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Mar 2026 16:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCC83A63F0;
	Thu,  5 Mar 2026 16:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jetm.me header.i=@jetm.me header.b="DjcCMZfN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="0Efzlg3o"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B730D37D122
	for <linux-bluetooth@vger.kernel.org>; Thu,  5 Mar 2026 16:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772728173; cv=none; b=rml1a4J11k5SlwojHhz8iXCuiv7ZHnB5r7UZqmrJfJjlWy8V/KbWR4ce7CyEahmMUdq8NOaf67KELJFLzns/nPPP1EqA3jDMqxpzqab/e7Luy/dx8VRaM06SgILG4hF0NoyQyTpRPi8goKdut2FJtYtLMbKqe1MLOkL+PtKYBOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772728173; c=relaxed/simple;
	bh=Opn2/YAzjaOq6sdN9SNTgcn7B72X7DdKsSY16eq765I=;
	h=Content-Type:MIME-Version:From:To:Date:Subject:Cc:In-Reply-To:
	 References:Message-Id; b=MfKpJykXi3cPOaKrUJhMmfwcvYMfDK9NtVpvSmDZxHqAQ396KyP75zzNpvSW0jmOLDhF0Zzo6U5saE9P76caXUGq7OKKBUqxc2cbXDQfwN1+duquoXUFU4d4iltcc+hlhgSMjPQrpSJLFt+6v8fDQx7yd3+CX/tocnJDtTAa/Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jetm.me; spf=pass smtp.mailfrom=jetm.me; dkim=pass (2048-bit key) header.d=jetm.me header.i=@jetm.me header.b=DjcCMZfN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=0Efzlg3o; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jetm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jetm.me
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 287951D001A5
	for <linux-bluetooth@vger.kernel.org>; Thu,  5 Mar 2026 11:29:31 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Thu, 05 Mar 2026 11:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772728171;
	 x=1772814571; bh=K/YqMKZlO7d8DGl4gWEDjv0ziHvJhdIyUwyGRB/MVi8=; b=
	DjcCMZfNsV5ofoILMOXUYcNoYdHxfzCtwatDMbjEtirOiBZdzOB9M/IylG6wPvt+
	tPO6PJerNXdP50DaLJDsW7sbWhttvgT2DW2klS+YVcen1Tp+ShMp8tUPKEGHwUtK
	ncizMrGHFWQFcrR1+qAAYYQRFGr9IqCsdZCl0WgJdPizcAcBO0wBjC5GpHvmn6Xc
	FyXY820PMiDMXLfOf3X5Bfl9fcic5YkpEDDDKRYa8MCfq0uPlBlUNywcvin5wO5G
	AHZuZ0Ga8x9oyK15cLE6U67db4MtWHS5dr33d/o25GrL6QnCp5B/QKbZ4QJ0uC5H
	YsU4dqUnRcZsNVSXobNYWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772728171; x=
	1772814571; bh=K/YqMKZlO7d8DGl4gWEDjv0ziHvJhdIyUwyGRB/MVi8=; b=0
	Efzlg3oH6wDJhYc4vu4AwWRZEH6qe4W0G6I7cf+uTiBRqf1S4YCeK58kMrYrJPXf
	Xv95VnLxq6uZFA/3fJaKtpiIsSes6PubHRO1gj0kdlIb2eyIiiVArtvz9Fq/vqab
	CY1p+chL580TVKIzoq0Zkw0IHjJstBqHMObkl/DEO+1DV8MDMhqv5p0PlN8jDVYK
	snQKraY8faD3dA9ylCV6x0rzF320w6BYIxJGN0Tky5rOJlzihJIK/eFOjqr613zg
	358X5YBxQHCNoUBVwTuR6oinnqxPQAbZMoGRDdFdQTbxa0uPMxazsuFY2QeC/kYq
	ZgE96xhb07h9RnY4+IGeQ==
X-ME-Sender: <xms:aq-paaODyXmpIT6Xj9YUk4PZBuKmIG9R105qwAPN64DTrN-R6wwqVw>
    <xme:aq-paTxS5HYl1nO384W6XgSO06OCqfb4maSSygfavG9UUhdW2HZ1eU8uxbLbclVIP
    FqGdJidZEgn8ZIUx5Od3UBgaGRldlE5sIuwShPqi39V4CJ-myWzPYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvieeikeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegopf
    hokfffucdluddtmdenucfjughrpefotggggffhvfffufevjghfsehtkedttdertdejnecu
    hfhrohhmpeflrghvihgvrhcuvfhirgcuoehflhhoshhssehjvghtmhdrmhgvqeenucggtf
    frrghtthgvrhhnpeetheelfedvteffieffgfekvdehieeuvdefvdfhheeivdelffejudfh
    vdeugeegleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomh
    enucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehflhho
    shhssehjvghtmhdrmhgvpdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehlihhnuhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:a6-paQ_90EqngOjqGcxp5yei3x4Cc9uHjFPcjorM4ZE-KxKnfY75Bg>
    <xmx:a6-paYq6oFKOgyDBAszAuVu6n3vvyQeS8jB76OROKzo08kvsobS8cg>
    <xmx:a6-paS5eZNq3CEMfV4OV9yMHweP1OT7TFH_6iY-jV9OXPWuchv05CA>
    <xmx:a6-paYNabKE1hy3hGoByrY4Om7-Uz8dg1u9QkB3FAhRyxG9W8SyMZA>
    <xmx:a6-pafTgY-rzbg3IsFLGcwSpI2snmOYeeNkkDk5O9WAINwaXVLPNJsbk>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E1A171EA006B; Thu,  5 Mar 2026 11:29:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Javier Tia <floss@jetm.me>
To: linux-bluetooth@vger.kernel.org
Date: Thu, 05 Mar 2026 10:05:45 -0600
Subject: [PATCH 2/2] Bluetooth: btusb: Add USB device IDs for MediaTek MT7927 (MT6639)
Cc: =?utf-8?q?linux-mediatek=40lists=2Einfradead=2Eorg=2C_Marcel_Holtmann_=3Cmarcel=40holtmann=2Eorg=3E=2C_Luiz_Augusto_von_Dentz_=3Cluiz=2Edentz=40gmail=2Ecom=3E=2C_Matthias_Brugger_=3Cmatthias=2Ebgg=40gmail=2Ecom=3E=2C_AngeloGioacchino_Del_Regno_=3Cangelogioacchino=2Edelregno=40collabora=2Ecom=3E=2C_Jean-Fran=C3=A7ois_Marli=C3=A8re_=3Cfreelance=40marliere=2Efr=3E=2C_Paul_Menzel_=3Cpmenzel=40molgen=2Empg=2Ede=3E?=@messagingengine.com
In-Reply-To: <177272816248.352280.12453518046823439297@jetm.me>
References: <177272816248.352280.12453518046823439297@jetm.me>
Message-Id: <20260305162930.E1A171EA006B@mailuser.phl.internal>
X-Rspamd-Queue-Id: 8A6452156D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[jetm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[jetm.me:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,holtmann.org,gmail.com,collabora.com,marliere.fr,molgen.mpg.de,messagingengine.com];
	TAGGED_FROM(0.00)[bounces-19849-lists,linux-bluetooth=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[jetm.me:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[floss@jetm.me,linux-bluetooth@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,jetm.me:dkim,jetm.me:email,messagingengine.com:dkim,mailuser.phl.internal:mid]
X-Rspamd-Action: no action

Add USB device IDs for the Bluetooth interface of the MediaTek MT7927
(Filogic 380) combo WiFi 7 + BT 5.4 module. The BT side uses hardware
variant 0x6639 and connects via USB.

Known devices:
- 0489:e13a - ASUS ROG Crosshair X870E Hero (Foxconn/Hon Hai)
- 0489:e0fa - Lenovo Legion Pro 7 16ARX9 (Foxconn/Hon Hai)
- 0489:e10f - Gigabyte Z790 AORUS MASTER X (Foxconn/Hon Hai)
- 0489:e116 - TP-Link Archer TBE550E PCIe (Foxconn/Hon Hai)
- 13d3:3588 - ASUS X870E-E / ProArt X870E-Creator (IMC/Azurewave)

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221096
Link: https://github.com/openwrt/mt76/issues/927
Assisted-by: Claude Code <noreply@anthropic.com> [claude-opus-4-6]
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/bluetooth/btusb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a5e44887a5b5..d5e990cf8ccd 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -751,6 +751,16 @@ static const struct usb_device_id quirks_table[] = {
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe139), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x0489, 0xe13a), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x0489, 0xe0fa), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x0489, 0xe10f), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x0489, 0xe116), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
+	{ USB_DEVICE(0x13d3, 0x3588), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe14e), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0489, 0xe14f), .driver_info = BTUSB_MEDIATEK |
-- 
2.53.0

