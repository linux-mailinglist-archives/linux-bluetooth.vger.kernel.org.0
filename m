Return-Path: <linux-bluetooth+bounces-19779-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA7BMhABp2k7bgAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19779-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 03 Mar 2026 16:41:04 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 670B21F2D19
	for <lists+linux-bluetooth@lfdr.de>; Tue, 03 Mar 2026 16:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 249363029276
	for <lists+linux-bluetooth@lfdr.de>; Tue,  3 Mar 2026 15:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18DE3603C3;
	Tue,  3 Mar 2026 15:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNharhEO"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809A835CB75
	for <linux-bluetooth@vger.kernel.org>; Tue,  3 Mar 2026 15:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772552405; cv=none; b=sm0A9E++RjfQHigI7Mz2+hH1hlxguFU4zqy4u97MtB74b2UmO1boRi0j5F5llnltqPp8gmdNCCg3LAsgNcluVY6VmCT625MpDVt0X2uPXqIUcU5Q45GOCQMfb2iIWA3IgpM39UF1IE901O3RTe1MfQdTeYscSumwuiAIqOGWpWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772552405; c=relaxed/simple;
	bh=/MfXwrfu56ZLo7D/qMDfUbEBvi0pgpPTkJV8NPW5KlY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=c35iOofxTz4OgfyGg5darluClWJSnkz85sCh6ymDNFMBA1sq/OVFuQWCZDFGysScnOApD9EoXPanGDInzC8M3RIUtTiuEd59LUPJ3vqXyXECRX3MYLx6+QjheL9PBdTPMl15H+GXbq4mbCcYOATn20SFDRkH7QnZ1OfzwHfNEE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNharhEO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB05C116C6;
	Tue,  3 Mar 2026 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772552405;
	bh=/MfXwrfu56ZLo7D/qMDfUbEBvi0pgpPTkJV8NPW5KlY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WNharhEOnGSM1LKSIB2aU1G8cojqjzWvl2SBy9mafbiQS5pcCD/ahBtUmbMiZV5nn
	 ZmhwJOT63QE7YE9WFS8AW60Nf6DVbv99IgM907/f6LtccMMpKKBSL59kCBtTuKB9z6
	 DNjwEkJCd/S9VBB35rBBrHZkNIE8fwKpV9Gm94FA1hN/DR86I71xdptNJtVYX/x3wD
	 0vGJ4/OcYpdfNDkwc6sq763CPaeIXKIaSda7VNQtBgvZprAvIxaa85gLo0hz05o4pE
	 MBZ0eneplQWV/YGad5/BYbTqD0JKdxQlZ9qRvCD/jmr4ZD/WPv9IC4m7TAveUtDWN7
	 rDO5dbdJ6EsOQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EFF3808200;
	Tue,  3 Mar 2026 15:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v2 1/2] hciemu: Fix silently dropping packet if
 writev
 return -EAGAIN
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177255240654.1348433.4748395920578414611.git-patchwork-notify@kernel.org>
Date: Tue, 03 Mar 2026 15:40:06 +0000
References: <20260226200330.313530-1-luiz.dentz@gmail.com>
In-Reply-To: <20260226200330.313530-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Queue-Id: 670B21F2D19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19779-lists,linux-bluetooth=lfdr.de,bluetooth];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello:

This series was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Thu, 26 Feb 2026 15:03:29 -0500 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> The code has been silently dropping packets due to lack of buffer
> since hciemu design is single threaded it cannot do partial writes
> or flushes to force the buffer to be consumed and give space to the
> next chunk, so in order to fix this the code will now attempt to
> detect if a socket runs out of space and automatically bump the
> buffer with use of SO_SNDBUF.
> 
> [...]

Here is the summary with links:
  - [BlueZ,v2,1/2] hciemu: Fix silently dropping packet if writev return -EAGAIN
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=744fad3c342e
  - [BlueZ,v2,2/2] bthost: Add segmentation support for L2CAP LE-(E)CRED mode
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=b138a0849ba2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



