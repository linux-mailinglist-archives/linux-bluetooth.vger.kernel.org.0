Return-Path: <linux-bluetooth+bounces-19272-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDZPCIOMm2li1wMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19272-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 00:08:51 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7715E170B49
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 00:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2E32300D690
	for <lists+linux-bluetooth@lfdr.de>; Sun, 22 Feb 2026 23:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617CB25C818;
	Sun, 22 Feb 2026 23:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=arke.cc header.i=daniele.quasimodo@arke.cc header.b="iJZRAuzX";
	dkim=pass (2048-bit key) header.d=arke.cc header.i=daniele.quasimodo@arke.cc header.b="GBlr6ejF"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from arke.cc (arke.cc [93.95.231.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A33A930
	for <linux-bluetooth@vger.kernel.org>; Sun, 22 Feb 2026 23:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.95.231.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771801725; cv=none; b=TXXJ2ZiWkvTlTwWxABzqW/d3JZP8rHjONTJMJ7GeUM/TT2XblLXm+CtN0YJopXTyiJmsqvlo0qNU2IcefxRYbPLCRiImM9upMFED2N1TlxGrcHP/aKuX8kA6+1qsZa6SSqz/qDXnAIT/Gp7mz/ZVzaGujE3jfZ70Ex7sXkLDuR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771801725; c=relaxed/simple;
	bh=vkU0N3xU4TumOqmY/rf0TMca9R1bXUGud03naZgj67Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pw4iy1xqI8wRZ2bJln5rJMZBLCZCJIv/zBe8AJcPG3uoqSTUyDzKTwpIEpBuTVPOlk2L8qMABU+E40FuxjF0FBiZUlOWBXKha5hsUwqSOoFK65Uww0EJYNfuYn7wrgm1JAoS8hzT4nQHWJBmUI60ZWmnGJBiEZ0uj2VW5HQ2TGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arke.cc; spf=fail smtp.mailfrom=arke.cc; dkim=permerror (0-bit key) header.d=arke.cc header.i=daniele.quasimodo@arke.cc header.b=iJZRAuzX; dkim=pass (2048-bit key) header.d=arke.cc header.i=daniele.quasimodo@arke.cc header.b=GBlr6ejF; arc=none smtp.client-ip=93.95.231.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arke.cc
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=arke.cc
Received: from arke.cc by arke.cc ([93.95.231.48]) via tcp with ESMTPSA id
	J-reXtgMrnked_35Tq1nOg (TLS1.3 TLS_CHACHA20_POLY1305_SHA256)
	23 Feb 2026 00:01:15 +0100
DKIM-Signature: v=1; d=arke.cc; s=2023a; i=daniele.quasimodo@arke.cc;
	a=ed25519-sha256; t=1771801275; x=1772060475; h=From:To:Cc:Bcc:Reply-To:
	References:In-Reply-To:Subject:Date:Message-Id:Content-Type:From:To:Cc:
	References:In-Reply-To:Subject:Date:Message-Id:Content-Type;
	bh=vkU0N3xU4TumOqmY/rf0TMca9R1bXUGud03naZgj67Q=; b=iJZRAuzXtldFOx6jpAv07dlj
	t/7OWU7/pDSmAlKykQCale3DdVGZ3RXIfOGmTGQ97PcPfaIgyWdP5N4JOtGJDA==
DKIM-Signature: v=1; d=arke.cc; s=2023b; i=daniele.quasimodo@arke.cc;
	a=rsa-sha256; t=1771801275; x=1772060475; h=From:To:Cc:Bcc:Reply-To:
	References:In-Reply-To:Subject:Date:Message-Id:Content-Type:From:To:Cc:
	References:In-Reply-To:Subject:Date:Message-Id:Content-Type;
	bh=vkU0N3xU4TumOqmY/rf0TMca9R1bXUGud03naZgj67Q=; b=GBlr6ejFYQvTP7bIe6gHP7Jc
	pbxrgUTf3hOI/5CGTpwEoKW5dwJmyDT0PF42IfEc7moX1ZYlhpCipmkZbsIf0Oqq/4PKDB6Nccu
	UUvsNDWVE+fb0HzUIXbr5eaPOgAp0VMTk67J6WIkVNGj03vy4frvwHorR2Fdpt2SzgUX7LNkour
	wdF0AYy2CIzC3YMr1NPeNsBZc/lPv32bVhe0Sh5qDxIgmojyxxJMZTUDdKRCoojZG3m74iP0/AJ
	rnVzIvsQdkPjZYOIgqlu3ZcQKQ43iZ2MYxy5Hg6S4S6VlGMUNARx2+5z9gN7elPYkhn5zqwpIud
	XHPNZ9HWwJjiZqXRIA==
Authentication-Results: arke.cc;
	auth=pass smtp.mailfrom=daniele.quasimodo@arke.cc
Message-ID: <e8a15eed-d4fb-42e2-ad9d-363cbc80e544@arke.cc>
Date: Mon, 23 Feb 2026 00:01:13 +0100
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btusb: Add support for 2c4e:0115 (Mercusys
 MA530)
To: Edo Akse <edo@akse.cloud>, linux-bluetooth@vger.kernel.org
Cc: marcel@holtmann.org, luiz.dentz@gmail.com
References: <20260214215815.26248-1-edo@akse.cloud>
Content-Language: en-US, it-IT
From: Daniele Quasimodo <daniele.quasimodo@arke.cc>
In-Reply-To: <20260214215815.26248-1-edo@akse.cloud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arke.cc,reject];
	R_DKIM_ALLOW(-0.20)[arke.cc:s=2023a,arke.cc:s=2023b];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19272-lists,linux-bluetooth=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniele.quasimodo@arke.cc,linux-bluetooth@vger.kernel.org];
	DKIM_TRACE(0.00)[arke.cc:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,akse.cloud:email,arke.cc:mid,arke.cc:dkim,arke.cc:email]
X-Rspamd-Queue-Id: 7715E170B49
X-Rspamd-Action: no action

Tested-by: Daniele Quasimodo <daniele.quasimodo@arke.cc>

I can confirm this patch fixes the issue on my Mercusys MA530
(VID:PID 2c4e:0115, RTL8761BU).

Before applying the patch, firmware (rtl8761bu_fw.bin) was not loaded
properly and LE discovery was continuously toggling on and off.

After applying the patch, firmware loads correctly and the device
operates reliably. I tested classic Bluetooth audio as well as BLE
scanning and connections without issues.

Given that this change only adds a USB device ID enabling already
supported hardware, it might also be suitable for stable backporting.

On 14/02/2026 22:57, Edo Akse wrote:
> Add USB ID 2c4e:0115 for the Mercusys MA530 which is a
> Realtek RTL8761BU-based Bluetooth adapter.
>
> Signed-off-by: Edo Akse <edo@akse.cloud>
> ---
>   drivers/bluetooth/btusb.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index fcec8e589e81..a52e05062199 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -802,6 +802,8 @@ static const struct usb_device_id quirks_table[] = {
>   						     BTUSB_WIDEBAND_SPEECH },
>   	{ USB_DEVICE(0x2b89, 0x6275), .driver_info = BTUSB_REALTEK |
>   						     BTUSB_WIDEBAND_SPEECH },
> +	{ USB_DEVICE(0x2c4e, 0x0115), .driver_info = BTUSB_REALTEK |
> +						     BTUSB_WIDEBAND_SPEECH },
>   
>   	/* Additional Realtek 8821AE Bluetooth devices */
>   	{ USB_DEVICE(0x0b05, 0x17dc), .driver_info = BTUSB_REALTEK },

