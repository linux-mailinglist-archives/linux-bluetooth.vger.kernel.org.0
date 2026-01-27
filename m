Return-Path: <linux-bluetooth+bounces-18556-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ9kNkwEeWk3ugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18556-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:30:36 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C18399125
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1736D30078AE
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A884320A34;
	Tue, 27 Jan 2026 18:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rkm29zVT"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84720192B75
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538631; cv=none; b=NfEmkhidfG/VdCTUAeXW+UG5H+hgsSB6PsZ7KLvVVgy145eiC1q/E93iEeacZ/Twc855XsLzSFC3Lo+4JGSVicNGRbmydVIwNp/LqL0DsAsfrQSLX/jtohzm3uO9KuPrvCmcLr0/kyDxCW2Mqu9YW7yT9o2jNHw37dYunkpxSU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538631; c=relaxed/simple;
	bh=TCme+yU2Isdy+m9peFMqHhePDuUuPab4z+bQxcKM1Os=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=thMFDuldHMtdXHdgm66kT4oWgfSw+C8f0tLEUpiom9rcWkSfmm5YZgQ4Nh3irNvVSxfNxze6vmuL/gbmkLrYyg47N7yeO8CGV9Qiyy1iYBduenQgVXfyicabd2+Ocrgpp0YW6Y4sN2kqgJzyanXkNa/9m1t1b1ONdAJzsncdXI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rkm29zVT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A9BC116C6;
	Tue, 27 Jan 2026 18:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769538631;
	bh=TCme+yU2Isdy+m9peFMqHhePDuUuPab4z+bQxcKM1Os=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Rkm29zVTORO+Fi1uAZF0nMEY9CraKPQkCO/Zk4TE9wIe0w6mEQmd8/FZnqvfLFV8f
	 Ss3FDBf6HfTlPspdIjmNO0iLyOWEwKygz6HAIn/qdk6QXP/rBRXQlYQQcBBNreC8qW
	 Iqh/PRbzSe+LFHkP8i6rVQrh06IwUn8/csVzPYJfDDTgqXIVTq4yU+lj+/yO7hMgRu
	 YTWmJ4qOiSQJRTfJxXP9h2AeO8vjCihwpxtsKuLlNmn6SGuOhbwCO+UD8GIc+Tkqne
	 10ooSYENlPny/0ah6IzKiu4mofeIIZeqNb1VK20VfLxmtaskyrR5LaC9ywSh8+K/0d
	 /P988EHb1WKug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4EB74380AA58;
	Tue, 27 Jan 2026 18:30:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] doc/qualification: Add PICS and howto for the SPP
 qualification
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176953862485.1352702.12781500863203754944.git-patchwork-notify@kernel.org>
Date: Tue, 27 Jan 2026 18:30:24 +0000
References: <20260127171455.151496-1-frederic.danis@collabora.com>
In-Reply-To: <20260127171455.151496-1-frederic.danis@collabora.com>
To: =?utf-8?b?RnLDqWTDqXJpYyBEYW5pcyA8ZnJlZGVyaWMuZGFuaXNAY29sbGFib3JhLmNvbT4=?=@codeaurora.org
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-18556-lists,linux-bluetooth=lfdr.de,bluetooth];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C18399125
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 27 Jan 2026 18:14:55 +0100 you wrote:
> ---
>  doc/qualification/spp-pics.rst | 127 +++++++++++++++++++++++++++++++++
>  doc/qualification/spp-pts.rst  |  35 +++++++++
>  2 files changed, 162 insertions(+)
>  create mode 100644 doc/qualification/spp-pics.rst
>  create mode 100644 doc/qualification/spp-pts.rst

Here is the summary with links:
  - [BlueZ] doc/qualification: Add PICS and howto for the SPP qualification
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=feecc7f60de8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



