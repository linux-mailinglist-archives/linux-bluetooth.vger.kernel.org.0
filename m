Return-Path: <linux-bluetooth+bounces-19115-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N2qBUWAlGmwFAIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19115-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 15:50:45 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C26414D4D8
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 15:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25FFB303BB34
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 14:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AF036AB5C;
	Tue, 17 Feb 2026 14:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObGncaW/"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C5D35502F
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771339817; cv=none; b=Swr/t3WZpLsyRra8tFc2f4GdyxghtyF3QuKpq1s0FRnZaWc0c1ReOD2+4pzhrs3mQFQXUY1bLhem62wo5b52vDarfR0Wt8+tpgmcRl16LHQBT3hUQ9hYuo38zo7zZvS6S1qVrlsaGT30d1lbUV+2D/q6nxoVnWbVO77qbQc9CME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771339817; c=relaxed/simple;
	bh=IKg3RGYrCJuLpyM2ioPuD3so2J4MECVZn6G8hkm+60Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RLg9enohyrc9D52pZJkEX264IQ86Lbl36RXgzdiF2BOj1n9LFeE85YUls8DGpTUJiyN4Fh3jOtf0q2tvGhwdHdD9cZQcREZ3vbqas0bbF7/RAvQhLnhWax1tlMnrIuvx61laU1h+5lIK8MTa4rp9BziHsd2njIXzU1nQFhsmYtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObGncaW/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC31C4CEF7;
	Tue, 17 Feb 2026 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771339816;
	bh=IKg3RGYrCJuLpyM2ioPuD3so2J4MECVZn6G8hkm+60Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ObGncaW/N2D6Nau8xkooIyjdfzq7tuHKIONGM+edwpZYZXcR3Mf4UDN3HKo0HCNiV
	 XvFQRbAAfqOhBulPXFywyOGR0d7qCGXNphjuouMiTtQ/rLKo+DkitK5PppeCKVpaQb
	 GQmxqCdZvjxuAJb1yUyCWsuIwhyprrdpGC00T5M9fGFEEfL1D9UhB1qDN1UxV3ZmkZ
	 tq9CQAnuASrfr86VbPsh+4pBmRVMfdEv7EoMSWFRsjNjSURJYNDDlwNJcsWYFCSEj4
	 27HcjfhpdsOGUB3KrGcdqwU+QBwMmEL4mGXpDj/2twBWlDkeRHgq6sxJ2r+7t+tDs2
	 OSG1stxLYMGWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0B072380AAE0;
	Tue, 17 Feb 2026 14:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v1 0/1] bass: Fix use-after-free when rescanning
 broadcast sources
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177133980881.109268.1145982084873590241.git-patchwork-notify@kernel.org>
Date: Tue, 17 Feb 2026 14:50:08 +0000
References: <20260217142017.1554-1-sarveshwar.bajaj@nxp.com>
In-Reply-To: <20260217142017.1554-1-sarveshwar.bajaj@nxp.com>
To: Sarveshwar Bajaj <sarveshwar.bajaj@nxp.com>
Cc: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com, pav@iki.fi,
 vinit.mehta@nxp.com, devyani.godbole@nxp.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19115-lists,linux-bluetooth=lfdr.de,bluetooth];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,iki.fi,nxp.com];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8C26414D4D8
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 17 Feb 2026 19:50:16 +0530 you wrote:
> Hi,
> 
> This patch fixes a use-after-free crash in the BASS plugin that occurs
> when rescanning for LE Audio broadcast sources.
> 
> The issue was reported in GitHub issue #1907.
> 
> [...]

Here is the summary with links:
  - [BlueZ,v1,1/1] bass: Fix use-after-free when rescanning broadcast sources
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=9f11cf01ecb4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



