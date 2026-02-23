Return-Path: <linux-bluetooth+bounces-19302-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Or8MhHbnGkrLwQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19302-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 23:56:17 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5A617EA0F
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 23:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEA6430517F1
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 22:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A91937C0EB;
	Mon, 23 Feb 2026 22:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fOwDhrNL"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D2237C0E6
	for <linux-bluetooth@vger.kernel.org>; Mon, 23 Feb 2026 22:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771887371; cv=none; b=PCMmM60gU8iISGfwT/kJxIVHWTLlao/w3HSvylIvroOdj/wgeuDhvdZ1YaUf9+TCESCS5DW4yawZAXIIRMdDsy8EID9R8c8xtKTJMHWblofBZwOsom5XGAXr9IClXj/sJJKeK+cRNJ6xChwek97KqANnl43RZQIG2VGkeTTpuXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771887371; c=relaxed/simple;
	bh=hXjo3gfjHuqNWO9+gAofisf2TSZgfL4gnkkUtSIiIAM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Sx/tgdCNjolJyEKJeJx7P2LVxxWDmUb3DMDlDJpubShPipQUKCvkIEIkcR0wKI63GlNSw/9eBPIFM/v6A0ZDjN3bwHkmYoudAcv4c48appOyrpVpCmIZZ1eTaqAXlp/yuI7hNok1lAWWZV8FcuYAHZCIfM+Y18c83AEPSIbOR9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fOwDhrNL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643BCC116C6;
	Mon, 23 Feb 2026 22:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771887371;
	bh=hXjo3gfjHuqNWO9+gAofisf2TSZgfL4gnkkUtSIiIAM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fOwDhrNLdqFGzWczxSAvNyRFX5Pvc4yyC9JhIgefXqVE0n+srPSMe2Vcx6qg7Di3F
	 iagrjdQDdIVivHThQMtT098zhp2aDTglrpo296ose6SWJMxfQToEG7o8csKyqvwl/8
	 29N+e7/QBAX5ONJuFOa3Pyify+rTtNZuw5MRITVy/Y6C77+85nL9kP6/K/5N0ov/2c
	 /YY1KMVaIfi2h6gFge8cjK4p0C155AgPThfQn615vV/Kpps9huURryAcqk6P5ag+HR
	 GWSdl+B2ZI19MmLjhi0ZZwgJEo5jdK+RG0w4H+hE2ImI4sS8MuuShP9FayUsoSLw6J
	 ci14rR8gXisSQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F113808200;
	Mon, 23 Feb 2026 22:56:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH BlueZ v2] l2test: Attempt to use BT_SNDMTU if output MTU
 has
 been set
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <177188737728.2662735.10739666292740323200.git-patchwork-notify@kernel.org>
Date: Mon, 23 Feb 2026 22:56:17 +0000
References: <20260220200850.3460177-1-luiz.dentz@gmail.com>
In-Reply-To: <20260220200850.3460177-1-luiz.dentz@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19302-lists,linux-bluetooth=lfdr.de,bluetooth];
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
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 3F5A617EA0F
X-Rspamd-Action: no action

Hello:

This patch was applied to bluetooth/bluez.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Fri, 20 Feb 2026 15:08:50 -0500 you wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> With the suggested fixes for L2CAP/ECFC/BV-27-C the kernel shall be
> able to accept setsockopt(BT_SNDMTU) in order for an applications
> to require a minimal output MTU greater than 64.
> 
> Fixes: https://github.com/bluez/bluez/issues/1895
> 
> [...]

Here is the summary with links:
  - [BlueZ,v2] l2test: Attempt to use BT_SNDMTU if output MTU has been set
    https://git.kernel.org/pub/scm/bluetooth/bluez.git/?id=290f9973c906

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



