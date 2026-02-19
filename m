Return-Path: <linux-bluetooth+bounces-19204-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rZKqCAtil2mCxgIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19204-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 20:18:35 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 224FE161E40
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 20:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 110453009804
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 Feb 2026 19:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCE62F3C19;
	Thu, 19 Feb 2026 19:18:27 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B04B2D24B7;
	Thu, 19 Feb 2026 19:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771528706; cv=none; b=L2Ce4+q9Ra5i/2OA5gCUVLTUOBEdVsHzduBCUIp0sF2dtJ2azR8JZZi0x7sUWT7Kn7J/nNP7F1JOaowJPNdZjCQeo6cxvMajDif1PINlrqDxAJvfu/DUu/Rrz6xlBY1aFxZPqA6y4ByiJF41rgp+R84qFoblnUs/UyO53cY49hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771528706; c=relaxed/simple;
	bh=IiotpZ8cjTMXrxd6uUKlEn/c66zaQeFfNmZYG5E/Bpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rdsCzzQHXjMkCrBdpe/RYGHWx9fgIhauCwTow2uL37U6+qhvf0MND+gI8PSiQHIZoqOMPRRQXp5XTP/ouiMbLtBWOVFJpTwdTA4BfjEy0B/+XzKvRSk2ssvqORVVKM5nZOUhqPWG/71AP9Qe4iknbSUTDsV89Yr3//3ELtQO5y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [10.55.231.83] (unknown [46.189.28.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 1B2CF4C2CA0D00;
	Thu, 19 Feb 2026 20:17:54 +0100 (CET)
Message-ID: <1f71c72b-32c5-459f-bec2-4f2d58ed5569@molgen.mpg.de>
Date: Thu, 19 Feb 2026 20:17:52 +0100
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btusb: Add Lite-On 04ca:3807 for MediaTek
 MT7921
To: Dylan Eray <dylan.eray6@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260219191102.64722-1-dylan.eray6@gmail.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20260219191102.64722-1-dylan.eray6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-19204-lists,linux-bluetooth=lfdr.de];
	DMARC_NA(0.00)[mpg.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.954];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pmenzel@molgen.mpg.de,linux-bluetooth@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mpg.de:email]
X-Rspamd-Queue-Id: 224FE161E40
X-Rspamd-Action: no action

Dear Dylan,


Thank you for your patch.

Am 19.02.26 um 20:11 schrieb Dylan Eray:
> Add USB device ID (04ca:3807) for a Lite-On Wireless_Device containing
> a MediaTek MT7921 (MT7920) Bluetooth chipset found in Acer laptops.
> 
> Without this entry, btusb binds via the generic USB class-based wildcard
> match but never sets the BTUSB_MEDIATEK flag. This means btmtk never
> triggers firmware loading, and the driver sends a raw HCI Reset that
> the uninitialized chip cannot respond to, resulting in:
> 
>    Bluetooth: hci0: Opcode 0x0c03 failed: -110

It’s common to add

> The information in /sys/kernel/debug/usb/devices about the Bluetooth 
> device is listed as the below:

and paste the relevant output into the commit message.

> Signed-off-by: Dylan Eray <dylan.eray6@gmail.com>
> ---
>   drivers/bluetooth/btusb.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index fcec8e5..fd637cf 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -705,6 +705,8 @@ static const struct usb_device_id quirks_table[] = {
>   						     BTUSB_WIDEBAND_SPEECH },
>   	{ USB_DEVICE(0x04ca, 0x3804), .driver_info = BTUSB_MEDIATEK |
>   						     BTUSB_WIDEBAND_SPEECH },
> +	{ USB_DEVICE(0x04ca, 0x3807), .driver_info = BTUSB_MEDIATEK |
> +						     BTUSB_WIDEBAND_SPEECH },
>   	{ USB_DEVICE(0x04ca, 0x38e4), .driver_info = BTUSB_MEDIATEK |
>   						     BTUSB_WIDEBAND_SPEECH },
>   	{ USB_DEVICE(0x13d3, 0x3568), .driver_info = BTUSB_MEDIATEK |

The diff looks good.

With the changes above, feel free to add:

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

