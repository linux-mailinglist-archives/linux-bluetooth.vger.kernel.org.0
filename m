Return-Path: <linux-bluetooth+bounces-18813-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDIPHC1qgmmvTwMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18813-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 03 Feb 2026 22:35:41 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9BEDEE2D
	for <lists+linux-bluetooth@lfdr.de>; Tue, 03 Feb 2026 22:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CA3730BF450
	for <lists+linux-bluetooth@lfdr.de>; Tue,  3 Feb 2026 21:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F2F364EA9;
	Tue,  3 Feb 2026 21:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CdOdwsXW"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E2025DB0D;
	Tue,  3 Feb 2026 21:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770154495; cv=none; b=lYYZstQv7uW25WBaPCAJg+s0BuSyMf8oi2BUQyhuQ/xblv+EfD+6/hNuECDo+adviQduBFKUTfIFMKN7mQQj6F2schcsmZ451pdnb6e2GdbqwWd+2Lj85nPiklOhfELypdGzDY7utyaZ2nJseNFb5mF0fxEXVv8nZOb9KCYfaCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770154495; c=relaxed/simple;
	bh=lkXIEMtijCiroYp61Hral6FLjWFoiOsLqFXBY9t0EvA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mPaLh1ZdhXrdhNDMrdfsVQ920S2f3SZps6dN4grkHtN/Pu0hERh3wA+LNNtNs7q1LhQcBkTyFidccV/mSmVr2KBbp4AJsHSjzWjPz5SNcsq+EI2IXhQhGYlHcvFT7TlMoBdYLtKhlZ1NaZnbyy9upUNHPqTFgf9+ZX6QMblh8iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CdOdwsXW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F28DC116D0;
	Tue,  3 Feb 2026 21:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770154494;
	bh=lkXIEMtijCiroYp61Hral6FLjWFoiOsLqFXBY9t0EvA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CdOdwsXWKjL9K1kqjn/1lIlbctd7BgEz5wb61Ps9kFW7L/zMEOVkjOqRP9tlV988c
	 8PMRA3/TEIp3K0HcDuH7Ppb3AVsC6J7sD+WeTQPoYy19D6Y7/ekEPMBYlSTM2T5+k3
	 lCQAL0RRaIkz+HZXJuMTcifQ9uWr7lzfep2L1gkzqU368i/+jrq+QXewGg7DTl7d9O
	 AKeqc9Uuf4M2XDyD3CBrDGafDDmg2ElBzSp7agolRAYOjYDFaCSpBK5p7rcI0jWQ7e
	 +Yi38HJqqcQBQkzSzk+QANIFn2NpLek9kVWsNZJCXnKiXieyi6XXGh0nEZAWZHnFzx
	 ZqkrboKeUYDgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 16E723808200;
	Tue,  3 Feb 2026 21:34:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND v1] Bluetooth: btusb: MT7922: Add VID/PID 0489/e174
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177015449087.2033762.12254196526643936768.git-patchwork-notify@kernel.org>
Date: Tue, 03 Feb 2026 21:34:50 +0000
References: <20260130061356.2343346-1-chris.lu@mediatek.com>
In-Reply-To: <20260130061356.2343346-1-chris.lu@mediatek.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, will-cy.Lee@mediatek.com, ss.wu@mediatek.com,
 steve.lee@mediatek.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[holtmann.org,gmail.com,mediatek.com,vger.kernel.org,lists.infradead.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-18813-lists,linux-bluetooth=lfdr.de,bluetooth];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: DC9BEDEE2D
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 30 Jan 2026 14:13:56 +0800 you wrote:
> Add VID 0489 & PID e174 for MediaTek MT7922 USB Bluetooth chip.
> 
> The information in /sys/kernel/debug/usb/devices about the Bluetooth
> device is listed as the below.
> 
> T:  Bus=06 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=0489 ProdID=e174 Rev= 1.00
> S:  Manufacturer=MediaTek Inc.
> S:  Product=Wireless_Device
> S:  SerialNumber=000000000
> C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
> A:  FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
> I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
> I:  If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
> E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us
> I:* If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
> E:  Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us
> 
> [...]

Here is the summary with links:
  - [RESEND,v1] Bluetooth: btusb: MT7922: Add VID/PID 0489/e174
    https://git.kernel.org/bluetooth/bluetooth-next/c/ba96a6fc642a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



