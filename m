Return-Path: <linux-bluetooth+bounces-18550-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDLfFWwEeWk3ugEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18550-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:31:08 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A564799158
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2893306EB7E
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896512FFDFA;
	Tue, 27 Jan 2026 18:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFIDnSwM"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178BA279907
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538623; cv=none; b=szuZWArZnC6yAZnkD9X3+q4Rl+Fadjz/cTmbRF/WWf0adefJ4hSwHYy8xPjNOQQ4NXl9EgThotmSmoeqmEL8mqvVeGxfm0zwUH2WpA8ri7+eFPmmNdt2rN8BlxKH+8VJYn+9elOV1q/e29n9O/UcDAbofVtG0ex0vGRB8Wc5AIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538623; c=relaxed/simple;
	bh=uKiXxo//b1bIxrmfDMW71nEJplLAdMdlqUBhGorRJb4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hbOrXdrGSnCv3GA8ocTMwbnrGqDDkaAD3b1rj+mEhyxBAlJYXWB3nH7G1sP7vTXWDZ3eM+7OqZB44ox2ehVGY0NdSYQKIxZGFr8LNHbUEH99ZX9gAJ5WKk7Kv5IZnjYmvrLHTuxbdwymQ7h/X5dTHSL8GL4EaTgzlQri0iT9N20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFIDnSwM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF753C116D0;
	Tue, 27 Jan 2026 18:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769538623;
	bh=uKiXxo//b1bIxrmfDMW71nEJplLAdMdlqUBhGorRJb4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZFIDnSwMbtSQPU+EBtUZ64a/LRYBQzJQDDRPy+1UR+L4fvQ3+ZCTv+YukJO3sOcow
	 DVsl73mesSRqE/AK3lK2d3ebCVuIl0HbRIGbFPnTsllk9QvphQrESyKnUmcKEcmzpC
	 mAYUbamxY7EQIApnIAtOcM9cZY+NmSBAEowXDZmQTfTlr5z59hy0RDu8n0T+wriI6D
	 dLNirioTTTuu4NTuerfkw8p5CfY3IEo1pscR9NKFp2ct+aoEryEX8n1sEbwIc3BHsN
	 sq8enaxZf+fbqXlLHD5f37uEMxD28ZuWiin/DolopKCdBpePilg9n4ZkPoFefgV8ih
	 wMKIC13mS0/0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11A71380AA58;
	Tue, 27 Jan 2026 18:30:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ] doc/qualification: Add PICS and howto for the AVDTP
 qualification
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <176953861659.1352702.12679351124402527252.git-patchwork-notify@kernel.org>
Date: Tue, 27 Jan 2026 18:30:16 +0000
References: <20260127170652.150403-1-frederic.danis@collabora.com>
In-Reply-To: <20260127170652.150403-1-frederic.danis@collabora.com>
To: =?utf-8?b?RnLDqWTDqXJpYyBEYW5pcyA8ZnJlZGVyaWMuZGFuaXNAY29sbGFib3JhLmNvbT4=?=@codeaurora.org
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:subspace.kernel.org:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-18550-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: A564799158
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 27 Jan 2026 18:06:52 +0100 you wrote:
> ---
>  doc/qualification/avdtp-pics.rst | 638 +++++++++++++++++++++++++++++++
>  doc/qualification/avdtp-pts.rst  | 405 ++++++++++++++++++++
>  2 files changed, 1043 insertions(+)
>  create mode 100644 doc/qualification/avdtp-pics.rst
>  create mode 100644 doc/qualification/avdtp-pts.rst

Here is the summary with links:
  - [BlueZ] doc/qualification: Add PICS and howto for the AVDTP qualification
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=a54bee4668f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



