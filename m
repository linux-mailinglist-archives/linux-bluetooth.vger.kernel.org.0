Return-Path: <linux-bluetooth+bounces-18269-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Nd7Mt3ob2lhUQAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18269-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 21:43:09 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1A24B7F9
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 21:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 679A666D508
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 18:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C913624B5;
	Tue, 20 Jan 2026 18:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHuU+uOo"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7A7425CD8
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 18:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768933209; cv=none; b=A9XB5nVElDXwv1wvq+dyptWyyctrbxi3n5Q7OKgvtvV0hVHgDZUISnoMuEwsglSdX5295BKX7V4bkBxXS/MvCa1J35kGdf+8FqwZk5q7JZoFHReblTsktc3dlMHfdC0P3ft5LeS7jLvEgojK+63QtYV1r0H6ABwg4q3FyZpREZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768933209; c=relaxed/simple;
	bh=RsgXW3tJswy7chhCCNL2lZeeC6gBNa3UG0daUFtQgik=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cdLB/nk0b46bJIynk+Csu+6CFG9yAShCsR+zITru2jpXG712sEGrc9Hs9pmOkudPXoyXI3GbGTBAVmFNvbg2kwdLfcau771NSEv/04U5ggYkMllxwuA6aC+OyxQxbr4KH31yMEqksEGw8YLYD1WUDcMrF4XRnxSH6wwt0vUVdoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHuU+uOo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DECC16AAE;
	Tue, 20 Jan 2026 18:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768933208;
	bh=RsgXW3tJswy7chhCCNL2lZeeC6gBNa3UG0daUFtQgik=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tHuU+uOomsHBDszl5GpZjsib0k+nrvx908zH+U+BD3sVmV1AZg07pTxw1Uq27GBOg
	 SfMgJprvU9Rrxc9aZEahaS89d8IvV2CLVatsN//QLQISYLTO5araA4z2dmPwnG0h1c
	 HmOPdNCcQYgC/T+QMKfHWJlGKw/4U8vqbVYk++56NC5yH1rjdLRUp71wkH+savYmPm
	 BbKnoSZRGwdAVHYW0VMHHXbLVHHJ6lw+ZFgQAAN8AR9C7pTe45UjL/SweAvdmpL3E4
	 6P8gyHWRvpiO3kxAePELTzioK/4OHEmgUxLn6xffBq4a6GUSC2jFH7VPuEvNt76qge
	 Bw1g9X7FLMQOQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8BB293810935;
	Tue, 20 Jan 2026 18:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btusb: Add new VID/PID for RTL8852CE
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176893320634.555371.5470832564426662145.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jan 2026 18:20:06 +0000
References: <20260114040335.118108-1-w27@sorz.org>
In-Reply-To: <20260114040335.118108-1-w27@sorz.org>
To: Shell Chen <w27@sorz.org>
Cc: linux-bluetooth@vger.kernel.org, marcel@holtmann.org, luiz.dentz@gmail.com
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FREEMAIL_CC(0.00)[vger.kernel.org,holtmann.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18269-lists,linux-bluetooth=lfdr.de,bluetooth];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 8B1A24B7F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 14 Jan 2026 15:03:35 +1100 you wrote:
> Add VID:PID 13d3:3612 to the quirks_table.
> 
> This ID pair is found in the Realtek RTL8852CE PCIe module
> in an ASUS TUF A14 2025 (FA401KM) laptop.
> 
> Tested on aforementioned laptop.
> 
> [...]

Here is the summary with links:
  - Bluetooth: btusb: Add new VID/PID for RTL8852CE
    https://git.kernel.org/bluetooth/bluetooth-next/c/a122dbf2ebcc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



