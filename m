Return-Path: <linux-bluetooth+bounces-19123-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL/vJcy4lGlmHQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19123-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 19:51:56 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F1414F5D7
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 19:51:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B48513053DC5
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 18:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8295B37472B;
	Tue, 17 Feb 2026 18:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ju595mPw"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103BC372B49;
	Tue, 17 Feb 2026 18:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771354217; cv=none; b=iO1iGdypwvf8YurRSjrDmzTmQkVvJ/nIbgIcFkU3Psf5zkJLbRx1RG3m0LRU7heGKM6ZhnGDC0X9YwQ2Gwi5duc+7LhfrYhP/dxhxcue5TQlHJlve+C5kjOwpoz7GEMBhFAQIkfgqlL8BOoj9sjQ/o3eB7on9aB6KbZdv4gs0OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771354217; c=relaxed/simple;
	bh=m9fqzSYUlMQC3epYGxphN9VBBo8XBctrLK4kz7F/9mM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GYUGFSetmioGQ3kQTPPytyThCLgpGMGIVYV6LVsQkKh3Rkdm5ElBesD9aMkqxAN+dWSSLVDrl6JwwVhRwed5u6Qi6PhOcxMQIs/jdi/HoTPvdCDv3DgtvpTjHmaMgtt5AtXHdRq2jggpjFyRmk5v5mVx0cDnIaKnsZ9QZgGGQFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ju595mPw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF007C4CEF7;
	Tue, 17 Feb 2026 18:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771354216;
	bh=m9fqzSYUlMQC3epYGxphN9VBBo8XBctrLK4kz7F/9mM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ju595mPwnMUSPruQjplKNAxjBr7K1DXKO6jlS1C77akHKizBE/0eg1n4YEBRJn/6r
	 hL83doFE5hgUfL0hRcvruF8s6C9Lx7qFsWJHBGucWW6kCiFggGZNbseLMpnaizm7CE
	 jyXzQMB8IWc19Z/0azI5CiagIaGXmotye/j2hSIIM2Xgxp/+ywQA9MGh0OOx4zM33o
	 qPC2TG84xbWlCEvr1AhUq2iF7yA2cgp5SEVR7quEORr0G4LPrs0nfWsaWip1pDpxJj
	 sy7vKpg6tsGlq40PCkfszrXdqqCDT3kINSX7cSi35dEXowTBCHZR4OjSV+qTErThvN
	 miLFbEf7H4Dtg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C22263806667;
	Tue, 17 Feb 2026 18:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btbcm: Add entry for BCM4343A2 UART Bluetooth
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177135420857.600961.692172776529792133.git-patchwork-notify@kernel.org>
Date: Tue, 17 Feb 2026 18:50:08 +0000
References: <20260209171158.22641-1-marex@nabladev.com>
In-Reply-To: <20260209171158.22641-1-marex@nabladev.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-bluetooth@vger.kernel.org, cniedermaier@dh-electronics.com,
 luiz.dentz@gmail.com, marcel@holtmann.org, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,dh-electronics.com,gmail.com,holtmann.org];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-19123-lists,linux-bluetooth=lfdr.de,bluetooth];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nabladev.com:email,holtmann.org:email,intel.com:email]
X-Rspamd-Queue-Id: E9F1414F5D7
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon,  9 Feb 2026 18:11:48 +0100 you wrote:
> This patch adds the device ID for the BCM4343A2 module, found e.g.
> in the muRata 1YN WiFi+BT combined device. The required firmware
> file is named 'BCM4343A2.hcd'.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
> Cc: Marcel Holtmann <marcel@holtmann.org>
> Cc: kernel@dh-electronics.com
> Cc: linux-bluetooth@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> [...]

Here is the summary with links:
  - Bluetooth: btbcm: Add entry for BCM4343A2 UART Bluetooth
    https://git.kernel.org/bluetooth/bluetooth-next/c/18f858cee25b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



