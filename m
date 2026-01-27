Return-Path: <linux-bluetooth+bounces-18548-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDC4IEYEeWk3ugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18548-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:30:30 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 013E699102
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C40923023E20
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058EA3271E8;
	Tue, 27 Jan 2026 18:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OX8qyhrA"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BA8192B75
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538620; cv=none; b=R5sDdjg7SuWJhFt8CLMXT2SBU0o/GorrxbqipY6BUbj8F6yFzWlzZdTMx9SRrUsJ6B36fQWGvr8ZmSwAtstguvQ9jYF9X8SULEo6E4IGvH1Im2fHZ2y9RI0gq7u8/4H9e5Y8H9dOoJK7wqVWGZ8lpDHcud11+PSxYJRV7EjWuuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538620; c=relaxed/simple;
	bh=TJtI6e6QQyjaaYiXC3YKX+wSsysCur0k9GWK3hOjERg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NiuQcLe3m7IUibyGuu60tHY/6tRv7I89EP0S20XIQF5aaa6yHMF5LGtFnRXUOTyT+QCTDjMD4WOSzxLsuW36+WJrYXmDiMqp168Vp/1SxA033Qi8rtJcyYJXVor6Lew/GN/rGAIqVNDIpcPh+e+3k4jXl++6drRDUgGqMvvNd28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OX8qyhrA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA81C116C6;
	Tue, 27 Jan 2026 18:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769538620;
	bh=TJtI6e6QQyjaaYiXC3YKX+wSsysCur0k9GWK3hOjERg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OX8qyhrAfaSDQdoWPtOj7aexAQ0IWsZfhNDTxvTkXCdpcwVPOjNtUulqw0J4ADcR+
	 KS9GaEoCag/UbMASXjyp66/zNS4GM7gJOmK5GlqrNEyckXvfDU0YF96YZeZHVFYPH8
	 3pld+ud3ePtGatx6qnhaoOSOhI6O9XLzGtijvH5Fo+TeVi5Alwwr5M7fOqNe/fpp/R
	 GMW3ROsZxBam4IgwQ3Bu7V1o+gLQNja0dm4WJTy4MLaj86Gd3+hqj5Rl5I/EeRVSof
	 aKBqme8Wu7tQcajlUV8ng816Pds2E8vjdGLd2hQaisEaa5Nr8Go3j1TO3TuQ3e1jsI
	 1UH2egQvHlgMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4E9BA380AA58;
	Tue, 27 Jan 2026 18:30:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] doc/qualification: Add PICS and howto for the HSP
 qualification
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176953861384.1352702.5041906515013687504.git-patchwork-notify@kernel.org>
Date: Tue, 27 Jan 2026 18:30:13 +0000
References: <20260127171613.151644-1-frederic.danis@collabora.com>
In-Reply-To: <20260127171613.151644-1-frederic.danis@collabora.com>
To: =?utf-8?b?RnLDqWTDqXJpYyBEYW5pcyA8ZnJlZGVyaWMuZGFuaXNAY29sbGFib3JhLmNvbT4=?=@codeaurora.org
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-18548-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 013E699102
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 27 Jan 2026 18:16:13 +0100 you wrote:
> ---
>  doc/qualification/hsp-pics.rst | 234 +++++++++++++++++++++++++++++++++
>  doc/qualification/hsp-pts.rst  |  87 ++++++++++++
>  2 files changed, 321 insertions(+)
>  create mode 100644 doc/qualification/hsp-pics.rst
>  create mode 100644 doc/qualification/hsp-pts.rst

Here is the summary with links:
  - [BlueZ] doc/qualification: Add PICS and howto for the HSP qualification
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=e4b4db9702e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



